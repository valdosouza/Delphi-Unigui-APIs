unit fm_order_items_production;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_order_items, Data.DB,
  Datasnap.DBClient, uniLabel, uniEdit, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel,
  Vcl.Menus, uniMainMenu;

type
  TFmOrderItemsProduction = class(TFmOrderItems)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmOrderItemsProduction: TFmOrderItemsProduction;

implementation

{$R *.dfm}

end.
