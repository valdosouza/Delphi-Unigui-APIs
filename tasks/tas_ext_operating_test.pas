unit tas_ext_operating_test;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniPageControl, uniRadioGroup, uniMemo, uniDateTimePicker, uniEdit,
  uniLabel, fm_brand, fm_entity, fm_collaborator, fm_measure, fm_ext_agent,
  Data.DB, Datasnap.DBClient;

type
  TTasExtOperatingTest = class(TBaseRegistry)
    UniPanel1: TUniPanel;
    UniLabel1: TUniLabel;
    UniEdit1: TUniEdit;
    UniLabel2: TUniLabel;
    UniDateTimePicker1: TUniDateTimePicker;
    UniLabel3: TUniLabel;
    UniEdit2: TUniEdit;
    Ctn_Ext_Agent: TUniContainerPanel;
    Ctn_Collaborator: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniEdit3: TUniEdit;
    UniMemo1: TUniMemo;
    UniRadioGroup1: TUniRadioGroup;
    UniLabel5: TUniLabel;
    UniPageControl1: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    UniPanel2: TUniPanel;
    UniLabel6: TUniLabel;
    UniEdit4: TUniEdit;
    Ctn_Entity_1: TUniContainerPanel;
    UniLabel7: TUniLabel;
    UniEdit5: TUniEdit;
    UniRadioGroup2: TUniRadioGroup;
    UniLabel8: TUniLabel;
    E_Rec_Number_1: TUniEdit;
    UniLabel9: TUniLabel;
    E_Rec_Year_1: TUniEdit;
    Ctn_Rec_Brand_1: TUniContainerPanel;
    UniLabel10: TUniLabel;
    E_Rec_Capacity_1: TUniEdit;
    Ctn_Rec_Measure_1: TUniContainerPanel;
    UniLabel11: TUniLabel;
    E_Amp_Number_1: TUniEdit;
    UniLabel12: TUniLabel;
    E_Amp_Year_1: TUniEdit;
    Ctn_Amp_Brand_1: TUniContainerPanel;
    UniLabel13: TUniLabel;
    E_Amp_Capacity_1: TUniEdit;
    Ctn_Amp_Measure_1: TUniContainerPanel;
    UniRadioGroup3: TUniRadioGroup;
    UniLabel14: TUniLabel;
    UniEdit12: TUniEdit;
    UniTabSheet2: TUniTabSheet;
    UniTabSheet3: TUniTabSheet;
    UniPanel3: TUniPanel;
    UniLabel15: TUniLabel;
    UniEdit13: TUniEdit;
    Ctn_Entity_2: TUniContainerPanel;
    UniLabel16: TUniLabel;
    UniEdit14: TUniEdit;
    UniRadioGroup4: TUniRadioGroup;
    UniLabel17: TUniLabel;
    E_Rec_Number_2: TUniEdit;
    UniLabel18: TUniLabel;
    E_Rec_Year_2: TUniEdit;
    Ctn_Rec_Brand_2: TUniContainerPanel;
    UniLabel19: TUniLabel;
    E_Rec_Capacity: TUniEdit;
    Ctn_Rec_Measure_2: TUniContainerPanel;
    UniLabel20: TUniLabel;
    E_Amp_Number_2: TUniEdit;
    UniLabel21: TUniLabel;
    E_Amp_Year_2: TUniEdit;
    Ctn_Amp_Brand_2: TUniContainerPanel;
    UniLabel22: TUniLabel;
    E_Amp_Capacity_2: TUniEdit;
    Ctn_Amp_Measure_2: TUniContainerPanel;
    UniRadioGroup5: TUniRadioGroup;
    UniLabel23: TUniLabel;
    UniEdit21: TUniEdit;
    UniPanel4: TUniPanel;
    UniLabel24: TUniLabel;
    UniEdit22: TUniEdit;
    Ctn_Entity_3: TUniContainerPanel;
    UniLabel25: TUniLabel;
    UniEdit23: TUniEdit;
    UniRadioGroup6: TUniRadioGroup;
    UniLabel26: TUniLabel;
    E_Rec_Number_3: TUniEdit;
    UniLabel27: TUniLabel;
    E_Rec_Year_3: TUniEdit;
    Ctn_Rec_Brand_3: TUniContainerPanel;
    UniLabel28: TUniLabel;
    E_Rec_Capacity_3: TUniEdit;
    Ctn_Rec_Measure_3: TUniContainerPanel;
    UniLabel29: TUniLabel;
    E_Amp_Number_3: TUniEdit;
    UniLabel30: TUniLabel;
    E_Amp_Year_3: TUniEdit;
    Ctn_Amp_Brand_3: TUniContainerPanel;
    UniLabel31: TUniLabel;
    E_Amp_Capacity_3: TUniEdit;
    Ctn_Amp_Measure_3: TUniContainerPanel;
    UniRadioGroup7: TUniRadioGroup;
    UniLabel32: TUniLabel;
    UniEdit30: TUniEdit;
    procedure FormatScreen;Override;
  private
    { Private declarations }
    procedure ShowExtAgent;
    procedure ShowCollaborator;
    procedure ShowEntity1;
    procedure ShowEntity2;
    procedure ShowEntity3;
    procedure ShowRecBrand1;
    procedure ShowRecBrand2;
    procedure ShowRecBrand3;
    procedure ShowRecMeasure1;
    procedure ShowRecMeasure2;
    procedure ShowRecMeasure3;
    procedure ShowAmpBrand1;
    procedure ShowAmpBrand2;
    procedure ShowAmpBrand3;
    procedure ShowAmpMeasure1;
    procedure ShowAmpMeasure2;
    procedure ShowAmpMeasure3;
   public
    { Public declarations }
    FrEntity1 : TFmEntity;
    FrEntity2 : TFmEntity;
    FrEntity3 : TFmEntity;
    FrRecBrand1 : TFmBrand;
    FrRecBrand2 : TFmBrand;
    FrRecBrand3 : TFmBrand;
    FrAmpBrand1 : TFmBrand;
    FrAmpBrand2 : TFmBrand;
    FrAmpBrand3 : TFmBrand;
    FrRecMeasure1 : TFmMeasure;
    FrRecMeasure2 : TFmMeasure;
    FrRecMeasure3 : TFmMeasure;
    FrAmpMeasure1 : TFmMeasure;
    FrAmpMeasure2 : TFmMeasure;
    FrAmpMeasure3 : TFmMeasure;
    FrCollaborator : TFmCollaborator;
    FrExtAGent : TFmExtAgent;


  end;

