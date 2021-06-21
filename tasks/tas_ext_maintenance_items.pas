unit tas_ext_maintenance_items;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniGroupBox, uniMemo, uniDateTimePicker, uniCheckBox, uniRadioGroup,
  uniEdit, uniLabel, uniPageControl, uniBasicGrid, uniDBGrid, fm_ext_motive, fm_entity, fm_address_delivery,
  fm_brand, fm_agency, fm_broadcaster, Data.DB, Datasnap.DBClient ;

type
  TTasExtMaintenanceItems = class(TBaseRegistry)
    UniPageControl1: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    UniPanel3: TUniPanel;
    UniLabel2: TUniLabel;
    UniEdit2: TUniEdit;
    UniRadioGroup1: TUniRadioGroup;
    Ctn_Brand: TUniContainerPanel;
    UniEdit3: TUniEdit;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniEdit4: TUniEdit;
    UniRadioGroup2: TUniRadioGroup;
    UniLabel5: TUniLabel;
    UniEdit5: TUniEdit;
    UniLabel6: TUniLabel;
    UniEdit6: TUniEdit;
    Ctn_1: TUniContainerPanel;
    UniEdit7: TUniEdit;
    UniLabel7: TUniLabel;
    UniEdit8: TUniEdit;
    UniLabel8: TUniLabel;
    UniEdit10: TUniEdit;
    UniLabel10: TUniLabel;
    UniEdit9: TUniEdit;
    UniLabel9: TUniLabel;
    Ctn_2: TUniContainerPanel;
    UniCheckBox1: TUniCheckBox;
    UniDateTimePicker1: TUniDateTimePicker;
    UniLabel11: TUniLabel;
    UniTabSheet2: TUniTabSheet;
    UniPanel4: TUniPanel;
    UniLabel12: TUniLabel;
    UniDateTimePicker2: TUniDateTimePicker;
    UniLabel13: TUniLabel;
    UniDateTimePicker3: TUniDateTimePicker;
    UniLabel14: TUniLabel;
    UniEdit11: TUniEdit;
    UniLabel15: TUniLabel;
    UniEdit12: TUniEdit;
    UniLabel16: TUniLabel;
    UniEdit13: TUniEdit;
    UniLabel17: TUniLabel;
    UniEdit14: TUniEdit;
    UniLabel18: TUniLabel;
    UniEdit15: TUniEdit;
    UniLabel19: TUniLabel;
    UniEdit16: TUniEdit;
    UniMemo1: TUniMemo;
    UniLabel20: TUniLabel;
    UniLabel21: TUniLabel;
    UniEdit17: TUniEdit;
    UniLabel22: TUniLabel;
    UniContainerPanel1: TUniContainerPanel;
    Manutenção: TUniTabSheet;
    UniPanel5: TUniPanel;
    UniLabel23: TUniLabel;
    UniDateTimePicker4: TUniDateTimePicker;
    UniLabel24: TUniLabel;
    UniDateTimePicker5: TUniDateTimePicker;
    UniContainerPanel2: TUniContainerPanel;
    UniLabel25: TUniLabel;
    UniDateTimePicker6: TUniDateTimePicker;
    UniLabel26: TUniLabel;
    UniDateTimePicker7: TUniDateTimePicker;
    UniLabel27: TUniLabel;
    UniMemo2: TUniMemo;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel28: TUniLabel;
    UniEdit18: TUniEdit;
    UniTabSheet3: TUniTabSheet;
    UniPanel6: TUniPanel;
    UniLabel29: TUniLabel;
    UniEdit19: TUniEdit;
    UniLabel30: TUniLabel;
    UniEdit20: TUniEdit;
    UniLabel31: TUniLabel;
    UniEdit21: TUniEdit;
    UniLabel32: TUniLabel;
    UniEdit22: TUniEdit;
    UniEdit23: TUniEdit;
    UniLabel33: TUniLabel;
    UniLabel34: TUniLabel;
    UniEdit24: TUniEdit;
    UniLabel35: TUniLabel;
    UniEdit25: TUniEdit;
    UniLabel36: TUniLabel;
    UniEdit26: TUniEdit;
    UniLabel37: TUniLabel;
    UniEdit27: TUniEdit;
    UniLabel38: TUniLabel;
    UniEdit28: TUniEdit;
    UniLabel39: TUniLabel;
    UniEdit29: TUniEdit;
    UniLabel40: TUniLabel;
    UniEdit30: TUniEdit;
    UniTabSheet4: TUniTabSheet;
    UniPanel7: TUniPanel;
    UniLabel41: TUniLabel;
    UniEdit31: TUniEdit;
    UniLabel42: TUniLabel;
    UniLabel43: TUniLabel;
    UniDateTimePicker8: TUniDateTimePicker;
    UniDateTimePicker9: TUniDateTimePicker;
    Ctn_Brand_Lote: TUniContainerPanel;
    UniLabel44: TUniLabel;
    UniEdit32: TUniEdit;
    UniGroupBox1: TUniGroupBox;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    UniTabSheet5: TUniTabSheet;
    UniPanel1: TUniPanel;
    Aprovado: TUniRadioGroup;
    Ctn_Ext_Motive: TUniContainerPanel;
    UniTabSheet6: TUniTabSheet;
    UniPanel2: TUniPanel;
    UniDBGrid1: TUniDBGrid;
    UniGroupBox2: TUniGroupBox;
    UniSpeedButton1: TUniSpeedButton;
    UniSpeedButton2: TUniSpeedButton;
    UniSpeedButton3: TUniSpeedButton;
    UniSpeedButton4: TUniSpeedButton;
    UniTabSheet7: TUniTabSheet;
    UniPanel8: TUniPanel;
    UniDBGrid2: TUniDBGrid;
    UniGroupBox3: TUniGroupBox;
    UniSpeedButton6: TUniSpeedButton;
    UniSpeedButton7: TUniSpeedButton;
    UniSpeedButton8: TUniSpeedButton;
    UniTabSheet8: TUniTabSheet;
    UniPanel9: TUniPanel;
    UniMemo3: TUniMemo;
    procedure FormatScreen;Override;
  private
    { Private declarations }
    procedure ShowEntity;
    procedure ShowAdressDelivery;
    procedure ShowAgency;
    procedure ShowBrand;
    procedure ShowBroadcaster;
    procedure ShowExtMotive;
  public
    { Public declarations }
    FrEntity : TFmEntity;
    FrAdressDelivery : TFmAdressDelivery;
    FrAgency: TFmAgency;
    FrBrand : TFmBrand;
    FrBroadcaster : TFmBroadcaster;
    FrExtMotive : TFmExtMotive;
  end;

