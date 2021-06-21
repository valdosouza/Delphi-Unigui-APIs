unit un_base_api;

interface

uses  Classes,System.SysUtils,System.StrUtils, Gauges, Vcl.Forms,REST.Json,System.Json,
      Vcl.Dialogs, un_dm, un_sistema,un_funcoes,Data.DB,
     System.Generics.Collections,REST.Response.Adapter, REST.Client,REST.Types,
     Data.Bind.Components,Data.Bind.ObjectScope, System.IniFiles, FireDAC.Comp.Client,
      uAuthCM,uDataCM,

      ControllerProduto,ControllerSincronia,listaTables,ControllerGestaoWeb,
      ControllerPedido,

      objOrderSale,

      tblProduto,tbldevices, Vcl.StdCtrls, Winapi.Windows, tblSincronia;
type
  TBaseAPI = Class(TComponent)

    private
      procedure setFCNPJ(const Value: String);
      procedure setFEstabelecimento(const Value: Integer);
    procedure setFListbox(const Value: TListBox);
    procedure setFDispositivo(const Value: Integer);
    procedure setFAuthCM(const Value: TAuthCM);
    procedure setFDataCM(const Value: TDataCM);
    procedure setFDataModel(const Value: TDM);
    procedure setFInstiturionWeb(const Value: Integer);
    procedure setFDescricao(const Value: String);

    protected
      FDataModel: TDM;
      FDataCM: TDataCM;
      FAuthCM : TAuthCM;
      FlistBox: TListBox;
      FEstabelecimento: Integer;
      FCNPJ: String;
      FDispositivo: Integer;
      FDescricao: String;
      FInstiturionWeb: Integer;

      RESTClient: TRESTClient;
      RESTRequest: TRESTRequest;
      RESTResponse: TRESTResponse;
      RESTResponseDSA: TRESTResponseDataSetAdapter;
      FDMemTable: TFDMemTable;

      FSincronia   : TControllerSincronia;
      FListaTables : TcontrollerTable;
      FGesWeb      : TControllerGestaoWeb;

      Path_Product_Img : String;
      Url_Api : String;
      porta : STring;


      function ConverteDataHora(Tempo:String):TDateTime;
      function gerarAccessToken:String;
      function AtualizarAccessToken:String;

      procedure configComponents(Operacao,Recurso,Metodo,ID,Param:String);
      function sendData(Data:String):Boolean;
      function getData(Data:String):Boolean;
      Procedure geralog(acesso : string);

      procedure getListSincronia(pTabela: String;pSentido:String);//plista:TListaSincronia);

      function getLastUpdate(pTabela: String;pSentido:String):TDateTime;
      procedure SetLastUpdate(Tabela, pSentido: String; tempo: TDateTime);

      procedure updateMsgProcess( pMsg: String; msgIndex: Integer);
      procedure SetProgressBar( MaxValue : Integer);

      procedure getInstitutionWeb;
      procedure getDispositivo;
      function ValidaConexao : Boolean;
    public

      progresso : TGauge;

      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure inicializa;Virtual;
      property CNPJ :String read FCNPJ write setFCNPJ;
      property Estabelecimento : Integer read FEstabelecimento write setFEstabelecimento;
      property InstiturionWeb : Integer read FInstiturionWeb write setFInstiturionWeb;
      property Dispositivo : Integer read FDispositivo write setFDispositivo;
      property Descricao : String read FDescricao write setFDescricao;
      property ListBox : TListBox read FlistBox write setFListbox;
      property DataModel: TDM    read FDataModel write setFDataModel;
      property DataCM: TDataCM   read FDataCM write setFDataCM;
      property AuthCM : TAuthCM  read FAuthCM write setFAuthCM;

  End;

implementation

{ TBaseAPI }

uses UnFunctions;


function TBaseAPI.AtualizarAccessToken: String;
Var
  LcStrJSon : String;
  LcValorJSon : TJSONValue;
  Lc_Arq_Ini: TIniFile;
  Value : String;
  LcValidade : TDateTime;
