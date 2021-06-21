unit ctrl_mob_customer;

interface

uses System.Classes,System.SysUtils, FireDAC.Comp.Client, FireDAC.Stan.Param,
    System.Generics.Collections,REST.Json,System.Json,objEntityFiscal,
  uDataCM, ctrl_mob_entity_fiscal, objCustomer,list_spl_customer,
  tblcustomer, TypesListCollection, ctrl_mob_base,tblPhone,tblAddress;

  Type
  TCtrlMobCustomer = class(TCtrlMobBAse)
    private

    public
      Registro : TCustomer;
      MFiscal : TCtrlMobEntityFiscal;
      ListSpl : TCollSplCustomer;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function save:boolean;
      function delete:boolean;
      function getByKey:Boolean;
      function getAllByKey:boolean;
      function saveDataObjeto( pReg : TCustomer; DObj: TObjEntityFiscal ):Boolean;
      procedure getListSpl(palavra:TStringList);
      procedure assign(Source,Destiny: TCustomer);
      procedure fillDataObjeto(pCustomer:TCustomer;pObj:TObjEntityFiscal);
      procedure clonarObj(Source,Destiny:TObjCustomer);
      procedure getList;
      procedure clear;
  end;

implementation

uses MainModule;

{ TCtrlMobCustomer }

procedure TCtrlMobCustomer.assign(Source, Destiny: TCustomer);
begin
  _assign(Source,Destiny);
end;

procedure TCtrlMobCustomer.clear;
begin
  clearObj(Registro);
end;

procedure TCtrlMobCustomer.clonarObj(Source, Destiny: TObjCustomer);
begin
  MFiscal.clonarObjEntityFiscal(Source.Fiscal,Destiny.Fiscal);
  _assign(Source.Cliente, Destiny.Cliente);
end;

constructor TCtrlMobCustomer.Create(AOwner: TComponent);
begin
  Registro := TCustomer.create;
  MFiscal := TCtrlMobEntityFiscal.Create(Self);
  ListSpl := TCollSplCustomer.Create;
  createTable;
end;

procedure TCtrlMobCustomer.createTable;
begin
  execcmd(concat(
                'CREATE TABLE  if not exists  tb_customer ( ',
                '  id int(11) , ',
                '  tb_institution_id int(11) , ',
                '  tb_vendor_id int(11), ',
                '  tb_salesman_id int(11), ',
                '  tb_carrier_id int(11) , ',
                '  credit_status char(1)  , ',
                '  credit_value decimal(10,2)  , ',
                '  wallet char(1) , ',
                '  consumer char(1) , ',
                '  multiplier decimal(10,2) , ',
                '  by_pass_st char(1) , ',
                '  active char(1) , ',
                '  created_at datetime , ',
                '  updated_at datetime ) ;'
      ));
end;

function TCtrlMobCustomer.delete: boolean;
begin
  try
    deleteObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

destructor TCtrlMobCustomer.Destroy;
begin
  {$IFDEF WIN32}
  Registro.DisposeOf;
  MFiscal.DisposeOf;
  ListSpl.DisposeOf;
  {$ENDIF }

end;


procedure TCtrlMobCustomer.fillDataObjeto(pCustomer: TCustomer;pObj:TObjEntityFiscal);
Var
  LcPhone : TPhone;
  LcAddress : TAddress;
