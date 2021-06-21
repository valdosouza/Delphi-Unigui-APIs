unit ControllerBrand;

interface
uses System.Classes, System.SysUtils,BaseController,prm_brand,Rest.Json,
      tblBrand, tblInstitutionHasPaymentTypes, FireDAC.Comp.Client,ObjBrand,
      FireDAC.Stan.Param, tblInstitutionHasBrand, TypesCollection;

Type

  TControllerBrand = Class(TBaseController)

    procedure clear;
  private

  public
    Registro : TBrand;
    Institution : TInstitutionHasBrand;
    Lista : TListBrand;
    Parametro : TPrmBrand;
    Obj : TObjBrand;
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
    procedure assign(ObjOri : TBrand);
    function saveDataObjeto(DObj : TObjBrand):Boolean;
  End;

implementation

{ ControllerBrand }

function TControllerBrand.activeRegiter: Boolean;
begin
  with Institution do
  Begin
    if (Registro.Codigo > 0) then
    Begin
      //Estabelecimento := Deve ser preenchido pelo interface
      CodigoMarca := Registro.Codigo;
      Ativo := 'S';
    End;
  End;
  SaveObj(Institution);
end;

procedure TControllerBrand.assign(ObjOri: TBrand);
begin
  _assign(ObjOri,Registro);
end;

procedure TControllerBrand.clear;
begin
  clearObj(Registro);
end;

constructor TControllerBrand.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TBrand.Create;
  Institution := TInstitutionHasBrand.Create;
  Lista     := TListBrand.create;
  Parametro := TPrmBrand.create;
  Obj := TObjBrand.create;
end;

function TControllerBrand.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerBrand.desactiveRegiter: Boolean;
begin
  with Institution do
  Begin
    if (Registro.Codigo > 0) then
    Begin
      //Estabelecimento := Deve ser preenchido pelo interface
      CodigoMarca := Registro.Codigo;
      Ativo := 'N';
    End;
  End;
  SaveObj(Institution);
end;

destructor TControllerBrand.Destroy;
begin
  Parametro.Destroy;
  Institution.DisposeOf;
  Registro.DisposeOf;
  Lista.DisposeOf;
  Obj.Destroy;
  inherited;
end;


function TControllerBrand.insert: boolean;
begin
  try
    Registro.Codigo := getNextByField(Registro,'id',0);
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerBrand.saveByDescription:boolean;
Var
  Lc_Qry : TFDQuery;
begin
  try
    Try
      Lc_Qry := createQuery;
      with Lc_Qry do
      Begin
        sql.Clear;
        sql.Add('SELECT id from tb_brand where description =:description');
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
      End;
    Finally
      FinalizaQuery(Lc_Qry);
    End;
    //Vincula a forma de pagamento ao Estabelecimento
    SaveInstitution;
    Result := true;
  except
    Result := False;
  end;

End;

function TControllerBrand.saveDataObjeto(DObj: TObjBrand): Boolean;
begin
  try
    ClonarObj(DObj.Marca, Registro);
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

function TControllerBrand.save: boolean;
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

procedure TControllerBrand.getbyKey;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      sql.Add('SELECT b.*, i.tb_institution_id,  i.active '+
              'from tb_brand b ' +
              '  inner join tb_institution_has_brand i '+
              '   on (i.tb_brand_id = b.id ) '+
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


procedure TControllerBrand.getList;
var
  Lc_Qry : TFDQuery;
  LITem : TBrand;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT b.*, ihb.*                                ',
                     'FROM tb_brand b                                ',
                     '  inner join tb_institution_has_brand ihb      ',
                     '  on (ihb.tb_brand_id = b.id )                 ',
                     'where ( ihb.tb_institution_id =:institution_id )   '
      ));

      //Incrementa SQL
      if Trim(Parametro.UltimaAtualizacao) <> '' then
      Begin
        sql.add(' AND ( ihb.updated_at >:updated_at ) ');
        sql.add(' order by ihb.updated_at asc ');
      End
      else
      Begin
        sql.add(' ORDER BY b.id  asc ');
      End;


      //Passagem de parametros
      parambyname('institution_id').AsInteger := Parametro.Estabelecimento;

      if Trim(Parametro.UltimaAtualizacao) <> '' then
        parambyname('updated_at').AsString := Parametro.UltimaAtualizacao;

      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TBrand.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

procedure TControllerBrand.SaveInstitution;
begin
  Institution.CodigoMarca := Registro.Codigo;
  SaveObj(Institution);
end;

procedure TControllerBrand.setParametro(par: String);
begin
  try
    Parametro := TPrmBrand.Create;
    if par <> '' then
    Begin
      Parametro:= TJson.JsonToObject<TPrmBrand>(par);
    //Tratar Data
      Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);
    End;
  Except
    Parametro.UltimaAtualizacao := '1900-01-01 01:00:00'
  end;

end;

end.
