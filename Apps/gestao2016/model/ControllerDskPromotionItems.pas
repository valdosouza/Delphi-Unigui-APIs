unit ControllerDskPromotionItems;

interface

uses IBX.IBDatabase,System.Classes, Vcl.Grids,IBQuery, System.SysUtils,BaseController,
      Un_sistema,Un_funcoes,Un_Regra_Negocio, tblDskpromotionItems ,GenericDao, Un_MSg,
      System.Generics.Collections, ControllerProduto;

Type
  TListaItensPromocao =  TObjectList<TDskPromotionItems>;

  TControllerDskPromotionItems = Class(TBaseController)
    Lista : TListaItensPromocao;
  private
  public
    Registro : TDskPromotionItems;
    Produto : TControllerProduto;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function salva:boolean;
    function Insert:boolean;
    function update:boolean;
    Function delete:boolean;
    Function deleteByPromotion:boolean;
    procedure getbyId;
    procedure getList;
    procedure getbyProduct;
    procedure getProductDuplicated;
  End;

implementation

{ TControllerDskPromotionItems }

constructor TControllerDskPromotionItems.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TDskPromotionItems.create;
  Produto := TControllerProduto.create(Self);
  Lista := TListaItensPromocao.create;
end;

function TControllerDskPromotionItems.delete: boolean;
begin
  Try
    DeleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerDskPromotionItems.deleteByPromotion: boolean;
Var
  LcQry : TIBQuery;
begin
  Try
    LcQry := GeraQuery;
    with LcQry do
    Begin
      sql.Add(concat('delete ',
                     'from tb_promotion_items ',
                     'where (tb_institution_id =:institution_id ) ',
                     'and (tb_promotion_id=:promotion_id) '
                     ));
      ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('promotion_id').AsInteger := Registro.Promocao;
      ExecSQL;
    End;
  Finally
    LcQry.Close;
    LcQry.DisposeOf
  End;
end;

destructor TControllerDskPromotionItems.Destroy;
begin
  FreeAndNil(Lista);
  FReeAndNil(Registro);
  inherited;
end;


procedure TControllerDskPromotionItems.getbyId;
begin
  _getByKey(Registro);
end;

procedure TControllerDskPromotionItems.getbyProduct;
var
  Qry : TIBQuery;
begin
  try
    Qry := GeraQuery;
    with Qry do
    Begin
      sql.add(concat(
                  'select * ',
                  'from tb_promotion_items pmi ',
                  'where pmi.tb_product_id =:product_id ',
                  ' pmi.TB_INSTITUTION_ID=:INSTITUTION_ID '
      ));
      ParamByName('TB_INSTITUTION_ID').AsInteger := Registro.Estabelecimento;
      ParamByName('product_id').AsInteger := Registro.Produto;
      Active := True;
      First;
      exist := (RecordCount > 0 );
      if exist then
        get(Qry,Registro);
      Close;
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

procedure TControllerDskPromotionItems.getList;
Var
  LcQry : TIBQuery;
  LITem : TDskPromotionItems;
begin
  LcQry := GeraQuery;
  with LcQry do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              'Select * ',
              'from  TB_PROMOTION_ITEMS ',
              ' where tb_promotion_id =:promotion_id '
        ));
    ParamByName('promotion_id').AsInteger := Registro.Promocao;
    Active := True;
    FetchAll;
    Lista.Clear;
    while not eof do
    Begin
      LITem := TDskPromotionItems.Create;
      get(LcQry,LITem);
      Lista.Add(LITem);
      Next;
    End;
  End;
end;

procedure TControllerDskPromotionItems.getProductDuplicated;
var
  Qry : TIBQuery;
begin
  try
    Qry := GeraQuery;
    with Qry do
    Begin
      sql.add(concat(
                  'select * ',
                  'from tb_promotion_items pmi ',
                  'where ( pmi.tb_product_id =:product_id  )',
                  ' AND  ( pmi.TB_INSTITUTION_ID=:INSTITUTION_ID ) ',
                  ' AND  ( pmi.TB_PROMOTION_ID <>:PROMOTION_ID)',
                  ' AND  ( pmi.TB_PROMOTION_ID > 0 )'
      ));
      ParamByName('INSTITUTION_ID').AsInteger := Registro.Estabelecimento;
      ParamByName('PROMOTION_ID').AsInteger := Registro.Promocao;
      ParamByName('product_id').AsInteger := Registro.Produto;
      Active := True;
      First;
      exist := (RecordCount > 0 );
      if exist then
        get(Qry,Registro);
      Close;
    end;
  finally
    FreeAndNil(Qry);
  end;

end;

function TControllerDskPromotionItems.Insert: boolean;
begin
  Try
    InsertObj(Registro);
    REsult := True;
  Finally
    REsult := False;
  End;
end;


function TControllerDskPromotionItems.salva: boolean;
begin
  SaveObj(Registro);
end;

function TControllerDskPromotionItems.update: boolean;
begin
  UpdateObj(Registro);
end;

end.
