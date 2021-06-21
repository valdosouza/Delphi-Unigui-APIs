unit base_form;

interface

uses
  Classes, System.Variants,  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Buttons, Vcl.Menus, Winapi.Windows, Winapi.Messages, System.SysUtils,
  Data.DB, Datasnap.DBClient, UnFunctions,REST.Json,System.Json,REST.JsonReflect,
  DBXJSONReflect, Data.DBXJSON, prm_simple,
  ControllerInstitution,ControllerLogOperation,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, uniGUIBaseClasses,
  uniSpeedButton, uniGUIApplication,  UniDBGrid, uniPanel, uniButton, uniBitBtn, Main,
  uniScrollBox, uniMainMenu, uniLabel, UniEdit, UniCheckBox, UniComboBox,
  UniDBLookupComboBox, UniRadioGroup, UniDateTimePicker, UniTreeView,
  UniMemo, uniImageList,ControllerConfig ;


type
  TSortByFieldOption = (ForceAscending, ForceDescending);
  TSortByFieldOptions = set of TSortByFieldOption;
  TDSCallbackMethod = reference to function(const Args: TJSONValue): TJSONValue;

  TBaseForm = class(TUniForm)
    cds_msg: TClientDataSet;
    cds_msgid: TStringField;
    cds_msgmensagem: TStringField;
    ds_msg: TDataSource;
    MenuTask: TUniMainMenu;
    MnuTarefas: TUniMenuItem;


    procedure UniFormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure UniFormCancel(Sender: TObject);

  private

  protected
    PInterface : Integer;
    PInsert,PUpdate,PDelete:Boolean;
    Config : TControllerConfig;
    LogOperation : TControllerLogOperation;
    AcessoOnline, pathImage : String;
    Ffinished : Boolean;
    FResult : Boolean;
    procedure SortClientDataSetByField(cds : TClientDataSet; FieldName : String;Direction: Boolean );
    procedure buttonIcon(button:TUniSpeedButton;name:String);
    procedure ClearFields(T: TComponent);Virtual;
    procedure createHintMemo;
    procedure FormatDbGrid;
    procedure MessageDenyREsource;
    procedure InitVariable;Virtual;
    procedure SetVariable;Virtual;
    procedure setImages;Virtual;
    procedure FormatScreen;Virtual;
    procedure setPrivilege;Virtual;
    procedure execShorCutKeyF1;Virtual;
    procedure execShorCutKeyF2;Virtual;
    procedure execShorCutKeyF3;Virtual;
    procedure execShorCutKeyF4;Virtual;
    procedure execShorCutKeyF5;Virtual;
    procedure execShorCutKeyF6;Virtual;
    procedure execShorCutKeyF7;Virtual;
    procedure execShorCutKeyF8;Virtual;
    procedure execShorCutKeyF9;Virtual;
    procedure execShorCutKeyF10;Virtual;
    procedure execShorCutKeyF11;Virtual;
    procedure execShorCutKeyF12;Virtual;

    procedure setFocus(NameComponent:String);
    Procedure geralogDev(acesso : string);
    procedure GeraLogOperation(Oper,Descrip:String);
    function validateGetView(cds:TClientDataset):Boolean;Virtual;
    function Configuracao(Tipo: char; CAmpo: string; Conteudo: string): string;

    procedure createCallCertificate(Cert_Valid,Cert_Expir:TUniPanel);
    procedure getValidityCertificate(Cert_Valid,Cert_Expir:TUniPanel);
    procedure createCallBack;
  type
    TMessageCallback = class(TDBXCallback)
    private
      FCallBackMethod: TDSCallbackMethod;
    public
      constructor Create(CallBackMethod: TDSCallbackMethod);
      function Execute(const Arg: TJSONValue): TJSONValue; override;
    end;

  public
    { Public declarations }
    //Controle do Estabelecimento
    InstitutionID : Integer;
    //Controlar a ativação da edição da tela
    CodigoRegistro : Variant;
    //Descrição relativa ao codigo ativado
    DescricaoRegistro : String;
    callbackList: TMessageCallback;
    callbackCertificate: TMessageCallback;

  end;

