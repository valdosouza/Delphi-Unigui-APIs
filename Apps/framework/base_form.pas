unit base_form;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, System.Permissions,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Media,
  FMX.Objects, FMX.Layouts, FMX.Memo, FMX.ListBox, FMX.TabControl, FMX.Controls.Presentation,
  System.Actions, FMX.ActnList, System.Messaging,FMX.Graphics,
   FMX.DateTimeCtrls,   FMX.ScrollBox, FMX.Edit, FMX.ImgList,
  //VertScrollBoxWithKBHandling,
  {$IFDEF ANDROID}
      Androidapi.JNI.Support,
      Androidapi.JNI.Embarcadero,
      Androidapi.Helpers,
      Androidapi.JNI.Os,
  {$ENDIF ANDROID}
  FMX.Ani, ctrl_mob_salesman_has_stock, ctrl_mob_stock_list,ctrl_mob_sync_data,
  System.ImageList, System.IniFiles, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView ;



type
  TBaseForm = class(TForm)
    LayoutMain: TLayout;
    ImageList: TImageList;
    Rc_process_Show: TRectangle;
    Rc_process_frame: TRectangle;
    Rc_process_tittle: TRectangle;
    Lb_process_msg: TLabel;
    img_cloud: TImage;
    AI_process_in: TAniIndicator;

  private

    procedure setFPermission(const Value: String);

  protected
    FPermission: String;
    Function GetPathExe:String;
    procedure SetConfigINI(Sessao, CHave, Valor:String);
    Function GetConfigINI(Sessao,CHave:String):String;

    procedure CloseLogin;
    procedure CloseSplash;
    procedure setInstitution(InstitutionID : Integer);
    procedure ClearFields(T: TComponent);
    procedure InitVariable;Virtual;
    procedure SetVariable;Virtual;
    procedure setImages;Virtual;
    procedure FormatScreen;Virtual;
    procedure LoadLoginForm;
    procedure LoadMainForm;
    procedure LoadSincronize;
    procedure LoadCadUSer(CodeId:Integer);
    procedure LayoutAjustment;
    procedure hideProcess;Virtual;
    function showProcess(Msg: String):Boolean;Virtual;
    procedure updateProcess(msg:String);
    procedure SetMainStock;

  public
    { Public declarations }
    CodigoRegistro : Variant;
    property Permission: String read FPermission write setFPermission;
  end;

var
  BaseForm: TBaseForm;

const
  EOL = concat(Char(10),Char(13));
implementation

uses ctrl_mob_config, MainModule, uMain, System.Math, uLogin, usplash,
  cad_user, tas_sincronize, tas_home, uDataCM;

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

{ TBaseForm }



procedure TBaseForm.ClearFields(T: TComponent);
begin

end;

procedure TBaseForm.CloseLogin;
begin
  if Assigned(Login) then
  BEgin
    Login.close;
    Login := nil;
  end;
end;

procedure TBaseForm.CloseSplash;
begin
  if Assigned(splash) then
  BEgin
    splash.close;
    splash.DisposeOf;
    splash := nil;
  end;
end;

procedure TBaseForm.FormatScreen;
begin

end;

function TBaseForm.GetConfigINI(Sessao, CHave: String): String;
var
  fReadStorage: String;
  LcResult : Boolean;
  function LcGetConfigINI(Sessao, CHave: String): String;
  var
    ArquivoIni: TIniFile;
  begin
    try
      ArquivoIni := TIniFile.Create(concat(GetPathExe,'/','cfgcomanda.ini'));
      Result     :=  ArquivoIni.ReadString(Sessao, CHave,'');
    finally
      ArquivoIni.DisposeOf;
    end;
  end;
begin
  {$IFDEF ANDROID}
  fReadStorage:= JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE);
  if PermissionsService.IsPermissionGranted(fReadStorage) then
  begin
    Result := LcGetConfigINI(Sessao,Chave);
  end
  else
  Begin
    LcResult := False;
    PermissionsService.RequestPermissions([JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE)],
      procedure(const APermissions: TArray<string>; const AGrantResults: TArray<TPermissionStatus>)
      begin
        if (Length(AGrantResults) = 1) and (AGrantResults[0] = TPermissionStatus.Granted) then
        Begin
          LcResult :=  true;
        end;
      end);
    if LcResult then
      Result := LcGetConfigINI(Sessao, CHave);
  end;
  {$ENDIF}
  {$IFDEF WIN32}
  Result := LcGetConfigINI(Sessao, CHave);
  {$ENDIF}
end;

function TBaseForm.GetPathExe: String;
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

procedure TBaseForm.hideProcess;
begin
  Rc_process_Show.Visible := False;
  Rc_process_Show.Align := TAlignLayout.None;
  AI_process_in.Enabled := False;
