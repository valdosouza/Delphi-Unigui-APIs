unit ctrl_mob_merchandise;

interface

uses System.SysUtils,System.Classes,ctrl_mob_base, TypesObjectsCollection,
  ObjMerchandise, GenericDao,FireDAC.Comp.Client, FireDAC.Stan.Param,
  list_spl_merchandise,TypesListCollection,tblMerchandise,ctrl_mob_stock_statement,
  ctrl_mob_product;

Type
  TCtrlMobMerchandise = class(TCtrlMobBase)
    private

    public
      Registro : TMerchandise;
      Product : TCtrlMobProduct;
      CollListaSpl : TCollSplMerchandise;
      StockStatement : TCtrlMobStockStatement;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function save:boolean;
      function getByKey:Boolean;
      procedure getListSpl(palavra:TStringList);
      procedure assign(ObjOri : TMerchandise);
  end;

implementation

  { TCtrlMobMerchandise }
uses MainModule;


procedure TCtrlMobMerchandise.assign(ObjOri: TMerchandise);
begin
  _assign(ObjOri,Registro);
end;

constructor TCtrlMobMerchandise.Create(AOwner: TComponent);
begin
  Registro := TMerchandise.create;
  Product := TCtrlMobProduct.Create(Self);
  CollListaSpl := TCollSplMerchandise.Create;
  StockStatement := TCtrlMobStockStatement.Create(Self);
  createTable;
end;

procedure TCtrlMobMerchandise.createTable;
begin
  execcmd(concat(
                'CREATE TABLE  if not exists tb_merchandise ( ',
                '  id int(11) , ',
                '  tb_institution_id int(11) , ',
                '  id_internal varchar(45) , ',
                '  id_provider int(11) , ',
                '  ncm varchar(8) , ',
                '  cest varchar(7) , ',
                '  kind_tributary char(1) , ',
                '  source char(1) , ',
                '  kind varchar(45) , ',
                '  tb_brand_id int(11) , ',
                '  print char(1) , ',
                '  controlseries varchar(1) , ',
                '  exclusive_dealer char(1) , ',
                '  application blob, ',
                '  composition char(1) , ',
                '  created_at datetime , ',
                '  updated_at datetime ) ;'
      ));
end;

destructor TCtrlMobMerchandise.Destroy;
begin
  {$IFDEF WIN32}
  StockStatement.DisposeOf;
  Registro.disposeOf;
  Product.disposeOf;
  CollListaSpl.DisposeOf;
  {$ENDIF }
end;

function TCtrlMobMerchandise.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TCtrlMobMerchandise.getListSpl(palavra: TStringList);
Var
  Lc_Qry :TFDQuery;
  item : TListSplMerchandise;
  I:Integer;
  LcSqlStr : String;
Begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Clear;
      sql.Add(concat(
            'select pr.id, pr.description product, pk.description package, stb.quantity  ',
            'from tb_product pr ',
            '  inner join tb_merchandise me ',
            '  on (me.id = pr.id) ',
            '      and (me.tb_institution_id = pr.tb_institution_id) ',
            '  inner  join tb_stock st ',
            '  on (st.tb_merchandise_id = me.id) ',
            '      and (st.tb_institution_id = me.tb_institution_id) ',
            '  inner join tb_stock_balance stb ',
            '  on (stb.tb_merchandise_id = me.id) ',
            '      and  (stb.tb_institution_id = me.tb_institution_id) ',
            '  inner join tb_package pk ',
            '  on (pk.id = st.tb_package_id) ',
            'where ( pr.id > 0 ) and ( pr.active = ''S'' ) ',
            ' and (tb_stock_list_id =:tb_stock_list_id) ',
            ' and ( me.tb_institution_id =:tb_institution_id ) '
          ));
      //Incrmenta o sql


      LcSqlStr := ' and ( ';
      if palavra.count > 0 then
      Begin
        for I := 0 to palavra.count -1 do
        Begin
          if I = 0 then
            LcSqlStr := concat(LcSqlStr,' ( pr.description like  :palavra',i.ToString,' ) ')
          else
            LcSqlStr := concat(LcSqlStr,' and ( pr.description like  :palavra',i.ToString,' ) ');
        End;
        LcSqlStr := concat(LcSqlStr,')');
        sql.Add(LcSqlStr);
      End;

     sql.Add(' order by pr.description ');
     if palavra.Count = 0 then   sql.Add('limit 0,50 ');
      //sql.Add(concat('Limit ', InttoStr( (Page * 20 ) - 20 ),',', InttoStr( (Page * 20 ) ) ));
      //Passagem parametros
      ParamByName('tb_institution_id').AsInteger := Self.Registro.Estabelecimento;
      ParamByName('tb_stock_list_id').AsInteger := GbStock;
      if palavra.count > 0 then
      Begin
        for I := 0 to palavra.count -1 do
          ParamByName(concat('palavra',i.ToString)).AsString := concat('%',palavra[I],'%');
      End;

      Active := True;
      FetchAll;
      First;
      Self.CollListaSpl.Clear;
      while not eof do
      Begin
        item := TListSplMerchandise.Create;
        item.Codigo    := FieldByName('id').AsInteger;
        item.Descricao := FieldByName('product').AsString;
        item.Embalagem := FieldByName('package').AsString;
        item.Estoque   := FieldByName('quantity').AsFloat;
        //add lista
        Self.CollListaSpl.Add( item );
        Next;
      End;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TCtrlMobMerchandise.save:boolean;
begin
  if Registro.Codigo = 0 then
    Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
  try
    if trim(Registro.CodigoInterno) = '' then
      Registro.CodigoInterno := IntToStr( Registro.Codigo );
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

end.