begin
  try
    Lc_Arq_Ini        := TIniFile.Create(getPathExe + 'config.ini');
    LcValidade := ConverteDataHora(Lc_Arq_Ini.ReadString('APISETES', 'date_expiration_refresh_token',''));
    if (LcValidade < Now ) then
    Begin
      RESTRequest.Params.Clear;
      with RESTRequest.Params.AddItem do
      Begin
        Kind := pkGETorPOST;
        name := 'refresh_token';
        Value := Lc_Arq_Ini.ReadString('APISETES', 'refresh_token','');
      End;

      RESTRequest.Method := rmGET;
      RESTRequest.Resource := 'auth';
      TRy
        RESTRequest.Execute;
        //
        Value := getCamposJsonString(RESTResponse.Content,'message');
        Lc_Arq_Ini.WriteString('APISETES', 'message',Value);

        Value := getCamposJsonString(RESTResponse.Content,'access_token');
        Lc_Arq_Ini.WriteString('APISETES', 'access_token',Value);
        //
        Value := getCamposJsonString(RESTResponse.Content,'refresh_token');
        Lc_Arq_Ini.WriteString('APISETES', 'refresh_token',Value);
        //
        Value := getCamposJsonString(RESTResponse.Content,'date_expiration_access_token');
        Lc_Arq_Ini.WriteString('APISETES', 'date_expiration_access_token',Value);
        //
        Value := getCamposJsonString(RESTResponse.Content,'date_expiration_refresh_token');
        Lc_Arq_Ini.WriteString('APISETES', 'date_expiration_refresh_token',Value);

      Except
        on E : Exception do
          ShowMessage( E.Message);
      End;
    End;
  finally
    Lc_Arq_Ini.DisposeOf;
  end;


end;

procedure TBaseAPI.configComponents(Operacao, Recurso,Metodo, ID, Param: String);
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
    LcAccessToKen := concat('?access_token=',Lc_Arq_Ini.ReadString('APISETES', 'access_token',''));
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
    Lc_Arq_Ini.DisposeOf;
  End;


end;

function TBaseAPI.ConverteDataHora(Tempo: String): TDateTime;
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

constructor TBaseAPI.Create(AOwner: TComponent);
begin

end;


destructor TBaseAPI.Destroy;
begin
  FSincronia.DisposeOf;
  FListaTables.DisposeOf;
  FGesWeb.DisposeOf;

  FDMemTable.DisposeOf;
  RESTResponseDSA.DisposeOf;
  RESTResponse.DisposeOf;
  RESTRequest.DisposeOf;
  RESTClient.DisposeOf;

  inherited;
end;

procedure TBaseAPI.geralog(acesso: string);
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

function TBaseAPI.gerarAccessToken: String;
Var
  LcStrJSon : String;
  LcValorJSon : TJSONValue;
  Lc_Arq_Ini: TIniFile;
  Value : String;
  LcValidade : TDateTime;
begin
  try
    Lc_Arq_Ini        := TIniFile.Create(getPathExe + 'config.ini');
    //'2018-09-19 01:12:18'
    LcValidade := ConverteDataHora(Lc_Arq_Ini.ReadString('APISETES', 'date_expiration_access_token',''));
    if (LcValidade < Now ) then
    Begin
      RESTRequest.Params.Clear;
      with RESTRequest.Params.AddItem do
      Begin
        Kind := pkGETorPOST;
        name := 'consumer_key';
        Value := Lc_Arq_Ini.ReadString('APISETES', 'consumer_key','');
      End;
      with RESTRequest.Params.AddItem do
      Begin
        Kind := pkGETorPOST;
        name := 'consumer_secret';
        Value := Lc_Arq_Ini.ReadString('APISETES', 'consumer_secret','');
      End;

      with RESTRequest.Params.AddItem do
      Begin
        Kind := pkGETorPOST;
        name := 'code';
        Value := Lc_Arq_Ini.ReadString('APISETES', 'code','');
      End;
      RESTRequest.Method := rmPOST;
      RESTRequest.Resource := 'auth';
      TRy
        RESTRequest.Execute;
        //
        Value := getCamposJsonString(RESTResponse.Content,'message');
        Lc_Arq_Ini.WriteString('APISETES', 'message',Value);
        //
        Value := getCamposJsonString(RESTResponse.Content,'access_token');
        Lc_Arq_Ini.WriteString('APISETES', 'access_token',Value);
        //
        Value := getCamposJsonString(RESTResponse.Content,'refresh_token');
        Lc_Arq_Ini.WriteString('APISETES', 'refresh_token',Value);
        //
        Value := getCamposJsonString(RESTResponse.Content,'date_expiration_access_token');
        Lc_Arq_Ini.WriteString('APISETES', 'date_expiration_access_token',Value);
        //
        Value := getCamposJsonString(RESTResponse.Content,'date_expiration_refresh_token');
        Lc_Arq_Ini.WriteString('APISETES', 'date_expiration_refresh_token',Value);
        //
        Value := getCamposJsonString(RESTResponse.Content,'date_activated');
        Lc_Arq_Ini.WriteString('APISETES', 'date_activated',Value);
      Except
        on E : Exception do
          ShowMessage( E.Message);
      End;
    End;
  finally
    Lc_Arq_Ini.DisposeOf;
  end;
