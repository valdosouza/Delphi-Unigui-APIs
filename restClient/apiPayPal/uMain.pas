unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses un_pay_pal;

procedure TForm1.SpeedButton1Click(Sender: TObject);
Var
  LcApi : TPayPal;
begin
  Try
    LcApi := TPayPal.Create(Self);

  Finally
    FreeAndNil(LcApi);
  End;
end;

end.
