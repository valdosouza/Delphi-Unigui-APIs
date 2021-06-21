unit tas_generate_nfe_55;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_form, uniPanel, Vcl.StdCtrls,DBXJSON,
  uniMemo, uniMultiItem,  uniGUIClasses, uniEdit, uniLabel, uniGUIBaseClasses,
  uniPageControl, fm_state, prm_to_invoice, REST.Json,System.Json,ClientProxy,
  REST.JsonReflect,DBXJSONReflect, UnFunctions, Data.DB, Datasnap.DBClient,
  uniBasicGrid, uniDBGrid, uniButton, uniBitBtn, uniSpeedButton,
  tas_generate_nfe, uniCheckBox, prm_nfe, unMessages, openReports, msg_form;



type
  TTasGenerateNfe55 = class(TTasGenerateNfe)
    L_NameCompany: TUniLabel;
    E_Motivo_Cancelamento: TUniEdit;
    procedure SB_InsertClick(Sender: TObject);
    procedure SB_authorizeClick(Sender: TObject);
    procedure SB_ConsultClick(Sender: TObject);
    procedure SB_CancelClick(Sender: TObject);
    procedure SB_PrintClick(Sender: TObject);
    procedure sb_EmailClick(Sender: TObject);
  private
    { Private declarations }
    function PrintLocal:Boolean;

    function verifyRejection:Boolean;

    procedure validateConference;
    procedure Conference;

    procedure validateAuthorizarion;
    procedure Authorizarion;

    procedure validateConsult;
    procedure Consult;

    procedure validateCancel;
    procedure Cancel;

    procedure validatePrint;
    procedure Print;

    procedure validateSendEmail;
    procedure SendEmail;

  public
    { Public declarations }
  end;

var
  TasGenerateNfe55: TTasGenerateNfe55;

implementation

{$R *.dfm}

uses Main, ControllerInvoiceReturn55, MainModule;

procedure TTasGenerateNfe55.Authorizarion;
var
  LcJSon : String;
  M : TJSONMarshal;
  jv : TJSONValue;
  p: TCProxy;
begin
  try
    ShowMask('Gerando Nf-e para Autoriza��o');
    ParamNfe.Operacao := 'Autoriza��o';
    createCallBack;
    MainForm.SQLConnect.Open;
    p := TCProxy.Create(MainForm.SQLConnect.DBXConnection);
    M := TJSONMarshal.Create(TJSONConverter.Create);
    jv := M.Marshal(ParamNfe);
    LcJSon := jv.ToString;
    self.cds_msg.EmptyDataSet;
    p.Authorization(LcJSon,callbackList);
    UniSession.Synchronize;
    if verifyRejection then PrintLocal;
    UniSession.Synchronize;
  finally
    HideMask;
    FreeAndNil(M);
    FreeAndNil(jv);
    FreeAndNil(p);
  end
end;

procedure TTasGenerateNfe55.Cancel;
var
  LcJSon : String;
  M : TJSONMarshal;
  jv : TJSONValue;
  p: TCProxy;
begin
  try
    ShowMask('Processo de Cancelamento NF-e');
    ParamNfe.Operacao := 'Cancelamento';
    ParamNfe.Motivo := E_Motivo_Cancelamento.Text;
    createCallBack;
    MainForm.SQLConnect.Open;
    p := TCProxy.Create(MainForm.SQLConnect.DBXConnection);
    M := TJSONMarshal.Create(TJSONConverter.Create);
    jv := M.Marshal(ParamNfe);
    LcJSon := jv.ToString;
    self.cds_msg.EmptyDataSet;
    UniSession.Synchronize;
    p.Cancel(LcJSon,callbackList);
    UniSession.Synchronize;
  finally
    HideMask;
    FreeAndNil(M);
    FreeAndNil(jv);
    FreeAndNil(p);
  end;
end;

procedure TTasGenerateNfe55.Conference;
var
  LcJSon : String;
  M : TJSONMarshal;
  jv : TJSONValue;
  p: TCProxy;
begin
  try
    ShowMask('Gerando Nf-e para Confer�ncia');
    ParamNfe.Operacao := 'Confer�ncia';
    createCallBack;
    MainForm.SQLConnect.Open;
    p := TCProxy.Create(MainForm.SQLConnect.DBXConnection);
    M := TJSONMarshal.Create(TJSONConverter.Create);
    jv := M.Marshal(ParamNfe);
    LcJSon := jv.ToString;
    self.cds_msg.EmptyDataSet;
    UniSession.Synchronize;
    p.PrintConference(LcJSon,callbackList);
    UniSession.Synchronize;
    if verifyRejection then PrintLocal;
    UniSession.Synchronize;
  finally
    HideMask;
    FreeAndNil(M);
    FreeAndNil(jv);
    FreeAndNil(p);
  end;