var
  TasExtOperatingTest: TTasExtOperatingTest;

implementation

{$R *.dfm}

{ TExtOperatingTest }


procedure TTasExtOperatingTest.FormatScreen;
begin
  inherited;
  ShowExtAgent;
  ShowCollaborator;
  ShowEntity1;
  ShowEntity2;
  ShowEntity3;
  ShowRecBrand1;
  ShowRecBrand2;
  ShowRecBrand3;
  ShowRecMeasure1;
  ShowRecMeasure2;
  ShowRecMeasure3;
  ShowAmpBrand1;
  ShowAmpBrand2;
  ShowAmpBrand3;
  ShowAmpMeasure1;
  ShowAmpMeasure2;
  ShowAmpMeasure3;
end;

procedure TTasExtOperatingTest.ShowAmpBrand1;
begin
  FrAmpBrand1 := TFmBrand.Create(Self);
  FrAmpBrand1.Name := 'fr_amp_brand_1';
  FrAmpBrand1.Parent := Ctn_Amp_Brand_1;
  FrAmpBrand1.Listar;
  FrAmpBrand1.Align := alClient;
  FrAmpBrand1.Show;
 end;

procedure TTasExtOperatingTest.ShowAmpBrand2;
begin
  FrAmpBrand2 := TFmBrand.Create(Self);
  FrAmpBrand2.Name := 'fr_amp_brand_2';
  FrAmpBrand2.Parent := Ctn_Amp_Brand_2;
  FrAmpBrand2.Listar;
  FrAmpBrand2.Align := alClient;
  FrAmpBrand2.Show;
end;

procedure TTasExtOperatingTest.ShowAmpBrand3;
begin
  FrAmpBrand3 := TFmBrand.Create(Self);
  FrAmpBrand3.Name := 'fr_amp_brand_3';
  FrAmpBrand3.Parent := Ctn_Amp_Brand_3;
  FrAmpBrand3.Listar;
  FrAmpBrand3.Align := alClient;
  FrAmpBrand3.Show;
end;

procedure TTasExtOperatingTest.ShowAmpMeasure1;
begin
  FrAmpMeasure1 := TFmMeasure.Create(Self);
  FrAmpMeasure1.Name := 'fr_amp_measure_1';
  FrAmpMeasure1.Parent := Ctn_Amp_Measure_1;
  FrAmpMeasure1.Listar;
  FrAmpMeasure1.Align := alClient;
  FrAmpMeasure1.Show;
end;

procedure TTasExtOperatingTest.ShowAmpMeasure2;
begin
  FrAmpMeasure2 := TFmMeasure.Create(Self);
  FrAmpMeasure2.Name := 'fr_amp_measure_2';
  FrAmpMeasure2.Parent := Ctn_Amp_Measure_2;
  FrAmpMeasure2.Listar;
  FrAmpMeasure2.Align := alClient;
  FrAmpMeasure2.Show;
