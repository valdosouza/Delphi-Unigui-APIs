unit msg_alert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniButton, unimButton, uniGUIBaseClasses, unimPanel, uniPanel, uniHTMLFrame,
  unimHTMLFrame;

type
  TMsgAlert = class(TUnimForm)
    pnl_button: TUnimPanel;
    btn_ok: TUnimButton;
    htm_message: TUnimHTMLFrame;
    procedure btn_okClick(Sender: TObject);
  private
    FMessagem: String;
    FFinalizada: Boolean;
    { Private declarations }

    procedure setFFinalizada(const Value: Boolean);
  public
    { Public declarations }
    Messagem : array of string;
    property Finalizada : Boolean read FFinalizada write setFFinalizada;
    procedure SetHtmlMessage;
  end;

function MsgAlert: TMsgAlert;

implementation

uses
  uniGUIApplication, MainModule;

{$R *.dfm}

function MsgAlert: TMsgAlert;
begin
  Result := TMsgAlert(UMM.GetFormInstance(TMsgAlert));
end;

{ TMsgAlert }

procedure TMsgAlert.setHtmlMessage;
Var
  I:Integer;
begin
  htm_message.HTML.Clear;
  Caption := Messagem[0];
  htm_message.HTML.Add(CONCAT(
      '<style> ',
      '.alerta { ',
      '  margin-top : 3px; ',
      '  text-align: center; ',
      '} ',
      '</style>'
  ));
  for I:=1 to High(Messagem) do
  Begin
    htm_message.HTML.add(concat(
            '<div class="alerta">', Messagem[I], ' </div>'
    ));
  End;
end;

procedure TMsgAlert.setFFinalizada(const Value: Boolean);
begin
  FFinalizada := Value;
end;

procedure TMsgAlert.btn_okClick(Sender: TObject);
begin
  FFinalizada := True;
  Self.Close;
end;

end.
