unit ControllerBank;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblBank, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerEntity, tblInstitutionHasBank;

Type
  TControllerBank = Class(TBaseController)
    procedure clear;
  private


  public
    Registro : TBank;
    Entity : TControllerEntity;
    Institution : TInstitutionHasBank;
    Pessoa:String;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function saveByNameCompany:boolean;
    function insert:boolean;
    function insertByNameCompany:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function getIdByNumber(Number:String):Integer;
    function getAllByKey:boolean;
    Function activeRegiter:Boolean;
    Function desactiveRegiter:Boolean;
    procedure SaveInstitution;
  End;

implementation

{ ControllerProvider }


function TControllerBank.activeRegiter: Boolean;
begin
with Institution do
  Begin
    if (Registro.Codigo > 0) then
    Begin
      Banco := Registro.Codigo;
      Ativo := 'S';
      RegistroCriado := Now;
      RegistroAlterado := Now;
    End;
  End;
  SaveObj(Institution);
end;

procedure TControllerBank.clear;
begin
  clearObj(Registro);
  clearObj(Institution)
end;

constructor TControllerBank.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TBank.Create;
  Entity := TControllerEntity.Create(Self);
  Institution := TInstitutionHasBank.Create;
end;

function TControllerBank.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerBank.desactiveRegiter: Boolean;
begin
 with Institution do
  Begin
    if (Registro.Codigo > 0) then
    Begin
      Banco := Registro.Codigo;
      Ativo := 'N';
      RegistroCriado := Now;
      RegistroAlterado := Now;
    End;
  End;
  SaveObj(Institution);
end;

destructor TControllerBank.Destroy;
begin
  Institution.DisposeOf;
  Registro.DisposeOf;
  Entity.DisposeOf;
  inherited;
end;


function TControllerBank.insert: boolean;
begin
   try
    if (Registro.Codigo = 0 ) then
      getNextByField(Registro,'id',0);
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerBank.insertByNameCompany: boolean;
begin
  try
    Entity.Registro.Codigo := getNextByField(Entity.Registro,'id',0);
    Entity.Insert;
    registro.Codigo := Entity.Registro.Codigo;
    insert;
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerBank.save: boolean;
begin
  try
    if Registro.Codigo > 0 then
     updateObj(Registro)
    else
      saveByNameCompany;
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerBank.saveByNameCompany: boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Clear;
      sql.Add('SELECT id from tb_entity where name_company =:name_company');
      ParamByName('name_company').AsString := Entity.Registro.NomeRazao;
      Active := True;
      FetchAll;
      if RecordCount > 0 then
      Begin
        Registro.Codigo := FieldByName('id').AsInteger;
        SaveObj(Registro);

      End
      else
      Begin
        Self.insertByNameCompany;
      End;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

procedure TControllerBank.SaveInstitution;
begin
  SaveObj(Institution);
end;


function TControllerBank.getAllByKey: boolean;
begin
  getByKey;
  Institution.Banco := Registro.Codigo;
  _getByKey(Institution);
  Entity.Registro.Codigo := Registro.Codigo;
  Entity.getAllByKey;

end;

function TControllerBank.getByKey: Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      sql.Add('SELECT b.* '+
              'from tb_bank b ' +
              '  inner join tb_institution_has_bank i '+
              '   on (i.tb_bank_id = b.id ) '+
              'where (i.tb_institution_id =:tb_institution_id) '+
              ' and  (b.id =:id) ' );

      ParamByName('tb_institution_id').AsInteger := Institution.Estabelecimento;
      ParamByName('id').AsInteger := Registro.Codigo;
      Active := true;
      FetchAll;
      exist := ( RecordCount > 0 );
      if (exist) then get(Lc_Qry,Registro);
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerBank.getIdByNumber(Number:String): Integer;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      sql.Add('SELECT id '+
              'from tb_bank  ' +
              'where (number =:number) ' );

      ParamByName('number').AsString := Number;
      Active := true;
      FetchAll;
      Result := FieldByName('id').AsInteger;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

end.
