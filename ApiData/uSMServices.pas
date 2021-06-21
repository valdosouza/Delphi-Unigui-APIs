unit uSMServices;

interface

uses System.SysUtils, System.Classes, System.Json,Vcl.ExtCtrls,synacode,
    DataSnap.DSProviderDataModuleAdapter, ACBrCEP,uSM,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json, tblentity,
    ControllerCrashlytics, tblCrashlytics, ACBrConsultaCNPJ,objImages,
    ControllerInstitution,System.NetEncoding, ObjFile;

type
  {$METHODINFO ON}
  TSMServices = class(TSM)
  private
    { Private declarations }
  public
    function getZipCode(par:String) : String;
    function setCrashlytics(par: string): String;
    function CNPJUpdateCaptcha:String;
    function setImagemFile(par: string): String;
    function setXMLFile(par: string): String;
    function setJPGFile(par: string): String;
  end;
   {$METHODINFO OFF}
implementation

uses ControllerState, ControllerCity, prm_address, UnFunctions;


function TSMServices.CNPJUpdateCaptcha: String;
var
  Stream: TMemoryStream;
//  Jpg: TJPEGImage;
{$IFDEF DELPHI2009_UP}
  png: TPngImage;
{$ELSE}
  ImgArq: String;
{$ENDIF}
  LcCNPJ : TACBrConsultaCNPJ;
  LcFileName:String;
begin
  {$IFNDEF SUPPORT_PNG}
    // COMO PROCEDER:
    //
    // 1) Caso o site da receita esteja utilizando uma imagem do tipo JPG, você pode utilizar o código comentado abaixo.
    //    * Comente ou apague o código que trabalha com PNG, incluindo o IFDEF/ENDIF;
    //    * descomente a declaração da variável jpg
    //    * descomente o código abaixo;
    // 2) Caso o site da receita esteja utilizando uma imagem do tipo PNG, você terá que utilizar uma biblioteca de terceiros para
    //conseguir trabalhar com imagens PNG.
    //  Neste caso, recomendamos verificar o manual da biblioteca em como fazer a implementação. Algumas sugestões:
    //    * Procure no Fórum do ACBr sobre os erros que estiver recebendo. Uma das maneiras mais simples está no link abaixo:
    //      - http://www.projetoacbr.com.br/forum/topic/20087-imagem-png-delphi-7/
    //    * O exemplo acima utiliza a biblioteca GraphicEX. Mas existem outras bibliotecas, caso prefira:
    //      - http://synopse.info/forum/viewtopic.php?id=115
    //      - http://graphics32.org/wiki/
    //      - http://cc.embarcadero.com/Item/25631
    //      - Várias outras: http://torry.net/quicksearchd.php?String=png&Title=Yes
  {$ENDIF}

  Stream:= TMemoryStream.Create;
  try
    TRy
      LcCNPJ := TACBrConsultaCNPJ.create(nil);
      LcCNPJ.Captcha(Stream);

     {$IFDEF DELPHI2009_UP}
      //Use esse código quando a imagem do site for do tipo PNG
      png:= TPngImage.Create;
      try
        png.LoadFromStream(Stream);
        Image1.Picture.Assign(png);
      finally
        png.Free;
      end;
      { //Use esse código quando a imagem do site for do tipo JPG
        Jpg:= TJPEGImage.Create;
        try
          Jpg.LoadFromStream(Stream);
          Image1.Picture.Assign(Jpg);
        finally
          Jpg.Free;
        end;
      }
     {$ELSE}
      LcFileName := TGUID.Empty.NewGuid.ToString;
      LcFileName := RemoveCaracterInformado(LcFileName,['}','{','-']);

      ImgArq := concat('C:\Domains\gestaosetes.com.br\setes.com.br\public_html', LcFileName , '.png');
      Stream.SaveToFile( ImgArq );
      Retorno.Mensagem := 'OK';
      Retorno.ID       := 200;
      Retorno.Code     := 1;
     {$ENDIF}
    Except
      on E:Exception do
      Begin
        Retorno.Mensagem := E.Message;
        Retorno.ID       := 500;
        Retorno.Code     := 0;
      End;
    End;
  finally
    Result := TJson.ObjectToJsonString(Retorno);
    Stream.Free;
    LcCNPJ.DisposeOf;
  end;

