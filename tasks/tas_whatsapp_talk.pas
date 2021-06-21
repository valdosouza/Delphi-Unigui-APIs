unit tas_whatsapp_talk;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniGUIClasses, uniEdit,
  uniLabel, uniImage, uniGUIBaseClasses, uniPanel, uniBasicGrid, uniDBGrid,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, ControllerWhatsapp,
  uniHTMLFrame, uniButton, uniBitBtn, uniSpeedButton, uniMemo, uniHTMLMemo,
  REST.Client, REST.Types, IPPeerClient, Data.Bind.Components,
  Data.Bind.ObjectScope, uniTimer, System.JSON;

type
  TTasWhatsappTalk = class(TFmBaseFrame)
    UniPanel2: TUniPanel;
    E_Message: TUniEdit;
    html_chat: TUniHTMLFrame;
    UniPanel1: TUniPanel;
    pnl_Comandos: TUniPanel;
    Sb_Boa_Noite: TUniSpeedButton;
    UniSpeedButton2: TUniSpeedButton;
    UniSpeedButton3: TUniSpeedButton;
    sb_sendMessage: TUniSpeedButton;
    UniSpeedButton5: TUniSpeedButton;
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    Tm_talk: TUniTimer;
    UniSpeedButton1: TUniSpeedButton;
    procedure UniSpeedButton2Click(Sender: TObject);
    procedure UniSpeedButton3Click(Sender: TObject);
    procedure Sb_Boa_NoiteClick(Sender: TObject);
    procedure UniSpeedButton5Click(Sender: TObject);
    procedure sb_sendMessageClick(Sender: TObject);
    procedure html_chatUpdateHtml(Sender: TObject);
    procedure Tm_talkTimer(Sender: TObject);
    procedure E_MessageKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UniSpeedButton1Click(Sender: TObject);
  private
    { Private declarations }

    procedure EnviaMensagem(Msg:String);


    procedure SendMessage(MessageText:String);
    procedure ReceiveMessage(MessageText:String);
    procedure configComponents(Operacao,Recurso,ID,Param:String);
    function sendData(Data:String):Boolean;
  protected

    procedure setVariable;override;
    procedure setImages;override;
    procedure InitVariable;override;
    procedure FormatScreen;override;
    Procedure geralog(acesso : string);
  public
    { Public declarations }
    WhatsApp : TControllerWhatsapp;
    procedure search;
    procedure OpenSessionWhatsApp;
  end;

var
  TasWhatsappTalk: TTasWhatsappTalk;

implementation

{$R *.dfm}

uses MainModule;

{ TTasWhatsappTalk }

procedure TTasWhatsappTalk.configComponents(Operacao, Recurso, ID,
  Param: String);
Var
  LcContentType: TRESTContentType;
begin
  Try
    RESTClient.ResetToDefaults;
    RESTRequest.ResetToDefaults;
    RESTResponse.ResetToDefaults;

    RESTClient.ContentType := 'application/json';
    RESTClient.BaseURL := concat( WhatsApp.Registro.UrlApi,'/',Recurso);
    if Operacao = 'post' then
      RESTRequest.Method := rmPOST;
    if Operacao = 'get' then
      RESTRequest.Method := rmGET;
  Finally

  End;
end;

procedure TTasWhatsappTalk.EnviaMensagem(Msg: String);
Var
  LcStrJson : String;
  LcMessage : String;
begin
  Try
    LcMessage := Msg;
    if (Length(Trim(LcMessage))>0) then
    Begin
      LcStrJson := concat('{ ',
                           ' "sessionName": "',WhatsApp.HasTalk.Registro.ContaOrigem ,'", ',
                           ' "number": "',WhatsApp.HasTalk.Registro.ContaDestino ,'", ',
                           ' "institution": "',WhatsApp.HasTalk.Registro.Estabelecimento.ToString ,'", ',
                           ' "text":"', LcMessage ,'" ',
                           '}'
      );
      configComponents('post','sendText','','');
      sendData(LcStrJSon);
      search;
    End;
  Except
    OpenSessionWhatsApp;
  End;
end;

procedure TTasWhatsappTalk.E_MessageKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then
  Begin
    sb_sendMessageClick(Self);

  End;
end;

procedure TTasWhatsappTalk.FormatScreen;
begin

end;

procedure TTasWhatsappTalk.geralog(acesso: string);
begin

end;

