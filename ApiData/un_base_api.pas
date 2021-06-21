unit un_base_api;

interface

uses  Classes,System.SysUtils,System.StrUtils, Gauges, Vcl.Forms,REST.Json,System.Json,
    Vcl.Dialogs,   un_dm, ControllerProduto,un_sistema,un_funcoes, tblProduto,
   REST.Response.Adapter, REST.Client,REST.Types, Data.Bind.Components,
   Data.Bind.ObjectScope, System.IniFiles, ControllerPedido, FireDAC.Comp.Client,
   IBX.IBDatabase, Data.DB, ControllerSincronia;
type

  TBaseAPI = Class(TComponent)

    private
    protected
      RESTClient: TRESTClient;
      RESTRequest: TRESTRequest;
      RESTResponse: TRESTResponse;
      RESTResponseDSA: TRESTResponseDataSetAdapter;
      FDMemTable: TFDMemTable;

      Sincronia  : TControllerSincronia;
      Path_Product_Img : String;
      Url_Api : String;
      porta : STring;
      function ConverteDataHora(Tempo:String):TDateTime;
      function gerarAccessToken:String;
      function AtualizarAccessToken:String;
      procedure getListSincronia(Tabela:String);

      procedure configComponents(Operacao,Recurso,Metodo,ID,Param:String);
      function sendData(Data:String):Boolean;
      function getData(Data:String):Boolean;

    public
      progresso : TGauge;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;

  End;

implementation

{ TBaseAPI }

function TBaseAPI.AtualizarAccessToken: String;
Var
  LcStrJSon : String;
  LcJSon : TJsonObject;
  LcValorJSon : TJSONValue;
  Lc_Arq_Ini: TIniFile;
  Value : String;
  LcValidade : TDateTime;
begin
  try
    Lc_Arq_Ini        := TIniFile.Create(GbPathExe + 'config.ini');
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
    FreeAndNil(Lc_Arq_Ini);
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

    Lc_Arq_Ini := TIniFile.Create(GbPathExe + 'config.ini');
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
    FreeAndNil(Lc_Arq_Ini);
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
var
  Lc_Arq_Ini : TIniFile;
begin
  inherited;
  Try
    Lc_Arq_Ini        := TIniFile.Create(GbPathExe + 'config.ini');
    Path_Product_Img  := Lc_Arq_Ini.ReadString('APISETES', 'pasta_image','');
    Url_Api           := Lc_Arq_Ini.ReadString('APISETES', 'url','');

    Sincronia     := TControllerSincronia.Create(nil);
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

destructor TBaseAPI.Destroy;
begin
  FreeAndNil( RESTClient );
  FreeAndNil( RESTRequest );
  FreeAndNil( RESTResponse );
  FreeAndNil( Sincronia );
  inherited;
end;

function TBaseAPI.gerarAccessToken: String;
Var
  LcStrJSon : String;
  LcJSon : TJsonObject;
  LcValorJSon : TJSONValue;
  Lc_Arq_Ini: TIniFile;
  Value : String;
  LcValidade : TDateTime;
begin
  try
    Lc_Arq_Ini        := TIniFile.Create(GbPathExe + 'config.ini');
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
    FreeAndNil(Lc_Arq_Ini);
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
      Pc_LogTarefasDelphi(concat('APISETES - ', E.Message,' - ',RESTResponse.Content));
    End;
  End;

end;

procedure TBaseAPI.getListSincronia(Tabela: String);
Var
  LcTime : TDatetime;
begin
  //Banco Local
  dm.setBDCrud(dm.IBD_Gestao);
  with Sincronia.SyncClient.Registro do
  Begin
    Codigo := Tabela;
    //R - Recieve / S - Send / W - Web / L - Envia Loja Tray / T - Recebe Loja Tray
    Sentido := 'L';
  End;
  LcTime := Sincronia.SyncClient.getTime;
  Sincronia.Registro.Tabela := Tabela;
  Sincronia.Registro.Tempo := LcTime;
  Sincronia.getList;
  progresso.MinValue := 0;
  progresso.MaxValue := Sincronia.Lista.Count;
  Application.ProcessMessages;
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
      Pc_LogTarefasDelphi(concat('APISETES - ', E.Message,' - ',RESTResponse.Content));
    End;
  End;

end;

end.
