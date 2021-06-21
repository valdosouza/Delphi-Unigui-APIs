unit sea_ext_operating_test;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniPanel,
  uniDateTimePicker, uniCheckBox, uniLabel, uniEdit, uniGroupBox,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses, fm_collaborator,
  uniPageControl;

type
  TSeaExtOperatingTest = class(TBaseSearch)
    UniEdit1: TUniEdit;
    UniLabel1: TUniLabel;
    UniCheckBox1: TUniCheckBox;
    UniDateTimePicker1: TUniDateTimePicker;
    UniLabel2: TUniLabel;
    UniDateTimePicker2: TUniDateTimePicker;
    UniLabel3: TUniLabel;
    UniEdit2: TUniEdit;
    Ctn_Collaborator: TUniContainerPanel;
    procedure FormatScreen;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;
  private
    { Private declarations }
    procedure ShowCollaborator;
  public
    { Public declarations }
    FrCollaborator : TFmCollaborator;
  end;

var
  SeaExtOperatingTest: TSeaExtOperatingTest;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TSeaExtOperatingTest }

procedure TSeaExtOperatingTest.FormatScreen;
begin
  inherited;
  ShowCollaborator;
end;

procedure TSeaExtOperatingTest.GetView;
begin
  //openTasExtOperatingTest(cds_searchid.AsInteger);
end;

procedure TSeaExtOperatingTest.SetRegister;
begin
  openTasExtOperatingTest(0);
end;

procedure TSeaExtOperatingTest.ShowCollaborator;
begin
  FrCollaborator := TFmCollaborator.Create(Self);
  FrCollaborator.Parent := Ctn_Collaborator;
  FrCollaborator.Listar;
  FrCollaborator.Align := alClient;
  FrCollaborator.Show;
end;

end.
