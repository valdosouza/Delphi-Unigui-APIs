unit print_product;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  base_impressao, uniGUIClasses,
  uniMultiItem, uniListBox, uniLabel, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniPanel, uniGroupBox, fm_category,fm_stock_list,
  prm_print_product, uReportCM,  Main,REST.Json, unMessages, Data.DB,
  Datasnap.DBClient, Vcl.Controls, Vcl.Forms, Vcl.Menus, uniMainMenu;

type
  TPrintProduct = class(TBaseImpressao)
    ctn_Category: TUniContainerPanel;
    Ctn_Stock_Id_Ori: TUniContainerPanel;
    procedure InitVariable;override;
    procedure FormatScreen;override;
  private
    { Private declarations }
    FrStock    : TFmStockList;
    FrCategory : TFmCategory;
    procedure ShowCategory;
    procedure ShowStock;
  protected
    Par: TPrmPrintProduct;
    function validadePrint:Boolean;Override;
    procedure setPrint;Override;
    function getparameters:TPrmPrintProduct;
  public
    { Public declarations }
    procedure prtProducts;
  end;

var
  PrintProduct: TPrintProduct;

implementation

{$R *.dfm}

uses openReports, MainModule;

{ TBaseImpressao1 }

procedure TPrintProduct.FormatScreen;
begin
  inherited;
  ShowCategory;
  ShowStock;
  Lbx_reports.ItemIndex := 0;
end;

function TPrintProduct.getparameters: TPrmPrintProduct;
begin
  Result := TPrmPrintProduct.Create;
  with Result do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Estoque := 0;
    Usuario := UMM.GInstitution.User.Registro.codigo;

    if ( FrCategory.DBLCB_Lista.KeyValue <> null ) then
      Categoria := FrCategory.DBLCB_Lista.KeyValue
    else
      Categoria := 0;
    Resultado := False;
    url := '';
  End
end;

procedure TPrintProduct.InitVariable;
begin
  inherited;
  Par := TPrmPrintProduct.create;
end;


procedure TPrintProduct.prtProducts;
Var
  LcJSon : String;
  LcCM : TReportCM;
begin
  try
    ShowMask('Aguarde Processamento do relatório...');
    Par := getparameters;
    LcJSon := TJson.ObjectToJsonString(Par);
    LcCM := TReportCM.Create(Self);
    LcJSon := LcCM.SMGeneralClient.GetProductFile(LcJSon);
    UniSession.Synchronize;
    Par := TJson.JsonToObject<TPrmPrintProduct>(LcJson);
    UniSession.Synchronize;
    if Par.Resultado then
    begin
      openReportViewer('Cadastro Produto',Par.url);
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

procedure TPrintProduct.setPrint;
begin
  case Lbx_reports.ItemIndex of
    0:prtProducts;
  end;
end;

procedure TPrintProduct.ShowCategory;
begin
  FrCategory := TFmCategory.Create(Self);
  FrCategory.Parent := ctn_Category;
  FrCategory.Align := alClient;
  FrCategory.Listar;
  FrCategory.Show;
end;

procedure TPrintProduct.ShowStock;
begin
  FrStock := TFmStockList.Create(Self);
  FrStock.Parent := Ctn_Stock_Id_Ori;
  FrStock.chbx_UpdateStock.Visible := False;
  FrStock.DBLCB_Lista.FieldLabel := 'Informe o nome do estoque';
  FrStock.listar;
  FrStock.Align := alClient;
  FrStock.Show;
end;

function TPrintProduct.validadePrint: Boolean;
begin
  Result := True;
end;

end.
