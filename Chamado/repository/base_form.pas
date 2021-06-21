unit base_form;

interface

uses
  Classes, Vcl.Menus, uniMainMenu, Data.DB, Datasnap.DBClient, System.JSON,
  uniGUIForm, uniPanel, Data.DBXJSON, System.SysUtils, prm_simple,
  Data.DBXJSONReflect, Main,ControllerInstitution, uniSpeedButton,
  Vcl.Graphics, uniEdit, uniMemo, uniCheckBox, uniComboBox,
  uniDBLookupComboBox, uniRadioGroup, uniDateTimePicker, uniTreeView,
  System.Variants, UnFunctions;




type

  TDSCallbackMethod = reference to function(const Args: TJSONValue): TJSONValue;


  TBaseForm = class(TUniForm)
    cds_msg: TClientDataSet;
    cds_msgid: TStringField;
    cds_msgmensagem: TStringField;
    ds_msg: TDataSource;

    procedure buttonIcon(button:TUniSpeedButton;name:String);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure UniFormCancel(Sender: TObject);

  private

  protected
    procedure ClearFields(T: TComponent);
    procedure createHintMemo;

    procedure InitVariable;Virtual;
    procedure SetVariable;Virtual;
    procedure setImages;Virtual;
    procedure FormatScreen;Virtual;

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

    procedure setFocus<T: class>(Obj: T);
    Procedure geralog(acesso : string);
    function validateGetView(cds:TClientDataset):Boolean;Virtual;
  protected
    AcessoOnline, pathImage : String;
    Ffinished : Boolean;
    FResult : Boolean;
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
    CodigoRegistro : Integer;
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
  ,GenericDAO
  ;
{ TTasMsgProcess.TChatCallback }

constructor TBaseForm.TMessageCallback.Create(CallBackMethod: TDSCallbackMethod);
begin
  FCallBackMethod := CallBackMethod;
end;

function TBaseForm.TMessageCallback.Execute(const Arg: TJSONValue): TJSONValue;
begin
  Result := FCallbackMethod(Arg);
end;

procedure TBaseForm.geralog(acesso: string);
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
    LcParamSimple.Resultado := IntToStr(UMM.GInstitution.Registro.Codigo);
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

begin

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
      geralog(e.Message)
  end;
end;

procedure TBaseForm.ClearFields(T: TComponent);
Var
  I,J:Integer;
begin
  with T do Begin
    for I := 0 to ((ComponentCount)-1) do begin
      if (Components[I].ClassName = 'TUniEdit') then
        TUniEdit (Components[I]).Clear;

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

procedure TBaseForm.FormatScreen;
begin

end;

procedure TBaseForm.InitVariable;
begin
  BringToFront;
  createHintMemo;
  ClearFields(self);
end;

procedure TBaseForm.setFocus<T>(Obj: T);
begin
  //  TUniComponentClass(Obj).JSName;
  //  UniSession.AddJS('setTimeout(function(){'+ TUniComponent(TClassFinder(Obj).ClassName).JSName +'.focus()}, 100)');
end;

procedure TBaseForm.setImages;
begin
  //
end;

procedure TBaseForm.SetVariable;
begin
  //
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
