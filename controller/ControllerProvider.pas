unit ControllerProvider;

interface
uses System.Classes, System.SysUtils,BaseController,REST.json,
      tblProvider, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerEntityFiscal, ControllerCompany, ControllerPerson,
      ObjProvider, prm_provider, TypesCollection,TypesObjectsCollection,
  tblPhone, tblAddress,list_spl_provider,TypesListCollection;

Type
  TControllerProvider = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TProvider;
    Fiscal : TControllerEntityFiscal;
    Parametro : TPrmprovider;
    Obj : TObjProvider;
    Lista : TListProvider;
    ListaObj : TListObjProvider;
    ListSpl : TCollSplProvider;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function getAllByKey:boolean;
    function saveDataObjeto( DObj: TObjProvider ):Boolean;Virtual;
    procedure fillDataObjeto(pProvider:TProvider;pObj:TObjProvider);
    procedure setParametro(par:String);
    procedure getlist;
    procedure getListObjProvider;
    procedure getListSpl;Virtual;
  End;

implementation

{ ControllerProvider }

procedure TControllerProvider.clear;
begin
  clearObj(Registro);
end;

constructor TControllerProvider.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TProvider.Create;
  Fiscal := TControllerEntityFiscal.Create(nil);
  Parametro := TPrmProvider.create;
  Obj := TObjProvider.Create;
  Lista := TListProvider.create;
  ListaObj := TListObjProvider.Create;
  ListSpl := TCollSplProvider.Create;
end;

function TControllerProvider.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerProvider.Destroy;
begin
  ListSpl.DisposeOf;
  ListaObj.DisposeOf;
  Lista.DisposeOf;
  Fiscal.Destroy;
  Registro.DisposeOf;
  inherited;
end;


procedure TControllerProvider.fillDataObjeto(pProvider: TProvider;
  pObj: TObjProvider);
Var
  LcPhone : TPhone;
  LcAddress : TAddress;

begin
  pObj.clear;
  pObj.Estabelecimento := pProvider.Estabelecimento;

  Self.Fiscal.Registro.Codigo := pProvider.Codigo;
  Self.Fiscal.getByKey;
  if Self.Fiscal.exist then
  BEgin
    _assign( Self.Fiscal.Registro, pObj.Fiscal.Entidade.Entidade);

    if Trim( Self.Fiscal.Fisica.Registro.CPF ) <> '' then
      _assign( Self.Fiscal.Fisica.Registro, pObj.Fiscal.Fisica )
    else
      _assign( Self.Fiscal.Juridica.Registro, pObj.Fiscal.Juridica);


    Self.Fiscal.Endereco.Registro.Codigo := pProvider.Codigo;
    Self.Fiscal.Endereco.Registro.Tipo  := 'COMERCIAL';
    Self.Fiscal.Endereco.getbykey;
    if Self.Fiscal.Endereco.exist then
    Begin
      LcAddress := TAddress.Create;
      _assign(Self.Fiscal.Endereco.Registro,LcAddress);
      pObj.Fiscal.Entidade.ListaEndereco.Add(LcAddress);
    End;

    Self.Fiscal.Telefone.Registro.Codigo := pProvider.Codigo;
    Self.Fiscal.Telefone.Registro.Tipo := 'Fone';
    Self.Fiscal.Telefone.getByKey;
    if Fiscal.Telefone.exist then
    BEgin
      LcPhone := TPhone.Create;
      _assign(Self.Fiscal.Telefone.Registro,LcPhone);
      pObj.Fiscal.Entidade.ListaFones.Add(LcPhone);
    End;

    Self.Fiscal.Telefone.Registro.Codigo := pProvider.Codigo;
    Self.Fiscal.Telefone.Registro.Tipo := 'Fax';
    Self.Fiscal.Telefone.getByKey;
    if Self.Fiscal.Telefone.exist then
    BEgin
      LcPhone := TPhone.Create;
      _assign(Self.Fiscal.Telefone.Registro,LcPhone);
      pObj.Fiscal.Entidade.ListaFones.Add(LcPhone);
    End;

    Self.Fiscal.Telefone.Registro.Codigo := pProvider.Codigo;
    Self.Fiscal.Telefone.Registro.Tipo := 'Celular';
    Self.Fiscal.Telefone.getByKey;
    if Fiscal.Telefone.exist then
    BEgin
      LcPhone := TPhone.Create;
      _assign(Self.Fiscal.Telefone.Registro,LcPhone);
      pObj.Fiscal.Entidade.ListaFones.Add(LcPhone);
    End;

    //email
    Self.Fiscal.Email.Registro.Codigo := pProvider.Codigo;
    Self.Fiscal.Email.getbyKind( Self.Registro.Codigo ,'principal');
    if Self.Fiscal.Email.exist then
      _assign(Fiscal.email.Registro, pObj.Fiscal.Entidade.Email) ;

    //Social Midia
    Self.Fiscal.MidiaSocial.Registro.Codigo :=  pProvider.Codigo;
    Self.Fiscal.MidiaSocial.Registro.Tipo := 'www';
    Self.Fiscal.MidiaSocial.getByKey;
    if Self.Fiscal.MidiaSocial.exist then
      _assign( Self.Fiscal.MidiaSocial.Registro, pObj.Fiscal.Entidade.MidiaSocial );

    _assign( pProvider, pObj.Fornecedor) ;
  End;

