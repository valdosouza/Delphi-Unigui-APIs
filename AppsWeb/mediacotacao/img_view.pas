unit img_view;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniGUIBaseClasses, uniLabel, unimLabel, uniImage, unimImage, uniButton,
  unimButton, unimPanel;

type
  TImgView = class(TUnimForm)
    img_view: TUnimImage;
    pnl_button: TUnimPanel;
    btn_ok: TUnimButton;
    procedure btn_okClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  uniGUIApplication;

{$R *.dfm}


procedure TImgView.btn_okClick(Sender: TObject);
begin
  Self.Close;
end;

end.
