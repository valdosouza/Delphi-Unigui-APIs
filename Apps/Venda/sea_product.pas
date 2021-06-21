unit sea_product;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  base_form, System.ImageList, FMX.ImgList, FMX.Objects,
  FMX.Controls.Presentation, FMX.Layouts, fm_sea_product, TypesListCollection;


type
  TSeaProduct = class(TBaseForm)
    FmAddSeaProduct: TFmSeaProduct;
    procedure FormCreate(Sender: TObject);
  private
  protected
    procedure InitVariable;Override;
    procedure FormatScreen;Override;
  public
    { Public declarations }
    ListaOrderItems :TCollSplOrderSaleItems;

  end;

var
  SeaProduct: TSeaProduct;

implementation
{ TSeaProduct }
{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

uses uDataCM ;

procedure TSeaProduct.FormatScreen;
begin
  inherited;
end;

procedure TSeaProduct.FormCreate(Sender: TObject);
begin
  inherited;
  InitVariable;
end;

procedure TSeaProduct.InitVariable;
begin
  inherited;
  SetMainStock;
  FmAddSeaProduct.getList('');
end;




end.