end;

procedure TTasExtOperatingTest.ShowAmpMeasure3;
begin
  FrAmpMeasure3 := TFmMeasure.Create(Self);
  FrAmpMeasure2.Name := 'fr_amp_measure_3';
  FrAmpMeasure3.Parent := Ctn_Amp_Measure_3;
  FrAmpMeasure3.Listar;
  FrAmpMeasure3.Align := alClient;
  FrAmpMeasure3.Show;
end;

procedure TTasExtOperatingTest.ShowCollaborator;
begin
  FrCollaborator := TFmCollaborator.Create(Self);
  FrCollaborator.Parent := Ctn_Collaborator;
  FrCollaborator.Listar;
  FrCollaborator.Align := alClient;
  FrCollaborator.Show;
end;

procedure TTasExtOperatingTest.ShowEntity1;
begin
  FrEntity1 := TFmEntity.Create(Self);
  FrEntity1.Name := 'fr_entity_1';
  FrEntity1.Parent := Ctn_Entity_1;
  FrEntity1.Listar;
  FrEntity1.Align := alClient;
  FrEntity1.Show;
end;

procedure TTasExtOperatingTest.ShowEntity2;
begin
  FrEntity2 := TFmEntity.Create(Self);
  FrEntity2.Name := 'fr_entity_2';
  FrEntity2.Parent := Ctn_Entity_2;
  FrEntity2.Listar;
  FrEntity2.Align := alClient;
  FrEntity2.Show;
end;

procedure TTasExtOperatingTest.ShowEntity3;
begin
  FrEntity3 := TFmEntity.Create(Self);
  FrEntity3.Name := 'fr_entity_3';
  FrEntity3.Parent := Ctn_Entity_3;
  FrEntity3.Listar;
  FrEntity3.Align := alClient;
  FrEntity3.Show;
end;

procedure TTasExtOperatingTest.ShowExtAgent;
begin
  FrExtAGent := TFmExtAgent.Create(Self);
  FrExtAGent.Parent := Ctn_Ext_Agent;
  FrExtAGent.Listar;
  FrExtAGent.Align := alClient;
  FrExtAGent.Show;
end;

procedure TTasExtOperatingTest.ShowRecBrand1;
begin
  FrRecBrand1 := TFmBrand.Create(Self);
  FrRecBrand1.Name := 'fr_rec_brand_1';
  FrRecBrand1.Parent := Ctn_Rec_Brand_1;
  FrRecBrand1.Listar;
  FrRecBrand1.Align := alClient;
  FrRecBrand1.Show;
end;

procedure TTasExtOperatingTest.ShowRecBrand2;
begin
  FrRecBrand2 := TFmBrand.Create(Self);
  FrRecBrand2.Name := 'fr_rec_brand_2';
  FrRecBrand2.Parent := Ctn_Rec_Brand_2;
  FrRecBrand2.Listar;
  FrRecBrand2.Align := alClient;
  FrRecBrand2.Show;
end;

procedure TTasExtOperatingTest.ShowRecBrand3;
begin
  FrRecBrand3 := TFmBrand.Create(Self);
  FrRecBrand3.Name := 'fr_rec_brand_3';
  FrRecBrand3.Parent := Ctn_Rec_Brand_3;
  FrRecBrand3.Listar;
  FrRecBrand3.Align := alClient;
  FrRecBrand3.Show;
end;

procedure TTasExtOperatingTest.ShowRecMeasure1;
begin
  FrRecMeasure1 := TFmMeasure.Create(Self);
  FrRecMeasure1.Name := 'fr_rec_measure_1';
  FrRecMeasure1.Parent := Ctn_Rec_Measure_1;
  FrRecMeasure1.Listar;
  FrRecMeasure1.Align := alClient;
  FrRecMeasure1.Show;
end;

procedure TTasExtOperatingTest.ShowRecMeasure2;
begin
  FrRecMeasure2 := TFmMeasure.Create(Self);
  FrRecMeasure2.Name := 'fr_rec_measure_2';
  FrRecMeasure2.Parent := Ctn_Rec_Measure_2;
  FrRecMeasure2.Listar;
  FrRecMeasure2.Align := alClient;
  FrRecMeasure2.Show;
end;

procedure TTasExtOperatingTest.ShowRecMeasure3;
begin
  FrRecMeasure3 := TFmMeasure.Create(Self);
  FrRecMeasure3.Name := 'fr_rec_measure_3';
  FrRecMeasure3.Parent := Ctn_Rec_Measure_3;
  FrRecMeasure3.Listar;
  FrRecMeasure3.Align := alClient;
  FrRecMeasure3.Show;
end;

end.
