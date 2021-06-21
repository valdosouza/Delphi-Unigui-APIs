unit tas_lot_ctrl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniCheckBox, uniPanel,
  uniLabel, uniEdit, uniGroupBox, Datasnap.Provider, Data.DB, Datasnap.DBClient,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid,
  uniPageControl, uniGUIBaseClasses, fm_entity, Vcl.Menus, uniMainMenu;

type
  TTasLotCtrl = class(TBaseSearch)
    UniGroupBox1: TUniGroupBox;
    UniEdit1: TUniEdit;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniEdit2: TUniEdit;
    Ctn_Entity: TUniContainerPanel;
    UniCheckBox1: TUniCheckBox;
    UniTabSheet2: TUniTabSheet;
    UniDBGrid1: TUniDBGrid;
    procedure FormatScreen;Override;
  private
    { Private declarations }
    procedure ShowEntity;
  public
    { Public declarations }
    FrEntity : TFmEntity;
  end;

var
  TasLotCtrl: TTasLotCtrl;

implementation

{$R *.dfm}

{ TTasLotControl }

procedure TTasLotCtrl.FormatScreen;
begin
  inherited;
  ShowEntity;
end;

procedure TTasLotCtrl.ShowEntity;
begin
  FrEntity := TFmEntity.Create(Self);
  FrEntity.Parent := Ctn_Entity;
  FrEntity.Listar;
  FrEntity.Align := alClient;
  FrEntity.Show;
end;

end.
