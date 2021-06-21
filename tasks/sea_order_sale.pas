unit sea_order_sale;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniRadioGroup,
  uniDateTimePicker, uniCheckBox, uniEdit, uniLabel, uniGroupBox;

type
  TSeaOrderSale = class(TBaseSearch)
    UniGroupBox1: TUniGroupBox;
    L_Codigo: TUniLabel;
    E_Number: TUniEdit;
    chbx_periodo: TUniCheckBox;
    DTP_Date_Initial: TUniDateTimePicker;
    DTP_Date_End: TUniDateTimePicker;
    RG_approved: TUniRadioGroup;
    ctn_Provider: TUniContainerPanel;
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
