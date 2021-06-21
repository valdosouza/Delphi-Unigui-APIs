unit un_pay_pal;

interface

uses  Classes,System.SysUtils,System.StrUtils,  REST.Json,System.Json,
     System.Generics.Collections,REST.Response.Adapter, REST.Client,REST.Types,
     Data.Bind.Components,Data.Bind.ObjectScope, System.IniFiles, FireDAC.Comp.Client;

type

  TPayPal = Class(TComponent)

    private

    protected
      RESTClient: TRESTClient;
      RESTRequest: TRESTRequest;
      RESTResponse: TRESTResponse;
      RESTResponseDSA: TRESTResponseDataSetAdapter;
      FDMemTable: TFDMemTable;
      Path_Product_Img : String;
      Url_Api : String;
      porta : STring;
      FInstiturionWeb : Integer;

      function ConverteDataHora(Tempo:String):TDateTime;
      function gerarAccessToken:String;
      function AtualizarAccessToken:String;
      procedure configComponents(Operacao,Recurso,Metodo,ID,Param:String);
      function sendData(Data:String):Boolean;
      function getData(Data:String):Boolean;
      Procedure geralog(acesso : string);
      procedure updateMsgProcess( pMsg: String; msgIndex: Integer);
      procedure GetIdInstitutionWeb;
    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
  End;

implementation

{ TPayPal }

uses UnFunctions;

function TPayPal.AtualizarAccessToken: String;
Var
  LcStrJSon : String;
  LcJSon : TJsonObject;
  LcValorJSon : TJSONValue;
  Lc_Arq_Ini: TIniFile;
  Value : String;
  LcValidade : TDateTime;
begin
  try
    Lc_Arq_Ini        := TIniFile.Create(getPathExe + 'config.ini');
    LcValidade := ConverteDataHora(Lc_Arq_Ini.ReadString('APIPAYPAL', 'date_expiration_refresh_token',''));
    if (LcValidade < Now ) then
    Begin
      RESTRequest.Params.Clear;
      with RESTRequest.Params.AddItem do
      Begin
        Kind := pkGETorPOST;
        name := 'refresh_token';
        Value := Lc_Arq_Ini.ReadString('APIPAYPAL', 'refresh_token','');
      End;

      RESTRequest.Method := rmGET;
      RESTRequest.Resource := 'auth';

      RESTRequest.Execute;
      //
      Value := getCamposJsonString(RESTResponse.Content,'message');
      Lc_Arq_Ini.WriteString('APIPAYPAL', 'message',Value);

      Value := getCamposJsonString(RESTResponse.Content,'access_token');
      Lc_Arq_Ini.WriteString('APIPAYPAL', 'access_token',Value);
      //
      Value := getCamposJsonString(RESTResponse.Content,'refresh_token');
      Lc_Arq_Ini.WriteString('APIPAYPAL', 'refresh_token',Value);
      //
      Value := getCamposJsonString(RESTResponse.Content,'date_expiration_access_token');
      Lc_Arq_Ini.WriteString('APIPAYPAL', 'date_expiration_access_token',Value);
      //
      Value := getCamposJsonString(RESTResponse.Content,'date_expiration_refresh_token');
      Lc_Arq_Ini.WriteString('APIPAYPAL', 'date_expiration_refresh_token',Value);

    End;
  finally
    FreeAndNil(Lc_Arq_Ini);
  end;


end;

procedure TPayPal.configComponents(Operacao, Recurso,Metodo, ID, Param: String);
Var
  Lc_Arq_Ini: TIniFile;
  LcContentType: TRESTContentType;
  LcUrl : String;
  LcAccessToKen : String;

