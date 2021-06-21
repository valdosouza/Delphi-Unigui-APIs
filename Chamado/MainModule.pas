unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI,ControllerInstitution;

type
  TUMM = class(TUniGUIMainModule)
    DB: TFDConnection;
    MysqlLink: TFDPhysMySQLDriverLink;
    WaitCursor: TFDGUIxWaitCursor;
    Qr_Crud: TFDQuery;
    procedure UniGUIMainModuleCreate(Sender: TObject);
  private
    FGInstitution: TControllerInstitution;
    FCustomer: Integer;
    procedure setFGInstitution(const Value: TControllerInstitution);
    procedure setFCustomer(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }
    property GInstitution : TControllerInstitution read FGInstitution write setFGInstitution;
    property Customer : Integer read FCustomer write setFCustomer;
  end;

Var
  GbEmail : String;
  GbEmpresa : String;
  GbPathExe : String;


function UMM: TUMM;
function getConnection:TFDConnection;
procedure ExecSQlCommand(sql:String);

implementation

uses
  UniGUIVars, ServerModule, uniGUIApplication;

{$R *.dfm}
function getConnection: TFDConnection;
begin
  Result := UMM.DB;
end;

procedure ExecSQlCommand(sql:String);
Begin
  UMM.DB.ExecSQL(sql);
end;

function UMM: TUMM;
begin
  Result := TUMM(UniApplication.UniMainModule)
end;


procedure TUMM.setFCustomer(const Value: Integer);
begin
  FCustomer := Value;
end;

procedure TUMM.setFGInstitution(const Value: TControllerInstitution);
begin
  FGInstitution := Value;
end;

procedure TUMM.UniGUIMainModuleCreate(Sender: TObject);
begin
  FGInstitution := TControllerInstitution.create(UniApplication);
  MysqlLink.VendorLib := 'C:\gestaoweb\libmysql.dll';
  Qr_Crud.Active := False;
end;

initialization
  RegisterMainModuleClass(TUMM);
end.
