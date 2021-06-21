unit tas_order_sale;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel;

type
  TSeaOrderSale = class(TBaseSearch)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SeaOrderSale: TSeaOrderSale;

implementation

{$R *.dfm}

end.