end;


procedure TTasGenerateNfe55.Consult;
var
  LcJSon : String;
  M : TJSONMarshal;
  jv : TJSONValue;
  p: TCProxy;
begin
  try
    ShowMask('Consultando Situa��o NF-e');
    UniSession.Synchronize;
    ParamNfe.Operacao := 'Consulta';
    createCallBack;
    MainForm.SQLConnect.Open;
    p := TCProxy.Create(MainForm.SQLConnect.DBXConnection);
    M := TJSONMarshal.Create(TJSONConverter.Create);
    jv := M.Marshal(ParamNfe);
    LcJSon := jv.ToString;
    self.cds_msg.EmptyDataSet;
    UniSession.Synchronize;
    p.Consult(LcJSon,callbackList);
    UniSession.Synchronize;
  finally
    HideMask;
    FreeAndNil(M);
    FreeAndNil(jv);
    FreeAndNil(p);
  end;
end;

procedure TTasGenerateNfe55.Print;
var
  LcJSon : String;
  M : TJSONMarshal;
  jv : TJSONValue;
  p: TCProxy;
begin
  try
    ShowMask('Solicitando Impress�o NF-e');
    ParamNfe.Operacao := 'Impress�o';
    createCallBack;
    MainForm.SQLConnect.Open;
    p := TCProxy.Create(MainForm.SQLConnect.DBXConnection);
    M := TJSONMarshal.Create(TJSONConverter.Create);
    jv := M.Marshal(ParamNfe);
    LcJSon := jv.ToString;
    self.cds_msg.EmptyDataSet;
    UniSession.Synchronize;
    p.Print(LcJSon,callbackList);
    UniSession.Synchronize;
    if verifyRejection then PrintLocal;
    UniSession.Synchronize;
  finally
    HideMask;
    FreeAndNil(M);
    FreeAndNil(jv);
    FreeAndNil(p);
  end;
end;

function TTasGenerateNfe55.PrintLocal: Boolean;
begin
  Result := False;
  cds_msg.First;
  while not cds_msg.Eof do
  Begin
    if cds_msg.FieldByName('id').AsString = 'Url Impress�o' then
    BEgin
      Result := True;
      break;
    End;
    cds_msg.Next;
  End;
  if Result then
  Begin
    openReportViewer('Nota Fiscal Eletr�nica - NF-e',
                      self.cds_msg.FieldByName('mensagem').AsString);
  End;
end;

procedure TTasGenerateNfe55.SB_authorizeClick(Sender: TObject);
begin
  validateAuthorizarion;
end;

procedure TTasGenerateNfe55.SB_CancelClick(Sender: TObject);
begin
  inherited;
  validatecancel;
end;

procedure TTasGenerateNfe55.SB_ConsultClick(Sender: TObject);
begin
  inherited;
  validateConsult;
end;

procedure TTasGenerateNfe55.sb_EmailClick(Sender: TObject);
begin
  inherited;
  validateSendEmail;
end;

procedure TTasGenerateNfe55.SB_InsertClick(Sender: TObject);
begin
  validateConference;
end;

procedure TTasGenerateNfe55.SB_PrintClick(Sender: TObject);
begin
  inherited;
  validatePrint;
end;

procedure TTasGenerateNfe55.SendEmail;
var
  LcJSon : String;
  M : TJSONMarshal;
  jv : TJSONValue;
  p: TCProxy;
begin
  try
    ShowMask('Solicitando envio de e-mail da NF-e');
    ParamNfe.Operacao := 'Enviando e-mail';
    createCallBack;
    MainForm.SQLConnect.Open;
    p := TCProxy.Create(MainForm.SQLConnect.DBXConnection);
    M := TJSONMarshal.Create(TJSONConverter.Create);
    jv := M.Marshal(ParamNfe);
    LcJSon := jv.ToString;
    self.cds_msg.EmptyDataSet;
    UniSession.Synchronize;
    p.SendEmail(LcJSon,callbackList);
    UniSession.Synchronize;
  finally
    HideMask;
    FreeAndNil(M);
    FreeAndNil(jv);
    FreeAndNil(p);
  end;
end;

procedure TTasGenerateNfe55.validateAuthorizarion;
var
  LcJSon : String;
  M : TJSONMarshal;
  jv : TJSONValue;
  p: TCProxy;
