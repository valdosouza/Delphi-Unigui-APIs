unit ControllerUser;

interface

uses System.Classes, System.SysUtils,BaseController,tblPrivilege,
      tblUser, ControllerMailing,ControllerEntity ,FireDAC.Comp.Client,
      Md5, FireDAC.Stan.Param,ControllerInstitutionHasUser, prm_user,
      controllerDevices,TypesCollection,ControllerUserHasPrivilege,
      ControllerUSerSendEmail;

Type
  TControllerUser = Class(TBaseController)
    procedure clear;
  private


  public
    Registro : TUser;
    Mailing : TControllerMailing;
    Entity : TControllerEntity;
    HasInstitution : TControllerInstitutionHasUser;
    device : TcontrollerDevices;
    Parametro : TPrmUser;
    HasPrivilegio : TControllerUserHasPrivilege;
    ListaPrivilegio : TListPrivilege;
    EnviaEmail : TControllerUSerSendEmail;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function update:boolean;
    procedure getbyKey;
    procedure getAllbyKey;
    Function delete:boolean;
    Function activeRegiter:Boolean;
    Function desactiveRegiter:Boolean;
    function doubleCheck(emailId:Integer;email:string;InstitutionID:Integer):Boolean;
    function insert:boolean;
    function autenticacao(email,senha:String):Boolean;
    function getByEmail: Boolean;
    function encryptPassword(Value:String):String;
    function getInstitutionUSer:Integer;
    function getListprivilege:boolean;
    function getPrivilege(Kind:String):Boolean;
  End;

implementation

{ TControllerUser }

function TControllerUser.activeRegiter: Boolean;
begin
  if (Registro.Codigo > 0) then
  Begin
    with HasInstitution.Registro do
    Begin
      Usuario := Registro.Codigo;
      Ativo := 'S';
      RegistroCriado := Now;
      RegistroAlterado := Now;
    End;
    HasInstitution.save;
  End;
end;

function TControllerUser.autenticacao(email, senha: String): Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      //Vincular o usuario a entidade - e pela entidade has mailing verifica o email e o grupo
      SQL.Add(concat(
              'Select u.* ',
              'from tb_user u ',
              ' inner join  tb_entity_has_mailing ehm ',
              ' on (ehm.tb_entity_id = u.id)',
              '  inner join tb_mailing m ',
              '  on (m.id = ehm.tb_mailing_id) ',
              'where ( email=:email ) and ( password=:password ) ',
              ' and (ehm.tb_mailing_group_id = 2) '
      ));
      ParamByName('email').AsString := email;
      ParamByName('password').AsString := MD5String(senha);
      active := True;
      FetchAll;
      result := (RowsAffected > 0) ;
      if result then get(Lc_Qry,Registro);
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerUser.getByEmail: Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Lc_Qry := createQuery;
  with Lc_Qry do
  Begin
    SQL.Clear;
    SQL.Add('Select m.email '+
            'from tb_mailing m '+
            'where email=:email '+
            ' and (m.id > 0) '+
            ' and (m.id <>:id) ');
    ParamByName('email').AsString := Mailing.Registro.Email;
    ParamByName('id').AsInteger := Registro.Codigo;
    active := True;
    FetchAll;
    result := (RowsAffected > 0) ;
  End;
    FinalizaQuery(Lc_Qry);
end;

procedure TControllerUser.getbyKey;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      sql.Add('SELECT u.*, i.tb_institution_id,  i.active '+
              'from tb_user u ' +
              '  inner join tb_institution_has_user i '+
              '   on (i.tb_user_id = u.id ) '+
              'where (i.tb_institution_id =:tb_institution_id) '+
              ' and  (u.id =:id) ' );

      ParamByName('tb_institution_id').AsInteger := Self.HasInstitution.Registro.Estabelecimento;
      ParamByName('id').AsInteger := Registro.Codigo;
      Active := true;
      FetchAll;
      exist := ( RecordCount > 0 );
      if (exist) then get(Lc_Qry,Registro);
    End;
  Finally
    finalizaQuery(Lc_Qry);
  End;
end;

function TControllerUser.getInstitutionUSer: Integer;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      SQL.Clear;
      SQL.Add(concat(
                'Select ihu.tb_institution_id ',
                'from tb_institution_has_user ihu ',
               'where (ihu.tb_user_id=:tb_user_id)'
               ));
      ParamByName('tb_user_id').AsInteger := Registro.Codigo;
      active := True;
      FetchAll;
      result := FieldByName('tb_institution_id').AsInteger;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;