end;

function TBaseAPI.getData(Data: String): Boolean;
begin
  Try
    RESTRequest.Execute;
    Result := True;
  except
    on E : Exception do
    Begin
      Result := False;
    End;
  End;

end;


procedure TBaseAPI.GetInstitutionWeb;
Var
  LcStrJSon : String;
begin
  //Desabilita o Botão
  if FInstiturionWeb = 0 then
  Begin
    Try
      LcStrJSon := FDataCM.SMInstitutionClient.getCodigo(FCNPJ);
      FInstiturionWeb := StrToIntDef( LcStrJSon,0 );
    Except
      on E: Exception do
      Begin
        FInstiturionWeb := 0;
      end;
    end;
  end;
end;

function TBaseAPI.getLastUpdate(pTabela, pSentido: String): TDateTime;
begin
  //Banco Local
  FDataModel.setBDCrud(FDataModel.IBD_Gestao);
  with FSincronia.SyncClient.Registro do
  Begin
    Codigo := pTabela;
    //D - Desktop / W - Web / M - Mobile
    Sentido := pSentido;
  End;
  Result := FSincronia.SyncClient.getTime;

end;

procedure TBaseAPI.getListSincronia(pTabela: String;pSentido:String);//;plista:TListaSincronia);
Var
  LcTime : TDatetime;
  I:Integer;
  LcSincronia : TSincronia;
begin
  //Banco Local
  FDataModel.setBDCrud(FDataModel.IBD_Gestao);
  LcTime := getLastUpdate(pTabela,pSentido);
  if  (pTabela = 'TB_NF_AVULSA') OR
      (pTabela = 'TB_NF_AVULSA') OR
      (pTabela = 'TB_NF_AVULSA') OR
      (pTabela = 'TB_NF_AVULSA') then
  Begin
    pTabela := 'TB_NOTA_FISCAL';
  end;

  FSincronia.Registro.Tabela := pTabela;
  FSincronia.Registro.Tempo := LcTime;
  FSincronia.getList;
  {
  for I := 0 to FSincronia.Lista.Count - 1 do
  BEgin
    LcSincronia := TSincronia.Create;
    FSincronia.ClonarObj(FSincronia.Lista[I],LcSincronia);
    plista.Add(LcSincronia);
  end;
  }
end;


procedure TBaseAPI.inicializa;
var
  Lc_Arq_Ini : TIniFile;
begin
  inherited;
  Try
    Lc_Arq_Ini        := TIniFile.Create(getPathExe + 'config.ini');

    FSincronia  := TControllerSincronia.Create(self);
    FSincronia.DataMod := FDataModel;

    FListaTables := TcontrollerTable.create(self);

    FGesWeb := TControllerGestaoWeb.Create(Self);
    FGesWeb.DataMod := FDataModel;



    Path_Product_Img  := Lc_Arq_Ini.ReadString('APISETES', 'pasta_image','');
    Url_Api           := Lc_Arq_Ini.ReadString('APISETES', 'url','');

    RESTClient    := TRESTClient.Create(Url_Api);
    RESTRequest   := TRESTRequest.Create(self);
    RESTResponse  := TRESTResponse.Create(self);
    RESTResponseDSA := TRESTResponseDataSetAdapter.Create(self);
    FDMemTable    := TFDMemTable.Create(self);

    //Configura
    RESTClient.ContentType := 'Content-Type: application/json';
    RESTRequest.Client := RESTClient;
    RESTRequest.Response := RESTResponse;
    RESTResponseDSA.Response := RESTResponse;
    RESTResponseDSA.NestedElements := TRue;
    RESTResponseDSA.Dataset := FDMemTable;
  Finally
    Lc_Arq_Ini.DisposeOf;
  End;

end;