begin
  try
    ShowMask('Validando Nf-e para Autoriza��o');
    ParamNfe.Operacao := 'Autoriza��o';
    createCallBack;
    MainForm.SQLConnect.Open;
    p := TCProxy.Create(MainForm.SQLConnect.DBXConnection);
    M := TJSONMarshal.Create(TJSONConverter.Create);
    jv := M.Marshal(ParamNfe);
    LcJSon := jv.ToString;
    self.cds_msg.EmptyDataSet;
    p.ValidateAuthorization(LcJSon,callbackList);
    UniSession.Synchronize;
    if verifyRejection then
    Begin
      MensageWaitToProceed(['S U C E S S O !',
                    '',
                    'Valida��o completada com sucesso.',
                    '']);
      FormMsg.ShowModal(
        Procedure(Sender: TComponent; AResult:Integer)
        begin
          self.Authorizarion;
        end);
    End;
  finally
    HideMask;
    FreeAndNil(M);
    FreeAndNil(jv);
    FreeAndNil(p);
  end;
end;

procedure TTasGenerateNfe55.validateCancel;
Var
  LcReturn55 : TControllerInvoiceReturn55;
  LcJSon : String;
  M : TJSONMarshal;
  jv : TJSONValue;
  p: TCProxy;
begin
  LcReturn55 := TControllerInvoiceReturn55.Create(Self);
  LcReturn55.Registro.Estabelecimento := ParamNfe.Estabelecimento;
  LcReturn55.Registro.Codigo := ParamNfe.Ordem;
  LcReturn55.getByKey;
  if LcReturn55.exist then
  Begin
    if Trim(E_Motivo_Cancelamento.Text)= '' then
    Begin
      MensageAlert(['A T E N � � O!.',
                    '',
                    'Justificativa de cancelamento deve ser informada.',
                    'Preencha o campo para continuar']);
      exit;
    end;

    if Length(E_Motivo_Cancelamento.Text) < 15 then
    begin
      MensageAlert(['A T E N � � O!.',
                    '',
                    'Justificativa de cancelamento n�o',
                    'pode ser inferior a 15 caracteres.',
                    'Verifique e tente novamente.']);
      Exit;
    end;
  End;
  try
    ShowMask('Validando Cancelamento Nf-e');
    ParamNfe.Operacao := 'Cancelamento';
    ParamNfe.Motivo := E_Motivo_Cancelamento.Text;
    createCallBack;
    MainForm.SQLConnect.Open;
    p := TCProxy.Create(MainForm.SQLConnect.DBXConnection);
    M := TJSONMarshal.Create(TJSONConverter.Create);
    jv := M.Marshal(ParamNfe);
    LcJSon := jv.ToString;
    self.cds_msg.EmptyDataSet;
    UniSession.Synchronize;
    p.ValidateCancel(LcJSon,callbackList);
    UniSession.Synchronize;
    HideMask;
    if verifyRejection then
    Begin
      MensageYesNo(['C O N F I R M A � � O!',
                    '',
                    'Deseja realmente Cancelar este Documento?',
                    '',
                    'Confirmar a opera��o ?'],mpAlerta);
      FormMsg.ShowModal(
        Procedure(Sender: TComponent; AResult:Integer)
        begin
          if (Sender as TMsgForm).BotaoEscolhido > 0 then
          Begin
            FormMsg := Nil;
            Self.Cancel;
          End;
        end
      );
    End;
  finally
    FreeAndNil(M);
    FreeAndNil(jv);
    FreeAndNil(p);
  end;
end;

procedure TTasGenerateNfe55.validateConference;
var
  LcJSon : String;
  M : TJSONMarshal;
  jv : TJSONValue;
  p: TCProxy;
begin
  try
    ShowMask('Validando Nf-e para Confer�ncia');
    ParamNfe.Operacao := 'Confer�ncia';
    createCallBack;
    MainForm.SQLConnect.Open;
    p := TCProxy.Create(MainForm.SQLConnect.DBXConnection);
    M := TJSONMarshal.Create(TJSONConverter.Create);
    jv := M.Marshal(ParamNfe);
    LcJSon := jv.ToString;
    self.cds_msg.EmptyDataSet;
    UniSession.Synchronize;
    p.ValidateConference(LcJSon,callbackList);
    UniSession.Synchronize;
    HideMask;
    if verifyRejection then
    Begin
      MensageWaitToProceed(['S U C E S S O !',
                    '',
                    'Valida��o completada com sucesso.',
                    '']);
      FormMsg.ShowModal(
        Procedure(Sender: TComponent; AResult:Integer)
        begin
          self.Conference
        end);
    End;
  finally
    FreeAndNil(M);
    FreeAndNil(jv);
    FreeAndNil(p);
  end;
