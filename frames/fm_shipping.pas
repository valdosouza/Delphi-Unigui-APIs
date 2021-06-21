unit fm_shipping;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniDateTimePicker,
  uniLabel, uniGUIClasses, uniEdit, uniPanel, uniGUIBaseClasses, fm_address_delivery,
  fm_carrier, fm_freight_mode;

type
  TFmShipping = class(TFmBaseFrame)
    Pnl_Entrega: TUniPanel;
    Ctn_AdressDelivery: TUniContainerPanel;
    Ctn_Carrier: TUniContainerPanel;
    Ctn_Freight_Mode: TUniContainerPanel;
    E_Help_Reference: TUniEdit;
    DtpDataDelivery: TUniDateTimePicker;
    pnl_Row_4: TUniPanel;
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ShowAdressDelivery;
    procedure ShowCarrier;
    procedure ShowFreightMode;
    procedure FormatScreen;
  public
    { Public declarations }
    FrAddressDelivery : TFmAdressDelivery;
    FrCarrier : TFmCarrier;
    FrFreightMode : TFmFreightMode;
  end;

var
  FmShipping: TFmShipping;

implementation

{$R *.dfm}

{ TFmShipping }

procedure TFmShipping.ShowAdressDelivery;
begin
  FrAddressDelivery := TFmAdressDelivery.Create(Self);
  FrAddressDelivery.Parent := Ctn_AdressDelivery;
  FrAddressDelivery.listar;
  FrAddressDelivery.Align := alClient;
  FrAddressDelivery.Show;
end;

procedure TFmShipping.ShowCarrier;
begin
  FrCarrier := TFmCarrier.Create(Self);
  FrCarrier.Parent := Ctn_Carrier;
  FrCarrier.listar;
  FrCarrier.Align := alClient;
  FrCarrier.Show;
end;

procedure TFmShipping.FormatScreen;
begin
  //
end;

procedure TFmShipping.ShowFreightMode;
begin
  FrFreightMode := TfmFreightMode.Create(Self);
  FrFreightMode.Parent := Ctn_Freight_Mode;
  FrFreightMode.Align := alClient;
  FrFreightMode.Listar;
  FrFreightMode.DBLCB_Lista.KeyValue := 2;
  FrFreightMode.Show;
end;

procedure TFmShipping.UniFrameCreate(Sender: TObject);
begin
  inherited;
  ShowFreightMode;
  ShowCarrier;
  ShowAdressDelivery
end;

end.
