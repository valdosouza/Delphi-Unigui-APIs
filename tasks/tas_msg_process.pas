unit tas_msg_process;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniMemo, uniGUIBaseClasses, uniPanel, uniButton,
  uniBitBtn, uniSpeedButton, ClientProxy,IPPeerClient, Data.DBXCommon, DBXJSON,
  REST.Json,System.Json, DBXDataSnap, Data.DB, Data.SqlExpr, Main, uniBasicGrid,
  uniDBGrid, Datasnap.DBClient, base_form, uniLabel, Vcl.Menus, uniMainMenu ;

type
  TDSCallbackMethod = reference to function(const Args: TJSONValue): TJSONValue;

  TTasMsgProcess = class(TBaseForm)
    Pnl_Corpo: TUniPanel;
    Pnl_Botao: TUniPanel;
    Sb_Verify: TUniSpeedButton;
    dbg_Msg: TUniDBGrid;
    procedure UniFormCreate(Sender: TObject);
    procedure Sb_VerifyClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FParamJson: String;
    procedure setFFParamJson(const Value: String);
    function iniciar:Boolean;
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
    callback: TMessageCallback;
    Resultado : Boolean;
    property Parametros : String read FParamJson write setFFParamJson;
  end;

implementation


{ TTasMsgProcess.TChatCallback }

constructor TTasMsgProcess.TMessageCallback.Create(CallBackMethod: TDSCallbackMethod);
begin
  FCallBackMethod := CallBackMethod;
end;

function TTasMsgProcess.TMessageCallback.Execute(const Arg: TJSONValue): TJSONValue;
begin
  Result := FCallbackMethod(Arg);
end;

{$R *.dfm}
function TTasMsgProcess.iniciar: Boolean;
Var
  I : Integer;
  m: TCProxy;
begin
  try
    ShowMask('Aguarde Processamento');
    MainForm.SQLConnect.Open;
    m := TCProxy.Create(MainForm.SQLConnect.DBXConnection);
    m.ValidtoInvoice(Parametros, callback);
    HideMask;
    IF (cds_msg.RecordCount > 0) then
    Begin
      Sb_Verify.Visible := True;
      Resultado := False;
    End
    else
    Begin
      Resultado := True;
      self.close;
    End;
  finally
    FReeAndNil(m);
  end;
end;

procedure TTasMsgProcess.setFFParamJson(const Value: String);
begin
  FParamJson := Value;
end;

procedure TTasMsgProcess.UniFormCreate(Sender: TObject);
begin
  if not cds_msg.Active then cds_msg.CreateDataSet;

  callback := TMessageCallback.Create( function(const Args: TJSONValue) : TJSONValue
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

procedure TTasMsgProcess.UniFormShow(Sender: TObject);
begin
  iniciar;
end;

procedure TTasMsgProcess.Sb_VerifyClick(Sender: TObject);
begin
  close;
end;

end.
