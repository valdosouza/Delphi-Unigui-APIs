unit sea_technical_assistance;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniPanel, uniEdit,
  uniLabel, uniGroupBox, Datasnap.Provider, Data.DB, Datasnap.DBClient,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid,
  uniGUIBaseClasses, fm_entity, fm_situation, uniPageControl;

type
  TSeaTechnicalAssistance = class(TBaseSearch)
    UniLabel1: TUniLabel;
    UniEdit1: TUniEdit;
    Ctn_Situation: TUniContainerPanel;
    Ctn_Entity: TUniContainerPanel;
    procedure FormatScreen;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;
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
  SeaTechnicalAssistance: TSeaTechnicalAssistance;

implementation

{$R *.dfm}

uses openForms;

{ TSeaTechnicalAssistance }

procedure TSeaTechnicalAssistance.FormatScreen;
begin
  inherited;
  ShowEntity;
  ShowSituation;
end;

procedure TSeaTechnicalAssistance.GetView;
begin
 //openTasTechnicalAssistance(cds_searchid.AsInteger);
end;

procedure TSeaTechnicalAssistance.SetRegister;
begin
  openTasTechnicalAssistance(0);
end;

procedure TSeaTechnicalAssistance.ShowEntity;
begin
  FrEntity := TFmEntity.Create(Self);
  FrEntity.Parent := Ctn_Entity;
  FrEntity.Align := alClient;
  FrEntity.Listar;
  FrEntity.Show;
end;

procedure TSeaTechnicalAssistance.ShowSituation;
begin
  FrSituation := TFmSituation.Create(Self);
  FrSituation.Parent := Ctn_Situation;
  FrSituation.Align := alClient;
  FrSituation.Listar;
  FrSituation.Show;
end;

end.