begin
  Try
    RESTClient.ResetToDefaults;
    RESTRequest.ResetToDefaults;
    RESTResponse.ResetToDefaults;

    Lc_Arq_Ini := TIniFile.Create(getPathExe + 'config.ini');
    //bASE URL / PORTA / api/gestao/ Recurso / metodo
    //http://localhost:223/api/gestao/TSMAgency/getByKey/1
    LcUrl := concat(Url_Api,':',porta,'/api/gestao/',Recurso,'/',Metodo,'/',PAram);
    LcAccessToKen := concat('?access_token=',Lc_Arq_Ini.ReadString('APIPAYPAL', 'access_token',''));
    RESTClient.ContentType := 'application/json';

    case AnsiIndexStr(UpperCase(Operacao), ['I', 'U','D','C']) of
      0:Begin
          RESTClient.BaseURL := concat(LcUrl,LcAccessToKen);
          RESTRequest.Method := rmPOST;
        End;
      1:Begin
          RESTClient.BaseURL := concat(LcUrl,ID,LcAccessToKen);
          RESTRequest.Method := rmPUT;
        End;
      2:Begin
          RESTClient.BaseURL := concat(LcUrl,ID,LcAccessToKen,Param);
          RESTRequest.Method := rmDELETE;
        End;
      3:Begin
          RESTClient.BaseURL := concat(LcUrl);
          RESTRequest.Method := rmGET;
        End;
    end;
  Finally
    FreeAndNil(Lc_Arq_Ini);
  End;


end;

function TPayPal.ConverteDataHora(Tempo: String): TDateTime;
Var
  LcAno:String;
  LcMes:String;
  LcDia:String;
  LcTime:String;
begin
  //2018-09-19 01:12:18'
  LcAno   := Copy(Tempo,1,4);
  LcMes   := Copy(Tempo,6,2);
  LcDia   := Copy(Tempo,9,2);
  LcTime  := Copy(Tempo,12,8);
  Result := StrToDateTimeDef(concat(LcDia,'/',LcMes,'/',LcAno,' ',LcTime),now);


end;

constructor TPayPal.Create(AOwner: TComponent);
var
  Lc_Arq_Ini : TIniFile;
begin
  inherited;
  Try
    Lc_Arq_Ini        := TIniFile.Create(getPathExe + 'config.ini');

    Path_Product_Img  := Lc_Arq_Ini.ReadString('APIPAYPAL', 'pasta_image','');
    Url_Api           := Lc_Arq_Ini.ReadString('APIPAYPAL', 'url','');

    RESTClient    := TRESTClient.Create(Url_Api);
    RESTRequest   := TRESTRequest.Create(nil);
    RESTResponse  := TRESTResponse.Create(nil);
    RESTResponseDSA := TRESTResponseDataSetAdapter.Create(nil);
    FDMemTable    := TFDMemTable.Create(nil);

    //Configura
    RESTClient.ContentType := 'Content-Type: application/json';
    RESTRequest.Client := RESTClient;
    RESTRequest.Response := RESTResponse;
    RESTResponseDSA.Response := RESTResponse;
    RESTResponseDSA.NestedElements := TRue;
    RESTResponseDSA.Dataset := FDMemTable;
  Finally
    FreeAndNil( Lc_Arq_Ini );
  End;
end;

destructor TPayPal.Destroy;
begin
  RESTClient.DisposeOf;
  RESTRequest.DisposeOf;
  RESTResponse.DisposeOf;
  inherited;
end;

procedure TPayPal.geralog(acesso: string);
var
  Arq : TextFile;
  Data : String;
  LcArq : String;