implementation


{$R *.dfm}


uses
   msg_form
  ,unMessages
  ,UnitConstantes
  ,ClientProxy
  ,MainModule
  ,ClasseUtil
  ,GenericDAO;
{ TTasMsgProcess.TChatCallback }

constructor TBaseForm.TMessageCallback.Create(CallBackMethod: TDSCallbackMethod);
begin
  FCallBackMethod := CallBackMethod;
end;

function TBaseForm.TMessageCallback.Execute(const Arg: TJSONValue): TJSONValue;
begin
  Result := FCallbackMethod(Arg);
end;

procedure TBaseForm.geralogDev(acesso: string);
var
  Arq : TextFile;
  Data : String;
  LcArq : String;
begin
  Data := DateToStr(Now);
  Data := StringReplace(Data,'/','-',[rfReplaceAll]);
  LcArq := Concat(ExtractFilePath(ParamStr(0)),'log\',Data ,'.log');
  AssignFile(Arq, LcArq );
  if not FileExists( LcArq ) then
    Rewrite(arq, LcArq)
  else
    Append(arq);
  Writeln(Arq, concat(DateTimeToStr(Now),' - BaseForm -  ', acesso));
  Writeln(Arq, '');
  CloseFile(Arq);


end;

procedure TBaseForm.GeraLogOperation(Oper, Descrip: String);
begin
  Try
    LogOperation.clear;
    with LogOperation.Registro do
    Begin
      Codigo := 0;
      Estabelecimento := Umm.GInstitution.Registro.Codigo;
      Usuario         := umm.GInstitution.User.Registro.Codigo;
      DataAlteracao   := Now;
      Tela            := Copy(Self.Caption,1,100);
      Operacao        := Copy(Oper,1,100);
      Descricao       := Copy(Descrip,1,255);
    End;
    LogOperation.insert;
  Except

  End;
end;

procedure TBaseForm.getValidityCertificate(Cert_Valid,Cert_Expir:TUniPanel);
Var
  LcJSon : String;
  LcParamSimple :TPrmSimple;
  M : TJSONMarshal;
  jv : TJSONValue;
  p: TCProxy;
Begin
  try
    createCallCertificate(Cert_Valid,Cert_Expir);
    LcParamSimple := TPrmSimple.Create;
    LcParamSimple.Referencia := 'Emitente';
    LcParamSimple.Resultado := IntToStr( UMM.GInstitution.registro.Codigo);
    MainForm.SQLConnect.Open;
    p := TCProxy.Create(MainForm.SQLConnect.DBXConnection);
    M := TJSONMarshal.Create(TJSONConverter.Create);
    jv := M.Marshal(LcParamSimple);
    LcJSon := jv.ToString;
    p.getValidityCertificate(LcJSon,callbackCertificate);
  finally
    FreeAndNil(LcParamSimple);
    FreeAndNil(M);
    FreeAndNil(jv);
    FreeAndNil(p);
  end;
End;

{ TBaseForm }

procedure TBaseForm.createCallBack;
begin
  if not cds_msg.Active then cds_msg.CreateDataSet;

  callbackList := TMessageCallback.Create( function(const Args: TJSONValue) : TJSONValue
  var
    LJSONObject: TJSONObject; I: Integer;
    LMessage: string;
  begin
    // Extract information about the transformation from Json
    LJSONObject := TJSONObject(Args);

    for I := 0 to LJSONObject.Size - 1 do
    begin
      with LJSONObject.Get(I) do
      Begin
        cds_msg.Append;
        cds_msg.FieldByName('id').AsString := JSonString.Value;
        cds_msg.FieldByName('mensagem').AsString := JsonValue.Value;
        cds_msg.Post;
        Result := TJSONTrue.Create;
      End;
    end;
  end);

end;

procedure TBaseForm.createCallCertificate(Cert_Valid,Cert_Expir:TUniPanel);
Var
  Lc_Date: TDate;
  Lc_Str_Date: String;
  Lc_Days_For: Integer;
begin
  callbackCertificate := TMessageCallback.Create( function(const Args: TJSONValue) : TJSONValue
  var
    LJSONObject: TJSONObject;
    unM:TJSONUnMarshal;
    LcParSimple :TPrmSimple;
    jv: TJSONValue;

      procedure errocertificado;
      BEgin
        // VAlidade
          Cert_Valid.Color := clBtnFace;
          Cert_Valid.Font.Color := clred;
          Cert_Valid.Caption := 'Não instalado/associado ao sistema';
          // Expira
          Cert_Expir.Color := clBtnFace;
          Cert_Expir.Font.Color := clGreen;
          Cert_Expir.Caption := 'Verifique!!!';
      End;
  begin
    LJSONObject := TJSONObject.create;
    LJSONObject := TJSONObject(Args);
    jv := LJSONObject.Get(0).JsonValue;
    jv := TJSONObject.ParseJSONValue(
                          JsonMinify( jv.ToString )
                    );
    if assigned(jv) then
    Begin
      unM:=TJSONUnMarshal.Create;
      LcParSimple := TPrmSimple(unm.Unmarshal(jv));
      IF (Trim(LcParSimple.Resultado) <> '') then
      Begin
        Try
          Lc_Date := StrToDateDef(LcParSimple.Resultado,Date);
          Lc_Str_Date := DateToStr(Lc_Date);
          Lc_Days_For := Round(Lc_Date - Date);
          if (Lc_Days_For <= 30) then
          Begin
            Cert_Valid.Color := clred;
            Cert_Valid.Font.Color := clBlack;
            Cert_Expir.Font.Color := clred;
          End
          else
          BEgin
            Cert_Valid.Color := clBtnFace;
            Cert_Expir.Font.Color := clGreen;
          End;
          Cert_Valid.Caption := ' Validade do Certificado: ' + Lc_Str_Date;
          Cert_Expir.Caption := 'O Certificado expira em ' +
            IntToStr(Lc_Days_For) + ' dia(s)';
        Except
          errocertificado;
        End;
      End
      else
      Begin
        errocertificado;
      End;
    End;
    Result := TJSONTrue.Create;
  end);
end;


procedure TBaseForm.buttonIcon(button: TUniSpeedButton; name: String);
var
  PathArq : string;
begin
  PathArq := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios','Publico');
  PathArq   := concat(PathArq, 'images/btn/',name);
  try
    if FileExists(PathArq) then
      button.Glyph.LoadFromFile(PathArq);
  except
    on E: Exception do
      geralogDev(e.Message)
  end;
end;

procedure TBaseForm.ClearFields(T: TComponent);
Var
  I,J:Integer;
begin
  with T do Begin
    for I := 0 to ((ComponentCount)-1) do
    begin
      if (Components[I].ClassName = 'TUniEdit') then
        TUniEdit (Components[I]).Clear;

      if (Components[I].ClassName = 'TUniFormattedNumberEdit') then
        TUniFormattedNumberEdit(Components[I]).value := 0;

      if (Components[I].ClassName = 'TUniMemo') then
        TUniMemo (Components[I]).Clear;

      if (Components[I].ClassName = 'TUniCheckBox') then
      Begin
        if ( TUniCheckBox (Components[I]).name = 'chbx_cad_active' ) then
          TUniCheckBox (Components[I]).Checked := true
        else
        if ( TUniCheckBox (Components[I]).name = 'ChBx_Periodo' ) then
          TUniCheckBox (Components[I]).Checked := true
        else
          TUniCheckBox (Components[I]).Checked := False;
      End;

      if (Components[I].ClassName = 'TUniComboBox') then
        TUniComboBox (Components[I]).ItemIndex := 0;

      if (Components[I].ClassName = 'TUniDBLookupComboBox') then
        TUniDBLookupComboBox(Components[I]).KeyValue := Null;

      if (Components[I].ClassName = 'TUniRadioGroup') then
        TUniRadioGroup (Components[I]).ItemIndex := 0;

      if (Components[I].ClassName = 'TUniDateTimePicker') then
        TUniDateTimePicker (Components[I]).DateTime := Now;

      if (Components[I].ClassName = 'TUniTreeView') then
        TUniTreeView (Components[I]).Items.Clear;

       // Desativado em 18/08/17 fechando dbgrid ao inserir na Compossição
      //if (Components[I].ClassName = 'TUniDBGrid') then
        //TUniDBGrid (Components[I]).DataSource.DataSet.Close;
    end;
  End;

end;

function TBaseForm.Configuracao(Tipo: char; CAmpo, Conteudo: string): string;
begin
  Config.clear;
  Config.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  Config.Registro.Campo     := Campo;
  Config.Registro.Usuario   := 0;
  Config.Registro.Conteudo  := Conteudo;
  if Tipo = 'G' then
  Begin
    Config.save;
  End
  else
  Begin
    Config.getByKey;
    if not Config.exist then
      Config.save;
  End;
  Result := Config.Registro.Conteudo
end;

procedure TBaseForm.createHintMemo;
Var
  I,J:Integer;
begin
  for I := 0 to ((ComponentCount)-1) do
  begin
    if (Components[I].ClassName = 'TUniMemo') then
    Begin
      TUniMemo(Components[I]).ClientEvents.ExtEvents.Add(
            'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10'  sender.tip' +
            ' = Ext.create('#39'Ext.tip.ToolTip'#39', {'#13#10'        target: sender.el,'#13#10 +
            '        html: '#39'<span class="hintClass">Para acrescentar uma linha tecle (shift+Enter)</span>'#39#13#10'    });' +
            #13#10'}')
    End;
  end;
end;

procedure TBaseForm.FormatDbGrid;
Var
  I,J:Integer;
begin
  for I := 0 to ((ComponentCount)-1) do
  begin
    if (Components[I].ClassName = 'TUniDBGrid') then
    Begin
      TUniDBGrid(Components[I]).LoadMask.Message := 'Carregando dados';
    End;
  end;

end;

procedure TBaseForm.FormatScreen;
begin
  BorderIcons := [biSystemMenu,biMaximize];
end;

procedure TBaseForm.InitVariable;
begin
  //GInterface - Deve ser setado em cada tela para depouis herdar daqui em diante
  UMM.GInstitution.User.Parametro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  UMM.GInstitution.User.Parametro.Usuario  := UMM.GInstitution.User.Registro.Codigo;
  UMM.GInstitution.User.Parametro.TelaInterface   := PInterface;
  if not UMM.GInstitution.User.getPrivilege('VISUALIZAR') then
  Begin
    MessageDenyREsource;
    self.Close;
  End;
  setPrivilege;
  Config := TControllerConfig.create(Self);
  LogOperation := TControllerLogOperation.create(Self);
  BringToFront;
  createHintMemo;
  FormatDbGrid;
  ClearFields(self);
end;

procedure TBaseForm.MessageDenyREsource;
begin
  MensageAlert(['A T E N Ç Ã O!.',
                '',
                'Você não está liberado para acessar este Recurso.',
                'Verifique e tente novamente']);
end;

procedure TBaseForm.setFocus(NameComponent:String);
begin
  UniSession.AddJS(concat('setTimeout(function(){', NameComponent ,'.focus()}, 100)'));
end;

procedure TBaseForm.setImages;
begin
  //
end;

procedure TBaseForm.setPrivilege;
begin
  {
  GInsert := UMM.GInstitution.User.getPrivilege('INSERIR');
  FUpdate,
  GDelete,
  GView:Boolean;
  }
end;

procedure TBaseForm.SetVariable;
begin
  //
end;

procedure TBaseForm.SortClientDataSetByField(cds: TClientDataSet;
  FieldName: String; Direction: Boolean);
const
  IndexName = 'GridSort';

var
  i: integer;
  index: TIndexDef;
  OldOrder: string;
  IndexOptions : TIndexOptions;
  Options: TSortByFieldOptions;
begin
  cds.DisableControls;
  try
    i := cds.IndexDefs.IndexOf(IndexName);
    if i <> - 1  then
    begin
      index := cds.IndexDefs.Find(IndexName);
      OldOrder := index.Fields;
      try
        cds.DeleteIndex(IndexName);
      except;
        OutputDebugString('no index?');
        //there seem to be conditions where the index does not exist but
      end;
      index.Free; //delete index for some reason does not free the index
      indexOptions := index.Options;
    end else
      IndexOptions := [ixDescending];

    index := cds.IndexDefs.AddIndexDef;
    index.Name := IndexName;
    index.Fields := FieldName;
    if Direction then
      Options :=  [ForceAscending]
    else
      Options := [ForceDescending];

    if ForceAscending in Options then
      index.Options := []
    else if ForceDescending in Options then
      index.Options := [ixDescending]
    else if OldOrder = FieldName  then
    begin
      if (IndexOptions = [ixDescending]) then
        index.Options := []
      else
        index.Options := [ixDescending];
    end;
    cds.IndexName := IndexName;
  finally
    cds.EnableControls;
  end;

end;

procedure TBaseForm.UniFormCancel(Sender: TObject);
begin
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Todas as modificações serão descartadas.',
                'Você tem certeza que deseja sair?'],mpConfirmacao);
  FormMsg.ShowModal(
  Procedure(Sender: TComponent; AResult:Integer)
  begin
    if (Sender as TMsgForm).BotaoEscolhido > 0 then
    Begin
      Self.Close;
    End;
  end
  );
