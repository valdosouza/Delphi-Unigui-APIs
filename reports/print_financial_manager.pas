unit print_financial_manager;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_impressao, Data.DB,REST.Json,
  Datasnap.DBClient, uniGroupBox, uniLabel, uniGUIClasses, uniMultiItem,
  uniListBox, uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniPanel,
  uniDateTimePicker, uniCheckBox, prm_print_financial, uReportCM,
  unMessages, MainModule, uniEdit, Vcl.Menus, uniMainMenu;

type
  TPrintFinancialManager = class(TBaseImpressao)
    ChBx_Periodo: TUniCheckBox;
    Dtp_Inicial: TUniDateTimePicker;
    UniLabel2: TUniLabel;
    Dtp_Final: TUniDateTimePicker;
    E_Terminal: TUniEdit;
    L_Codigo: TUniLabel;
  private
    { Private declarations }
    procedure initVariable;override;
    procedure prtFinancialRealManager;
  protected
    Par : TPrmPrintFinancial;
    function validadePrint:Boolean;Override;
    procedure setPrint;Override;
    function getparameters:TPrmPrintFinancial;

  public
    { Public declarations }
  end;

var
  PrintFinancialManager: TPrintFinancialManager;

implementation

{$R *.dfm}

uses openReports;

{ TBaseImpressao1 }

function TPrintFinancialManager.getparameters: TPrmPrintFinancial;
begin
  Result := TPrmPrintFinancial.Create;
  with Result do
  Begin
    Estabelecimento := UMM.GInstitution.registro.codigo;
    Usuario := UMM.GInstitution.User.Registro.codigo;
    Resultado := false;
    Periodo         := ChBx_Periodo.Checked;
    DataInicial     := Dtp_Inicial.DateTime;
    DataFinal       := Dtp_Final.DateTime;
    URL             := '';
    TErminal        := StrToIntDef(E_Terminal.Text,0);
  End;

end;

procedure TPrintFinancialManager.initVariable;
begin
  inherited;
  Par := TPrmPrintFinancial.create;
end;

procedure TPrintFinancialManager.prtFinancialRealManager;
Var
  LcJSon : String;
  LcCM : TReportCM;
begin
  try
    ShowMask('Aguarde Processamento do relatório...');
    Par := getparameters;
    LcJSon := TJson.ObjectToJsonString(Par);
    LcCM := TReportCM.Create(Self);
    LcJSon := LcCM.SMFinancialClient.GetFinancialRealManager(LcJSon);
    UniSession.Synchronize;
    Par := TJson.JsonToObject<TPrmPrintFinancial>(LcJson);
    UniSession.Synchronize;
    if Par.Resultado then
    begin
      openReportViewer('Relatório Gerencial',Par.url);
      UniSession.Synchronize;
    end
    else
    Begin
      MensageAlert(['A T E N Ç Ã O!.',
                   '',
                      'Campo não informado.',
                      'Preencha o campo para continuar']);
    End;
  finally
    HideMask;
    FreeAndNil(LcCM);
  end;

end;

procedure TPrintFinancialManager.setPrint;
begin
  case Lbx_reports.ItemIndex of
    0:prtFinancialRealManager;
  end;
end;

function TPrintFinancialManager.validadePrint: Boolean;
begin
  Result := true;
end;

end.
