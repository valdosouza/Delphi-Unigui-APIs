unit tas_bank_activity;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniCheckBox,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid, uniPageControl,
  uniGUIBaseClasses, uniPanel, uniRadioGroup, uniDateTimePicker, uniEdit,
  uniMultiItem, uniComboBox, uniLabel, uniGroupBox, fm_bank_account, fm_payment_type,
  Vcl.Menus, uniMainMenu;

type
  TTasBankActivity = class(TBaseSearch)
    pnl_search_row_1: TUniPanel;
    UniGroupBox2: TUniGroupBox;
    UniGroupBox3: TUniGroupBox;
    pnl_param_row_1: TUniPanel;
    UniComboBox1: TUniComboBox;
    Ctn_Bank_Account: TUniContainerPanel;
    UniEdit1: TUniEdit;
    UniEdit2: TUniEdit;
    UniEdit3: TUniEdit;
    UniEdit4: TUniEdit;
    Ctn_Payment_Type: TUniContainerPanel;
    UniRadioGroup1: TUniRadioGroup;
    UniRadioGroup2: TUniRadioGroup;
    pnl_param_row_3: TUniPanel;
    pnl_param_row_2: TUniPanel;
    pnl_data: TUniPanel;
    ChBx_Periodo: TUniCheckBox;
    pnl_data_campos: TUniPanel;
    DTP_Date_Initial: TUniDateTimePicker;
    DTP_Date_End: TUniDateTimePicker;
    UniPanel2: TUniPanel;
    UniCheckBox3: TUniCheckBox;
    UniDateTimePicker1: TUniDateTimePicker;
    E_VL_Saldo: TUniEdit;
    E_VL_Debito: TUniEdit;
    E_VL_Credito: TUniEdit;
    E_VL_Fut_Debito: TUniEdit;
    E_VL_Fut_Saldo: TUniEdit;
    E_VL_Fut_Credito: TUniEdit;
    procedure FormatScreen;Override;
  private
    { Private declarations }
    procedure ShowBankAccount;
    procedure ShowPaymentType;
  public
    { Public declarations }
    FrBankAccount : TFmBankAccount;
    FrPaymentType : TFmPaymentType;
  end;

var
  TasBankActivity: TTasBankActivity;

implementation

{$R *.dfm}

{ TTasBankActivity }

procedure TTasBankActivity.FormatScreen;
begin
  inherited;
  ShowBankAccount;
  ShowPaymentType;
end;

procedure TTasBankActivity.ShowBankAccount;
begin
  FrBankAccount := TFmBankAccount.Create(Self);
  FrBankAccount.Parent := Ctn_Bank_Account;
  FrBankAccount.Listar;
  FrBankAccount.Align := alClient;
  FrBankAccount.Show;
end;

procedure TTasBankActivity.ShowPaymentType;
begin
  FrPaymentType := TfmPaymentType.Create(Self);
  FrPaymentType.Parent := Ctn_Payment_Type;
  FrPaymentType.Listar;
  FrPaymentType.Align := alClient;
  FrPaymentType.Show;
end;

end.