procedure TTasWhatsappTalk.html_chatUpdateHtml(Sender: TObject);
begin
  inherited;
 (Sender as TUniHTMLFrame).JSInterface.JSCode(#1'.body.dom.scrollTo(0, '#1'.body.dom.scrollHeight);');
end;

procedure TTasWhatsappTalk.InitVariable;
begin
  inherited;
  WhatsApp := TControllerWhatsapp.Create(self);

end;

procedure TTasWhatsappTalk.OpenSessionWhatsApp;
Var
  LcStrJson : String;
begin
  LcStrJson := concat('{ ',
                       ' "sessionName": "', WhatsApp.HasTalk.Registro.ContaOrigem ,'", ',
                       ' "institution": "', WhatsApp.HasTalk.Registro.Estabelecimento.ToString ,'" ',
                       '}'
  );
  configComponents('post','open','','');
  sendData(LcStrJSon);
end;

procedure TTasWhatsappTalk.ReceiveMessage(MessageText: String);
begin
  html_chat.HTML.Add(Concat('<p class="from-them">',MessageText, '</p>'));
end;

procedure TTasWhatsappTalk.search;
Var
  I:Integer;
begin
  Try
    Tm_talk.Enabled := False;
    with WhatsApp.HasTalk do
    Begin
      //pega o codigo da ultima conversa
      WhatsApp.HasTalk.Registro.Codigo := html_chat.Tag;
      getlist;
      //EmptyDataSet; vou tentar incluir novas mensagem sem que que limpar e carregar tudo
      for I := 0 to Lista.Count - 1 do
      Begin
        IF (Lista[I].Sentido = 'in') then
          ReceiveMessage(Lista[I].Mensagem)
        else
          SendMessage(Lista[I].Mensagem);
        html_chat.Tag := Lista[I].Codigo;
      End;
    End;
  Finally
    Tm_talk.Enabled := True;
  End;
end;

function TTasWhatsappTalk.sendData(Data: String): Boolean;
Var
  LcJson :TJsonVAlue;
begin
  Try
    Try
      Self.showMask('Aguarde Enviando Mensagem');
      UniSession.Synchronize();
      Tm_talk.Enabled := False;
      RESTResponse.RootElement := '';
      RESTRequest.ResetToDefaults;
      RESTRequest.Params.Clear;
      RESTRequest.Method := rmPOST;
      LcJson:= TJSonObject.ParseJSONValue(Data);
      RESTRequest.Body.ClearBody;
      RESTRequest.Body.Add(LcJson.ToJSON, TRESTContentType.ctAPPLICATION_JSON);
      RESTRequest.Execute;
      Result := True;
    except
      on E : Exception do
      Begin
        Result := False;
      End;
    End;
  Finally
    Tm_talk.Enabled := True;
    RESTRequest.ResetToDefaults;
    self.HideMask;
  End;
end;

procedure TTasWhatsappTalk.SendMessage(MessageText: String);
var
  HTMLJSName: string;
begin

  HTMLJSName := html_chat.JSName;
  html_chat.HTML.Add(Concat('<p class="from-me">',MessageText, '</p>'));
  UniSession.AddJS('setTimeout(function(){' + HTMLJSName + '.iframeEl.dom.contentWindow.scrollTo(0, ' +
                    HTMLJSName + '.iframeEl.dom.contentWindow.document.body.scrollHeight)}, 50)');
end;

procedure TTasWhatsappTalk.setImages;
begin

end;

procedure TTasWhatsappTalk.setVariable;
begin
  //Configura
  RESTClient.ContentType := 'Content-Type: application/json';
  RESTRequest.Client := RESTClient;
  RESTRequest.Response := RESTResponse;
  WhatsApp.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  WhatsApp.getFirstByKey;

end;

procedure TTasWhatsappTalk.Sb_Boa_NoiteClick(Sender: TObject);
begin
  EnviaMensagem(TUniSpeedButton(Sender).Caption);
end;

procedure TTasWhatsappTalk.UniSpeedButton1Click(Sender: TObject);
Var
  LcInst:String;
  LcPhone : String;
  LcStrJson : String;
  LcMessage : String;
begin
  LcInst := WhatsApp.HasTalk.Registro.Estabelecimento.ToString;
  LcPhone := WhatsApp.HasTalk.Registro.ContaDestino;

  LcMessage := concat('https://www.delivery.setes.com.br/#/institution=',LcInst,'/phone=',LcPhone);
  EnviaMensagem(LcMessage);
end;

procedure TTasWhatsappTalk.UniSpeedButton2Click(Sender: TObject);
begin
  EnviaMensagem(TUniSpeedButton(Sender).Caption);
end;

procedure TTasWhatsappTalk.UniSpeedButton3Click(Sender: TObject);
begin
  EnviaMensagem(TUniSpeedButton(Sender).Caption);
end;

procedure TTasWhatsappTalk.sb_sendMessageClick(Sender: TObject);
begin
  EnviaMensagem(E_Message.Text);
  E_Message.Clear;
end;

procedure TTasWhatsappTalk.UniSpeedButton5Click(Sender: TObject);
Var
  LcInst:String;
  LcPhone : String;
  LcStrJson : String;
  LcMessage : String;
begin
  LcInst := WhatsApp.HasTalk.Registro.Estabelecimento.ToString;
  LcPhone := WhatsApp.HasTalk.Registro.ContaDestino;

  case WhatsApp.HasTalk.Registro.Estabelecimento of
    6820:Begin
          LcMessage := concat('Olá, bem-vindo ao atendimento online da Spice :)   ',
                              'Este canal é exclusivo para agilizar o seu pedido de forma automática. ',
                              'Por favor clique no link abaixo para efetuá-lo. ',
                              'https://www.delivery.setes.com.br/#/institution=',LcInst,'/phone=',LcPhone);
          End;
    16350:Begin
          LcMessage := concat('Olá, bem-vindo ao atendimento online da Nôno Guerino.   ',
                              'Este canal é exclusivo para agilizar o seu pedido de forma automática. ',
                              'Por favor clique no link abaixo para efetuá-lo. ',
                              'https://www.delivery.setes.com.br/#/institution=',LcInst,'/phone=',LcPhone);
          End;
    else
      Begin
          LcMessage := concat('Olá, bem-vindo ao nosso atendimento online :)   ',
                              'Este canal é exclusivo para agilizar o seu pedido de forma automática. ',
                              'Por favor clique no link abaixo para efetuá-lo. ',
                              'https://www.delivery.setes.com.br/#/institution=',LcInst,'/phone=',LcPhone);
          End;

  end;
  EnviaMensagem(LcMessage);
end;

procedure TTasWhatsappTalk.Tm_talkTimer(Sender: TObject);
begin
  inherited;
  search;
end;

end.
