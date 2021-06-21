unit sea_ext_maintenance;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniMultiItem,
  uniComboBox, uniLabel, uniEdit, uniDateTimePicker, uniCheckBox, uniRadioGroup,
  uniGroupBox, fm_entity, uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaExtMaintenance = class(TBaseSearch)
    UniRadioGroup1: TUniRadioGroup;
    ChBx_Periodo: TUniCheckBox;
    DTP_Date_Initial: TUniDateTimePicker;
    DTP_Date_End: TUniDateTimePicker;
    UniEdit1: TUniEdit;
    UniLabel1: TUniLabel;
    Ctn_Entity: TUniContainerPanel;
    UniRadioGroup2: TUniRadioGroup;
    UniLabel2: TUniLabel;
    UniEdit2: TUniEdit;
    UniEdit3: TUniEdit;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniEdit4: TUniEdit;
    UniLabel5: TUniLabel;
    UniEdit5: TUniEdit;
    UniLabel6: TUniLabel;
    UniEdit6: TUniEdit;
    UniLabel7: TUniLabel;
    UniEdit7: TUniEdit;
    UniLabel8: TUniLabel;
    UniComboBox1: TUniComboBox;
    procedure GetView;Override;
    procedure SetRegister;Override;
    procedure FormatScreen;Override;
  private
    { Private declarations }
    procedure ShowEntity;
  public
    { Public declarations }
    FrEntity : TFmEntity;
  end;

var
  SeaExtMaintenance: TSeaExtMaintenance;

implementation

{$R *.dfm}

uses openForms;

{ TSeaExtMaintenance }

procedure TSeaExtMaintenance.FormatScreen;
begin
  inherited;
  ShowEntity;
end;

procedure TSeaExtMaintenance.GetView;
begin
  //openTasExtMaintenance(cds_searchid.AsInteger);
end;

procedure TSeaExtMaintenance.SetRegister;
begin
  openTasExtMaintenance(0);
end;

procedure TSeaExtMaintenance.ShowEntity;
begin
  FrEntity := TFmEntity.Create(Self);
  FrEntity.Parent := Ctn_Entity;
  FrEntity.Align := alClient;
  FrEntity.Listar;
  FrEntity.Show;
end;

end.
