unit tas_set_price;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_form, uniPanel, uniPageControl,
  uniGUIBaseClasses, uniGUIClasses, uniCheckBox, uniGroupBox, uniEdit, uniLabel,
  uniRadioGroup, uniButton, fm_category, fm_brand, fm_price_list, fm_provider, fm_product,
  Vcl.Menus, uniMainMenu, Data.DB, Datasnap.DBClient;

type
  TTasSetPrice = class(TBaseForm)
    UniPanel1: TUniPanel;
    UniPageControl1: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    UniPanel2: TUniPanel;
    Ctn_Category: TUniContainerPanel;
    Ctn_Brand: TUniContainerPanel;
    Ctn_Price_List: TUniContainerPanel;
    UniRadioGroup1: TUniRadioGroup;
    UniRadioGroup2: TUniRadioGroup;
    UniLabel1: TUniLabel;
    UniEdit1: TUniEdit;
    UniGroupBox1: TUniGroupBox;
    UniLabel2: TUniLabel;
    UniEdit2: TUniEdit;
    Ctn_Provider: TUniContainerPanel;
    UniLabel3: TUniLabel;
    UniEdit3: TUniEdit;
    UniCheckBox1: TUniCheckBox;
    UniTabSheet2: TUniTabSheet;
    UniPanel3: TUniPanel;
    UniLabel4: TUniLabel;
    UniEdit4: TUniEdit;
    UniEdit5: TUniEdit;
    UniLabel5: TUniLabel;
    UniLabel7: TUniLabel;
    UniEdit7: TUniEdit;
    UniLabel8: TUniLabel;
    UniEdit8: TUniEdit;
    UniCheckBox2: TUniCheckBox;
    UniPanel4: TUniPanel;
    UniButton2: TUniButton;
    UniButton3: TUniButton;
    Ctn_Product: TUniContainerPanel;
    procedure FormatScreen;Override;
  private
    { Private declarations }
    procedure ShowCategory;
    procedure ShowBrand;
    procedure ShowPriceList;
    procedure ShowProvider;
    procedure ShowProduct;
  public
    { Public declarations }
    FrCategory : TFmCategory;
    FrBrand : TFmBrand;
    FrPriceList : TFmPriceList;
    FrProvider : TFmProvider;
    FrProduct: TFmProduct;
  end;

var
  TasSetPrice: TTasSetPrice;

implementation

{$R *.dfm}

{ TTasSetPrice }

procedure TTasSetPrice.FormatScreen;
begin
  inherited;
  ShowCategory;
  ShowBrand;
  ShowPriceList;
  ShowProvider;
  ShowProduct;
end;

procedure TTasSetPrice.ShowBrand;
begin
  FrBrand := TFmBrand.Create(Self);
  FrBrand.Parent := Ctn_Brand;
  FrBrand.Align := alClient;
  FrBrand.Listar;
  FrBrand.Show;
end;

procedure TTasSetPrice.ShowCategory;
begin
  FrCategory := TFmCategory.Create(Self);
  FrCategory.Parent := Ctn_Category;
  FrCategory.Align := alClient;
  FrCategory.Listar;
  FrCategory.Show;
end;

procedure TTasSetPrice.ShowPriceList;
begin
  FrPriceList := TFmPriceList.Create(Self);
  FrPriceList.Parent := Ctn_Price_List;
  FrPriceList.Align := alClient;
  FrPriceList.Listar;
  FrPriceList.Show;
end;

procedure TTasSetPrice.ShowProduct;
begin
  FrProduct := TFmProduct.Create(Self);
  FrProduct.Parent := Ctn_Product;
  FrProduct.Align := alClient;
  FrProduct.Listar;
  FrProduct.Show;
end;

procedure TTasSetPrice.ShowProvider;
begin
  FrProvider := TFmProvider.Create(Self);
  FrProvider.Parent := Ctn_Provider;
  FrProvider.Align := alClient;
  FrProvider.Listar;
  FrProvider.Show;
end;

end.