end;

function TSMServices.getZipCode(par:String): String;
Var
  cep : TACBrCEP;
  Lc_State : TControllerState;
  Lc_City : TControllerCity;
  Lc_Address : TPrmAddress;
Begin
  Try
    cep := TACBrCEP.Create(nil);
    Lc_Address := TPrmAddress.Create;
    Lc_Address.Zipcode := '0';
    with cep DO
    Begin
      WebService := wsCorreios;
      BuscarPorCEP(par);
      if Enderecos.Count > 0 then
      Begin
        Lc_Address := TPrmAddress.Create;
        with Enderecos[0],Lc_Address do
        Begin
          Zipcode := CEp;
          if (Trim(Tipo_Logradouro) <> '') then
            Street := Trim(Tipo_Logradouro) + ' ' + Logradouro
          else
            Street := Logradouro;
          Complement := Complemento;
          Neighborhood := Bairro;
          Country := 1058;
          Try
            //Estado
            Lc_State := TControllerState.Create(nil);
            Lc_State.Registro.Abreviatura := UF;
            Lc_State.getByAbbreviation;
            State := Lc_State.Registro.Codigo;
            //Cidade
            Lc_City := TControllerCity.Create(nil);
            Lc_City.Registro.Nome := UpperCase(Municipio);
            Lc_City.Registro.CodigoEstado := Lc_State.Registro.Codigo;
            Lc_City.getByName;
            City := Lc_City.Registro.Codigo;
          Finally
            //Libera
            Lc_State.DisposeOf;
            Lc_City.DisposeOf;
          End;
        end;
      end;
    End;
  Finally
    Result := TJson.ObjectToJsonString(Lc_Address);
    Cep.DisposeOf;
    Lc_Address.DisposeOf;
  End;
end;

function TSMServices.setCrashlytics(par: string): String;
Var
  LcExcecao : Boolean;
  CtrlCrashlytics :TControllerCrashlytics;
begin
  try
    CtrlCrashlytics := TControllerCrashlytics.create(nil);
    CtrlCrashlytics.Registro := TJson.JsonToObject<TCrashlytics>(par);
    //Exceções que vem de clientes desatualizados
    LcExcecao :=  (Pos('TB_CTRL_ESTOQUE', CtrlCrashlytics.Registro.Mensagem) > 0) or
                  (Pos('Session has expired', CtrlCrashlytics.Registro.Mensagem) > 0) or
                  (Pos('CST', CtrlCrashlytics.Registro.Mensagem) > 0) ;

    if not LcExcecao then
    BEgin
      CtrlCrashlytics.insert;
      Result := 'Crashlytics registrado com sucesso';
    End;
  finally
    CtrlCrashlytics.disposeOf;
  end;
end;

function TSMServices.setImagemFile(par: string): String;
Var
  LcObj : TObjImages;
  LcCtrl : TControllerInstitution;
  LcStream : TStringStream;
  LcMemoStream : TMemoryStream;
  LcImage : TImage;
