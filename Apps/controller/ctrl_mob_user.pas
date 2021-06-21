unit ctrl_mob_user;

interface
uses System.Classes,System.SysUtils, FireDAC.Comp.Client, FireDAC.Stan.Param,
    System.Generics.Collections,prm_user, ctrl_mob_base,REST.Json,System.Json,
    Md5,tblUser, uAuthCM;



Type
  TCtrlMobUser = class(TCtrlMobBase)

    private

    public
      Registro : TUser;
      Parametro : TPrmUser;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      function encryptPassword(Value:String):String;
      procedure getbyKey;
  end;
implementation

{ TCtrlMobUser }

constructor TCtrlMobUser.Create(AOwner: TComponent);
begin
  Registro := TUser.Create;
  Parametro := TPrmUser.Create;
end;

destructor TCtrlMobUser.Destroy;
begin
  {$IFDEF WIN32}
  Registro.DisposeOf;
  Parametro.Destroy;
  {$ENDIF }

end;

function TCtrlMobUser.encryptPassword(Value: String): String;
begin
  Result := MD5String(Value);
end;

procedure TCtrlMobUser.getbyKey;
Var
  LcJSon : TJsonObject;
begin
  Try
    LcJSon := AuthCM.SMClient.getByKey(Parametro.Estabelecimento,Parametro.Entidade.Codigo);
    Parametro := TJson.JsonToObject<TPrmUser>(LcJson);
  Finally
    LcJSon.DisposeOf;
  End;
end;

end.