begin
  Self.MFiscal.clear;
  Self.MFiscal.Registro.Codigo := pCustomer.Codigo;
  Self.MFiscal.getByKey;
  if Self.MFiscal.MFisica.exist or Self.MFiscal.MJuridica.exist then
  BEgin
    _assign( Self.MFiscal.Registro, pObj.Entidade.Entidade);

    if Self.MFiscal.MFisica.exist then
      _assign( Self.MFiscal.MFisica.Registro, pObj.Fisica );

    if Self.MFiscal.MJuridica.exist then
      _assign( Self.MFiscal.MJuridica.Registro, pObj.Juridica);


    Self.MFiscal.MEndereco.Registro.Codigo := pCustomer.Codigo;
    Self.MFiscal.MEndereco.Registro.Tipo  := 'COMERCIAL';
    Self.MFiscal.MEndereco.getbykey;
    if Self.MFiscal.MEndereco.exist then
    Begin
      LcAddress := TAddress.Create;
      _assign(Self.MFiscal.MEndereco.Registro,LcAddress);
      pObj.Entidade.ListaEndereco.Add(LcAddress);
    End;

    Self.MFiscal.MTelefone.Registro.Codigo := pCustomer.Codigo;
    Self.MFiscal.MTelefone.Registro.Tipo := 'Fone';
    Self.MFiscal.MTelefone.getByKey;
    if MFiscal.MTelefone.exist then
    BEgin
      LcPhone := TPhone.Create;
      _assign(Self.MFiscal.MTelefone.Registro,LcPhone);
      pObj.Entidade.ListaFones.Add(LcPhone);
    End;

    Self.MFiscal.MTelefone.Registro.Codigo := pCustomer.Codigo;
    Self.MFiscal.MTelefone.Registro.Tipo := 'Fax';
    Self.MFiscal.MTelefone.getByKey;
    if Self.MFiscal.MTelefone.exist then
    BEgin
      LcPhone := TPhone.Create;
      _assign(Self.MFiscal.MTelefone.Registro,LcPhone);
      pObj.Entidade.ListaFones.Add(LcPhone);
    End;

    Self.MFiscal.MTelefone.Registro.Codigo := pCustomer.Codigo;
    Self.MFiscal.MTelefone.Registro.Tipo := 'Celular';
    Self.MFiscal.MTelefone.getByKey;
    if Self.MFiscal.MTelefone.exist then
    BEgin
      LcPhone := TPhone.Create;
      _assign(Self.MFiscal.MTelefone.Registro,LcPhone);
      pObj.Entidade.ListaFones.Add(LcPhone);
    End;

    //email
    Self.MFiscal.MEmail.Registro.Codigo := pCustomer.Codigo;
    Self.MFiscal.MEmail.getbyKind( Self.Registro.Codigo ,'principal');
    if Self.MFiscal.MEmail.exist then
      _assign(self.MFiscal.Memail.Registro, pObj.Entidade.Email) ;

    //Social Midia
    Self.MFiscal.MMidiaSocial.Registro.Codigo :=  pCustomer.Codigo;
    Self.MFiscal.MMidiaSocial.Registro.Tipo := 'www';
    Self.MFiscal.MMidiaSocial.getByKey;
    if Self.MFiscal.MMidiaSocial.exist then
      _assign( Self.MFiscal.MMidiaSocial.Registro, pObj.Entidade.MidiaSocial );

  End;


end;

function TCtrlMobCustomer.getAllByKey: boolean;
begin
  getByKey;
  MFiscal.Registro.Codigo := Registro.Codigo;
  MFiscal.getAllByKey;

end;

function TCtrlMobCustomer.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TCtrlMobCustomer.getList;
begin

end;

procedure TCtrlMobCustomer.getListSpl(palavra:TStringList);
Var
  Lc_Qry :TFDQuery;
  item : TListSplCustomer;
  I:Integer;
  LcSqlStr : String;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Clear;
      sql.Add(concat(
            'SELECT distinct ct.id, et.name_company,et.nick_trade, ',
            'ad.street, ad.nmbr, ad.neighborhood, ad.kind ',
            'FROM tb_customer ct ',
            '  INNER JOIN tb_entity et ',
            '  on (ct.id = et.id) ',
//            '  inner join tb_institution_has_entity ihe ',
//            '  on (et.id = ihe.tb_entity_id) '+
            '  inner join tb_address ad ',
            '  on (ad.id = et.id) ',
            'where (ct.tb_institution_id =:tb_institution_id)  '
          ));
      //Incrmenta o sql
      LcSqlStr := '';
      if palavra.count > 0 then
      Begin
        LcSqlStr := ' ( ';
        //Loop do razaoa social
        for I := 0 to palavra.count -1 do
        Begin
          if I = 0 then
            LcSqlStr := concat(LcSqlStr,' ( et.name_company like :palavra',i.ToString,' ) ')
          else
            LcSqlStr := concat(LcSqlStr,' and ( et.name_company like :palavra',i.ToString,' ) ');
        End;
        LcSqlStr := concat(LcSqlStr,')');

        //Loop no Nome Fantasia
        LcSqlStr := concat(LcSqlStr, ' or ( ');
        for I := 0 to palavra.count -1 do
        Begin
          if I = 0 then
            LcSqlStr := concat(LcSqlStr,' ( et.nick_trade like :palavra',i.ToString,' ) ')
          else
            LcSqlStr := concat(LcSqlStr,' and ( et.nick_trade like :palavra',i.ToString,' ) ');
        End;
        LcSqlStr := concat(LcSqlStr,')');
        LcSqlStr := concat(' and (', LcSqlStr,')');
        sql.Add(LcSqlStr);
      End;


      sql.Add(' order by et.nick_trade ');
      if palavra.Count = 0 then   sql.Add('limit 0,20 ');
      //sql.Add(concat('Limit ', InttoStr( ( Page * 20 ) - 20 ),',', InttoStr( (Page * 20 ) ) ));
      //passagem de PArametros
      ParamByName('tb_institution_id').AsInteger := self.Registro.Estabelecimento;
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

function TCtrlMobCustomer.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TCtrlMobCustomer.saveDataObjeto(pReg : TCustomer; DObj: TObjEntityFiscal): Boolean;
Var
  I : Integer;
begin
  MFiscal.saveDataObjeto(DObj);
  //Salvar Cliente
  pReg.Codigo := DObj.Entidade.Entidade.Codigo;
  _assign( pReg, Registro );
  save;
end;

end.
