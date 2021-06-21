unit ControllerCustomer;

interface
uses System.Classes, System.SysUtils,BaseController,REST.json,
      tblCustomer, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerAddress,ControllerCompany,ControllerPerson,ControllerEntity, ControllerSalesMan,
      ControllerEntityFiscal, list_spl_customer,TypesListCollection,
    TypesCollection, prm_customer,objCustomer, tblPhone, tblAddress, tblMailing,ObjEntityFiscal,
  tblSocialMedia, tblPerson, tblCompany,System.Generics.Collections,TypesObjectsCollection;

Type


  TControllerCustomer = Class(TBaseController)

    procedure clear;
  private
    TipoPessoa:String;

  protected


  public
    Registro : TCustomer;
    Fiscal : TControllerEntityFiscal;
    Vendedor : TControllerSalesMan;
    ListaObj : TListObjCustomer;
    Lista : TListCustomer;
    ListSpl : TCollSplCustomer;
    Obj : TObjCustomer;
    Parametro : TPrmCustomer;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure setParametro(par:String);
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function getAllByKey:boolean;
    procedure getListSpl;Virtual;

    procedure getlist;

    procedure getListObjCustomer;
    function saveDataObjeto( DObj: TObjCustomer ):Boolean;Virtual;
    procedure fillDataObjeto(pCustomer:TCustomer;pObj:TObjCustomer);
    procedure assign(Source,Destiny: TCustomer);
    procedure clonarObj(Source,Destiny:TObjCustomer);
  End;

implementation

{ ControllerCustomer }

procedure TControllerCustomer.assign(Source,Destiny: TCustomer);
begin
  _assign(Source,Destiny);
end;


procedure TControllerCustomer.clear;
begin
  clearObj(Registro);
end;

procedure TControllerCustomer.clonarObj(Source, Destiny: TObjCustomer);
begin
  Fiscal.clonarObj(Source.Fiscal,Destiny.Fiscal);
  _assign(Source.Cliente, Destiny.Cliente);
end;

constructor TControllerCustomer.Create(AOwner: TComponent);
begin
  inherited;
  Registro  := TCustomer.Create;
  Fiscal    := TControllerEntityFiscal.Create( Self );
  ListaObj  := TListObjCustomer.Create;
  Lista     := TListCustomer.Create;
  ListSpl   := TCollSplCustomer.Create;
  Vendedor  := TControllerSalesMan.Create( Self );
  Obj       := TObjCustomer.Create;
  Parametro := TPrmCustomer.create;
end;

function TControllerCustomer.delete: boolean;
begin
  inherited;
end;

destructor TControllerCustomer.Destroy;
begin
  Parametro.Destroy;
  Obj.Destroy;
  Fiscal.Destroy;
  Registro.DisposeOf;
  ListaObj.DisposeOf;
  ListSpl.DisposeOf;
  Lista.DisposeOf;
  Vendedor.DisposeOf;
  inherited;
end;

procedure TControllerCustomer.fillDataObjeto(pCustomer: TCustomer;pObj:TObjCustomer );
Var
  LcPhone : TPhone;
  LcAddress : TAddress;

