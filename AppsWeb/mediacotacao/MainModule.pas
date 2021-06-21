unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.Client, ControllerInstitution, ctrl_mob_step_advertise;

type
  TUMM = class(TUniGUIMainModule)
    DB: TFDConnection;
    MysqlLink: TFDPhysMySQLDriverLink;
    WaitCursor: TFDGUIxWaitCursor;
    procedure UniGUIMainModuleCreate(Sender: TObject);
    procedure UniGUIMainModuleSessionTimeout(ASession: TObject;
      var ExtendTimeOut: Integer);
  private
    FGInstitution: TControllerInstitution;
    FAdvertise: TCtrlMmobStepAdvertise;
    procedure setFGInstitution(const Value: TControllerInstitution);
    procedure setFAdvertise(const Value: TCtrlMmobStepAdvertise);
    { Private declarations }
  public
    { Public declarations }
    property GInstitution : TControllerInstitution read FGInstitution write setFGInstitution;
    property Advertise : TCtrlMmobStepAdvertise read FAdvertise write setFAdvertise;
  end;

function UMM: TUMM;
function getConnection(): TFDConnection;
procedure ExecSQlCommand(sql:String);


implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication;

function UMM: TUMM;
begin
  Result := TUMM(UniApplication.UniMainModule)
end;

function getConnection: TFDConnection;
begin
  Result := UMM.DB;
end;

procedure ExecSQlCommand(sql:String);
Begin
  UMM.DB.ExecSQL(sql);
end;

{ TUniMainModule }

procedure TUMM.setFAdvertise(const Value: TCtrlMmobStepAdvertise);
begin
  FAdvertise := Value;
end;

procedure TUMM.setFGInstitution(const Value: TControllerInstitution);
begin
  FGInstitution := Value;
end;


procedure TUMM.UniGUIMainModuleCreate(Sender: TObject);
begin
  FAdvertise := TCtrlMmobStepAdvertise.Create(UniApplication);
  FgInstitution := TControllerInstitution.create(UniApplication);
  GInstitution.Registro.Codigo := 16;
  GInstitution.User.Registro.Codigo := 11;
end;

procedure TUMM.UniGUIMainModuleSessionTimeout(ASession: TObject;
  var ExtendTimeOut: Integer);
begin
  extendTimeout := 600000;
end;

initialization
  RegisterMainModuleClass(TUMM);
end.
