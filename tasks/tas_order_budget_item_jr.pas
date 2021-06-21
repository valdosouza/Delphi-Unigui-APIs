unit tas_order_budget_item_jr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniGroupBox, uniEdit, uniLabel, uniMultiItem, uniComboBox, Data.DB,
  Datasnap.DBClient;

type
  TTasOrderBudgetItemJr = class(TBaseRegistry)
    Ctn_Broadcaster: TUniContainerPanel;
    Ctn_Med_Pos_Prog: TUniContainerPanel;
    UniComboBox1: TUniComboBox;
    UniLabel1: TUniLabel;
    UniComboBox2: TUniComboBox;
    UniLabel2: TUniLabel;
    UniEdit1: TUniEdit;
    UniEdit2: TUniEdit;
    UniEdit3: TUniEdit;
    UniEdit4: TUniEdit;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    UniEdit5: TUniEdit;
    UniEdit6: TUniEdit;
    UniEdit7: TUniEdit;
    UniEdit8: TUniEdit;
    UniLabel8: TUniLabel;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    UniGroupBox1: TUniGroupBox;
    UniEdit9: TUniEdit;
    UniLabel11: TUniLabel;
    UniEdit10: TUniEdit;
    UniLabel12: TUniLabel;
    UniEdit11: TUniEdit;
    UniLabel13: TUniLabel;
    UniEdit12: TUniEdit;
    UniLabel14: TUniLabel;
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TasOrderBudgetItemJr: TTasOrderBudgetItemJr;

implementation

{$R *.dfm}

end.
