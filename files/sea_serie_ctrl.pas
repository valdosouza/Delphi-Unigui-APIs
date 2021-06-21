unit sea_serie_ctrl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniEdit, uniPanel,
  uniLabel, uniDateTimePicker, uniCheckBox, uniGroupBox, Datasnap.Provider,
  Data.DB, Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIClasses, uniBasicGrid, uniDBGrid, uniPageControl, uniGUIBaseClasses, fm_entity,
   fm_product;

type
  TSeaSerieCtrl = class(TBaseSearch)
    UniCheckBox1: TUniCheckBox;
    UniDateTimePicker1: TUniDateTimePicker;
    UniLabel1: TUniLabel;
    UniDateTimePicker2: TUniDateTimePicker;
    Ctn_Entity: TUniContainerPanel;
    UniLabel2: TUniLabel;
    UniEdit1: TUniEdit;
    UniLabel3: TUniLabel;
    UniEdit2: TUniEdit;
    UniLabel4: TUniLabel;
    UniEdit3: TUniEdit;
    Ctn_Product: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniEdit4: TUniEdit;
    procedure FormatScreen;Override;
  private
    { Private declarations }
    procedure ShowEntity;
    procedure ShowProduct;
  public
    { Public declarations }
    FrEntity : TFmEntity;
    FrProduct : TFmProduct;
  end;

var
  SeaSerieCtrl: TSeaSerieCtrl;

implementation

{$R *.dfm}

{ TSeaSerieCtrl }

procedure TSeaSerieCtrl.FormatScreen;
begin
  inherited;
  ShowEntity;
  ShowProduct;
end;

procedure TSeaSerieCtrl.ShowEntity;
begin
  FrEntity := TFmEntity.Create(Self);
  FrEntity.Parent := Ctn_Entity;
  FrEntity.Listar;
  FrEntity.Align := alClient;
  FrEntity.Show;
end;

procedure TSeaSerieCtrl.ShowProduct;
begin
  FrProduct := TFmProduct.Create(Self);
  FrProduct.Parent := Ctn_Product;
  FrProduct.Listar;
  FrProduct.Align := alClient;
  FrProduct.Show;
end;

end.
