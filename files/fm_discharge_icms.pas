unit fm_discharge_icms;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniEdit, uniGUIBaseClasses, uniLabel;

type
  TFmBaseFrame2 = class(TFmBaseFrame)
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
    Sb_Register: TUniSpeedButton;
    Sb_Search: TUniSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmBaseFrame2: TFmBaseFrame2;

implementation

{$R *.dfm}

end.
