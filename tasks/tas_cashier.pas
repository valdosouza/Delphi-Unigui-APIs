unit tas_cashier;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_form, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniGUIClasses, uniPanel, uniMultiItem,
  uniComboBox, uniDateTimePicker, uniCheckBox, uniGroupBox, uniEdit, uniLabel,
  uniBasicGrid, uniDBGrid, fm_payment_type,msg_form, unmessages, Vcl.Menus,
  uniMainMenu, Data.DB, Datasnap.DBClient;

type
  TTasCashier = class(TBaseForm)
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    SB_Delete: TUniSpeedButton;
    SB_Change: TUniSpeedButton;
    SB_Insert: TUniSpeedButton;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    UniButton3: TUniButton;
    UniButton4: TUniButton;
    UniDBGrid1: TUniDBGrid;
    UniLabel1: TUniLabel;
    UniEdit1: TUniEdit;
    UniLabel2: TUniLabel;
    UniEdit2: TUniEdit;
    UniLabel3: TUniLabel;
    UniEdit3: TUniEdit;
    UniLabel4: TUniLabel;
    UniEdit4: TUniEdit;
    UniPanel3: TUniPanel;
    UniGroupBox1: TUniGroupBox;
    ChBx_Periodo: TUniCheckBox;
    DTP_Date_Initial: TUniDateTimePicker;
    DTP_Date_End: TUniDateTimePicker;
    UniLabel5: TUniLabel;
    UniEdit5: TUniEdit;
    UniLabel6: TUniLabel;
    UniEdit6: TUniEdit;
    UniLabel7: TUniLabel;
    UniComboBox1: TUniComboBox;
    UniLabel8: TUniLabel;
    UniComboBox2: TUniComboBox;
    Ctn_Payment_Type: TUniContainerPanel;
    UniPanel4: TUniPanel;
    UniDBGrid2: TUniDBGrid;
    procedure FormatScreen;Override;

 private
    { Private declarations }
    procedure ShowPaymentType;
  public
    { Public declarations }
    FrPaymentType : TFmPaymentType;
  end;

var
  TasCashier: TTasCashier;

implementation

{$R *.dfm}

{ TTasCashier }

procedure TTasCashier.FormatScreen;
begin
 inherited;
  ShowPaymentType;
end;

procedure TTasCashier.ShowPaymentType;
begin
  FrPaymentType := TfmPaymentType.Create(Self);
  FrPaymentType.Parent := Ctn_Payment_Type;
  FrPaymentType.Align := alClient;
  FrPaymentType.Listar;
  FrPaymentType.Show;
end;



end.
