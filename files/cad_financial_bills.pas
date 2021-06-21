unit cad_financial_bills;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cad_financial, Vcl.Menus, uniMainMenu,
  uniMemo, uniPageControl, uniEdit, uniPanel, uniGUIClasses, uniDateTimePicker,
  uniLabel, uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, Data.DB,
  Datasnap.DBClient;

type
  TCadFinancialBills = class(TCadFinancial)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadFinancialBills: TCadFinancialBills;

implementation

{$R *.dfm}

end.
