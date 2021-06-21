unit print_entities;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_impressao, uniGroupBox, uniLabel,
  uniGUIClasses, uniMultiItem, uniListBox, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniPanel, fm_state, fm_city,uReportCM, MainModule,
  Main,REST.Json, unMessages, prm_print_entities, Data.DB, Datasnap.DBClient,
  Vcl.Menus, uniMainMenu;

type
  TPrintEntities = class(TBaseImpressao)
    ctn_state: TUniContainerPanel;
    ctn_city: TUniContainerPanel;
    procedure initVariable;override;
    procedure FormatScreen;Override;
    procedure OnChange(Sender: TObject);
  private
    procedure prtCustomer;
    procedure prtProvider;
    procedure prtCarrier;
  protected
    FrState : TFmState;
    FrCity : TFmCity;
    Par : TPrmPrintEntities;
    procedure ShowState;
    procedure ShowCity;
    function validadePrint:Boolean;Override;
    procedure setPrint;Override;
    function getparameters:TPrmPrintEntities;
  public
    { Public declarations }

  end;

var
  PrintEntities: TPrintEntities;

implementation

{$R *.dfm}

uses openReports;

{ TPrintentities }

procedure TPrintEntities.FormatScreen;
begin
  ShowState;
  ShowCity;
end;

procedure TPrintEntities.prtCarrier;
Var
  LcJSon : String;
  LcCM : TReportCM;
begin
  try
    ShowMask('Aguarde Processamento do relatório...');
    Par := getparameters;
    LcJSon := TJson.ObjectToJsonString(Par);
    LcCM := TReportCM.Create(Self);
    LcJSon := LcCM.SMGeneralClient.GetCarrierFile(LcJSon);
    Par := TJson.JsonToObject<TPrmPrintEntities>(LcJson);
    if Par.Resultado then
    begin
      openReportViewer('Cadastro Transportadora',Par.url);
    end
    else
    Begin
      MensageAlert(['A T E N Ç Ã O!.',
                   '',
                      'Campo Nome não informado.',
                      'Preencha o campo para continuar']);
    End;
  finally
    HideMask;
    FreeAndNil(LcCM);
  end;
end;

procedure TPrintEntities.prtCustomer;
Var
  LcJSon : String;
  LcCM : TReportCM;
begin
  try
    ShowMask('Aguarde Processamento do relatório...');
    Par := getparameters;
    LcJSon := TJson.ObjectToJsonString(Par);
    LcCM := TReportCM.Create(Self);
    LcJSon := LcCM.SMGeneralClient.GetCustomerFile(LcJSon);
    UniSession.Synchronize;
    Par := TJson.JsonToObject<TPrmPrintEntities>(LcJson);
    UniSession.Synchronize;
    if Par.Resultado then
    begin
      openReportViewer('Cadastro Cliente',Par.url);
      UniSession.Synchronize;
    end
    else
    Begin
      MensageAlert(['A T E N Ç Ã O!.',
                   '',
                      'Campo Nome não informado.',
                      'Preencha o campo para continuar']);
    End;
  finally
    HideMask;
    FreeAndNil(LcCM);
  end;
end;

procedure TPrintEntities.prtProvider;
Var
  LcJSon : String;
  LcCM : TReportCM;
begin
  try
    ShowMask('Aguarde Processamento do relatório...');
    Par := getparameters;
    LcJSon := TJson.ObjectToJsonString(Par);
    LcCM := TReportCM.Create(Self);
    LcJSon := LcCM.SMGeneralClient.GetProviderFile(LcJSon);
    UniSession.Synchronize;
    Par := TJson.JsonToObject<TPrmPrintEntities>(LcJson);
    UniSession.Synchronize;
    if Par.Resultado then
    begin
      openReportViewer('Cadastro Fornecedor',Par.url);
      UniSession.Synchronize;
    end
    else
    Begin
      MensageAlert(['A T E N Ç Ã O!.',
                   '',
                      'Campo Nome não informado.',
                      'Preencha o campo para continuar']);
    End;
  finally
    HideMask;
    FreeAndNil(LcCM);
  end;
end;

procedure TPrintEntities.setPrint;
begin
  case Lbx_reports.ItemIndex of
    0:prtCustomer;
    1:prtProvider;
    2:prtCarrier;
  end;

end;

procedure TPrintEntities.ShowCity;
begin
  FrCity := TFmCity.Create(Self);
  FrCity.Parent := ctn_City;
  FrCity.Align := alClient;
  FrCity.Show;

end;

procedure TPrintEntities.ShowState;
begin
  FrState := TFmState.Create(Self);
  FrState.Parent := ctn_State;
  FrState.Align := alClient;
  FrState.Listar(1058);
  FrState.DBLCB_Lista.OnChange := OnChange;
  FrState.Show;
end;

function TPrintEntities.getparameters: TPrmPrintEntities;
begin
  REsult := TPrmPrintEntities.create;
  with REsult do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Usuario         := UMM.GInstitution.User.Registro.codigo;
    Resultado       := false;
    if ( FrState.DBLCB_Lista.KeyValue <> Null) then
      Estado        := FrState.DBLCB_Lista.KeyValue
    else
      Estado        := '';
    if ( FrCity.DBLCB_Lista.KeyValue <> Null) then
      Cidade        := FrCity.DBLCB_Lista.KeyValue
    else
      Cidade        := '';
    URL             := '';
  end;

end;

procedure TPrintEntities.initVariable;
begin
  inherited;
  Par := TPrmPrintEntities.create;
end;

procedure TPrintEntities.OnChange(Sender: TObject);
begin
  with FrState do
  Begin
    if (DBLCB_Lista.Text <> '') and
       (DBLCB_Lista.KeyValue <> null) then
      FrCity.Listar(DBLCB_Lista.KeyValue)
    else
      FrState.Listar(41);
  End;
end;

function TPrintEntities.validadePrint: Boolean;
begin
  Result := True;
end;

end.
