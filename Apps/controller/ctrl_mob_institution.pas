unit ctrl_mob_institution;

interface

uses System.Classes,System.SysUtils, FireDAC.Comp.Client, FireDAC.Stan.Param,
    System.Generics.Collections,REST.Json,System.Json,TypesListCollection,
  uDataCM, ctrl_mob_entity_fiscal, objInstitution,list_spl_institution,
  tblinstitution, ctrl_mob_base,tblPhone,tblAddress,TypesCollection,
  prm_institution;

  Type
  TCtrlMobInstitution = class(TCtrlMobBAse)
    private

    public
      Registro : TInstitution;
      MFiscal : TCtrlMobEntityFiscal;
      ListSpl : TCollSplInstitution;
      Lista :  TListInstitution;
      Parametro : TPrmInstitution;
      Obj :TObjInstitution;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function save:boolean;
      function getByKey:Boolean;
      function getAllByKey:boolean;
      function saveDataObjeto( DObj: TObjInstitution ):Boolean;
      procedure getListSpl(palavra:TStringList);
      procedure assign(Source,Destiny: Tinstitution);
      procedure fillDataObjeto(pCustomer:Tinstitution;pObj:TObjInstitution);
      procedure getList;
      procedure clear;
      function countInstitution:Integer;

  end;

implementation

{ TCtrlMobInstitution }

procedure TCtrlMobInstitution.assign(Source, Destiny: Tinstitution);
begin
  _assign(Source,Destiny);
end;

procedure TCtrlMobInstitution.clear;
begin
  clearObj(Registro)
end;



function TCtrlMobInstitution.countInstitution: Integer;
Var
  Lc_Qry : TFdquery;
begin
   Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add( 'Select * from tb_institution ');
      Active := True;
      FetchAll;
      REsult := RecordCount;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

constructor TCtrlMobInstitution.Create(AOwner: TComponent);
begin
  inherited;
  Registro  := Tinstitution.create;
  MFiscal   := TCtrlMobEntityFiscal.Create(Self);
  Lista     :=  TListInstitution.create;
  ListSpl   := TCollSplInstitution.Create;
  Parametro := TPrmInstitution.Create;
  Obj       := TObjInstitution.Create;
  createTable;

end;

procedure TCtrlMobInstitution.createTable;
begin
  execcmd(concat(
                'CREATE TABLE if not exists  tb_institution ( ',
                '  id int(11) NOT NULL,                       ',
                '  active char(1) DEFAULT NULL,               ',
                '  created_at datetime DEFAULT NULL,          ',
                '  updated_at datetime DEFAULT NULL,          ',
                '  PRIMARY KEY (id))                          '
      ));
end;

destructor TCtrlMobInstitution.Destroy;
begin

  inherited;
end;

procedure TCtrlMobInstitution.fillDataObjeto(pCustomer: Tinstitution;
  pObj: TObjInstitution );
begin

end;

function TCtrlMobInstitution.getAllByKey: boolean;
begin
  getByKey;
  MFiscal.Registro.Codigo := Registro.Codigo;
  MFiscal.getAllByKey;

end;

function TCtrlMobInstitution.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TCtrlMobInstitution.getList;
Var
  Lc_Qry :TFDQuery;
  item : TInstitution;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Clear;
      sql.Add(concat(
            'SELECT * ',
            'FROM tb_institution it ',
            'where (it.id > 0 ) '
          ));

      sql.Add(' order by it.id');
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        item := TInstitution.Create;
        get(Lc_Qry,item);
        Lista.Add(item);
        Next;
      End;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

