unit unmessages;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniMemo, uniButton, uniGUIBaseClasses, uniPanel,
  uniGUIDialogs,uniGUIApplication, UnFunctions,msg_form, tas_msg_process;

  procedure CallBackGeral(Sender: TComponent; AResult: Integer);
  procedure CallBackValidade(Sender: TComponent; AResult: Integer);
  procedure MensagePadrao(const Titulo : String;
                          Msg: array of string;
                          Opcoes : array of string;
                          BotaoEscape : array of TMsgEscape;
                          TipoPadrao : TMsgPadrao);
  procedure MensageAlert(Msg: array of string);

  procedure MensageException(Msg: array of string);

  procedure MensageYesNo(Msg: array of string;
                         TipoPadrao : TMsgPadrao);
  procedure MensageWaitToProceed(Msg: array of string);
  procedure MensageProcess(Msg: string;ValueJson:String);

Var
  FormMsg : TMsgForm;
  TasMsgProcess : TTasMsgProcess;
implementation


procedure CallBackGeral(Sender: TComponent; AResult: Integer);
Var
  BotaoEscolhido : Integer;
begin
  while not (Sender as TMsgForm).Finalized do
  Begin
    sleep(1);
  End;
  BotaoEscolhido := (sender as TMsgForm).BotaoEscolhido;
end;

procedure CallBackValidade(Sender: TComponent; AResult: Integer);
Var
  BotaoEscolhido : Integer;
begin
  while not (Sender as TMsgForm).Finalized do
  Begin
    sleep(1);
  End;
  BotaoEscolhido := (sender as TMsgForm).BotaoEscolhido;
end;

procedure MensagePadrao(const Titulo : String;
                        Msg: array of string;
                        Opcoes : array of string;
                        BotaoEscape : array of TMsgEscape;
                        TipoPadrao : TMsgPadrao);
Var
  i : Integer;
Begin
  if assigned( FormMsg ) then FormMsg := Nil;
  FormMsg := TMsgForm.Create(uniApplication);
  FormMsg.Finalized := False;
  //Mensagem
  SetLength(FormMsg.Msg,Length(Msg));
  for i:=Low(Msg) to High(Msg) do
    FormMsg.Msg[i]:=Msg[i];
  //Opções
  SetLength(FormMsg.Opcoes,Length(Opcoes));
  for i:=Low(Opcoes) to High(Opcoes) do
    FormMsg.Opcoes[i]:=Opcoes[i];
  //Botao escape
  SetLength(FormMsg.BotaoEscape,Length(BotaoEscape));
  for i:=Low(BotaoEscape) to High(BotaoEscape) do
    FormMsg.BotaoEscape[i] := BotaoEscape[i];
  //Tipo Padrao
  FormMsg.TipoPadrao := TipoPadrao;
  FormMsg.FormatScreen;
  //FormMsg.ShowModal(CallBackGeral );
End;

procedure MensageAlert(Msg: array of string);
Var
  i : Integer;
Begin
  if assigned( FormMsg ) then FormMsg := Nil;
  FormMsg := TMsgForm.Create(uniApplication);
  FormMsg.Finalized := False;
  //Titulo
  FormMsg.Titulo := 'Mensagem';
  //Mensagem
  SetLength(FormMsg.Msg,Length(Msg));
  for i:=Low(Msg) to High(Msg) do
    FormMsg.Msg[i]:=Msg[i];
  //Opções
  FormMsg.Opcoes:= ['OK'];
  //Botao escape
  FormMsg.BotaoEscape := [bEscape];
  //Tipo Padrao
  FormMsg.TipoPadrao := mpAlerta;
  FormMsg.FormatScreen;
  FormMsg.ShowModal(CallBackValidade );
End;

procedure MensageException(Msg: array of string);
Var
  i : Integer;
Begin
  if assigned( FormMsg ) then FormMsg := Nil;
  FormMsg := TMsgForm.Create(uniApplication);
  FormMsg.Finalized := False;
  //Titulo
  FormMsg.Titulo := 'Erro - Exceçãos';
  //Mensagem
  SetLength(FormMsg.Msg,Length(Msg));
  for i:=Low(Msg) to High(Msg) do
    FormMsg.Msg[i]:=Msg[i];
  //Opções
  FormMsg.Opcoes:= ['VERIFICAR'];
  //Botao escape
  FormMsg.BotaoEscape := [bEscape];
  //Tipo Padrao
  FormMsg.TipoPadrao := mpAlerta;
  FormMsg.FormatScreen;
  FormMsg.ShowModal(CallBackValidade );
End;

procedure MensageYesNo(Msg: array of string;
                       TipoPadrao : TMsgPadrao);
Var
  i : Integer;
Begin
  //Mensagem
  if assigned( FormMsg ) then FormMsg := Nil;
  FormMsg := TMsgForm.Create(uniApplication);
  FormMsg.Titulo := 'Solicitação de Confirmação';
  SetLength(FormMsg.Msg,Length(Msg));
  for i:=Low(Msg) to High(Msg) do
    FormMsg.Msg[i]:=Msg[i];
  //Opções
  FormMsg.Opcoes := ['NÃO','SIM'];
  //Botao escape
  FormMsg.BotaoEscape := [bEscape,bNormal];
  //Tipo Padrao
//  FormMsg.TipoPadrao := mpConfirmacao;
  FormMsg.TipoPadrao := TipoPadrao;
  FormMsg.FormatScreen;
  FormMsg.ShowModal(CallBackValidade );
End;

procedure MensageWaitToProceed(Msg: array of string);
Var
  i : Integer;
Begin
  //Mensagem
  if assigned( FormMsg ) then FormMsg := Nil;
  FormMsg := TMsgForm.Create(uniApplication);
  FormMsg.Titulo := 'Processo Finalizado';
  SetLength(FormMsg.Msg,Length(Msg));
  for i:=Low(Msg) to High(Msg) do
    FormMsg.Msg[i]:=Msg[i];
  //Opções
  FormMsg.Opcoes := ['CONTINUAR'];
  //Botao escape
  FormMsg.BotaoEscape := [bNormal];
  //Tipo Padrao
  FormMsg.TipoPadrao := mpConfirmacao;
  FormMsg.TamanhoBotao := 100;
  FormMsg.FormatScreen;
End;

procedure MensageProcess(Msg: string;ValueJson:String);
Var
  i : Integer;
Begin
  //Mensagem
  if assigned( TasMsgProcess ) then FormMsg := Nil;
  TasMsgProcess := TTasMsgProcess.Create(uniApplication);
  TasMsgProcess.Caption := Msg;
  TasMsgProcess.Parametros := ValueJson;
End;

end.





































