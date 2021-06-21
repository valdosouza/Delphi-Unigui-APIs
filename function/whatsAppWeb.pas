unit whatsAppWeb;

interface

uses System.Classes,REST.Client, REST.Types, Jsons, System.JSON,System.Math,
  System.SysUtils;


type

  TWhatsAppWeb = class(TComponent)
  private

    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    FNumeroReceive: String;
    FUrlApi: String;
    FSenderNumber: String;
    FInstitutionWeb: String;

    procedure ReceiveMessage(MessageText:String);
    procedure configComponents(Operacao,Recurso,ID,Param:String);
    function sendData(Data:String):Boolean;
    procedure setFNumeroReceive(const Value: String);
    procedure setFUrlApi(const Value: String);
    procedure setFInstitutionWeb(const Value: String);
    procedure setFSenderNumber(const Value: String);

  public

    MessageText : STring;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function  Open:Boolean;
    function  check:Boolean;
    procedure SendMessage;
    property InstitutionWeb : String read FInstitutionWeb write setFInstitutionWeb;
    property SenderNumber : String read FSenderNumber write setFSenderNumber;
    property ReceiverNumber : String read FNumeroReceive write setFNumeroReceive;
    property UrlApi : String read FUrlApi write setFUrlApi;
  end;

implementation

{ TWhatsAppWeb }



function TWhatsAppWeb.check: Boolean;
Var
  LcStrJson : String;
  LcMessage : String;
begin
  LcStrJson := concat('{ ',
                       ' "sessionName": "',FSenderNumber ,'", ',
                       ' "institution": "',FInstitutionWeb ,'" ',
                       '}'
  );
  configComponents('post','check','','');
  sendData(LcStrJSon);
  result := (Pos('true',RESTResponse.Content)>0);
end;

procedure TWhatsAppWeb.configComponents(Operacao, Recurso, ID, Param: String);
begin
  Try
    RESTClient.ResetToDefaults;
    RESTRequest.ResetToDefaults;
    RESTResponse.ResetToDefaults;
    RESTClient.ContentType := 'application/json';
    RESTClient.BaseURL := concat(FUrlApi,'/',Recurso);
    if Operacao = 'post' then
      RESTRequest.Method := rmPOST;
    if Operacao = 'get' then
      RESTRequest.Method := rmGET;
  Finally

  End;

end;

constructor TWhatsAppWeb.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  RESTClient    := TRESTClient.Create(FUrlApi);
  RESTRequest   := TRESTRequest.Create(Self);
  RESTResponse  := TRESTResponse.Create(Self);
  //Configura
  RESTClient.ContentType := 'Content-Type: application/json';
  RESTRequest.Client := RESTClient;
  RESTRequest.Response := RESTResponse;

end;

destructor TWhatsAppWeb.Destroy;
begin

  inherited;
end;


function TWhatsAppWeb.Open:Boolean;
Var
  LcStrJson : String;
  LcMessage : String;
begin
  LcStrJson := concat('{ ',
                       ' "sessionName": "',FSenderNumber ,'", ',
                       ' "institution": "',FInstitutionWeb ,'" ',
                       '}'
  );
  configComponents('post','open','','');
  sendData(LcStrJSon);
  result := (Pos('Sucesso',RESTResponse.Content)>0);
end;

procedure TWhatsAppWeb.ReceiveMessage(MessageText: String);
begin

end;

function TWhatsAppWeb.sendData(Data: String): Boolean;
Var
  LcJson :TJsonVAlue;
  LcContentType: TRESTContentType;
begin
  LcContentType := TRESTContentType.ctAPPLICATION_JSON;
  RESTResponse.RootElement := '';
  RESTRequest.ResetToDefaults;
  RESTRequest.Params.Clear;
  RESTRequest.Method := rmPOST;
  LcJson:= TJSonObject.ParseJSONValue(Data);
  RESTRequest.Body.ClearBody;
  RESTRequest.Body.Add(LcJson.ToJSON, LcContentType);
  RESTRequest.Execute;
  Result := True;
end;

procedure TWhatsAppWeb.SendMessage;
Var
  LcStrJson : String;
begin
  if (Length(Trim(MessageText))>0) then
  Begin
    LcStrJson := concat('{ ',
                         ' "sessionName": "',FSenderNumber ,'", ',
                         ' "number": "',FNumeroReceive ,'", ',
                         ' "institution": "',FInstitutionWeb ,'", ',
                         ' "text":"', MessageText ,'" ',
                         '}'
    );
    configComponents('post','sendText','','');
    sendData(LcStrJSon);
  End;
end;




procedure TWhatsAppWeb.setFInstitutionWeb(const Value: String);
begin
  FInstitutionWeb := Value;
end;

procedure TWhatsAppWeb.setFNumeroReceive(const Value: String);
begin
   case Length(Value) of
    8:Begin //'9911-2072'
        FNumeroReceive := concat('55419',Value);
      End;
    9:Begin //'9-9911-2072'
        FNumeroReceive := concat('5541',Value);
      End;
    10:Begin //41-9911-2072
        FNumeroReceive := concat('55',Value);
      End;
    11:Begin //'41-9-9911-2072'
        FNumeroReceive := concat('55',Value);
      End;
    else
    Begin
      FNumeroReceive := Value;
    End;
  end;
end;

procedure TWhatsAppWeb.setFSenderNumber(const Value: String);
begin
  FSenderNumber := Value;
end;

procedure TWhatsAppWeb.setFUrlApi(const Value: String);
begin
  FUrlApi := Value;
end;

end.