begin
  try
    Try
      LcCtrl := TControllerInstitution.Create(nil);
      LcObj := TJson.JsonToObject<TObjImages>(par);

      LcCtrl.Registro.Codigo := LcObj.Images.Estabelecimento;
      LcCtrl.getRepository(False,'');

      LcStream := TStringStream.Create(LcObj.Content);
      LcStream.Position := 0;
      //Cria o stream que vai receber o conteúdo depois de trafegado
      LcMemoStream := TMemoryStream.Create;
      // Decodifica a transferência do Stream de Recebido para Foto
      TNetEncoding.Base64.Decode(LcStream, LcMemoStream);
      // Posiciona o Stream Foto no início
      LcMemoStream.Position := 0;
      // Carrega o Stream Foto para a imagem
      LcImage.Picture.Bitmap.LoadFromStream( LcMemoStream);

      LcImage.Picture.SaveToFile( concat(LcCtrl.PathPublico,'\', LcObj.Images.NomeArquivo ) );
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := LcCtrl.Registro.Codigo;
    Except
      on E:Exception do
      Begin
        Retorno.Mensagem := E.Message;
        Retorno.ID       := 500;
        Retorno.Code     := 0;
      End;
    End;
  finally
    Result := TJson.ObjectToJsonString(Retorno);
    LcCtrl.DisposeOf;
    LcObj.Destroy;
    LcStream.DisposeOf;
    LcMemoStream.DisposeOf;
  end;
end;

function TSMServices.setJPGFile(par: string): String;
Var
  LcObj : TObjFile;
  LcCtrl : TControllerInstitution;
  lStreamDst : TFileStream;
  Buffer : PChar;
  LcPath : String;
  LcConteudo : String;
begin
  try
    LcCtrl := TControllerInstitution.Create(nil);
    LcObj := TJson.JsonToObject<TObjFile>(par);

    LcCtrl.Registro.Codigo := LcObj.Estabelecimento;
    LcCtrl.getRepository(False,'');
    //Tratar alguns erros que podem acontecer
    if Length( Trim(LcObj.FileName) )  = 0 then
    Begin
      LcObj.FileName := concat('File_',
                          LcCtrl.GeneratePrimaryKey,
                          '.jpg');
    End;

    if Length( Trim(LcObj.Content) )  > 0 then
    Begin
      { Cria o novo arquivo vazio }
      LcPath := concat(LcCtrl.PathPublico, LcObj.FolderName,'\' );
      if not (DirectoryExists(LcPath)) then ForceDirectories(LcPath);
      lStreamDst := TFileStream.Create ( concat(LcPath,'\', LcObj.FileName) , fmCreate);

      { Decodifica o conteúdo }
      LcConteudo := ZDecompressString(LcObj.Content);
      try
        { Grava o conteúdo decodificado no arquivo }
        Buffer := PChar ( LcConteudo );
        lStreamDst.Write (Buffer^, Length( LcConteudo ));
        Retorno.Mensagem := 'SAVED';
        Retorno.ID       := 200;
        Retorno.Code     := LcObj.Estabelecimento;
      Except
        on E:Exception do
        Begin
          Retorno.Mensagem := E.Message;
          Retorno.ID       := 500;
          Retorno.Code     := 0;
        End;
      End;
    End;
  finally
    Result := TJson.ObjectToJsonString(Retorno);
    LcCtrl.DisposeOf;
    LcObj.Destroy;
    lStreamDst.Free();
  end;

end;

function TSMServices.setXMLFile(par: string): String;
Var
  LcObj : TObjFile;
  LcCtrl : TControllerInstitution;
  lStreamDst : TFileStream;
  Buffer : PChar;
  LcPath : String;
  LcConteudo : String;
begin
  try
    LcCtrl := TControllerInstitution.Create(nil);
    LcObj := TJson.JsonToObject<TObjFile>( DecodeBase64( par ));

    LcCtrl.Registro.Codigo := LcObj.Estabelecimento;
    LcCtrl.getRepository(True,'');
    //Tratar alguns erros que podem acontecer
    if Length( Trim(LcObj.FileName) )  = 0 then
    Begin
      LcObj.FileName := concat('File_',
                          LcCtrl.GeneratePrimaryKey,
                          '.tmp');
    End;

    if Length( Trim(LcObj.Content) )  > 0 then
    Begin
      { Cria o novo arquivo vazio }
      LcPath := concat(LcCtrl.PathPublico, LcObj.FolderName,'\' );
      if not (DirectoryExists(LcPath)) then ForceDirectories(LcPath);
      lStreamDst := TFileStream.Create ( concat(LcPath,'\', LcObj.FileName) , fmCreate);

      { Decodifica o conteúdo }
      LcConteudo := DecodeBase64(LcObj.Content);
      try
        { Grava o conteúdo decodificado no arquivo }
        Buffer := PChar ( LcConteudo );
        lStreamDst.Write (Buffer^, Length( LcConteudo ));
        Retorno.Mensagem := 'SAVED';
        Retorno.ID       := 200;
        Retorno.Code     := LcObj.Estabelecimento;
      Except
        on E:Exception do
        Begin
          Retorno.Mensagem := E.Message;
          Retorno.ID       := 500;
          Retorno.Code     := 0;
        End;
      End;
    End;
  finally
    Result := TJson.ObjectToJsonString(Retorno);
    LcCtrl.DisposeOf;
    LcObj.Destroy;
    lStreamDst.Free();
  end;
end;

end.

