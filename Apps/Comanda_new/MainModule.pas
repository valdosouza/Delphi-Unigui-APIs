unit MainModule;

interface

uses
  System.SysUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client,
  System.Classes, FireDAC.Comp.DataSet, System.Bluetooth, System.Bluetooth.Components,
  REST.Json,System.Json, FireDAC.Comp.UI, un_print, FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util, FireDAC.Comp.Script, FireDAC.Phys.FB, FireDAC.Phys.FBDef;



type
  TUMM = class(TDataModule)
    Qr_Crud: TFDQuery;
    DB: TFDConnection;
    Cursor: TFDGUIxWaitCursor;
    DevicePrint: TBluetooth;
    FDScript1: TFDScript;
    FDCommand1: TFDCommand;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    Print : TPrint;
    procedure ConnectDatabase;
    procedure DisconnectDatabase;
    procedure ExecComando(SqlTxt: String);
    procedure ExecConsulta(SqlTxt: String);

  end;

var
  UMM: TUMM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses UnFunctions;

{$R *.dfm}


procedure TUMM.ConnectDatabase;
begin
  try
    if not DB.Connected then
    BEgin
      DB.Params.Clear;
      DB.Params.Add('Password=masterkey');
      DB.Params.Add('User_Name=sysdba');
      DB.Params.Add('Port=3050');
      DB.Params.Add('CharacterSet=WIN1252');
      DB.Params.Add('OSAuthent=No');
      DB.Params.Add('DriverID=FB');
      DB.Params.Values['Database'] := GetConfig('MOBILE','DATABASE');
      DB.Connected := True;
    End;
  Except
    DB.Connected := False;
  end;
end;

procedure TUMM.DataModuleCreate(Sender: TObject);
var
  i: integer;
  aBTDeviceList: TBluetoothDeviceList;
begin
  try
    aBTDeviceList := TBluetoothManager.Current.CurrentAdapter.PairedDevices;
    if aBTDeviceList.Count>0 then
    Begin
      DevicePrint.Enabled := True;
      Print := TPrint.Create(DevicePrint);
    End;
  except
      DevicePrint.Enabled := False;
  End;
end;

procedure TUMM.DataModuleDestroy(Sender: TObject);
begin
  Print.DisposeOf;
end;

procedure TUMM.DisconnectDatabase;
begin
  try
    DB.Close;
  Except

  end;
end;

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


