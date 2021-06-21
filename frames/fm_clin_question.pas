unit fm_clin_question;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniLabel, uniGUIClasses,
  uniRadioButton, uniGUIBaseClasses, uniPanel;

type
  TFmClinQuestion = class(TFmBaseFrame)
    pnl_quiz: TUniPanel;
    UniPanel1: TUniPanel;
    Rb_Yes: TUniRadioButton;
    Rb_No: TUniRadioButton;
    Lb_Question: TUniLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmClinQuestion: TFmClinQuestion;

implementation

{$R *.dfm}

end.