function TBaseAPI.sendData(Data: String): Boolean;
begin
  Try
    RESTRequest.Body.Add(concat('''',Data,''''), TRESTContentType.ctAPPLICATION_JSON);
    RESTRequest.Execute;
    Result := True;
  except
    on E : Exception do
    Begin
      Result := False;
    End;
  End;

end;

procedure TBaseAPI.setFAuthCM(const Value: TAuthCM);
begin
  FAuthCM := Value;
end;

procedure TBaseAPI.setFCNPJ(const Value: String);
begin
  FCNPJ := RemoveCaracterInformado(Value, ['.','.','/','-']);
end;


procedure TBaseAPI.setFDataCM(const Value: TDataCM);
begin
  FDataCM := Value;
end;

procedure TBaseAPI.setFDataModel(const Value: TDM);
begin
  FDataModel := Value;
end;

procedure TBaseAPI.setFDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TBaseAPI.setFDispositivo(const Value: Integer);
begin
  FDispositivo := Value;
end;

procedure TBaseAPI.setFEstabelecimento(const Value: Integer);
begin
  FEstabelecimento := Value;
end;

procedure TBaseAPI.setFInstiturionWeb(const Value: Integer);
begin
  FInstiturionWeb := Value;
end;

procedure TBaseAPI.setFListbox(const Value: TListBox);
begin
  FlistBox := Value;
end;


procedure TBaseAPI.updateMsgProcess( pMsg: String; msgIndex: Integer);
Begin
  TThread.Synchronize(nil,
    procedure
    Begin
      try
        FlistBox.Items[msgIndex] := pMsg;
        progresso.Progress := progresso.Progress + 1;
        Application.ProcessMessages;
      except
        on E: Exception do
        BEgin
          FlistBox.Items[msgIndex] := concat('Indice: ',msgIndex.ToString,' - ',e.Message);
        End;
      end;
    end
  );
end;

function TBaseAPI.ValidaConexao: Boolean;
begin
  Result := True;
  getInstitutionWeb;
  if ( FInstiturionWeb = 0) then
  Begin
    FlistBox.Items.Add('Estabelecimento não registrado no Sistema Web');
    Result := False;
    exit;
  end;

  getDispositivo;
  if ( FDispositivo = 0)  then
  Begin
    FlistBox.Items.Add('Dispositivo não autorizado no Sistema Web');
    Result := False;
    exit;
  end;
end;

procedure TBaseAPI.getDispositivo;
Var
  LcValidade: Tdate;
  LcDEviceOut,LcDEviceIN : TDevices;
  LcStrJSon : String;
  LcJson : TJSONObject;
begin
  if FDispositivo = 0 then
  Begin
    TRy
      LcValidade := StrToDateDef(Fc_Aq_Geral('L','SINCRONIA','VALIDADE','0'),0);
      LcDEviceOut := TDevices.create;
      LcDEviceOut.Codigo := 0;
      LcDEviceOut.Estabelecimento := FInstiturionWeb;
      LcDEviceOut.Descricao := Fc_NomeComputador;

      LcDEviceOut.Usuario := 1;
      LcDEviceOut.Identificacao :=  Fc_Aq_Geral('L','SINCRONIA','TERMINAL','0');

      LcDEviceOut.Validade := Date + 30;

      LcDEviceOut.NomeApp := 'Roteador';
      LcDEviceOut.Ativo := 'N';
      LcStrJSon := TJson.ObjectToJsonString(LcDEviceOut);
      LcJson := TJSONObject.Create;
      LcJson := FAuthCM.SMClient.validaMobileDevice(LcStrJSon);
      LcDEviceIN := TDevices.create;
      LcDEviceIN := TJson.JsonToObject<TDevices>(LcJson);
      if LcDEviceIN.Ativo = 'S' then
      BEgin
        LcValidade    := LcDEviceIN.Validade;
        FDispositivo  := LcDEviceIN.Codigo;
        FDESCRICAO    := LcDEviceIN.Descricao;
        Fc_Aq_Geral('G','SINCRONIA','VALIDADE',DateToStr(LcValidade));
        Fc_Aq_Geral('G','SINCRONIA','TERMINAL',LcDEviceIN.Codigo.ToString);
      End;
    finally
      LcDEviceOut.DisposeOf;
      LcDEviceIN.DisposeOf;
      LcJson.DisposeOf;
    end;
  end;
end;

procedure TBaseAPI.SetLastUpdate(Tabela, pSentido: String; tempo: TDateTime);
Var
  LcStrDataTime : String;
begin
  with FSincronia.SyncClient.Registro do
  Begin
    Codigo := Tabela;
    Sentido := pSentido;
    LcStrDataTime := DateTimeToStr(Tempo);
    //13/12/2017 01:37:38
    Data := StrToDate(Copy(LcStrDataTime,1,10));
    Hora := StrToTimeDef(Copy(LcStrDataTime,12,8 ),StrToTime('00:00:00'));
    OPerador := 0;
  End;
  FSincronia.SyncClient.save;
end;

procedure TBaseAPI.SetProgressBar(MaxValue: Integer);
begin
  TThread.Synchronize(nil,
    procedure
    Begin
      progresso.Progress := 0;
      progresso.MinValue := 0;
      progresso.MaxValue := MaxValue;
      Application.ProcessMessages;
    end
  );
end;

end.
