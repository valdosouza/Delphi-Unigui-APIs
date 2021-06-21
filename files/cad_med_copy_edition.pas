unit cad_med_copy_edition;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  Data.DB, Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniGUIClasses, uniPanel, uniEdit, Vcl.StdCtrls, uniCheckBox,
  uniBasicGrid, uniDBGrid, fm_StateCity;

type
  TCadMedCopyEdition = class(TBaseRegistry)
    pnl_row_1: TUniPanel;
    ctn_StateCity: TUniContainerPanel;
    E_Tiragem: TUniEdit;
    pnl_row_2: TUniPanel;
    Sb_Ins_Produto: TUniBitBtn;
    Sb_Exc_Produto: TUniBitBtn;
    DBG_Produtos: TUniDBGrid;
  private
    { Private declarations }
  public
    FrStateCity : TFmStateCity;
    procedure ShowStateCity;

  end;

var
  CadMedCopyEdition: TCadMedCopyEdition;

implementation

{$R *.dfm}

{ TCadMedCopyEdition }

procedure TCadMedCopyEdition.ShowStateCity;
begin
  FrStateCity := TFmStateCity.Create(Self);
  FrStateCity.Parent := ctn_StateCity;
  FrStateCity.Align := alClient;
  FrStateCity.FrState.Listar(1058);
  FrStateCity.FrState.DBLCB_Lista.KeyValue := 41;
  FrStateCity.Show;

end;

end.
