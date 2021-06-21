unit api_receita_ws;

interface

uses  Classes,SysUtils,StrUtils,    REST.Response.Adapter, REST.Client,REST.Types,
    Data.Bind.Components,   FireDAC.Comp.Client,   CnpjReceita, UnFunctions;
type

  TApiReceitaWs = Class(TComponent)

    private
    FCNPJ: String;
    procedure setFCNPJ(const Value: String);
    protected
      RESTClient: TRESTClient;
      RESTRequest: TRESTRequest;
      RESTResponse: TRESTResponse;
      RESTResponseDSA: TRESTResponseDataSetAdapter;
      FDMemTable: TFDMemTable;

      Url_Api : String;

      function ConverteDataHora(Tempo:String):TDateTime;

      procedure configComponents;
      function sendData(Data:String):Boolean;
      function getData(Data:String):Boolean;
    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      property CNPJ :String read FCNPJ write setFCNPJ;
      function getDados:TCnpjReceita;
  End;

implementation

{ TApiReceitaWs }

uses Un_Msg;


procedure TApiReceitaWs.configComponents;
Var
  LcContentType: TRESTContentType;
  LcUrl : String;
begin
  RESTClient.ResetToDefaults;
  RESTRequest.ResetToDefaults;
  RESTResponse.ResetToDefaults;

  LcUrl := concat('https://www.receitaws.com.br/v1/cnpj/',FCNPJ);
  RESTClient.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
  RESTClient.AcceptCharset :=  'UTF-8, *;q=0.8';
  RESTClient.ContentType := '';

  RESTClient.BaseURL := concat(LcUrl);
  RESTRequest.Method := rmGET;
end;

function TApiReceitaWs.ConverteDataHora(Tempo: String): TDateTime;
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

constructor TApiReceitaWs.Create(AOwner: TComponent);
begin
  inherited;
  RESTClient    := TRESTClient.Create(Url_Api);
  RESTRequest   := TRESTRequest.Create(nil);
  RESTResponse  := TRESTResponse.Create(nil);
  RESTResponseDSA := TRESTResponseDataSetAdapter.Create(nil);
  FDMemTable    := TFDMemTable.Create(nil);

  //Configura
  RESTClient.ContentType := '';
  RESTRequest.Client := RESTClient;
  RESTRequest.Response := RESTResponse;
  RESTResponseDSA.Response := RESTResponse;
  RESTResponseDSA.NestedElements := TRue;
  RESTResponseDSA.Dataset := FDMemTable;
end;

destructor TApiReceitaWs.Destroy;
begin
  FDMemTable.Close;
  FDMemTable.DisposeOf;
  RESTClient.DisposeOf;
  RESTRequest.DisposeOf;
  RESTResponse.DisposeOf;
  inherited;
end;


function TApiReceitaWs.getDados: TCnpjReceita;
begin
  Result := TCnpjReceita.Create;
  configComponents;
  getData('');
  if Trim(RESTResponse.Content) <> '' then
  Begin
    try
      if FDMemTable.Active then FDMemTable.Active := True;

      with FDMemTable, Result do
      Begin
        EmpresaTipo   :=  FieldByName('tipo').AsString;
        RazaoSocial   :=  FieldByName('nome').AsString;
        Porte         :=  FieldByName('porte').AsString;
        Abertura      :=  StrToDateDef(FieldByName('abertura').AsString,Date);
        Fantasia      :=  FieldByName('fantasia').AsString;
        Endereco      :=  FieldByName('logradouro').AsString;
        Numero        :=  FieldByName('numero').AsString;
        Complemento   :=  FieldByName('complemento').AsString;
        Bairro        :=  FieldByName('bairro').AsString;
        Cidade        :=  FieldByName('municipio').AsString;
        UF            :=  FieldByName('uf').AsString;
        CEP           :=  FieldByName('cep').AsString;
        Situacao      :=  FieldByName('situacao').AsString;
        EndEletronico :=  FieldByName('email').AsString;
        Telefone      :=  FieldByName('telefone').AsString;
      End;
    except
      on e:exception do
       Begin
         FDMemTable.close;
         MensagemPadrao('Mensagem de erro', 'A T E N Ç Ã O!.' + EOLN + EOLN +
                        'Houve um erro no tratamento dos dados.' + EOLN +
                        'Feche esta tela e tente novamente' + EOLN,
                        ['OK'], [bEscape], mpAlerta);


       End;
    end;
  End;
end;

function TApiReceitaWs.getData(Data: String): Boolean;
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


function TApiReceitaWs.sendData(Data: String): Boolean;
begin
  Try
    RESTResponse.RootElement := '';
    FDMemTable.IndexFieldNames := '';
    FDMemTable.Active := False;

    RESTRequest.Body.Add(Data, TRESTContentType.ctAPPLICATION_JSON);
    RESTRequest.Execute;
    Result := True;
  except
    on E : Exception do
    Begin
      Result := False;
    End;
  End;

end;

procedure TApiReceitaWs.setFCNPJ(const Value: String);
begin
  FCNPJ := Value;
end;


end.
