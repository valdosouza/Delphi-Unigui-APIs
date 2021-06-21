unit tas_order_items_packing;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, tas_order_items, uniButton, uniBitBtn,
  uniSpeedButton, uniEdit, uniGUIClasses, uniLabel, uniPanel, uniGUIBaseClasses;

type
  TTasOrderItemsPacking = class(TTasOrderItems)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TasOrderItemsPacking: TTasOrderItemsPacking;

implementation

{$R *.dfm}

end.