var
  TasExtMaintenanceItems: TTasExtMaintenanceItems;

implementation

{$R *.dfm}

{ TTasExtMaintenanceItems }

procedure TTasExtMaintenanceItems.FormatScreen;
begin
  inherited;
  ShowEntity;
  ShowAdressDelivery;
  ShowAgency;
  ShowBrand;
  ShowBroadcaster;
  ShowExtMotive;
end;

procedure TTasExtMaintenanceItems.ShowAdressDelivery;
begin
 //
end;

procedure TTasExtMaintenanceItems.ShowAgency;
begin
  FrAgency := TFmAgency.Create(Self);
  FrAgency.Parent := Ctn_1;
  FrAgency.Listar;
  FrAgency.Align := alClient;
  FrAgency.Show;
end;

procedure TTasExtMaintenanceItems.ShowBrand;
begin
  FrBrand := TFmBrand.Create(Self);
  FrBrand.Parent := Ctn_Brand;
  FrBrand.Listar;
  FrBrand.Align := alClient;
  FrBrand.Show;
end;

procedure TTasExtMaintenanceItems.ShowBroadcaster;
begin
  FrBroadcaster := TFmBroadcaster.Create(Self);
  FrBroadcaster.Parent := Ctn_2;
  FrBroadcaster.Listar;
  FrBroadcaster.Align := alClient;
  FrBroadcaster.Show;
end;

procedure TTasExtMaintenanceItems.ShowEntity;
begin
//
end;

procedure TTasExtMaintenanceItems.ShowExtMotive;
begin
  FrExtMotive := TFmExtMotive.Create(Self);
  FrExtMotive.Parent := Ctn_Ext_Motive;
  FrExtMotive.Listar;
  FrExtMotive.Align := alClient;
  FrExtMotive.Show;
end;

end.
