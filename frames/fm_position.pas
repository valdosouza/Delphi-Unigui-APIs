unit fm_position;

interface

uses
 Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniEdit, uniGUIBaseClasses, uniLabel;

type
  TFmPosition = class(TFmBaseFrame)
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
  FmPosition: TFmPosition;

implementation

{$R *.dfm}

{ TFmPosition }

procedure TFmPosition.Sb_RegisterClick(Sender: TObject);
begin
   openCadMaterial(E_Description)
end;

procedure TFmPosition.Sb_SearchClick(Sender: TObject);
begin
   openMaterial(E_Description);
end;

procedure TFmPosition.setImages;
begin
  inherited;
  buttonIcon(Sb_Search,'miniSearch.bmp');
end;

end.
