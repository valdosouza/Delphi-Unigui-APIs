unit ControllerCategory;


interface
uses System.Classes, System.SysUtils,BaseController,Rest.json,prm_category,
      tblCategory,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
       System.Generics.Defaults, System.Generics.Collections, TypesCollection;

Type

  TControllerCategory = Class(TBaseController)

    procedure clear;
  private

  public
    Registro : TCategory;
    Lista: TListCategory;
    Parametro : TPrmCategory;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure setParametro(par:String);
    function save:boolean;
    procedure getAll;
    procedure OrderLista;
    procedure updateLista;
    function insert:boolean;
    procedure setLevelPosition;
    function deleteByLevel:Boolean;
    function getByKey:Boolean;
    function getGroup:Boolean;
    procedure getList;
    procedure assign(ObjOri : TCategory);
  End;

implementation

{ ControllerCategory }

uses UnFunctions;


procedure TControllerCategory.assign(ObjOri: TCategory);
begin
  _assign(ObjOri,Registro);
end;

procedure TControllerCategory.clear;
begin
  clearObj(Registro);
end;

constructor TControllerCategory.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TCategory.Create;
  Lista := TListCategory.Create;
  Parametro := TPrmCategory.Create;
end;

function TControllerCategory.deleteByLevel: Boolean;
Var
  Qry : TFDQuery;
Begin
  Qry := createQuery;
  with Qry do
  Begin
    sql.add('DELETE  '+
            'FROM tb_category '+
            'WHERE ( tb_institution_id =:tb_institution_id ) '+
            ' and (posit_level like :posit_level) ');

    ParamByName('tb_institution_id').AsInteger  := Parametro.Categoria.Estabelecimento;
    ParamByName('posit_level').AsString         := Parametro.Categoria.NivelPosicao + '%';
    ExecSQL;
  End;
  Qry.Close;
  FreeAndNil(Qry);
end;

destructor TControllerCategory.Destroy;
begin
  Parametro.Destroy;
  Registro.DisposeOf;
  Lista.DisposeOf;
  inherited;
end;


function TControllerCategory.insert: boolean;
begin
  Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerCategory.save: boolean;
begin
  if Registro.Codigo = 0 then
  Begin
    Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
    setLevelPosition;
  End;
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

procedure TControllerCategory.setLevelPosition;
Var
  Lc_Nivel : String;
Begin
  Lc_Nivel := StrZero( Registro.Codigo,3,0);
  if  Trim( Registro.NivelPosicao) ='' then
    Registro.NivelPosicao := Lc_Nivel
  else
    Registro.NivelPosicao := Registro.NivelPosicao  + '.' + Lc_Nivel;
end;

procedure TControllerCategory.setParametro(par: String);
begin
  try
    Parametro := TPrmCategory.Create;
    Parametro:= TJson.JsonToObject<TPrmCategory>(par);
  //Tratar Data
    Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);
  Except
    Parametro.UltimaAtualizacao := '1900-01-01 01:00:00'
  end;
end;

procedure TControllerCategory.updateLista;
Var
  I : Integer;
  lcategory : TCategory;

Begin
  for I := 0 to Self.Lista.Count - 1  do
  Begin
    if ( registro.Codigo = TCategory( Self.Lista.Items[I]).Codigo ) then
    Begin
      lcategory  := TCategory.Create;
      lcategory := TCategory( Self.Lista[I] );
      break;
    End;
  End;
  if ( lcategory.Codigo = 0 ) then
    lista.Add(lcategory);
end;

procedure TControllerCategory.OrderLista;
var
  comparison: TComparison<TCategory>;
  delegateComparer: TDelegatedComparer<TCategory>;
begin
  // método anonimo para ordenação crescente por ID
  comparison := function (const P1, P2: TCategory): Integer
    begin
      Result := CompareText(P1.NivelPosicao, P2.NivelPosicao);
    end;

  // método anonimo para ordenação decrescente por ID
  { comparison := function (const P1, P2: TPessoa): Integer
    begin
      Result := - CompareText(P1.Id, P2.Id);
    end; }

  // classe que implementa TComparer<T> e facilita o uso.
  // passe o método de comparação para o delegate!
  delegateComparer := TDelegatedComparer<TCategory>.Create(comparison);
  try
    // Usando método Sort da nossa lista passando nosso "ordenador"
    Lista.Sort(delegateComparer);
  finally
    delegateComparer.Free;
  end;
