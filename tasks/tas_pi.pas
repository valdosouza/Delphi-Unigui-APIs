unit tas_pi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, uniRadioGroup, uniMemo,
  uniBasicGrid, uniDBGrid, uniPanel, uniMultiItem, uniComboBox, uniGUIClasses,
  uniEdit, uniLabel, Vcl.Menus, uniMainMenu, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses;

type
  TTasPi = class(TBaseRegistry)
    UniPanel1: TUniPanel;
    UniLabel1: TUniLabel;
    UniEdit2: TUniEdit;
    UniEdit3: TUniEdit;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniEdit4: TUniEdit;
    UniEdit5: TUniEdit;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniEdit6: TUniEdit;
    UniComboBox2: TUniComboBox;
    UniLabel6: TUniLabel;
    Ctn_Agency: TUniContainerPanel;
    UniLabel7: TUniLabel;
    Ctn_Broadcaster: TUniContainerPanel;
    UniLabel8: TUniLabel;
    Ctn_Advertiser: TUniContainerPanel;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    UniEdit1: TUniEdit;
    UniEdit7: TUniEdit;
    UniLabel11: TUniLabel;
    UniLabel12: TUniLabel;
    UniLabel13: TUniLabel;
    UniLabel14: TUniLabel;
    UniSpeedButton1: TUniSpeedButton;
    UniSpeedButton2: TUniSpeedButton;
    UniSpeedButton3: TUniSpeedButton;
    UniPanel2: TUniPanel;
    UniDBGrid1: TUniDBGrid;
    UniDBGrid3: TUniDBGrid;
    UniLabel15: TUniLabel;
    UniSpeedButton7: TUniSpeedButton;
    UniSpeedButton8: TUniSpeedButton;
    UniSpeedButton9: TUniSpeedButton;
    UniLabel16: TUniLabel;
    UniMemo1: TUniMemo;
    UniLabel17: TUniLabel;
    UniRadioGroup1: TUniRadioGroup;
    UniEdit8: TUniEdit;
    UniEdit9: TUniEdit;
    UniEdit10: TUniEdit;
    UniEdit11: TUniEdit;
    UniLabel18: TUniLabel;
    UniLabel19: TUniLabel;
    UniLabel20: TUniLabel;
    UniLabel21: TUniLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TasPi: TTasPi;

implementation

{$R *.dfm}

end.
