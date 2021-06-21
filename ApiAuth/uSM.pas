unit uSM;

interface

uses System.SysUtils, System.Classes, System.Json,REST.Json,
    Datasnap.DSServer, Datasnap.DSAuth, prm_auth_login, ControllerUser, prm_user,
  Vcl.Dialogs, UnFunctions,ControllerDevices, tblDevices;

type
{$METHODINFO ON}
  TSM = class(TComponent)
  private
    function ChangePassWord(prm: TPRmUser):Boolean;
  public
    { Public declarations }
    function GetAuthentication(par: string): string;
    function update(par: string): TJSONValue;
    function getByKey(institutionID,userID:Integer) : TJsonObject;
    function validaMobileDevice(par: string) : TJsonObject;
  end;
{$METHODINFO OFF}

implementation

{ TSM }

function TSM.ChangePassWord(prm: TPRmUser): Boolean;
Var
  User : TControllerUser;
begin
  Result := True;
  if Trim(prm.NovaSenha) <> '' then
  Begin
    Try
      User := TControllerUser.Create(nil);
      User.Registro.Codigo := prm.Usuario.Codigo;
      User.HasInstitution.Registro.Estabelecimento := prm.Estabelecimento;
      User.getbyKey;
      //Existe o Usuario e as senhas conferem
      if User.exist and ( prm.Usuario.Password = user.Registro.Password ) then
      Begin
        USer.Registro := prm.Usuario;
        USer.Registro.Password := prm.NovaSenha;
        USer.save;
      End
      else
      Begin
        REsult := False;
      End;
    Finally
      User.DisposeOf;
    End;
  End;
end;

function TSM.GetAuthentication(par: string): string;
Var
  LcUrl : String;
  LcPath : String;
  Lc_Param : TPrmAuthLogin;
  LcFile : String;
  User : TControllerUser;
begin
  try
    Lc_Param := TPrmAuthLogin.Create;
    Lc_Param := TJSON.JsonToObject<TPrmAuthLogin>(par);
    Lc_Param.Resultado := False;
    User := TControllerUser.Create(nil);
    try
      if User.autenticacao(Lc_Param.email,Lc_Param.password) then
      Begin
        Lc_Param.Resultado := True;
        Lc_Param.Usuario := User.Registro.Codigo;
        Lc_Param.Estabelecimento := User.getInstitutionUSer;
        Lc_Param.Dispositivo := User.Registro.Dispositivo;
        User.Entity.Registro.Codigo := User.Registro.Codigo;
        User.Entity.getByKey;
        Lc_Param.NomeUsuario := User.Entity.Registro.ApelidoFantasia;
      End;
    Except
      on E: Exception do
      Begin
        Lc_Param.Resultado := False;
        GeralogCrashlytics('TSM.GetAuthentication',E.Message)
      end;
    end;
  finally
    Result := TJson.ObjectToJsonString(Lc_Param);
    User.disposeOf;
  end;
end;


function TSM.getByKey(institutionID, userID: Integer): TJsonObject;
Var
  User : TControllerUser;
begin
  try
    User := TControllerUser.create(nil);
    try
      with User do
      Begin
        HasInstitution.Registro.Estabelecimento := institutionID;
        Registro.Codigo := userID;
        getAllByKey;
        Parametro.Usuario := Registro;
        Parametro.Entidade := Entity.Registro;
        Parametro.Email := Mailing.Registro;
      End;
      Result := TJson.ObjectToJsonObject(user.Parametro);
    except
      on E: Exception do
      Begin
        GeralogCrashlytics('TSM.getByKey',E.Message);
        user.Parametro.Entidade.NomeRazao := 'Usuario não encontrado';
        Result := TJson.ObjectToJsonObject(user.Parametro);
      end;
    end;
  finally
    User.DisposeOf;
  end;
end;

function TSM.Update(par: string): TJSONValue;
Var
  LcPrm: TPRmUser;
  User : TControllerUser;
begin
  try
    User := TControllerUser.Create(nil);
    LcPrm := TPRmUser.Create;
    LcPrm := TJson.JsonToObject<TPRmUser>(par);
    //Entidade
    USer.Entity.Registro := LcPrm.Entidade;
    USer.Entity.save;
    //MAiling
    User.Mailing.Registro := LcPrm.Email;
    User.Mailing.save;
    //Usuario
    USer.Registro := LcPrm.Usuario;
    USer.save;

    if ChangePassWord(Lcprm) then
      Result := TJSONString.Create('Usuário alterado com sucesso')
    else
      Result := TJSONString.Create('Falha - Senha atual não confere.')
  finally
    LcPrm.DisposeOf;
    User.DisposeOf;
  end;
end;

function TSM.validaMobileDevice(par: string): TJsonObject;
Var
  Device : TControllerDevices;
begin
  try
    try
      Device := TControllerDevices.Create(nil);
      if par <> '' then
        Device.Registro := TJson.JsonToObject<TDevices>(par);
      Device.getByIdentificacao;
      if not Device.exist then
      Begin
        Device.save;
      End;
      Device.Registro.RegistroCriado := Now;
      Device.Registro.RegistroAlterado := Now;
      Device.Registro.Validade := Now;
      Result := TJson.ObjectToJsonObject(Device.Registro);
    Except
      on E: Exception do
        GeralogCrashlytics('TSM.validaMobileDevice',E.Message)
    end;
  finally
    Device.DisposeOf;
  end;
end;


end.