end;

function TControllerProvider.insert: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerProvider.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;


end;

function TControllerProvider.saveDataObjeto(DObj: TObjProvider): Boolean;
Var
  I : Integer;
begin
  Fiscal.saveDataObjeto( DObj.Fiscal );
  //Salvar Fornecedor
  ClonarObj(DObj.Fornecedor, self.Registro );

  self.Registro.codigo := DObj.Fiscal.Entidade.Entidade.Codigo;//Codigo atualizado no Fiscal.saveDataObjeto;
  Self.save;
  //Reposiciona os codigo de cliente e vendedor
  DObj.Fornecedor.Codigo   := self.Registro.Codigo;
end;

procedure TControllerProvider.setParametro(par: String);
begin
  try
    Parametro := TPrmProvider.Create;
    Parametro:= TJson.JsonToObject<TPrmProvider>(par);
  //Tratar Data
    Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);
  Except
    Parametro.UltimaAtualizacao := '1900-01-01 01:00:00'
  end;

end;

function TControllerProvider.getAllByKey: boolean;
begin
  getByKey;
  Fiscal.Registro.Codigo := Registro.Codigo;
  Fiscal.getAllByKey;
end;

function TControllerProvider.getByKey: Boolean;
begin
  _getByKey(Registro);
  Fiscal.Registro.Codigo := Self.Registro.Codigo;
  Fiscal.getByKey;
end;

procedure TControllerProvider.getlist;
var
  Lc_Qry : TFDQuery;
  LITem : TProvider;
begin
  try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat(
                'SELECT f.* ',
                'FROM tb_provider f ',
                '   inner join tb_entity e ',
                '   on (f.id = e.id) ',
                '   inner join tb_person p ',
                '   on (p.id = e.id) ',
                'where (f.id > 0) ',
                'and (f.tb_institution_id =:institution_id) ',
                'and (p.cpf <>'''') and (p.cpf is not null) '
      ));
      //Incrementa SQL - Inner

      if Trim(Parametro.UltimaAtualizacao) <> '' then
        sql.add(' AND ( f.updated_at >:updated_at ) ');

      //Incrementa SQL - Union
      sql.add(concat(
                'union ',
                'SELECT f.* ',
                'FROM tb_provider f ',
                '   inner join tb_entity e ',
                '   on (f.id = e.id) ',
                '   inner join tb_company j ',
                '   on (j.id = e.id) ',
                'where (f.id > 0) ',
                'and (f.tb_institution_id =:institution_id) ',
                'and (j.cnpj <>'''') and (j.cnpj is not null) '
      ));
      //Incrementa SQL - Inner
      if Trim(Parametro.UltimaAtualizacao) <> '' then
        sql.add(' AND ( f.updated_at >:updated_at ) ');


      //Incrementa SQL - Order By
      if Trim(Parametro.UltimaAtualizacao) <> '' then
      Begin
        sql.add(' order by updated_at asc ');
      End
      else
      Begin
        sql.add(' ORDER BY id asc ');
      End;


      //Incrementa SQL - Limit
      if ( Parametro.Limite <> '0' ) and ( Parametro.Limite <> '') then
        sql.add(concat(' limit 0, ',Parametro.Limite));

      if Trim(Parametro.UltimaAtualizacao) <> '' then
        parambyname('updated_at').AsString := Parametro.UltimaAtualizacao;

      ParamByName('institution_id').AsInteger := Parametro.Fornecedor.Estabelecimento;

      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TProvider.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;


