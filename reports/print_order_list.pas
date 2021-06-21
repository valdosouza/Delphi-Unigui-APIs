unit print_order_list;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_impressao, uniGroupBox, uniLabel,
  uniGUIClasses, uniMultiItem, uniListBox, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniPanel, uniDateTimePicker, uniCheckBox, fm_entity,
  prm_print_order_list, MainModule, Main, uReportCM,REST.Json,  unMessages,
  Data.DB, Datasnap.DBClient, Vcl.Menus, uniMainMenu;

type
  TPrintOrderList = class(TBaseImpressao)
    ChBx_Periodo: TUniCheckBox;
    Dtp_Inicial: TUniDateTimePicker;
    UniLabel2: TUniLabel;
    Dtp_Final: TUniDateTimePicker;
    Ctn_Entity: TUniContainerPanel;
    procedure initVariable;override;
    procedure FormatScreen;override;
  private
    { Private declarations }
    procedure prtOrderListPurchase;
    procedure prtOrderListSale;
    procedure prtOrderListAdjust;
    procedure prtOrderListPacking;
    procedure prtOrderListJob;
    procedure prtOrderListStockTransfer;
  protected
    FrEntity : TFmEntity;
    Tipo : String;
    Par: TPrmPrintOrderList;
    procedure ShowEntity;
    function validadePrint:Boolean;Override;
    procedure setPrint;Override;
    function getparameters:TPrmPrintOrderList;
  public
    { Public declarations }
  end;

var
  PrintOrderList: TPrintOrderList;

implementation

{$R *.dfm}

uses openReports;

{ TPrintOrder }

procedure TPrintOrderList.FormatScreen;
begin
  ShowEntity;
end;

function TPrintOrderList.getparameters: TPrmPrintOrderList;
begin
  REsult := TPrmPrintOrderList.create;
  with REsult do
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
  end;
end;

procedure TPrintOrderList.initVariable;
begin
  inherited;
  Par := TPrmPrintOrderList.create;
end;

procedure TPrintOrderList.prtOrderListAdjust;
Var
  LcJSon : String;
  LcCM : TReportCM;
begin
  try
    ShowMask('Aguarde Processamento do relatório...');
    Par := getparameters;
    LcJSon := TJson.ObjectToJsonString(Par);
    LcCM := TReportCM.Create(Self);
    LcJSon := LcCM.SMGeneralClient.GetOrderListAdjust(LcJSon);
    UniSession.Synchronize;
    Par := TJson.JsonToObject<TPrmPrintOrderList>(LcJson);
    UniSession.Synchronize;
    if Par.Resultado then
    begin
      openReportViewer('Lista de Ajustes de Estoques',Par.url);
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
    FreeAndNil(Par);
    FreeAndNil(LcCM);
  end;
end;

procedure TPrintOrderList.prtOrderListJob;
Var
  LcJSon : String;
  LcCM : TReportCM;
begin
  try
    ShowMask('Aguarde Processamento do relatório...');
    Par := getparameters;
    LcJSon := TJson.ObjectToJsonString(Par);
    LcCM := TReportCM.Create(Self);
    LcJSon := LcCM.SMGeneralClient.GetOrderListJob(LcJSon);
    UniSession.Synchronize;
    Par := TJson.JsonToObject<TPrmPrintOrderList>(LcJson);
    UniSession.Synchronize;
    if Par.Resultado then
    begin
      openReportViewer('Lista de Engenharias',Par.url);
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
    FreeAndNil(Par);
    FreeAndNil(LcCM);
  end;
end;

procedure TPrintOrderList.prtOrderListPacking;
Var
  LcJSon : String;
  LcCM : TReportCM;
begin
  try
    ShowMask('Aguarde Processamento do relatório...');
    Par := getparameters;
    LcJSon := TJson.ObjectToJsonString(Par);
    LcCM := TReportCM.Create(Self);
    LcJSon := LcCM.SMGeneralClient.GetOrderListPacking(LcJSon);
    UniSession.Synchronize;
    Par := TJson.JsonToObject<TPrmPrintOrderList>(LcJson);
    UniSession.Synchronize;
    if Par.Resultado then
    begin
      openReportViewer('Lista de Romaneios',Par.url);
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
    FreeAndNil(Par);
    FreeAndNil(LcCM);
  end;
end;

procedure TPrintOrderList.prtOrderListPurchase;
Var

  LcJSon : String;
  LcCM : TReportCM;
begin
  try
    ShowMask('Aguarde Processamento do relatório...');
    Par := getparameters;
    LcJSon := TJson.ObjectToJsonString(Par);
    LcCM := TReportCM.Create(Self);
    LcJSon := LcCM.SMGeneralClient.GetOrderListPurchase(LcJSon);
    Par := TJson.JsonToObject<TPrmPrintOrderList>(LcJson);
    if Par.Resultado then
    begin
      openReportViewer('Lista de Compras',Par.url);
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
    FreeAndNil(Par);
    FreeAndNil(LcCM);
  end;
end;

procedure TPrintOrderList.prtOrderListSale;
Var
  LcJSon : String;
  LcCM : TReportCM;
begin
  MensageAlert(['A T E N Ç Ã O!.',
               '',
               'em desenvolvimento...',
               '']);
end;

procedure TPrintOrderList.prtOrderListStockTransfer;
Var
  LcJSon : String;
  LcCM : TReportCM;
begin
  try
    ShowMask('Aguarde Processamento do relatório...');
    Par := getparameters;
    LcJSon := TJson.ObjectToJsonString(Par);
    LcCM := TReportCM.Create(Self);
    LcJSon := LcCM.SMGeneralClient.GetOrderListStockTransfer(LcJSon);
    UniSession.Synchronize;
    Par := TJson.JsonToObject<TPrmPrintOrderList>(LcJson);
    UniSession.Synchronize;
    if Par.Resultado then
    begin
      openReportViewer('Lista de Transferência de Estoques',Par.url);
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
    FreeAndNil(Par);
    FreeAndNil(LcCM);
  end;
end;

procedure TPrintOrderList.setPrint;
begin
  case Lbx_reports.ItemIndex of
    0:prtOrderListPurchase;
    1:prtOrderListSale;
    2:prtOrderListAdjust;
    3:prtOrderListPacking;
    4:prtOrderListJob;
    5:prtOrderListStockTransfer;
  end;
end;

procedure TPrintOrderList.ShowEntity;
begin
  FrEntity := TfmEntity.Create(Self);
  FrEntity.Parent := Ctn_Entity;
  FrEntity.Align := alClient;
  FrEntity.Listar;
  FrEntity.Show;
end;

function TPrintOrderList.validadePrint: Boolean;
begin
  Result := true;
end;

end.
