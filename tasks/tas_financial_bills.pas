unit tas_financial_bills;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, tas_financial, Vcl.Menus, uniMainMenu,
  uniButton, uniBasicGrid, uniDBGrid, uniRadioGroup, uniPageControl, uniPanel,
  uniEdit, uniLabel, uniDateTimePicker, uniGUIClasses, uniCheckBox, uniGroupBox,
  uniBitBtn, uniSpeedButton, uniGUIBaseClasses, fm_entity, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, cad_financial, uniMultiItem, uniComboBox;

type
  TTasFinancialBills = class(TTasFinancial)
    pnl_search_row_1_1: TUniPanel;
    procedure SB_InsertClick(Sender: TObject);
    procedure setvariable;override;
    procedure dbg_SearchCellClick(Column: TUniDBGridColumn);
  private
    { Private declarations }
  protected
  public
    { Public declarations }

  end;

var
  TasFinancialBills: TTasFinancialBills;

implementation

{$R *.dfm}

uses openForms;

{ TTasFinancialBills }

procedure TTasFinancialBills.dbg_SearchCellClick(Column: TUniDBGridColumn);
begin
  inherited;
  somatotal;
end;

procedure TTasFinancialBills.SB_InsertClick(Sender: TObject);
begin
  inherited;
  openCadFinancialBills(0);
end;

procedure TTasFinancialBills.setvariable;
begin
  inherited;
  Tipo := 'R';
end;

end.
