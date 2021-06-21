unit tas_technical_assistance;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniMemo, uniBasicGrid, uniDBGrid, uniPageControl, uniDateTimePicker,
  uniEdit, uniLabel, fm_entity, fm_situation, Data.DB, Datasnap.DBClient;

type
  TTasTechnicalAssistance = class(TBaseRegistry)
    UniPanel1: TUniPanel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniEdit1: TUniEdit;
    UniLabel4: TUniLabel;
    UniEdit2: TUniEdit;
    Ctn_Entity: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniDateTimePicker1: TUniDateTimePicker;
    UniPageControl1: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    UniPanel2: TUniPanel;
    UniDBGrid1: TUniDBGrid;
    UniTabSheet2: TUniTabSheet;
    UniPanel3: TUniPanel;
    UniLabel6: TUniLabel;
    UniEdit3: TUniEdit;
    UniLabel7: TUniLabel;
    UniDateTimePicker2: TUniDateTimePicker;
    UniLabel8: TUniLabel;
    UniDateTimePicker3: TUniDateTimePicker;
    Ctn_Situation: TUniContainerPanel;
    UniLabel9: TUniLabel;
    UniEdit4: TUniEdit;
    UniLabel10: TUniLabel;
    UniEdit5: TUniEdit;
    UniLabel11: TUniLabel;
    UniMemo1: TUniMemo;
    UniLabel12: TUniLabel;
    UniDateTimePicker4: TUniDateTimePicker;
    UniLabel13: TUniLabel;
    UniEdit6: TUniEdit;
    procedure FormatScreen;Override;
  private
    { Private declarations }
    procedure ShowEntity;
    procedure ShowSituation;
  public
    { Public declarations }
    FrEntity : TFmEntity;
    FrSituation : TFmSituation;
  end;

var
  TasTechnicalAssistance: TTasTechnicalAssistance;

implementation

{$R *.dfm}

{ TTasTechnicalAssistance }

procedure TTasTechnicalAssistance.FormatScreen;
begin
  inherited;
  ShowEntity;
  ShowSituation;
end;

procedure TTasTechnicalAssistance.ShowEntity;
begin
  FrEntity := TFmEntity.Create(Self);
  FrEntity.Parent := Ctn_Entity;
  FrEntity.Align := alClient;
  FrEntity.Listar;
  FrEntity.Show;
end;

procedure TTasTechnicalAssistance.ShowSituation;
begin
  FrSituation := TFmSituation.Create(Self);
  FrSituation.Parent := Ctn_Situation;
  FrSituation.Align := alClient;
  FrSituation.Listar;
  FrSituation.Show;
end;

end.
