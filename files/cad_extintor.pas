unit cad_extintor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniLabel, uniEdit, uniPageControl, uniDateTimePicker, uniCheckBox,
  uniRadioGroup, fm_entity, fm_address_delivery, fm_brand, fm_agency, fm_broadcaster,
  uniGroupBox, uniMemo, Data.DB, Datasnap.DBClient;

type
  TCadExtintor = class(TBaseRegistry)
    UniPanel1: TUniPanel;
    UniEdit1: TUniEdit;
    UniLabel1: TUniLabel;
    Ctn_Entity: TUniContainerPanel;
    Ctn_Address_Delivery: TUniContainerPanel;
    UniPanel2: TUniPanel;
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
    procedure ClearAllFields;Override;
    procedure InitVariable;Override;
    procedure setVariable; override;
    procedure FormatScreen;Override;

    procedure ShowData;Override;
    procedure ShowDataOrder;
    procedure ShowNoData;Override;
    procedure EditionControl;Override;
  private
    { Private declarations }
    procedure ShowEntity;
    procedure ShowAdressDelivery;
    procedure ShowAgency;
    procedure ShowBrand;
    procedure ShowBroadcaster;

  public
    { Public declarations }
    FrEntity : TFmEntity;
    FrAdressDelivery : TFmAdressDelivery;
    FrAgency: TFmAgency;
    FrBrand : TFmBrand;
    FrBroadcaster : TFmBroadcaster;
  end;

var
  CadExtintor: TCadExtintor;

implementation

{$R *.dfm}

{ TCadExtintor }

procedure TCadExtintor.ClearAllFields;
begin
  inherited;
  ClearFields(FrEntity);
  ClearFields(FrAdressDelivery);
  ClearFields(FrAgency);
  ClearFields(FrBrand);
  ClearFields(FrBroadcaster);
end;

procedure TCadExtintor.ShowEntity;
begin
  FrEntity := TfmEntity.Create(Self);
  FrEntity.Parent := Ctn_Entity;
  FrEntity.Listar;
  FrEntity.Align := alClient;
  FrEntity.Show;
end;

procedure TCadExtintor.EditionControl;
begin
 inherited;
  EditionControler(FrEntity);
  EditionControler(FrAdressDelivery);
  EditionControler(FrAgency);
  EditionControler(FrBrand);
  EditionControler(FrBroadcaster);
end;

procedure TCadExtintor.FormatScreen;
begin
  inherited;
  ShowEntity;
  ShowAdressDelivery;
  ShowAgency;
  ShowBrand;
  ShowBroadcaster
end;

procedure TCadExtintor.InitVariable;
begin
  inherited;
 //
end;

procedure TCadExtintor.setVariable;
begin
  inherited;
 //
end;

procedure TCadExtintor.ShowAdressDelivery;
begin
  FrAdressDelivery := TFmAdressDelivery.Create(Self);
  FrAdressDelivery.Parent := Ctn_Address_Delivery;
  FrAdressDelivery.Listar;
  FrAdressDelivery.Align := alClient;
  FrAdressDelivery.Show;
end;

procedure TCadExtintor.ShowAgency;
begin
  FrAgency := TFmAgency.Create(Self);
  FrAgency.Parent := Ctn_1;
  FrAgency.Listar;
  FrAgency.Align := alClient;
  FrAgency.Show;
end;

procedure TCadExtintor.ShowNoData;
begin
  ClearAllFields;
  inherited;
end;

procedure TCadExtintor.ShowBrand;
begin
  FrBrand := TFmBrand.Create(Self);
  FrBrand.Parent := Ctn_Brand;
  FrBrand.Listar;
  FrBrand.Align := alClient;
  FrBrand.Show;
end;

procedure TCadExtintor.ShowBroadcaster;
begin
  FrBroadcaster := TFmBroadcaster.Create(Self);
  FrBroadcaster.Parent := Ctn_2;
  FrBroadcaster.Listar;
  FrBroadcaster.Align := alClient;
  FrBroadcaster.Show;
end;

procedure TCadExtintor.ShowData;
begin
  inherited;
  //
end;

procedure TCadExtintor.ShowDataOrder;
begin
 //
end;

end.
