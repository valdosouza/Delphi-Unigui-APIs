unit print_financial_payment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_impressao, uniGroupBox, uniLabel,
  uniGUIClasses, uniMultiItem, uniListBox, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniPanel, uniDateTimePicker, uniCheckBox, fm_entity,
  uReportCM, MainModule, Main,REST.Json, unMessages, prm_print_financial,
  Data.DB, Datasnap.DBClient, Vcl.Menus, uniMainMenu;

type
  TPrintFinancialPayment = class(TBaseImpressao)
    ChBx_Periodo: TUniCheckBox;
    Dtp_Inicial: TUniDateTimePicker;
    UniLabel2: TUniLabel;
    Dtp_Final: TUniDateTimePicker;
    Ctn_Entity: TUniContainerPanel;
    procedure initVariable;override;
    procedure FormatScreen;override;
  private
    { Private declarations }
    procedure prtFinancialPayment;
  protected
    FrEntity : TFmEntity;
    Tipo : String;
    Par : TPrmPrintFinancial;
    procedure ShowEntity;
    function validadePrint:Boolean;Override;
    procedure setPrint;Override;
    function getparameters:TPrmPrintFinancial;

  public
    { Public declarations }
  end;

var
  PrintFinancialPayment: TPrintFinancialPayment;

implementation

{$R *.dfm}

uses openReports;

{ TPrintFinancialPayment }

procedure TPrintFinancialPayment.FormatScreen;
begin
  ShowEntity;
end;

function TPrintFinancialPayment.getparameters: TPrmPrintFinancial;
begin
  Result := TPrmPrintFinancial.Create;
  with Result do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Usuario := UMM.GInstitution.User.Registro.codigo;
    Resultado := false;
    Periodo         := ChBx_Periodo.Checked;
    DataInicial     := Dtp_Inicial.DateTime;
    DataFinal       := Dtp_Final.DateTime;
    if ( FrEntity.DBLCB_Lista.KeyValue <> Null) then
      Entidade        := FrEntity.DBLCB_Lista.KeyValue
    else
      Entidade        := 0;
    URL             := '';
  End;

end;

procedure TPrintFinancialPayment.initVariable;
begin
  inherited;
  Par := TPrmPrintFinancial.create;
end;

procedure TPrintFinancialPayment.prtFinancialPayment;
Var
  LcJSon : String;
  LcCM : TReportCM;
begin
  try
    ShowMask('Aguarde Processamento do relatório...');
    Par := getparameters;
    LcJSon := TJson.ObjectToJsonString(Par);
    LcCM := TReportCM.Create(Self);
    LcJSon := LcCM.SMFinancialClient.GetFinancialPayment(LcJSon);
    UniSession.Synchronize;
    Par := TJson.JsonToObject<TPrmPrintFinancial>(LcJson);
    UniSession.Synchronize;
    if Par.Resultado then
    begin
      openReportViewer('Contas à PAgar',Par.url);
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

procedure TPrintFinancialPayment.setPrint;
begin
  case Lbx_reports.ItemIndex of
    0:prtFinancialPayment;
  end;
end;

procedure TPrintFinancialPayment.ShowEntity;
begin
  FrEntity := TfmEntity.Create(Self);
  FrEntity.Parent := Ctn_Entity;
  FrEntity.Align := alClient;
  FrEntity.Listar;
  FrEntity.Show;
end;

function TPrintFinancialPayment.validadePrint: Boolean;
begin
  Result := True
end;

end.
