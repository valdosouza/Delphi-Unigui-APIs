unit ControllerStock;


interface
uses System.Classes, System.SysUtils,Basecontroller,prm_stock,rest.json,
      tblStock,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerPackage, ControllerMeasure, ControllerColor, TypesCollection,
      ControllerConfig;

Type
  TControllerStock = Class(TBaseController)

    procedure clear;
  private


  public
    Registro : TStock;
    Embalagem : TControllerPackage;
    Medida : TControllerMeasure;
    Cor : TControllerColor;
    Lista : TListStock;
    Parametro : TPrmStock;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure setParametro(par:String);
    function save:boolean;
    function insert:boolean;
    function Update:boolean;
    function getByKey:Boolean;
    function getAllByKey:Boolean;
    function delete: boolean;
    function getByBarCode:Boolean;
    procedure UpdateImage;
    procedure getlist;
    procedure getDeliverylist(MenuDesc:String);
    procedure assign(ObjOri : TStock);
  End;

implementation

{ ControllerProduct }

procedure TControllerStock.assign(ObjOri: TStock);
begin
  _assign(ObjOri,Registro);
end;

procedure TControllerStock.clear;
begin
  clearObj(Registro);
end;

constructor TControllerStock.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TStock.Create;
  Embalagem := TControllerPackage.create(Self);
  Medida := TControllerMeasure.create(Self);
  Cor := TControllerColor.create(Self);
  Lista := TListStock.create;
  Parametro := TPrmStock.Create;
end;

function TControllerStock.delete: boolean;
begin
  deleteObj(Registro)
end;

destructor TControllerStock.Destroy;
begin
  Parametro.Destroy;
  Embalagem.DisposeOf;
  Medida.DisposeOf;
  Cor.DisposeOf;
  Registro.DisposeOf;
  Lista.DisposeOf;
  inherited;
end;


function TControllerStock.insert: boolean;
begin
  try
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerStock.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;





procedure TControllerStock.setParametro(par: String);
begin
  try
    Parametro := TPrmStock.Create;
    Parametro:= TJson.JsonToObject<TPrmStock>(par);
  //Tratar Data
    Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);
  Except
    Parametro.UltimaAtualizacao := '1900-01-01 01:00:00'
  end;

end;


function TControllerStock.Update: boolean;
begin
  try
    updateObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

procedure TControllerStock.UpdateImage;
Var
  Lc_Qry : TFdQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add(concat(
                'update tb_stock set ',
                ' link_url =:link_url ',
                'Where ( tb_institution_id =:tb_institution_id ) ',
                ' and  ( tb_merchandise_id =:tb_merchandise_id ) '
      ));
      ParamByName('tb_institution_id').AsInteger  := REgistro.Estabelecimento;
      ParamByName('tb_merchandise_id').AsInteger  := Registro.Mercadoria;
      ParamByName('link_url').AsString            := Registro.linkUrl;
      ExecSQL;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerStock.getAllByKey: Boolean;
begin
  getByKey;
  Embalagem.Registro.Codigo := Registro.Embalagem;
  Embalagem.Institution.Estabelecimento := Registro.Estabelecimento;
  Embalagem.getbyKey;

  Medida.Registro.Codigo := Registro.Medida;
  Medida.Institution.Estabelecimento := Registro.Estabelecimento;
  Medida.getbyKey;

  Cor.Registro.Codigo := Registro.Cor;
  cor.Institution.Estabelecimento := Registro.Estabelecimento;
  Cor.getbyKey
end;

function TControllerStock.getByBarCode: Boolean;
Var
  Lc_Qry : TFdQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add(concat(
                'SELECT * ',
                'FROM tb_stock ',
                'Where ( tb_institution_id =:tb_institution_id ) ',
                ' and  ( codebar =:codebar ) ',
                '  and ( codebar <> ''SEM GTIN'' ) '
      ));
      if (REgistro.Mercadoria > 0) then
        SQL.Add(' AND (tb_merchandise_id <>:tb_merchandise_id )');

      ParamByName('tb_institution_id').AsInteger := REgistro.Estabelecimento;
      ParamByName('codebar').AsString := Registro.CodigoBarra;

      if (REgistro.Mercadoria > 0) then
        ParamByName('tb_merchandise_id').AsInteger := REgistro.Mercadoria;

      Active := True;
      FetchAll;
      exist := (recordCount > 0);
      if exist then get(Lc_Qry,Registro) ;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;


