unit MainModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Phys.MySQLDef,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.MySQL, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.UI, FireDAC.Comp.DataSet,System.IniFiles, Vcl.Forms;


type
  TUMM = class(TDataModule)
    Qr_Crud: TFDQuery;
    MysqlLink: TFDPhysMySQLDriverLink;
    WaitCursor: TFDGUIxWaitCursor;
    DB: TFDConnection;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ExecComando(SqlTxt: String);
    procedure ExecConsulta(SqlTxt: String);
  end;

var
  UMM: TUMM;
  GbInstitution : Integer;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TUMM }


procedure TUMM.ExecComando(SqlTxt: String);
begin
  with Qr_Crud do
  Begin
    active := False;
    sql.Clear;
    SQL.Add(SqlTxt);
    ExecSQL;
  End;
end;

procedure TUMM.ExecConsulta(SqlTxt: String);
begin
  with Qr_Crud do
  Begin
    active := False;
    sql.Clear;
    SQL.Add(SqlTxt);
    Active := True;
    FetchAll;
    First;
  End;
end;

end.
