unit fm_Installment_open;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniEdit, uniGUIBaseClasses, uniLabel;

type
  TFmInstallmentOpen = class(TFmBaseFrame)
    E_Plots: TUniEdit;
    E_DeadLine: TUniEdit;
    procedure E_PlotsExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmInstallmentOpen: TFmInstallmentOpen;

implementation

{$R *.dfm}

procedure TFmInstallmentOpen.E_PlotsExit(Sender: TObject);
begin
  UniSession.AddJS('setTimeout(function(){'+ E_DeadLine.JSName +'.focus()}, 100)');
end;

end.