begin
  pObj.clear;
  pObj.Estabelecimento := pCustomer.Estabelecimento;

  Self.Fiscal.Registro.Codigo := pCustomer.Codigo;
  Self.Fiscal.getByKey;
  if Self.Fiscal.exist then
  BEgin
    _assign( Self.Fiscal.Registro, pObj.Fiscal.Entidade.Entidade);

    if Trim( Self.Fiscal.Fisica.Registro.CPF ) <> '' then
      _assign( Self.Fiscal.Fisica.Registro, pObj.Fiscal.Fisica )
    else
      _assign( Self.Fiscal.Juridica.Registro, pObj.Fiscal.Juridica);

    Self.Fiscal.Endereco.Registro.Codigo := pCustomer.Codigo;
    Self.Fiscal.Endereco.Registro.Tipo  := 'COMERCIAL';
    Self.Fiscal.Endereco.getbykey;
    if Self.Fiscal.Endereco.exist then
    Begin
      LcAddress := TAddress.Create;
      _assign(Self.Fiscal.Endereco.Registro,LcAddress);
      pObj.Fiscal.Entidade.ListaEndereco.Add(LcAddress);
    End;

    Self.Fiscal.Telefone.Registro.Codigo := pCustomer.Codigo;
    Self.Fiscal.Telefone.Registro.Tipo := 'Fone';
    Self.Fiscal.Telefone.getByKey;
    if Fiscal.Telefone.exist then
    BEgin
      LcPhone := TPhone.Create;
      _assign(Self.Fiscal.Telefone.Registro,LcPhone);
      pObj.Fiscal.Entidade.ListaFones.Add(LcPhone);
    End;

    Self.Fiscal.Telefone.Registro.Codigo := pCustomer.Codigo;
    Self.Fiscal.Telefone.Registro.Tipo := 'Fax';
    Self.Fiscal.Telefone.getByKey;
    if Self.Fiscal.Telefone.exist then
    BEgin
      LcPhone := TPhone.Create;
      _assign(Self.Fiscal.Telefone.Registro,LcPhone);
      pObj.Fiscal.Entidade.ListaFones.Add(LcPhone);
    End;

    Self.Fiscal.Telefone.Registro.Codigo := pCustomer.Codigo;
    Self.Fiscal.Telefone.Registro.Tipo := 'Celular';
    Self.Fiscal.Telefone.getByKey;
    if Fiscal.Telefone.exist then
    BEgin
      LcPhone := TPhone.Create;
      _assign(Self.Fiscal.Telefone.Registro,LcPhone);
      pObj.Fiscal.Entidade.ListaFones.Add(LcPhone);
    End;

    //email
    Self.Fiscal.Email.Registro.Codigo := pCustomer.Codigo;
    Self.Fiscal.Email.getbyKind( Self.Registro.Codigo ,'principal');
    if Self.Fiscal.Email.exist then
      _assign(Fiscal.email.Registro, pObj.Fiscal.Entidade.Email) ;

    //Social Midia
    Self.Fiscal.MidiaSocial.Registro.Codigo :=  pCustomer.Codigo;
    Self.Fiscal.MidiaSocial.Registro.Tipo := 'www';
    Self.Fiscal.MidiaSocial.getByKey;
    if Self.Fiscal.MidiaSocial.exist then
      _assign( Self.Fiscal.MidiaSocial.Registro, pObj.Fiscal.Entidade.MidiaSocial );

    _assign( pCustomer, pObj.Cliente) ;
  End;
end;


function TControllerCustomer.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerCustomer.saveDataObjeto(DObj: TObjCustomer ): Boolean;
Var
  I : Integer;
begin
  Try
    Fiscal.saveDataObjeto(DObj.Fiscal);
    //Salvar Cliente
    DObj.Cliente.Codigo := DObj.Fiscal.Entidade.Entidade.Codigo;//Codigo atualizado no Fiscal.saveDataObjeto;
    _assign( DObj.Cliente, self.Registro );

    //Registra o codigo do vendedor utilizando o CPF/CNPJ
    if Length(DObj.DocFiscalVendedor)> 0 then
    Begin
      if Length(DObj.DocFiscalVendedor) = 11 then
        self.Registro.Vendedor := Vendedor.Colaborador.Fiscal.Fisica.getIDbyCPF(DObj.DocFiscalVendedor)
      else
        self.Registro.Vendedor := Vendedor.Colaborador.Fiscal.Juridica.getIDbyCNPJ(DObj.DocFiscalVendedor);
    End;
    Self.save;
    //Reposiciona os codigo de cliente e vendedor
    DObj.Cliente.Codigo   := self.Registro.Codigo;
    Result := true;
  except
    Result := False;
  end;
end;


procedure TControllerCustomer.setParametro(par: String);
begin
  try
    Parametro := TPrmCustomer.Create;
    Parametro:= TJson.JsonToObject<TPrmCustomer>(par);
  //Tratar Data
    Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);
  Except
    Parametro.UltimaAtualizacao := '1900-01-01 01:00:00'
  end;
