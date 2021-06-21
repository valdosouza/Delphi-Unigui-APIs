unit cad_financial_payment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cad_financial, Vcl.Menus, uniMainMenu,
  uniMemo, uniPageControl, uniEdit, uniPanel, uniGUIClasses, uniDateTimePicker,
  uniLabel, uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses;

type
  TCadFinancialPayment = class(TCadFinancial)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadFinancialPayment: TCadFinancialPayment;

implementation

{$R *.dfm}

end.
