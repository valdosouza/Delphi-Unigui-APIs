unit define_page_views;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniGUIBaseClasses, uniTrackBar, unimSlider, uniLabel, unimLabel, uniButton,
  unimButton, unimPanel, uniURLFrame, unimURLFrame;

type
  TDefinePageViews = class(TUnimForm)
    pnl_button: TUnimPanel;
    btn_ok: TUnimButton;
    Lb_total_page_views: TUnimLabel;
    Sld_Page_Views: TUnimSlider;
    procedure btn_okClick(Sender: TObject);
    procedure Sld_Page_ViewsChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  uniGUIApplication;

{$R *.dfm}


procedure TDefinePageViews.btn_okClick(Sender: TObject);
begin

  close;
end;

procedure TDefinePageViews.Sld_Page_ViewsChange(Sender: TObject);
Var
  Lc_Valor : Real;
begin
  Lc_Valor :=Sld_Page_Views.Position * 1000;
  Lb_total_page_views.Caption := concat( FloatToStrF(Lc_Valor,ffNumber,10,0),'/dia');
end;

end.