function TControllerUser.getListprivilege: boolean;
Var
  Lc_Qry : TFDQuery;
  LcItem : TPrivilege;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      SQL.Clear;
      SQL.Add(concat(
                'Select p.id, p.description, uhp.active ',
                'from tb_privilege p ',
                ' inner join tb_user_has_privilege uhp ',
                '  on (uhp.tb_privilege_id = p.id ) ',
                'where  ( uhp.tb_institution_id =:tb_institution_id) ',
                '  and  ( uhp.tb_user_id =:tb_user_id) ',
                '  and  ( uhp.tb_interface_id =:tb_interface_id) ',
                'union ',
                'Select p.id, p.description, ''N'' active ',
                'from tb_privilege p ',
                '  inner join tb_interface_has_privilege ihp ',
                '  on (ihp.tb_privilege_id = p.id) ',
                'where  p.id not in ( ',
                '  Select p.id ',
                '  from tb_privilege p ',
                '   inner join tb_user_has_privilege uhp ',
                '    on (uhp.tb_privilege_id = p.id ) ',
                '  where  ( uhp.tb_institution_id =:tb_institution_id) ',
                '    and  ( uhp.tb_user_id =:tb_user_id) ',
                '    and  ( uhp.tb_interface_id =:tb_interface_id) ',
                ') ',
                'and  (ihp.tb_interface_id =:tb_interface_id) '

               ));
      ParamByName('tb_institution_id').AsInteger  := Parametro.Estabelecimento;
      ParamByName('tb_user_id').AsInteger         := Parametro.Usuario;
      ParamByName('tb_interface_id').AsInteger    := Parametro.TelaInterface;
      active := True;
      FetchAll;
      ListaPrivilegio.Clear;
      while not eof do
      Begin
        LcItem := TPrivilege.Create;
        LcItem.Codigo    := FieldByName('id').AsInteger;
        LcItem.Descricao := FieldByName('description').AsString;
        LcItem.Ativo     := FieldByName('active').AsString;
        ListaPrivilegio.Add(LcItem);
        Next;
      End;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

function TControllerUser.getPrivilege(Kind:String): Boolean;
Var
  Lc_Qry : TFDQuery;
  LcItem : TPrivilege;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      SQL.Clear;
      SQL.Add(concat(
                'Select p.id, p.description, uhp.active ',
                'from tb_privilege p ',
                ' inner join tb_user_has_privilege uhp ',
                '  on (uhp.tb_privilege_id = p.id ) ',
                'where  ( uhp.tb_institution_id =:tb_institution_id) ',
                '  and  ( uhp.tb_user_id =:tb_user_id) ',
                '  and  ( uhp.tb_interface_id =:tb_interface_id) ',
                '  and  ( p.description =:description ) '
               ));
      ParamByName('tb_institution_id').AsInteger  := Parametro.Estabelecimento;
      ParamByName('tb_user_id').AsInteger         := Parametro.Usuario;
      ParamByName('tb_interface_id').AsInteger    := Parametro.TelaInterface;
      ParamByName('description').AsString         := Kind;
      active := True;
      FetchAll;
      //Se não definido vamos liberar por enquanto
      if RecordCount = 0 then
      BEgin
        REsult := True;
      End
      else
      Begin
        REsult := (FieldByName('active').AsString = 'S');
      End;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

procedure TControllerUser.clear;
begin
  clearObj(Registro);
end;

constructor TControllerUser.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TUser.Create;
  Mailing := TControllerMailing.Create(Self);
  Entity := TControllerEntity.Create(Self);
  HasInstitution := TControllerInstitutionHasUser.Create(Self);
  device := TcontrollerDevices.Create(Self);
  Parametro := TPrmUser.Create;
  ListaPrivilegio := TListPrivilege.Create;
  HasPrivilegio := TControllerUserHasPrivilege.Create(Self);
  EnviaEmail := TControllerUSerSendEmail.Create(Self);
end;

function TControllerUser.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerUser.desactiveRegiter: Boolean;
begin
  if (Registro.Codigo > 0) then
  Begin
    with HasInstitution.Registro do
    Begin
        Usuario := Self.Registro.Codigo;
        Ativo := 'N';
        RegistroCriado := Now;
        RegistroAlterado := Now;
      End;
    HasInstitution.save;
  End;
end;

destructor TControllerUser.Destroy;
begin
  HasPrivilegio.DisposeOf;
  ListaPrivilegio.DisposeOf;
  Registro.DisposeOf;
  Mailing.DisposeOf;
  Entity.DisposeOf;
  HasInstitution.DisposeOf;
  device.DisposeOf;
  Parametro.Destroy;
  inherited;
end;

function TControllerUser.doubleCheck(emailId:Integer;email: string;InstitutionID:Integer): Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add(Concat(
                'SELECT m.id ',
                'FROM tb_user u ',
                '  inner join tb_entity e ',
                '  on (e.id = u.id) ',
                '  inner join tb_institution_has_user ihu ',
                '  on (ihu.tb_user_id = u.id) ',
                '  inner join tb_entity_has_mailing ehm ',
                '  on (ehm.tb_entity_id = e.id) ',
                '  inner join tb_mailing m ',
                '  on (m.id = ehm.tb_mailing_id) ',
                'where ihu.tb_institution_id =:tb_institution_id ',
                'and tb_mailing_group_id = 2 ',
                'and m.email =:email ',
                ' and m.id <> :emailID '
      ));
      ParamByName('emailID').AsInteger := emailId;
      ParamByName('email').AsString := Email;
      ParamByName('tb_institution_id').AsInteger := InstitutionID;
      active := True;
      FetchAll;
      Result := (RecordCount > 0);
    End;
  Finally
    finalizaQuery(Lc_Qry);
  End;

end;

function TControllerUser.encryptPassword(Value: String): String;
begin
  Result := MD5String(Value);
end;


procedure TControllerUser.getAllbyKey;
begin
  getbyKey;

  Entity.Registro.Codigo := Registro.Codigo;
  Entity.getByKey;

  Mailing.Registro.Codigo := Registro.Codigo;
  Mailing.getbyKind(Registro.Codigo,'sistema');

  EnviaEmail.Registro.Usuario := Registro.Codigo;
  EnviaEmail.getByKey;
end;

function TControllerUser.insert: boolean;
begin
  Registro.Codigo := getNextByField(Registro,'id',0);
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerUser.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerUser.update: boolean;
begin
  try
    UpdateObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

end.