end;

procedure TTasGenerateNfe55.validateConsult;
var
  LcJSon : String;
  M : TJSONMarshal;
  jv : TJSONValue;
  p: TCProxy;
begin
  try
    ShowMask('Validando Consulta Nf-e');
    ParamNfe.Operacao := 'Comsulta';
    createCallBack;
    MainForm.SQLConnect.Open;
    p := TCProxy.Create(MainForm.SQLConnect.DBXConnection);
    M := TJSONMarshal.Create(TJSONConverter.Create);
    jv := M.Marshal(ParamNfe);
    LcJSon := jv.ToString;
    self.cds_msg.EmptyDataSet;
    UniSession.Synchronize;
    p.ValidateConsult(LcJSon,callbackList);
    UniSession.Synchronize;
    HideMask;
    if verifyRejection then
    Begin
      MensageWaitToProceed(['S U C E S S O !',
                    '',
                    'Valida��o completada com sucesso.',
                    '']);
      FormMsg.ShowModal(
        Procedure(Sender: TComponent; AResult:Integer)
        begin
          self.Consult;
        end);
    End;
  finally
    FreeAndNil(M);
    FreeAndNil(jv);
    FreeAndNil(p);
  end;
end;

procedure TTasGenerateNfe55.validatePrint;
var
  LcJSon : String;
  M : TJSONMarshal;
  jv : TJSONValue;
  p: TCProxy;
begin
  try
    ShowMask('Validando Impress�o NF-e');
    ParamNfe.Operacao := 'Impress�o';
    createCallBack;
    MainForm.SQLConnect.Open;
    p := TCProxy.Create(MainForm.SQLConnect.DBXConnection);
    M := TJSONMarshal.Create(TJSONConverter.Create);
    jv := M.Marshal(ParamNfe);
    LcJSon := jv.ToString;
    self.cds_msg.EmptyDataSet;
    UniSession.Synchronize;
    p.ValidatePrint(LcJSon,callbackList);
    UniSession.Synchronize;
    HideMask;
    if verifyRejection then
    Begin
      MensageWaitToProceed(['S U C E S S O !',
                    '',
                    'Valida��o completada com sucesso.',
                    '']);
      FormMsg.ShowModal(
        Procedure(Sender: TComponent; AResult:Integer)
        begin
          Self.Print;
        end);
    End;
  finally
    FreeAndNil(M);
    FreeAndNil(jv);
    FreeAndNil(p);
  end;
end;

procedure TTasGenerateNfe55.validateSendEmail;
var
  LcJSon : String;
  M : TJSONMarshal;
  jv : TJSONValue;
  p: TCProxy;
begin
  try
    ShowMask('Validando Envio de e-mail da Nf-e');
    ParamNfe.Operacao := 'Enviando e-mail';
    createCallBack;
    MainForm.SQLConnect.Open;
    p := TCProxy.Create(MainForm.SQLConnect.DBXConnection);
    M := TJSONMarshal.Create(TJSONConverter.Create);
    jv := M.Marshal(ParamNfe);
    LcJSon := jv.ToString;
    self.cds_msg.EmptyDataSet;
    UniSession.Synchronize;
    p.ValidateSendEmail(LcJSon,callbackList);
    UniSession.Synchronize;
    HideMask;
    if verifyRejection then
    Begin
      MensageWaitToProceed(['S U C E S S O !',
                    '',
                    'Valida��o completada com sucesso.',
                    '']);
      FormMsg.ShowModal(
        Procedure(Sender: TComponent; AResult:Integer)
        begin
          Self.SendEmail;
        end);
    End;
  finally
    FreeAndNil(M);
    FreeAndNil(jv);
    FreeAndNil(p);
  end;
end;

function TTasGenerateNfe55.verifyRejection: Boolean;
begin
  Result := True;
  cds_msg.First;
  while not cds_msg.Eof do
  Begin
    if cds_msg.FieldByName('id').AsString = 'Rejei��o' then
    BEgin
      Result := False;
      MensageAlert(['A T E N � � O!.',
                    '',
                    'N�o foi possivel prosseguir.',
                    'Verifique a rejei��o encontrada.']);
      break;
    End;
    cds_msg.Next;
  End;
end;

end.
