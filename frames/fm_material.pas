unit fm_material;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniEdit, uniGUIBaseClasses, uniLabel;
type
  TFmMaterial = class(TFmBaseFrame)
    E_Description: TUniEdit;
    Sb_Register: TUniSpeedButton;
    Sb_Search: TUniSpeedButton;
    L_NameCompany: TUniLabel;

    procedure setImages;Override;
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmMaterial: TFmMaterial;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TFmBaseFrame1 }

procedure TFmMaterial.Sb_RegisterClick(Sender: TObject);
begin
   openCadMaterial(E_Description)
end;

procedure TFmMaterial.Sb_SearchClick(Sender: TObject);
begin
   openSeaMaterial(E_Description);
end;

procedure TFmMaterial.setImages;
begin
  inherited;
  buttonIcon(Sb_Search,'miniSearch.bmp');
end;
end.