end;

procedure TBaseForm.UniFormCreate(Sender: TObject);
begin
  InitVariable;
end;

procedure TBaseForm.UniFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    88 : // 'x'
      if ssAlt in Shift then
        Close;
  end;
end;

procedure TBaseForm.UniFormShow(Sender: TObject);
begin
  setImages;
  FormatScreen;
  SetVariable;
end;


function TBaseForm.validateGetView(cds: TClientDataset): Boolean;
begin
  Result := True;
  if not cds.Active then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Nenhuma busca foi efetuada.',
                  'Clique em buscar e tente novamente']);
    Result := False;
    exit;
  end;

  if cds.RecordCount = 0 then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há registros para visualizar.',
                  'Verifique e tente novamente']);
    Result := False;
    exit;
  end;

end;

procedure TBaseForm.execShorCutKeyF1;
begin
  //implementada nas  descendencias
end;

procedure TBaseForm.execShorCutKeyF10;
Begin
  //implementada nas  descendencias
end;

procedure TBaseForm.execShorCutKeyF11;
begin
  //implementada nas  descendencias
end;

procedure TBaseForm.execShorCutKeyF12;
begin
  //implementada nas  descendencias
end;

procedure TBaseForm.execShorCutKeyF2;
begin
  //implementada nas  descendencias
end;

procedure TBaseForm.execShorCutKeyF3;
begin
  //implementada nas  descendencias
end;

procedure TBaseForm.execShorCutKeyF4;
begin
  //implementada nas  descendencias
end;

procedure TBaseForm.execShorCutKeyF5;
begin
  //implementada nas  descendencias
end;

procedure TBaseForm.execShorCutKeyF6;
begin
  //implementada nas  descendencias
end;

procedure TBaseForm.execShorCutKeyF7;
begin
  //implementada nas  descendencias
end;

procedure TBaseForm.execShorCutKeyF8;
begin
  //implementada nas  descendencias
end;

procedure TBaseForm.execShorCutKeyF9;
begin
  //implementada nas  descendencias
end;

end.
