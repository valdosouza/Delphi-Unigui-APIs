unit tas_home;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  base_form, System.ImageList, FMX.ImgList, FMX.Objects,
  FMX.Controls.Presentation, FMX.Ani, FMX.Layouts, FMX.Effects,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView;

type
  TTasHome = class(TBaseForm)
    Rectangle1: TRectangle;
    Lb_Name_Institution: TLabel;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Label3: TLabel;
    Label4: TLabel;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Label5: TLabel;
    Label6: TLabel;
    ShadowEffect2: TShadowEffect;
    ShadowEffect3: TShadowEffect;
    Rectangle7: TRectangle;
    Rectangle8: TRectangle;
    Label7: TLabel;
    Label8: TLabel;
    ShadowEffect4: TShadowEffect;
    Sb_change_institurion: TSpeedButton;
    procedure Sb_change_institurionClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure SetVariable;Override;
  public
    { Public declarations }
  end;

var
  TasHome: TTasHome;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

uses MainModule, lista_combo_institution, uMain, UnFunctions;


procedure TTasHome.FormCreate(Sender: TObject);
begin
  SetVariable;
end;

procedure TTasHome.Sb_change_institurionClick(Sender: TObject);
Var
  LcForm : TListaComboInstitution;
begin
  LcForm := TListaComboInstitution.Create(Self);
  LcForm.ShowModal(
  procedure(ModalResult : TModalResult)
  begin
    Lb_Name_Institution.Text := UMM.GInstitution.MFiscal.Registro.ApelidoFantasia;
    SetMainStock;
    LcForm := nil;
  end);
end;

procedure TTasHome.SetVariable;
begin
  Sb_change_institurion.Visible := (UMM.GInstitution.countInstitution > 1);
  Lb_Name_Institution.Text := UMM.GInstitution.MFiscal.Registro.ApelidoFantasia;
end;

end.


