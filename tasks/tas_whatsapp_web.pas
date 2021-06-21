unit tas_whatsapp_web;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_form, Vcl.Menus, uniMainMenu,
  Data.DB, Datasnap.DBClient, uniPageControl, uniPanel, uniGUIClasses,
  uniScrollBox, uniGUIBaseClasses, uniEdit, uniBasicGrid, uniDBGrid,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ControllerWhatsapp, MainModule,
  tas_whatsapp_talk, uniTimer, uniButton, uniBitBtn, uniSpeedButton,
  uniGUITypes, System.JSON, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope,REST.Types, uniGUIApplication;

type
  TTasWhatsappWeb = class(TBaseForm)
    pnl_contatos: TUniPanel;
    Scb_Modules: TUniScrollBox;
    Container: TUniContainerPanel;
    pc_whatsAppTalk: TUniPageControl;
    dbg_contact: TUniDBGrid;
    cds_contacts: TFDMemTable;
    cds_contactsimg_full_url: TStringField;
    ds_contacts: TDataSource;
    cds_contactsid: TStringField;
    cds_contactsname: TStringField;
    TimerList: TUniTimer;
    cds_contactsupdated_at: TDateTimeField;
    cds_contactsactive: TStringField;
    Sb_Atualizar: TUniSpeedButton;
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    AtivaroWhatsApp1: TUniMenuItem;
    Sair1: TUniMenuItem;
    procedure UniFormDestroy(Sender: TObject);
    procedure dbg_contactCellClick(Column: TUniDBGridColumn);
    procedure TimerListTimer(Sender: TObject);
    procedure Sb_AtualizarClick(Sender: TObject);
    procedure dbg_contactFieldImageURL(const Column: TUniDBGridColumn;
      const AField: TField; var OutImageURL: string);
    procedure dbg_contactDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure AtivaroWhatsApp1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ShowContactList;
    procedure AddCssDbGRid;
    procedure RemoveCssDbGRid;
    procedure NovaAba;
    function ValidateOpenAba:Boolean;
    procedure OpenSessionWhatsApp;
    procedure CloseSessionWhatsApp;
    procedure configComponents(Operacao,Recurso,ID,Param:String);
    function sendData(Data:String):Boolean;
  protected
    procedure InitVariable;override;
    procedure SetVariable;override;
    procedure setImages;override;
    procedure FormatScreen;override;
    procedure ShowData;
  public
    { Public declarations }
    WhatsApp : TControllerWhatsapp;
  end;

var
  TasWhatsappWeb: TTasWhatsappWeb;

implementation

{$R *.dfm}

uses unmessages, UnFunctions, msg_form;

procedure TTasWhatsappWeb.AddCssDbGRid;
Var
  LcCSS : String;
begin
  LcCSS := concat(
            '.x-grid .x-grid-column { ',
            '    border-style: solid; ',
            '    border-width: 1px 1px 0; ',
            '    height: 30px; ',
            '    line-height: 30px; ',
            '    padding: 0 8px; ',
            '    vertical-align: middle; ',
            '    font-size:  11pt; ',
            '    font-weight: bold; ',
            '} ',
            '.x-grid .x-grid-cell { ',
            '    height: 30px !important; ',
            '    line-height: 30px !important; ',
            '    font-size:  11pt; ',
            '} '
  );

  dbg_contact.JSInterface.JSCallGlobal(
             'Ext.util.CSS.createStyleSheet',
             [
                concat('#',dbg_contact.JSName,'_id ',
                LcCSS),
                concat(dbg_contact.JSName,'_css')
             ]);

end;

procedure TTasWhatsappWeb.FormatScreen;
begin
  inherited;
  AddCssDbGRid;
end;

procedure TTasWhatsappWeb.InitVariable;
begin
  inherited;
  WhatsApp := TControllerWhatsapp.Create(self);
end;

procedure TTasWhatsappWeb.NovaAba;
var
  LcTbs   :TUniTabSheet;
  LcPgCount : Integer;
  Form : TTasWhatsappTalk;