begin
exit;
  Data := DateToStr(Now);
  Data := StringReplace(Data,'/','-',[rfReplaceAll]);
  LcArq := Concat(ExtractFilePath(ParamStr(0)),'log\',Data ,'.log');
  AssignFile(Arq, LcArq );
  if not FileExists( LcArq ) then
    Rewrite(arq, LcArq)
  else
    Append(arq);
  Writeln(Arq, concat(DateTimeToStr(Now),acesso));
  Writeln(Arq, '');
  CloseFile(Arq);
end;

function TPayPal.gerarAccessToken: String;
Var
  LcStrJSon : String;
  LcJSon : TJsonObject;
  LcValorJSon : TJSONValue;
  Lc_Arq_Ini: TIniFile;
  Value : String;
  LcValidade : TDateTime;
begin
  try
    Lc_Arq_Ini        := TIniFile.Create(getPathExe + 'config.ini');
    //'2018-09-19 01:12:18'
    LcValidade := ConverteDataHora(Lc_Arq_Ini.ReadString('APIPAYPAL', 'date_expiration_access_token',''));
    if (LcValidade < Now ) then
    Begin
      RESTRequest.Params.Clear;
      with RESTRequest.Params.AddItem do
      Begin
        Kind := pkGETorPOST;
        name := 'consumer_key';
        Value := Lc_Arq_Ini.ReadString('APIPAYPAL', 'consumer_key','');
      End;
      with RESTRequest.Params.AddItem do
      Begin
        Kind := pkGETorPOST;
        name := 'consumer_secret';
        Value := Lc_Arq_Ini.ReadString('APIPAYPAL', 'consumer_secret','');
      End;

      with RESTRequest.Params.AddItem do
      Begin
        Kind := pkGETorPOST;
        name := 'code';
        Value := Lc_Arq_Ini.ReadString('APIPAYPAL', 'code','');
      End;
      RESTRequest.Method := rmPOST;
      RESTRequest.Resource := 'auth';

      RESTRequest.Execute;
      //
      Value := getCamposJsonString(RESTResponse.Content,'message');
      Lc_Arq_Ini.WriteString('APIPAYPAL', 'message',Value);
      //
      Value := getCamposJsonString(RESTResponse.Content,'access_token');
      Lc_Arq_Ini.WriteString('APIPAYPAL', 'access_token',Value);
      //
      Value := getCamposJsonString(RESTResponse.Content,'refresh_token');
      Lc_Arq_Ini.WriteString('APIPAYPAL', 'refresh_token',Value);
      //
      Value := getCamposJsonString(RESTResponse.Content,'date_expiration_access_token');
      Lc_Arq_Ini.WriteString('APIPAYPAL', 'date_expiration_access_token',Value);
      //
      Value := getCamposJsonString(RESTResponse.Content,'date_expiration_refresh_token');
      Lc_Arq_Ini.WriteString('APIPAYPAL', 'date_expiration_refresh_token',Value);
      //
      Value := getCamposJsonString(RESTResponse.Content,'date_activated');
      Lc_Arq_Ini.WriteString('APIPAYPAL', 'date_activated',Value);
    End;
  finally
    FreeAndNil(Lc_Arq_Ini);
  end;
end;

function TPayPal.getData(Data: String): Boolean;
begin
  Try
    RESTRequest.Execute;
    Result := True;
  except
    on E : Exception do
    Begin
      Result := False;
      Pc_LogTarefasDelphi(concat('APIPAYPAL - ', E.Message,' - ',RESTResponse.Content));
    End;
  End;

end;

procedure TPayPal.GetIdInstitutionWeb;
Var
  LcValorJSon : TJSONValue;
begin
  //Desabilita o Botão
  if FInstiturionWeb = 0 then
  Begin
    Try
      //LcvalorJSon := FDataCM.SMInstitutionClient.getCodigo(FCNPJ);
      FInstiturionWeb := StrToIntDef( LcvalorJSon.Value,0 );
    Except
      on E: Exception do
      Begin
        Pc_LogTarefasDelphi(concat('GetIdInstitutionWeb - ', E.Message));
        FInstiturionWeb := 0;
      end;
    end;
  end;
end;

function TPayPal.sendData(Data: String): Boolean;
begin
  Try
    RESTRequest.Body.Add(concat('''',Data,''''), TRESTContentType.ctAPPLICATION_JSON);
    RESTRequest.Execute;
    Result := True;
  except
    on E : Exception do
    Begin
      Result := False;
      Pc_LogTarefasDelphi(concat('APIPAYPAL - ', E.Message,' - ',RESTResponse.Content));
    End;
  End;

end;

procedure TPayPal.updateMsgProcess( pMsg: String; msgIndex: Integer);
Begin
  TThread.Synchronize(nil,
    procedure
    Begin
      try

      except

      end;
    end
  );
end;

end.