end;

procedure TBaseForm.InitVariable;
begin
end;



procedure TBaseForm.LayoutAjustment;
begin

end;

procedure TBaseForm.LoadCadUSer(CodeId:Integer);
Var
  Form : TCadUser;
begin
  Form := TCadUser.Create(Application);
  Form.CodigoRegistro := CodeId;
  Form.Parent := Self;
  Form.ShowModal(
  procedure(ModalResult : TModalResult)
  begin
     Form := nil;
  end);
end;

procedure TBaseForm.LoadLoginForm;
begin
  if not Assigned(Login) then  Login := TLogin.Create(Application);
  Application.MainForm := Login;
  Login.Show;
end;

procedure TBaseForm.LoadMainForm;
begin
  if not Assigned(Main) then  Main := TMain.Create(Application);
  Application.MainForm := Main;
  Main.Show;
end;

procedure TBaseForm.LoadSincronize;
Var
  Frm : TTasSincronize;
begin
  Frm := TTasSincronize.Create(Application);
  Frm.Show;
  Application.MainForm := frm;

end;


procedure TBaseForm.SetConfigINI(Sessao, CHave, Valor: String);
var
  fWriteStorage: String;
  function LcSetConfigINI(Sessao, CHave: String): String;
  var
    ArquivoIni: TIniFile;
  begin
    try
      ArquivoIni := TIniFile.Create(concat(GetPathExe,'/','cfgcomanda.ini'));
      ArquivoIni.WriteString(Sessao, CHave, Valor);
    finally
      ArquivoIni.DisposeOf;
    end;
  end;
begin
  {$IFDEF ANDROID}
  fWriteStorage := JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE);
  if PermissionsService.IsPermissionGranted(fWriteStorage) then
  begin
    LcSetConfigINI(Sessao, CHave);
  end
  else
  Begin
    PermissionsService.RequestPermissions([JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE)],
      procedure(const APermissions: TArray<string>; const AGrantResults: TArray<TPermissionStatus>)
      var
        ArquivoIni: TIniFile;
      begin
        if (Length(AGrantResults) = 1) and (AGrantResults[0] = TPermissionStatus.Granted) then
        Begin
          try
            ArquivoIni := TIniFile.Create(concat(GetPathExe,'/','cfgcomanda.ini'));
            ArquivoIni.WriteString(Sessao, CHave, Valor);
          finally
            ArquivoIni.DisposeOf;
          end;
        end;
      end)
  end;
  {$ENDIF}

  {$IFDEF WIN32}
  LcSetConfigINI(Sessao, CHave);
  {$ENDIF}
end;

procedure TBaseForm.setFPermission(const Value: String);
begin
  FPermission := Value;
end;

procedure TBaseForm.setImages;
begin

end;

procedure TBaseForm.setInstitution(InstitutionID : Integer);
begin
  if InstitutionID = 0 then
  Begin
    UMM.GInstitution.getList;
    InstitutionID := UMM.GInstitution.lista[0].Codigo;
  End;
  UMM.GInstitution.Registro.Codigo := InstitutionID;
  UMM.GInstitution.getAllByKey;
end;



procedure TBaseForm.SetMainStock;
VAr
  LcStockSalesman : TCtrlMobSalesmanHasStock;
  LcStockList : TCtrlMobStockList;
begin
  try
    LcStockList     := TCtrlMobStockList.Create(nil);
    LcStockList.Registro.Estabelecimento :=  UMM.GInstitution.Registro.Codigo;

    LcStockSalesman := TCtrlMobSalesmanHasStock.Create(nil);
    LcStockSalesman.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    LcStockSalesman.Registro.Vendedor := GbSalesMan;
    LcStockSalesman.getbySalesman;
    if LcStockSalesman.exist then
      GbStock := LcStockSalesman.Registro.Estoque
    else
      GbStock := LcStockList.getMain;
  finally
    LcStockSalesman.DisposeOf;
    LcStockList.DisposeOf;
  end;
end;

procedure TBaseForm.SetVariable;
begin

end;

function TBaseForm.showProcess(Msg: String):Boolean;
begin
  Rc_process_Show.BringToFront;
  Rc_process_Show.Visible := True;
  Rc_process_Show.Align := TAlignLayout.Client;
  AI_process_in.Enabled := True;
  Lb_process_msg.Text := Msg;
  Application.ProcessMessages;
end;

procedure TBaseForm.updateProcess(msg: String);
begin
  TThread.Queue(nil,
    procedure
    Begin
      AI_process_in.Repaint;
      Lb_process_msg.Text := msg;
      Application.ProcessMessages;
    end
  );

end;

end.


