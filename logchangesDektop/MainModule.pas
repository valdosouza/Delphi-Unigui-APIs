unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Datasnap.Provider, Data.DB,IniFiles,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.UI;

type
  TUMM = class(TUniGUIMainModule)
    DB: TFDConnection;
    MysqlLink: TFDPhysMySQLDriverLink;
    WaitCursor: TFDGUIxWaitCursor;
    Qr_Crud: TFDQuery;
    DSP: TDataSetProvider;
    procedure UniGUIMainModuleCreate(Sender: TObject);
    procedure UniGUIMainModuleSessionTimeout(ASession: TObject;
      var ExtendTimeOut: Integer);
  private
    { Private declarations }
    procedure configs;
  public
    { Public declarations }
  end;

function UMM: TUMM;
function getConnection(): TFDConnection;
procedure ExecSQlCommand(sql:String);

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication,
  UnitConstantes, ClasseUtil;

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

procedure TUMM.configs;
var
   ArquivoIni: TIniFile;
   sArqConfig,
   sDriver,
   sDriverBanco,
   sNomeBanco,
   sServer,
   sUsername,
   sPassword,
   sPublic,
   sPrivate,
   sUrl  : String;
begin
  try
    sDriver := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO,'Configuracao','DriverBanco');
    if sDriver = '' then begin
      sDriver := 'MySql';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, 'Configuracao', 'DriverBanco', sDriver);
    end;

    sServer := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'Server');
    if sServer = '' then begin
      sServer := 'localhost';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'Server', sServer);
    end;

    sNomeBanco := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'Database');
    if sNomeBanco = '' then begin
      sNomeBanco := 'gestao_setes';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'Database', sNomeBanco);
    end;

    sUsername := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'User_Name');
    if sUsername = '' then begin
      sUsername := 'gestao_setes';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'User_Name', sUsername);
    end;

    sPassword := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'Password');
    if sPassword = '' then begin
      sPassword := '12345';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'Password', sPassword);
    end;

    sDriverBanco := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'DriverID');
    if sDriverBanco = '' then begin
      sDriverBanco := 'MySql';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'DriverID', sDriverBanco);
    end;

    sPublic := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios','Publico');
    if sPublic = '' then begin
      sPublic := STRNG_CAMINHO_PUBLICO;
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios', 'Publico', sPublic);
    end;

    sPrivate := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios','Privado');
    if sPrivate = '' then begin
      sPrivate := STRNG_CAMINHO_PRIVADO;
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios', 'Privado', sPrivate);
    end;

    sUrl := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios','URL');
    if sUrl = '' then begin
      sUrl := STRNG_CAMINHO_URL;
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios', 'URL', sUrl);
    end;
    UMM.DB.Params.Clear;
    UMM.DB.Params.Add('Server='+sServer);
    UMM.DB.Params.Add('Database='+sNomeBanco);
    UMM.DB.Params.Add('User_Name='+sUsername);
    UMM.DB.Params.Add('Password='+sPassword);
    UMM.DB.Params.Add('DriverID=MySQL');
  finally
    ArquivoIni.Free;
  end;

end;

procedure TUMM.UniGUIMainModuleCreate(Sender: TObject);
begin
  configs;
  MysqlLink.VendorLib := 'C:\gestaoweb\libmysql.dll';
  Qr_Crud.Active := False;

end;

procedure TUMM.UniGUIMainModuleSessionTimeout(ASession: TObject;
  var ExtendTimeOut: Integer);
begin
  extendTimeout := 600000;
end;

initialization
  RegisterMainModuleClass(TUMM);
end.