end;

function TControllerCustomer.getAllByKey: boolean;
begin
  getByKey;
  Fiscal.Registro.Codigo := Registro.Codigo;
  Fiscal.getAllByKey;
end;


function TControllerCustomer.getByKey: Boolean;
begin
  _getByKey(Registro);
end;


procedure TControllerCustomer.getList;
var
  Lc_Qry : TFDQuery;
  LITem : TCustomer;
begin
  try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat(
                'SELECT c.* ',
                'FROM tb_customer c ',
                '   inner join tb_entity e ',
                '   on (c.id = e.id) ',
                '   inner join tb_person p ',
                '   on (p.id = e.id) ',
                'where (c.id > 0) ',
                'and (c.tb_institution_id =:institution_id) ',
                'and (p.cpf <>'''') and (p.cpf is not null) '
      ));
      //Incrementa SQL - Inner


      //Incrementa SQL - Where
      if Parametro.Cliente.Vendedor > 0 then
        sql.add(' and ( c.tb_salesman_id=:tb_salesman_id ) ');

      if Trim(Parametro.UltimaAtualizacao) <> '' then
        sql.add(' AND ( c.updated_at >:updated_at ) ');

      //Incrementa SQL - Union
      sql.add(concat(
                'union ',
                'SELECT c.* ',
                'FROM tb_customer c ',
                '   inner join tb_entity e ',
                '   on (c.id = e.id) ',
                '   inner join tb_company j ',
                '   on (j.id = e.id) ',
                'where (c.id > 0) ',
                'and (c.tb_institution_id =:institution_id) ',
                'and (j.cnpj <>'''') and (j.cnpj is not null) '
      ));
      //Incrementa SQL - Inner


      //Incrementa SQL - Where
      if Parametro.Cliente.Vendedor > 0 then
        sql.add(' and ( c.tb_salesman_id=:tb_salesman_id ) ');

      if Trim(Parametro.UltimaAtualizacao) <> '' then
        sql.add(' AND ( c.updated_at >:updated_at ) ');


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

      //Passagem de parametros
      if Parametro.Cliente.Vendedor > 0 then
        parambyname('tb_salesman_id').AsInteger := Parametro.Cliente.Vendedor;

      if Trim(Parametro.UltimaAtualizacao) <> '' then
        parambyname('updated_at').AsString := Parametro.UltimaAtualizacao;

      ParamByName('institution_id').AsInteger := Parametro.Cliente.Estabelecimento;

      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TCustomer.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;

end;

procedure TControllerCustomer.getListObjCustomer;
Var
  I : Integer;
  LcObj :TObjCustomer;
begin
  ListaObj.Clear;
  for I := 0 to (Lista.Count - 1)do
  Begin
    //Criar objto para dar append na lista garante que não dará erro ao destruir o componente
    LcObj := TObjCustomer.Create;
    fillDataObjeto(Lista[I], LcObj);
    ListaObj.Add( LcObj );
  End;
end;

procedure TControllerCustomer.getListSpl;
Var
  Lc_Qry :TFDQuery;
  item : TListSplCustomer;
begin
  Try
    Lc_Qry := createQuery;
    item := TListSplCustomer.Create;
    with Lc_Qry,Parametro do
    Begin
      sql.Clear;
      sql.Add(concat(
            'SELECT distinct ct.id, et.name_company,et.nick_trade, ',
            'ad.street, ad.nmbr, ad.neighborhood, ad.kind ',
            'FROM tb_customer ct ',
            '  INNER JOIN tb_entity et ',
            '  on (ct.id = et.id) ',
            '  inner join tb_address ad ',
            '  on (ad.id = et.id) ',
            'where ( ( ct.tb_salesman_id =:salesman_id ) ',
            '    and ( ct.tb_institution_id =:institution_id) ) '
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
      ParamByName('institution_id').AsInteger := Parametro.cliente.Estabelecimento;

      ParamByName('salesman_id').AsInteger := Parametro.Cliente.Vendedor;

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
        item := TListSplCustomer.Create;
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


function TControllerCustomer.insert: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.