begin
  if ValidateOpenAba then
  Begin
    LcPgCount := pc_whatsAppTalk.PageCount;
    LcTbs := TUniTabSheet.Create(pc_whatsAppTalk);
    lcTbs.Name := concat('tbs_', cds_contactsid.AsString);
    lcTbs.Closable := True;
    LcTbs.PageControl := pc_whatsAppTalk;
    LcTbs.Caption:= concat('Cliente: ',cds_contactsname.AsString) ;
    Form := TTasWhatsappTalk.create(LcTbs);
    Form.Parent := LcTbs;
    Form.WhatsApp.HasTalk.Registro.Estabelecimento  := UMM.GInstitution.Registro.Codigo;
    Form.WhatsApp.HasTalk.Registro.ContaOrigem      := WhatsApp.Registro.Identificacao;
    Form.WhatsApp.HasTalk.Registro.ContaDestino     := cds_contactsid.AsString;
    Form.WhatsApp.HasTalk.Registro.Codigo           := 0;
    Form.search;
    Form.Show;
    pc_whatsAppTalk.ActivePage := LcTbs;
  End;
end;

procedure TTasWhatsappWeb.OpenSessionWhatsApp;
Var
  LcStrJson : String;
begin

  LcStrJson := concat('{ ',
                       ' "sessionName": "',WhatsApp.Registro.Identificacao ,'", ',
                       ' "institution": "',WhatsApp.Registro.Estabelecimento.ToString ,'" ',
                       '}'
  );
  configComponents('post','open','','');
  sendData(LcStrJSon);

end;

procedure TTasWhatsappWeb.RemoveCssDbGRid;
begin
  dbg_contact.JSInterface.JSCallGlobal(
  'Ext.util.CSS.removeStyleSheet', [ dbg_contact.JSName+'_css' ]);
end;

function TTasWhatsappWeb.sendData(Data: String): Boolean;
Var
  LcJson :TJsonVAlue;
begin
  try
    self.showMask('Aguarde Ativando o WhatsApp');
    UniSession.Synchronize();
    Try
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
  finally
    self.HideMask;
  end;
end;

procedure TTasWhatsappWeb.setImages;
begin
  inherited;

end;

procedure TTasWhatsappWeb.SetVariable;
begin
  inherited;
  RESTClient.ContentType := 'Content-Type: application/json';
  RESTRequest.Client := RESTClient;
  RESTRequest.Response := RESTResponse;
  WhatsApp.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  WhatsApp.getFirstByKey;
  WhatsApp.WhatsappWeb.UrlApi := WhatsApp.Registro.UrlApi;
  WhatsApp.WhatsappWeb.InstitutionWeb := UMM.GInstitution.Registro.Codigo.ToString;
  WhatsApp.WhatsappWeb.SenderNumber := WhatsApp.Registro.Sessao;
end;

procedure TTasWhatsappWeb.ShowContactList;
Var
  I:Integer;
begin
  with WhatsApp.HasContact do
  Begin
    Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    Registro.ContaOrigem := WhatsApp.Registro.Identificacao;
    if cds_contacts.RecordCount = 0 then
      Registro.RegistroAlterado := 0;
    getlist;
    with cds_contacts  do
    Begin
      if ( Lista.Count > 0 ) then
      Begin
        Registro.RegistroAlterado := Lista[0].RegistroAlterado;
        if not Active then CreateDataSet;
        LogChanges := False;
        if cds_contacts.RecordCount = 0 then
        Begin
          for I := 0 to Lista.Count - 1 do
          Begin
            //Guarda a data e hora para o proximo ciclo de busca
            Append;
            //Peça Geral
            FieldByName('id').AsString            := Lista[I].ContaDestino;
            FieldByName('name').AsString          := Lista[I].Nome;
            FieldByName('img_full_url').AsString  := Lista[I].ImagemUrl;
            FieldByName('updated_at').AsDateTime  := Lista[I].RegistroAlterado;
            FieldByName('active').AsString        := Lista[I].Ativo;
            Post;
          End;
        End
        else
        Begin
          for I := 0 to Lista.Count - 1 do
          Begin
            //Guarda a data e hora para o proximo ciclo de busca
            first;
            if (Locate('id', Lista[I].ContaDestino, [])) then
            Begin
              edit;
              //Peça Geral
              FieldByName('id').AsString            := Lista[I].ContaDestino;
              FieldByName('name').AsString          := Lista[I].Nome;
              FieldByName('img_full_url').AsString  := Lista[I].ImagemUrl;
              FieldByName('updated_at').AsDateTime  := Lista[I].RegistroAlterado;
              FieldByName('active').AsString        := Lista[I].Ativo;
              Post;
            End;
          End;
        End;
      cds_contacts.IndexFieldNames :=  'updated_at:D';
      cds_contacts.Refresh;
      cds_contacts.first;
      End;
    End;

  End;