end;



procedure TControllerCategory.getAll;
var
  Qry : TFDQuery;
  lCategory : TCategory;
begin
  Qry := createQuery;
  with Qry do
  Begin
    sql.add('SELECT * '+
            'FROM tb_category '+
            'WHERE tb_institution_id =:tb_institution_id '+
            ' ORDER BY posit_level ');

    ParamByName('tb_institution_id').AsInteger := Parametro.Categoria.Estabelecimento;
    Active := True;
    FetchAll;
    First;
    Lista.Clear;
    while not eof do
    Begin
      lCategory := TCategory.Create;
      with lCategory do
      Begin
        Codigo            := FieldByName('id').AsInteger;
        Estabelecimento   := FieldByName('tb_institution_id').asInteger;
        Descricao         := FieldByName('description').asString;
        Ativo             := FieldByName('active').asString;
        NivelPosicao      := FieldByName('posit_level').asString;
        Tipo              := FieldByName('kind').asString;
        RegistroCriado    := FieldByName('created_at').AsDateTime;
        RegistroAlterado  := FieldByName('updated_at').AsDateTime;
      end;
      Lista.add(lCategory);
      next;
    end;
    Close;
  end;
  FreeAndNil(Qry);
end;

function TControllerCategory.getByKey: Boolean;
begin
  Registro.Codigo          := Parametro.Categoria.Codigo;
  Registro.Estabelecimento := Parametro.Categoria.Estabelecimento;
  _getByKey(Registro);
end;

function TControllerCategory.getGroup: Boolean;
var
  Qry : TFDQuery;
  LITem : TCategory;
begin
  getByKey;
  if exist then
  Begin
    Try
      Qry := createQuery;
      with Qry do
      Begin
        sql.add(concat('SELECT *                                     ',
                        'FROM tb_category                            ',
                       'where ( tb_institution_id =:institution_id ) '
        ));
        //Passagem de parametros
        parambyname('institution_id').AsInteger := Parametro.Categoria.Estabelecimento;

        if (Parametro.Categoria.Codigo > 0 ) then
          sql.add(' AND ( id=:id )');

        if (Parametro.Categoria.NivelPosicao <> '' ) then
          sql.add(' AND ( ( posit_level =:one_level ) or (posit_level =:posit_level ) )');

        if (Parametro.Categoria.Codigo >0 ) then
        Begin
          parambyname('id').AsInteger := Parametro.Categoria.Codigo;
        End;

        if (Parametro.Categoria.NivelPosicao <> '' ) then
        Begin
          parambyname('one_level').AsString := Copy(Parametro.Categoria.NivelPosicao,1,3);
          parambyname('posit_level').AsString := Parametro.Categoria.NivelPosicao;
        End;

        Active := True;
        FetchAll;
        exist := RecordCount > 0;
        First;
        Lista.Clear;
        while not eof do
        Begin
          LITem := TCategory.Create;
          get(Qry,LITem);
          Lista.add(LITem);
          next;
        end;
      end;
    Finally
      Qry.Close;
      FreeAndNil(Qry);
    End;
  End;
end;

procedure TControllerCategory.getList;
var
  Qry : TFDQuery;
  LITem : TCategory;
begin
  Try
    Qry := createQuery;
    with Qry do
    Begin
      sql.add(concat('SELECT *                                     ',
                      'FROM tb_category                            ',
                     'where ( tb_institution_id =:institution_id ) '
      ));

      //Incrementa SQL
      if Trim(Parametro.UltimaAtualizacao) <> '' then
      Begin
        sql.add(' AND ( updated_at >:updated_at ) ');
        sql.add(' order by updated_at asc ');
      End
      else
      Begin
        sql.add(' ORDER BY id  asc ');
      End;


      //Passagem de parametros
      parambyname('institution_id').AsInteger := Parametro.Categoria.Estabelecimento;

      if Trim(Parametro.UltimaAtualizacao) <> '' then
        parambyname('updated_at').AsString := Parametro.UltimaAtualizacao;

      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TCategory.Create;
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


end.