end;

procedure TControllerProvider.getListObjProvider;
Var
  I : Integer;
  LcObj :TObjProvider;
begin
  ListaObj.Clear;
  for I := 0 to (Lista.Count - 1)do
  Begin
    //Criar objto para dar append na lista garante que não dará erro ao destruir o componente
    LcObj := TObjProvider.Create;
    fillDataObjeto(Lista[I], LcObj);
    ListaObj.Add( LcObj );
  End;
end;

procedure TControllerProvider.getListSpl;
Var
  Lc_Qry :TFDQuery;
  item : TListSplProvider;
begin
  Try
    Lc_Qry := createQuery;
    item := TListSplProvider.Create;
    with Lc_Qry,Parametro do
    Begin
      sql.Clear;
      sql.Add(concat(
            'SELECT distinct pd.id, et.name_company,et.nick_trade, ',
            'ad.street, ad.nmbr, ad.neighborhood, ad.kind ',
            'FROM tb_provider pd ',
            '  INNER JOIN tb_entity et ',
            '  on (pd.id = et.id) ',
            '  inner join tb_address ad ',
            '  on (ad.id = et.id) ',
            'where  ( pd.tb_institution_id =:institution_id)  '
          ));
      //Incrmenta o sql
      if Parametro.Entidade.NomeRazao <> '' then
        sql.Add(' and ( et.name_company like :name) ');

      if Parametro.Entidade.ApelidoFantasia <> '' then
        sql.Add(' and (et.nick_trade like :nick) ');

      if Parametro.Endereco.Logradouro <> '' then
        sql.Add(' and (ad.street like :street) ');

      sql.Add(concat('Limit ', InttoStr( (Pagina * 20 ) - 20 ),',', InttoStr( (Pagina * 20 ) ) ));
      //passagem de PArametros
      ParamByName('institution_id').AsInteger := Parametro.Fornecedor.Estabelecimento;

      if Parametro.Entidade.NomeRazao <> '' then
        ParamByName('name').AsString := concat('%',Parametro.Entidade.NomeRazao,'%');

      if Parametro.Entidade.ApelidoFantasia <> '' then
        ParamByName('nick').AsString := concat('%',Parametro.Entidade.ApelidoFantasia,'%');

      if Parametro.Endereco.Logradouro <> '' then
        ParamByName('street').AsString := concat('%',Parametro.Endereco.Logradouro,'%');

      Active := True;
      FetchAll;
      First;
      while not eof do
      Begin
        item := TListSplProvider.Create;
        item.Codigo          := FieldByName('id').AsInteger;
        item.NomeRazao       := FieldByName('name_company').AsString;
        item.ApelidoFantasia := FieldByName('nick_trade').AsString;
        item.Logradouro      := FieldByName('street').AsString;
        item.NumeroPredial   := FieldByName('nmbr').AsString;
        item.Bairro          := FieldByName('neighborhood').AsString;
        item.TipoEndereco    := FieldByName('kind').AsString;
        //add lista
        ListSpl.Add(item);
        Next;
      End;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

end.