end;

procedure TTasWhatsappWeb.ShowData;
begin
  ShowContactList;
end;

procedure TTasWhatsappWeb.TimerListTimer(Sender: TObject);
begin
  WhatsApp.WhatsappWeb.check;
  if not cds_contacts.Active then cds_contacts.CreateDataSet;
  cds_contacts.EmptyDataSet;
  cds_contacts.Close;
  ShowContactList;
end;

procedure TTasWhatsappWeb.UniFormDestroy(Sender: TObject);
begin
  RemoveCssDbGRid;
  inherited;
end;

procedure TTasWhatsappWeb.Sair1Click(Sender: TObject);
begin
  inherited;
  CloseSessionWhatsApp;
  Self.Close;
end;

procedure TTasWhatsappWeb.Sb_AtualizarClick(Sender: TObject);
begin
  if not cds_contacts.Active then cds_contacts.CreateDataSet;
  cds_contacts.EmptyDataSet;
  cds_contacts.Close;
  ShowContactList;

end;

function TTasWhatsappWeb.ValidateOpenAba: Boolean;
Var
  I : Integer;
begin
  Result := True;
  for I := 0 to pc_whatsAppTalk.PageCount -1 do
  Begin
    if pc_whatsAppTalk.Pages[I].Name = concat('tbs_', cds_contactsid.AsString) then
    Begin
      pc_whatsAppTalk.ActivePageIndex := I;
      Result := FAlse;
      Break;
    End;
  End;
end;

procedure TTasWhatsappWeb.AtivaroWhatsApp1Click(Sender: TObject);
begin
  OpenSessionWhatsApp;
  if (RESTResponse.Content <> '') then
  Begin
    if Pos('Sucesso',RESTResponse.Content)> 0 then
    Begin
      ShowData;
      Sb_Atualizar.Enabled := True;
      TimerList.Enabled := True;
    End
    else
    Begin
      Sb_Atualizar.Enabled := False;
      TimerList.Enabled := False;
    End;
  End;
end;

procedure TTasWhatsappWeb.CloseSessionWhatsApp;
Var
  LcStrJson : String;
begin
  LcStrJson := concat('{ ',
                       ' "sessionName": "',WhatsApp.Registro.Identificacao ,'", ',
                       ' "institution": "',WhatsApp.Registro.Estabelecimento.ToString ,'" ',
                       '}'
  );
  configComponents('post','close','','');
  sendData(LcStrJSon);

end;

procedure TTasWhatsappWeb.configComponents(Operacao, Recurso, ID,
  Param: String);
begin
  RESTClient.ResetToDefaults;
  RESTRequest.ResetToDefaults;
  RESTResponse.ResetToDefaults;

  RESTClient.ContentType := 'application/json';
  RESTClient.BaseURL := concat( WhatsApp.Registro.UrlApi,'/',Recurso);
  if Operacao = 'post' then
    RESTRequest.Method := rmPOST;
  if Operacao = 'get' then
    RESTRequest.Method := rmGET;
end;

procedure TTasWhatsappWeb.dbg_contactCellClick(Column: TUniDBGridColumn);
begin
  inherited;
  NovaAba;
  cds_contacts.Edit;
  cds_contactsactive.AsString := 'N';
  cds_contacts.Post;

  WhatsApp.HasContact.Registro.Estabelecimento  := WhatsApp.Registro.Estabelecimento;
  WhatsApp.HasContact.Registro.ContaOrigem      := WhatsApp.Registro.Identificacao;
  WhatsApp.HasContact.Registro.ContaDestino      := cds_contactsid.AsString;
  WhatsApp.HasContact.Registro.Ativo            := 'N';
  WhatsApp.HasContact.acessado;
end;

procedure TTasWhatsappWeb.dbg_contactDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
 if Odd((Sender as TUniDBGrid).DataSource.DataSet.RecNo) then
      Attribs.Color:= clWhite
    else
      Attribs.Color:= $00F1F2F3; // leve cinza
end;

procedure TTasWhatsappWeb.dbg_contactFieldImageURL(
  const Column: TUniDBGridColumn; const AField: TField;
  var OutImageURL: string);
begin
  inherited;
  if SameText(AField.FieldName, 'active') then
  begin
    if ( AField.AsString = 'S' ) then
      OutImageURL := 'files/icon_checked.jpg'
    else
      OutImageURL := 'files/icon_blank.jpg';
  end;
end;

end.
