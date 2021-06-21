unit unmessages;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniMemo, uniButton, uniGUIBaseClasses, uniPanel,
  uniGUIDialogs,uniGUIApplication, msg_alert;

    procedure CallBackValidade(Sender: TComponent; AResult: Integer);
    procedure MensageAlert(Msg: array of string);

Var
  FormMsg : TMsgAlert;

implementation

uses unFunctions;

procedure CallBackValidade(Sender: TComponent; AResult: Integer);
begin
  while not (Sender as TMsgAlert).Finalizada do
  Begin
    sleep(1);
  End;
end;

procedure MensageAlert(Msg: array of string);
Var
  i : Integer;
Begin
  if assigned( FormMsg ) then FormMsg := Nil;
    FormMsg := TMsgAlert.Create(uniApplication);
  FormMsg.Finalizada := False;
  //Titulo
  FormMsg.Caption := 'Mensagem';
  FormMsg.Height := 142 + (High(Msg) * 19);
  //Mensagem
  SetLength(FormMsg.Messagem,Length(Msg));
  for i:=Low(Msg) to High(Msg) do
    FormMsg.Messagem[i]:=Msg[i];
  FormMsg.SetHtmlMessage;
  //Opções

  //Botao escape

  //Tipo Padrao


  FormMsg.ShowModal(CallBackValidade );
End;

end.










