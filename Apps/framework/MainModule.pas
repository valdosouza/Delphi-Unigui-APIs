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
  FireDAC.Stan.Util, FireDAC.Comp.Script, ctrl_mob_address, ctrl_mob_base,
  ctrl_mob_brand, ctrl_mob_category, ctrl_mob_city, ctrl_mob_company,
  ctrl_mob_config, ctrl_mob_country, ctrl_mob_customer, ctrl_mob_entity,
  ctrl_mob_entity_fiscal, ctrl_mob_entity_has_mailing, ctrl_mob_financial,
  ctrl_mob_institution_has_entity, ctrl_mob_institution_has_line_business,
  ctrl_mob_line_business,ctrl_mob_institution, FireDAC.Phys.SQLiteWrapper.Stat;




type
  TUMM = class(TDataModule)
    SQLite: TFDPhysSQLiteDriverLink;
    DB: TFDConnection;
    Cursor: TFDGUIxWaitCursor;
    DevicePrint: TBluetooth;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    function validaprinter:Boolean;
    Function GetPathExe:String;
  public
    { Public declarations }
    //DB: TFDConnection;
    Print : TPrint;
    GInstitution : TCtrlMobInstitution;
    procedure ConnectDatabase;
    procedure DisconnectDatabase;
  end;
const
  GbServidor  = '177.70.22.118';

var
  UMM: TUMM;
  GbPAthExe : String;
  GbDataBase :String;
  GbSalesMan : Integer;
  GbTerminal : Integer;
  GbStock : Integer;
  GbUser : Integer;
  GbNameUser : String;
  GbCasaDecimal : Integer;
  GbEmail : String;
  GbPass : String;
  GbNameEmpresa : String;
  GbVersion : Integer;
  function getConnection(): TFDConnection;


implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses UnFunctions;

{$R *.dfm}
function getConnection: TFDConnection;
begin
  UMM.ConnectDatabase;
  Result := UMM.DB;
end;

procedure TUMM.ConnectDatabase;
begin
  try
    if (not assigned(DB)) or (DB = nil) then
      DB := TFDConnection.Create(Self);
    if not DB.Connected  then
    Begin
      GbDataBase := concat( GetPathExe, 'gestaomob.db');
      DB.Params.Clear;
      DB.Params.Add('DriverID=SQLite');
      DB.Params.Add(concat('Database=',GbDataBase));
      DB.Params.Add('Pooled=false');
      //DB.Params.Add('OpenMode=ReadWrite'); o aplicativo instala mas não abre..
      DB.Params.Add('Protocol=Local');
      DB.Params.Add('ForeignKeys=On');
      DB.Params.Add('LockingMode=Normal');
      DB.Params.Add('Synchronous=Full');
      DB.Params.Add('SharedCache=False');
      DB.Params.Add('BusyTimeout=20000');
      DB.LoginPrompt := false;
      DB.Connected := True;
    End;
  Except
    on E:exception do
    Begin
      DB := TFDConnection.Create(Self);
      try
        ConnectDatabase;
        //GeralogCrashlytics('1º - TUMM.ConnectDatabase- ',E.Message);
      except
        on E:exception do
        Begin
          DB.Close;
          //GeralogCrashlytics('2º - TUMM.ConnectDatabase- ',E.Message);
        End;
      end;
    End;
  end;
end;



procedure TUMM.DataModuleCreate(Sender: TObject);
var
  i: integer;
  aBTDeviceList: TBluetoothDeviceList;
begin
  try
    UMM.GInstitution := TCtrlMobInstitution.Create(Self);
    aBTDeviceList := TBluetoothManager.Current.CurrentAdapter.PairedDevices;
    if aBTDeviceList.Count>0 then
    Begin
      DevicePrint.Enabled := True;
      Print := TPrint.Create(self);
      Print.DevicePrint := Self.DevicePrint;
    End;
  except
      DevicePrint.Enabled := False;
  End;
end;

procedure TUMM.DataModuleDestroy(Sender: TObject);
begin
  Print.DisposeOf;
  GInstitution.DisposeOf;
end;

procedure TUMM.DisconnectDatabase;
begin
  try
    DB.Close;
  Except

  end;
end;


function TUMM.GetPathExe: String;
Var
  LcTam : Integer;
  LcAux : String;
begin
  {$IFDEF ANDROID}// if the operative system is Android
    Result := GetHomePath;
    LcTam := Length(Result);
    LcAux := Copy(REsult,LcTam,1);
    if (LcAux <> '/') then
      REsult := concat(REsult,'/');
  {$ENDIF ANDROID}
  {$IFNDEF ANDROID}
    REsult  :=  ExtractFilePath(ParamStr(0));
    LcTam := Length(Result);
    LcAux := Copy(REsult,LcTam,1);
    if (LcAux <> '\') then
      REsult := concat(REsult,'\');
  {$ENDIF ANDROID}
end;

function TUMM.validaprinter: Boolean;
begin

end;

end.




