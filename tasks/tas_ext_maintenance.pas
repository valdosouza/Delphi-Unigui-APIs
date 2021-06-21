unit tas_ext_maintenance;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniEdit, uniDateTimePicker, uniLabel, uniGroupBox, uniBasicGrid,
  uniDBGrid, fm_entity, fm_address_list, fm_ext_level, Data.DB,
  Datasnap.DBClient;

type
  TTasExtMaintenance = class(TBaseRegistry)
    UniPanel1: TUniPanel;
    UniLabel1: TUniLabel;
    UniDateTimePicker1: TUniDateTimePicker;
    UniLabel2: TUniLabel;
    UniEdit1: TUniEdit;
    Ctn_Entity: TUniContainerPanel;
    Ctn_Address_List: TUniContainerPanel;
    Ctn_Ext_Level: TUniContainerPanel;
    UniLabel3: TUniLabel;
    UniEdit2: TUniEdit;
    UniLabel4: TUniLabel;
    UniEdit3: TUniEdit;
    UniLabel5: TUniLabel;
    UniEdit4: TUniEdit;
    UniLabel6: TUniLabel;
    UniEdit5: TUniEdit;
    UniLabel7: TUniLabel;
    UniEdit6: TUniEdit;
    UniDBGrid1: TUniDBGrid;
    UniPanel2: TUniPanel;
    UniGroupBox1: TUniGroupBox;
    Sb_Insert_Ext: TUniSpeedButton;
    Sb_Chance_Ext: TUniSpeedButton;
    Sb_Delet_Ext: TUniSpeedButton;
    UniSpeedButton8: TUniSpeedButton;
    UniSpeedButton9: TUniSpeedButton;
    UniSpeedButton10: TUniSpeedButton;
    UniLabel8: TUniLabel;
    UniLabel9: TUniLabel;
    procedure FormatScreen;Override;
    function ValidateInsertExt: Boolean;
    function ValidateChangeExt: Boolean;
    function ValidateDeleteExt: Boolean;
    procedure Sb_Insert_ExtClick(Sender: TObject);
    procedure Sb_Chance_ExtClick(Sender: TObject);
    procedure Sb_Delet_ExtClick(Sender: TObject);
  private
    { Private declarations }
    procedure ShowEntity;
    procedure ShowAddressList;
    procedure ShowExtLevel;
  public
    { Public declarations }
    FrEntity : TFmEntity;
    FrAddressList : TFmAddressList;
    FrExtLevel : TFmExtLevel;
  end;

var
  TasExtMaintenance: TTasExtMaintenance;

implementation

{$R *.dfm}

uses openForms;

{ TTasExtMaintenance }

procedure TTasExtMaintenance.FormatScreen;
begin
  inherited;
  ShowEntity;
  ShowAddressList;
  ShowExtLevel;
end;

procedure TTasExtMaintenance.Sb_Chance_ExtClick(Sender: TObject);
begin
  inherited;
  if ValidateChangeExt then
  Change;
end;

procedure TTasExtMaintenance.Sb_Delet_ExtClick(Sender: TObject);
begin
  inherited;
  if ValidateDeleteExt then
  Delete;
end;

procedure TTasExtMaintenance.Sb_Insert_ExtClick(Sender: TObject);
begin
  inherited;
  if ValidateInsertExt then
    Insert;
  openTasExtMaintenanceItems(0);
end;

procedure TTasExtMaintenance.ShowAddressList;
begin
  FrAddressList := TFmAddressList.Create(Self);
  FrAddressList.Parent := Ctn_Address_List;
  FrAddressList.Align := alClient;
  FrAddressList.Listar;
  FrAddressList.Show;
end;

procedure TTasExtMaintenance.ShowEntity;
begin
  FrEntity := TFmEntity.Create(Self);
  FrEntity.Parent := Ctn_Entity;
  FrEntity.Align := alClient;
  FrEntity.Listar;
  FrEntity.Show;
end;

procedure TTasExtMaintenance.ShowExtLevel;
begin
  FrExtLevel := TFmExtLevel.Create(Self);
  FrExtLevel.Parent := Ctn_Ext_Level;
  FrExtLevel.Align := alClient;
  //FrExtLevel.Listar;
  FrExtLevel.Show;
end;

function TTasExtMaintenance.ValidateChangeExt: Boolean;
begin
 Result := True;
end;

function TTasExtMaintenance.ValidateDeleteExt: Boolean;
begin
  Result := True;
end;

function TTasExtMaintenance.ValidateInsertExt: Boolean;
begin
  Result := True;
end;

end.
