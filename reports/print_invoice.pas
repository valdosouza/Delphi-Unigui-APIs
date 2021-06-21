unit print_invoice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_impressao, uniGroupBox, uniLabel,
  uniGUIClasses, uniMultiItem, uniListBox, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniPanel, uniDateTimePicker, uniCheckBox, fm_entity,
  uReportCM, MainModule, Main,REST.Json, unMessages, prm_print_invoice, Data.DB,
  Datasnap.DBClient, Vcl.Menus, uniMainMenu;

type
  TPrintInvoice = class(TBaseImpressao)
    ChBx_Periodo: TUniCheckBox;
    Dtp_Inicial: TUniDateTimePicker;
    Ctn_Entity: TUniContainerPanel;
    UniLabel2: TUniLabel;
    Dtp_Final: TUniDateTimePicker;
    procedure initVariable;override;
    procedure FormatScreen;override;
  private
    { Private declarations }
    procedure prtInvoice;
  protected
    FrEntity : TFmEntity;
    Par : TPrmPrintInvoice;
    procedure ShowEntity;
    function validadePrint:Boolean;Override;
    procedure setPrint;Override;

  public
    { Public declarations }
    function getparameters:TPrmPrintInvoice;
  end;

var
  PrintInvoice: TPrintInvoice;

implementation

{$R *.dfm}

uses openReports;

{ TPrintInvoice }

procedure TPrintInvoice.FormatScreen;
begin
  ShowEntity;
end;

function TPrintInvoice.getparameters: TPrmPrintInvoice;
begin
  Result := TPrmPrintInvoice.create;
  with Result do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Usuario         := UMM.GInstitution.User.Registro.codigo;
    Resultado       := false;
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

procedure TPrintInvoice.initVariable;
begin
  inherited;
  Par := TPrmPrintInvoice.create;
end;

procedure TPrintInvoice.prtInvoice;
Var
  LcJSon : String;
  LcCM : TReportCM;
begin
  Try
    ShowMask('Aguarde Processamento do relatório...');
    Par := getparameters;
    LcJSon := TJson.ObjectToJsonString(Par);
    LcCM := TReportCM.Create(Self);
    LcJSon := LcCM.SMGeneralClient.GetInvoiceList(LcJSon);
    UniSession.Synchronize;
    Par := TJson.JsonToObject<TPrmPrintInvoice>(LcJson);
    UniSession.Synchronize;
    if Par.Resultado then
    begin
      openReportViewer('Nota Fiscal',Par.url);
      UniSession.Synchronize;
    end
    else
    Begin
      MensageAlert(['A T E N Ç Ã O!.',
                   '',
                      'Campo Nome não informado.',
                      'Preencha o campo para continuar']);
    End;
  Finally
    HideMask;
    FreeAndNil(LcCM);
  End;
end;

procedure TPrintInvoice.setPrint;
begin
  case Lbx_reports.ItemIndex of
    0:prtInvoice;
  end;
end;

procedure TPrintInvoice.ShowEntity;
begin
  FrEntity := TfmEntity.Create(Self);
  FrEntity.Parent := Ctn_Entity;
  FrEntity.Align := alClient;
  FrEntity.Listar;
  FrEntity.Show;
end;

function TPrintInvoice.validadePrint: Boolean;
begin
  Result := True;
end;

end.
