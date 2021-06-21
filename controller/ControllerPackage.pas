unit ControllerPackage;

interface
uses System.Classes, System.SysUtils,BaseController,prm_package,ObjPackage,
      tblPackage, tblInstitutionHasPaymentTypes, FireDAC.Comp.Client,REST.json,
      FireDAC.Stan.Param, tblInstitutionHasPackage, TypesCollection;

Type
  TControllerPackage = Class(TBaseController)

    procedure clear;
  private

  public
    Registro : TPackage;
    Institution : TInstitutionHasPackage;
    Lista : TListPackage;
    Obj : TObjPackage;
    Parametro : TPrmPackage;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure setParametro(par:String);
    function save:boolean;
    function saveByDescription:boolean;
    procedure getbyKey;
    function insert:boolean;
    Function delete:boolean;
    Function activeRegiter:Boolean;
    Function desactiveRegiter:Boolean;
    procedure SaveInstitution;
    procedure getList;
    procedure assign(ObjOri : TPackage);
    function saveDataObjeto(DObj : TObjPackage):Boolean;
  End;

implementation

{ ControllerPackage }

function TControllerPackage.activeRegiter: Boolean;
begin
  with Institution do
  Begin
    if (Registro.Codigo > 0) then
    Begin
      //Estabelecimento := Deve ser preenchido pelo interface
      CodigoEmbalagem := Registro.Codigo;
      Ativo := 'S';
    End;
  End;
  SaveObj(Institution);
end;

procedure TControllerPackage.assign(ObjOri: TPackage);
begin
  _assign(ObjOri,Registro);
end;

procedure TControllerPackage.clear;
begin
  clearObj(Registro);
end;

constructor TControllerPackage.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TPackage.Create;
  Institution := TInstitutionHasPackage.Create;;
  Lista := TListPackage.create;
  Parametro := TPrmPackage.Create;
  Obj := TObjPackage.Create;
end;

function TControllerPackage.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerPackage.desactiveRegiter: Boolean;
begin
  with Institution do
  Begin
    if (Registro.Codigo > 0) then
    Begin
      //Estabelecimento := Deve ser preenchido pelo interface
      CodigoEmbalagem := Registro.Codigo;
      Ativo := 'N';
    End;
  End;
  SaveObj(Institution);
end;

destructor TControllerPackage.Destroy;
begin
  Obj.Destroy;
  Parametro.Destroy;
  Institution.DisposeOf;
  Registro.DisposeOf;
  Lista.DisposeOf;
  inherited;
end;


function TControllerPackage.insert: boolean;
begin
  try
    Registro.Codigo := getNextByField(Registro,'id',0);
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerPackage.saveByDescription:boolean;
Var
  Lc_Qry : TFDQuery;
begin
  try
    Try
      Lc_Qry := createQuery;
      with Lc_Qry do
      Begin
        sql.Clear;
        sql.Add('SELECT id from tb_package where description =:description');
        ParamByName('description').AsString := Registro.Descricao;
        Active := True;
        FetchAll;
        if RecordCount > 0 then
        Begin
          Registro.Codigo := FieldByName('id').AsInteger;
          updateObj(Registro);
        End
        else
        Begin
          Self.insert;
        End;
        Close;
      End;
    Finally
      Lc_Qry.Close;
      FreeAndNil(Lc_Qry);
    End;
    //Vincula a forma de pagamento ao Estabelecimento
    SaveInstitution;
    Result := true;
  except
    Result := False;
  end;

End;

function TControllerPackage.saveDataObjeto(DObj: TObjPackage): Boolean;
begin
  Try
    ClonarObj(DObj.Embalagem, Registro);
    //Colocar zero para que a gravação aconteça pela descrição
    Registro.Codigo := 0;
    Institution.Estabelecimento := DObj.Estabelecimento;
    Institution.Ativo := 'S';
    save;
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerPackage.save: boolean;
begin
  try
    if Registro.Codigo > 0 then
     SaveObj(Registro)
    else
      saveByDescription;
    Result := true;
  except
    Result := False;
  end;
end;

procedure TControllerPackage.getbyKey;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      sql.Add('SELECT p.*, i.tb_institution_id,  i.active '+
              'from tb_package p ' +
              '  inner join tb_institution_has_Package i '+
              '   on (i.tb_package_id = p.id ) '+
              'where (i.tb_institution_id =:tb_institution_id) '+
              ' and  (p.id =:id) ' );

      ParamByName('tb_institution_id').AsInteger := Institution.Estabelecimento;
      ParamByName('id').AsInteger := Registro.Codigo;
      Active := true;
      FetchAll;
      exist := ( RecordCount > 0 );
      if (exist) then get(Lc_Qry,Registro);
    End;
  Finally
    Lc_Qry.Close;
    FreeAndNil(Lc_Qry);
  End;
end;


procedure TControllerPackage.getList;
var
  Qry : TFDQuery;
  LITem : TPackage;
begin
  Try
    Qry := createQuery;
    with Qry do
    Begin
      sql.add(concat('SELECT                                            ',
                     '   p.description,                                 ',
                     '   p.id,                                          ',
                     '   ihp.updated_at,                                ',
                     '   p.abbreviation,                                ',
                     '   ihp.created_at                                 ',
                     'FROM tb_package p                                ',
                     '  inner join tb_institution_has_package ihp      ',
                     '  on (ihp.tb_package_id = p.id )                 ',
                     'where ( ihp.tb_institution_id =:institution_id ) '
      ));

      //Incrementa SQL
      if Trim( Parametro.UltimaAtualizacao ) <> '' then
      Begin
        sql.add(' AND ( ihp.updated_at >:updated_at ) ');
        sql.add(' order by ihp.updated_at asc ');
      End
      else
      Begin
        sql.add(' ORDER BY p.id  asc ');
      End;
      //Passagem de parametros
      parambyname('institution_id').AsInteger := Parametro.Estabelecimento;

      if Trim( Parametro.UltimaAtualizacao ) <> '' then
        parambyname('updated_at').AsString := Parametro.UltimaAtualizacao;
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TPackage.Create;
        get(Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    Qry.Close;
    FreeAndNil(Qry);
  End;
end;

procedure TControllerPackage.SaveInstitution;
begin
  Institution.CodigoEmbalagem := Registro.Codigo;
  SaveObj(Institution);
end;


procedure TControllerPackage.setParametro(par: String);
begin
  try
    Parametro := TPrmPackage.Create;
    Parametro:= TJson.JsonToObject<TPrmPackage>(par);
  //Tratar Data
    Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);
  Except
    Parametro.UltimaAtualizacao := '1900-01-01 01:00:00'
  end;

end;

end.
