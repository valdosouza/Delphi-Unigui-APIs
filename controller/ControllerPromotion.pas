unit ControllerPromotion;

interface

uses System.Classes, Vcl.Grids, System.SysUtils,BaseController,
       tblpromotion,tblpromotionLog,GenericDao,TypesCollection,
      System.Generics.Collections, ControllerPromotionItems,objPromotion,
  FireDAC.Comp.Client, prm_promotion,ControllerConfig,tblpromotionItems,
  rest.json;

Type

  TControllerPromotion = Class(TBaseController)
    Lista : TListPromotion;
  private

  public
    Registro : TPromotion;
    log : TPromotionLog;
    Items  : TControllerPromotionItems;
    Obj           : TObjPromotion;
    Parametro : TPrmPromotion;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure setParametro(par:String);
    procedure clear;
    function salva:boolean;
    function Insert:boolean;
    procedure getlist;
    function update:boolean;
    Function delete:boolean;
    function tempromocao:Boolean;
    procedure getbyKey;
    procedure getbyProduct(product:Integer);
    procedure fillDataObjeto(pPromotion:TPromotion);
    function saveDataObjeto(DObj : TObjPromotion):Boolean;
  End;
implementation

{ TControllerPromotion }

procedure TControllerPromotion.clear;
begin
  clearObj(Registro);
end;

constructor TControllerPromotion.Create(AOwner: TComponent);
begin
  inherited;
  Registro  := TPromotion.Create;
  log       := TPromotionLog.Create;
  Items  := TControllerPromotionItems.Create(Self);
  Lista := TListPromotion.Create;
  Obj     := TObjPromotion.Create;
  Parametro := TPrmPromotion.create;
end;


destructor TControllerPromotion.Destroy;
begin
  Parametro.Destroy;
  Registro.DisposeOf;
  Log.DisposeOf;
  Items.DisposeOf;
  Lista.DisposeOf;
  Obj.destroy;
  inherited;
end;


procedure TControllerPromotion.fillDataObjeto(pPromotion: TPromotion);
var
  I,J : Integer;
  LcCtrlitenm : TControllerPromotionItems;
  LcItem : TPromotionItems;
begin
  Try
    LcCtrlitenm := TControllerPromotionItems.Create(Self);
    Obj.Estabelecimento := pPromotion.Estabelecimento;
    Obj.Promocao.Codigo          := pPromotion.Codigo;
    Obj.Promocao.Estabelecimento := pPromotion.Estabelecimento;
    Obj.Promocao.Descricao       := pPromotion.Descricao;
    Obj.Promocao.Preco           := pPromotion.Preco;
    Obj.Promocao.Quantidade      := pPromotion.Quantidade;
    Obj.Promocao.Ativo           := pPromotion.Ativo;

    //Itens
    LcCtrlitenm.Registro.Promocao := pPromotion.Codigo;
    LcCtrlitenm.Registro.Estabelecimento := pPromotion.Estabelecimento;
    LcCtrlitenm.getList;
    for I := 0 to LcCtrlitenm.Lista.Count -1 do
    Begin
      LcItem := TPromotionItems.Create;
      LcItem.Promocao        := LcCtrlitenm.Lista[I].Promocao;
      LcItem.Estabelecimento := LcCtrlitenm.Lista[I].Estabelecimento;
      LcItem.Produto         := LcCtrlitenm.Lista[I].Produto;
      Obj.Items.Add(LcItem);
    End;
  Finally
    LcCtrlitenm.DisposeOf;
  End;

end;

function TControllerPromotion.salva: boolean;
begin
  Try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
    SaveObj(Registro);
    Result := True;
  Finally
    Result := False;
  End;
end;

function TControllerPromotion.saveDataObjeto(DObj: TObjPromotion): Boolean;
Var
  I : Integer;
begin
  Try
    Registro.Codigo          := DObj.Promocao.Codigo;
    Registro.Estabelecimento := DObj.Promocao.Estabelecimento;
    Registro.Descricao       := DObj.Promocao.Descricao;
    Registro.Preco           := DObj.Promocao.Preco;
    Registro.Quantidade      := DObj.Promocao.Quantidade;
    Registro.Ativo           := DObj.Promocao.Ativo;
    salva;
    //Itens
    Items.Registro.Promocao        := DObj.Promocao.Codigo;
    Items.Registro.Estabelecimento := DObj.Promocao.Estabelecimento;
    Items.deleteByPromotion;
    for I := 0 to DObj.Items.Count-1 do
    Begin
      Items.Registro.Promocao        := DObj.Items[I].Promocao;
      Items.Registro.Estabelecimento := DObj.Items[I].Estabelecimento;
      Items.Registro.Produto         := DObj.Items[I].Produto;
      Items.Insert;
    End;
    Result := true;
  except
    Result := False;
  end;
end;

procedure TControllerPromotion.setParametro(par: String);
begin
  Parametro:= TJson.JsonToObject<TPrmPromotion>(par);
  //Tratar Data
  Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);

end;

function TControllerPromotion.tempromocao: Boolean;
var
  Lc_Qry : TFDQuery;
begin
  try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat(
                  'select first 1 1 ',
                  'from tb_promotion ',
                  'where  (active = ''S'') '
      ));
      Active := True;
      First;
      result := (RecordCount > 0 );
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;

function TControllerPromotion.update: boolean;
begin
  Try
    UpdateObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;


function TControllerPromotion.Insert: boolean;
begin
  Try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
    InsertObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;


function TControllerPromotion.delete: boolean;
begin
  Try
    DeleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

procedure TControllerPromotion.getByKey;
begin
  Registro.Codigo           := Parametro.Promocao.Codigo;
  Registro.Estabelecimento  := Parametro.Promocao.Estabelecimento;
  _getByKey(Registro);
end;



procedure TControllerPromotion.getbyProduct(product:Integer);
var
  Lc_Qry : TFDQuery;
begin
  try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat(
                  'select pm.* ',
                  'from tb_promotion pm ',
                  '  inner join tb_promotion_items pmi ',
                  '  on (pmi.tb_institution_id = pm.tb_institution_id) and ',
                  '     (pmi.tb_promotion_id = pm.id) ',
                  'where pmi.tb_product_id =:product_id ',
                  ' and (active = ''S'') '
      ));
      ParamByName('product_id').AsInteger := product;
      Active := True;
      First;
      exist := (RecordCount > 0 );
      if exist then
        get(Lc_Qry,Registro);
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;

end;

procedure TControllerPromotion.getList;
var
  Lc_Qry : TFDQuery;
  LITem : TPromotion;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT p.*           ',
                     'FROM tb_promotion p  '
      ));

      //Incrementa SQL - INNER

      //Incrementa SQL - WHERE
      sql.add(concat(
                'where ( p.tb_institution_id =:institution_id )         '
      ));

      if Trim(Parametro.UltimaAtualizacao) <> '' then
        sql.add(' AND ( p.updated_at >:updated_at ) ');

      //Incrementa SQL - ORDER BY
      if Trim(Parametro.UltimaAtualizacao) <> '' then
      Begin
        sql.add(' order by p.updated_at asc ');
      End
      else
      Begin
        sql.add(' ORDER BY p.id  asc ');
      End;

      //Passagem de parametros
      parambyname('institution_id').AsInteger := Parametro.Promocao.Estabelecimento;

      if Trim(Parametro.UltimaAtualizacao) <> '' then
        parambyname('updated_at').AsString := Parametro.UltimaAtualizacao;


      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TPromotion.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;


end;

end.
