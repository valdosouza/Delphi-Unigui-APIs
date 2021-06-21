unit fm_pos_prog;

interface

uses
 Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniEdit, uniGUIBaseClasses, uniLabel;

type
  TFmMedPosProg = class(TFmBaseFrame)
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
    Sb_Register: TUniSpeedButton;
    Sb_Search: TUniSpeedButton;

    procedure setImages;Override;
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmMedPosProg: TFmMedPosProg;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TFmPosition }

procedure TFmMedPosProg.Sb_RegisterClick(Sender: TObject);
begin
   openCadMedPosProg(E_Description)
end;

procedure TFmMedPosProg.Sb_SearchClick(Sender: TObject);
begin
   openSeaMedPosProg(E_Description);
end;

procedure TFmMedPosProg.setImages;
begin
  inherited;
  buttonIcon(Sb_Search,'miniSearch.bmp');
end;

end.