function TControllerStock.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerStock.getDeliverylist(MenuDesc:String);
var
  Lc_Qry : TFDQuery;
  LITem : TStock;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat(
              'select  st.* ',
              'from tb_rest_menu r ',
              '  inner join tb_rest_menu_has_product rmhp ',
              '  on (rmhp.tb_rest_menu_id = r.id) ',
              '    and (rmhp.tb_institution_id = r.tb_institution_id) ',
              '  inner join tb_stock st ',
              '  on (st.tb_merchandise_id = rmhp.tb_product_id) ',
              '    and (st.tb_institution_id = rmhp.tb_institution_id) ',
              '    inner join tb_product pd ',
              '    on (st.tb_merchandise_id = pd.id) ',
              '      and (st.tb_institution_id = pd.tb_institution_id) ',
              '  inner join tb_measure me ',
              '  on (me.id = st.tb_measure_id) ',
              '  inner join tb_price pc ',
              '  on (pc.tb_product_id = st.tb_merchandise_id) ',
              '  and (pc.tb_institution_id = st.tb_institution_id) ',
              'where r.description =:menu ',
              'and r.tb_institution_id =:tb_institution_id ',
              'and pc.tb_price_list_id = 1 '
      ));

      //Passagem de parametros
      parambyname('tb_institution_id').AsInteger :=  Parametro.Estoque.Estabelecimento;
      parambyname('menu').AsString            :=  MenuDesc;

      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TStock.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);

  End;

end;

procedure TControllerStock.getList;
var
  Lc_Qry : TFDQuery;
  LITem : TStock;
  LcConfig : TControllerConfig;
  LcStatusProduto : String;
begin
  Try
    LcConfig := TControllerConfig.Create(Self);
    LcConfig.Registro.Estabelecimento := Parametro.Estoque.Estabelecimento;
    LcConfig.Registro.Campo := 'DOWNLOAD_PRODUCT';
    LcConfig.getByKey;
    if LcConfig.exist then
      LcStatusProduto := LcConfig.Registro.Conteudo
    else
      LcStatusProduto := 'A';

    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT s.*                                     ',
                     'FROM tb_stock s                                '
      ));

      //Incrementa SQL - INNER
      sql.add(concat(
               '  inner join tb_merchandise m                          ',
               '  on ( m.id = s.tb_merchandise_id )                    ',
               '     and ( m.tb_institution_id = s.tb_institution_id ) ',
               '  inner join tb_product p                              ',
               '  on (m.id = p.id )                                    ',
               '     and (m.tb_institution_id = p.tb_institution_id)   '

      ));

      //Incrementa SQL - WHERE
      sql.add(concat(
                'where ( s.tb_institution_id =:institution_id )         ',
                ' and ( p.active = ''S'' )                              ',
                ' and ( m.kind = ''P''   )                               '
      ));
      if LcStatusProduto = 'P' then
        sql.add(concat(
                  ' and ( p.published = ''S'' )                         '
        ));


      if Trim(Parametro.UltimaAtualizacao) <> '' then
        sql.add(' AND ( s.updated_at >:updated_at ) ');

      //Incrementa SQL - ORDER BY
      if Trim(Parametro.UltimaAtualizacao) <> '' then
      Begin
        sql.add(' order by s.updated_at asc ');
      End
      else
      Begin
        sql.add(' ORDER BY s.tb_merchandise_id  asc ');
      End;

      //Passagem de parametros
      parambyname('institution_id').AsInteger := Parametro.Estoque.Estabelecimento;

      if Trim(Parametro.UltimaAtualizacao) <> '' then
        parambyname('updated_at').AsString := Parametro.UltimaAtualizacao;


      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TStock.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
    LcConfig.DisposeOf;
  End;



end;


end.