procedure TCtrlMobInstitution.getListSpl(palavra: TStringList);
Var
  Lc_Qry :TFDQuery;
  item : TListSplInstitution;
  I:Integer;
  LcSqlStr : String;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Clear;
      sql.Add(concat(
            'SELECT distinct it.id, et.name_company,et.nick_trade, ',
            'ad.street, ad.nmbr, ad.neighborhood, ad.kind ',
            'FROM tb_institution it ',
            '  INNER JOIN tb_entity et ',
            '  on (it.id = et.id) ',
            '  inner join tb_address ad ',
            '  on (ad.id = et.id) ',
            'where (it.id > 0 ) '
          ));
      //Incrmenta o sql
      LcSqlStr := ' and ( ';
      if palavra.count > 0 then
      Begin
        for I := 0 to palavra.count -1 do
        Begin
          if I = 0 then
            LcSqlStr := concat(LcSqlStr,' ( et.name_company like :palavra',i.ToString,' ) ')
          else
            LcSqlStr := concat(LcSqlStr,' and ( et.name_company like :palavra',i.ToString,' ) ');
        End;
        LcSqlStr := concat(LcSqlStr,')');
      End;

      if palavra.count > 0 then
      Begin
        LcSqlStr := concat(LcSqlStr, ' or ( ');
        for I := 0 to palavra.count -1 do
        Begin
          if I = 0 then
            LcSqlStr := concat(LcSqlStr,' ( et.nick_trade like :palavra',i.ToString,' ) ')
          else
            LcSqlStr := concat(LcSqlStr,' and ( et.nick_trade like :palavra',i.ToString,' ) ');
        End;
        LcSqlStr := concat(LcSqlStr,')');
        sql.Add(LcSqlStr);
      End;

      sql.Add(' order by et.nick_trade ');
      if palavra.Count = 0 then   sql.Add('limit 0,20 ');
      //sql.Add(concat('Limit ', InttoStr( ( Page * 20 ) - 20 ),',', InttoStr( (Page * 20 ) ) ));
      //passagem de PArametros
      if palavra.count > 0 then
      Begin
        for I := 0 to palavra.count -1 do
          ParamByName(concat('palavra',i.ToString)).AsString := concat('%',palavra[I],'%');
      End;

      Active := True;
      FetchAll;
      First;
      ListSpl.Clear;
      while not eof do
      Begin
        item := TListSplInstitution.Create;
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

function TCtrlMobInstitution.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TCtrlMobInstitution.saveDataObjeto(DObj: TObjInstitution): Boolean;
Var
  I : Integer;
  Lc_Aux:Integer;
begin
  //Verifica se a busca será feita por CPF ou CNPJ
  if (DObj.Fiscal.Fisica.CPF <> '' ) then
  Begin
    _assign(DObj.Fiscal.Fisica, MFiscal.MFisica.Registro);
    MFiscal.MFisica.save;
  End
  else
  Begin
    _assign(DObj.Fiscal.Juridica, MFiscal.MJuridica.Registro);
    MFiscal.MJuridica.save;
  End;
  _assign( DObj.Fiscal.Entidade.Entidade,Self.MFiscal.Registro);
  Self.MFiscal.save;

  //Endereço
  for I := 0 to DObj.Fiscal.Entidade.ListaEndereco.Count -1 do
  Begin
    _assign( DObj.Fiscal.Entidade.ListaEndereco[I], Self.MFiscal.MEndereco.Registro );
    Self.MFiscal.MEndereco.save;
  End;
  //Telefone
  for I := 0 to DObj.Fiscal.Entidade.ListaFones.Count -1 do
  Begin
    _assign( DObj.Fiscal.Entidade.ListaFones[I], Self.MFiscal.MTelefone.Registro);
    Self.MFiscal.MTelefone.save;
  End;
  //Email
  //Não deleta o email do mailing, apenas delete o vinculo deste email à Entidade
  self.MFiscal.MEmail.deleteHasEntity(Self.Registro.Codigo,
                          1 );

  if DObj.Fiscal.Entidade.Email.Email <> '' then
  Begin
    self.MFiscal.MEmail.Registro.Email := DObj.Fiscal.Entidade.Email.Email;
    self.MFiscal.MEmail.save;
  End;

  //Salvar Isnttution
  _assign(DObj.Institution, Registro);
  save;

end;

end.

