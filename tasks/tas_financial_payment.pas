unit tas_financial_payment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, tas_financial, Vcl.Menus, uniMainMenu,
  uniRadioGroup, uniButton, uniBasicGrid, uniDBGrid, uniPageControl, uniPanel,
  uniEdit, uniLabel, uniDateTimePicker, uniGUIClasses, uniCheckBox, uniGroupBox,
  uniBitBtn, uniSpeedButton, uniGUIBaseClasses, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, uniMultiItem, uniComboBox;

type
  TTasFinancialPayment = class(TTasFinancial)
    procedure setvariable;override;
    procedure SB_InsertClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TasFinancialPayment: TTasFinancialPayment;

implementation

{$R *.dfm}

uses openForms;

{ TTasFinancialPayment }

procedure TTasFinancialPayment.SB_InsertClick(Sender: TObject);
begin
  inherited;
  OpenCadFinancialPayment;
end;

procedure TTasFinancialPayment.setvariable;
begin
  inherited;
  Tipo := 'P';
end;

end.
