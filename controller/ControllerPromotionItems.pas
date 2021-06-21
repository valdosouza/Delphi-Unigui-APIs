unit ControllerPromotionItems;

interface

uses System.Classes, Vcl.Grids,System.SysUtils,BaseController,
      tblpromotionItems ,tblpromotionItemsLog,GenericDao, TypesCollection,
      System.Generics.Collections, ControllerProduct, FireDAC.Comp.Client;

Type


  TControllerPromotionItems = Class(TBaseController)
  private
  public
    Registro : TPromotionItems;
    Log : TPromotionItemsLog;
    Produto : TControllerProduct;
    Lista : TListPromotionItems;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function salva:boolean;
    procedure clear;
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

{ TControllerPromotionItems }

procedure TControllerPromotionItems.clear;
begin
  clearObj(Registro);
end;

constructor TControllerPromotionItems.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TPromotionItems.create;
  Log := TPromotionItemsLog.create;
  Produto := TControllerProduct.create(Self);
  Lista := TListPromotionItems.create;
end;

function TControllerPromotionItems.delete: boolean;
begin
  Try
    DeleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerPromotionItems.deleteByPromotion: boolean;
Var
  Lc_Qry : TFDQuery;
begin
  try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Add(concat('delete ',
                     'from tb_promotion_items ',
                     'where (tb_institution_id =:institution_id) ',
                     'and (tb_promotion_id=:promotion_id) '
                     ));
      ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('promotion_id').AsInteger := Registro.Promocao;
      ExecSQL;
    End;
  finally
    finalizaQuery(Lc_Qry);
  end;
end;

destructor TControllerPromotionItems.Destroy;
begin
  Lista.DisposeOf;
  Produto.DisposeOf;
  Log.DisposeOf;
  Registro.DisposeOf;
  inherited;
end;


procedure TControllerPromotionItems.getbyId;
begin
  _getByKey(Registro);
end;

procedure TControllerPromotionItems.getbyProduct;
var
  Lc_Qry : TFDQuery;
begin
  try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat(
                  'select * ',
                  'from tb_promotion_items pmi ',
                  'where pmi.tb_product_id =:product_id ',
                  ' pmi.tb_institution_id=:institution_id '
      ));
      ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('product_id').AsInteger := Registro.Produto;
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

procedure TControllerPromotionItems.getList;
Var
  Lc_Qry : TFDQuery;
  LITem : TPromotionItems;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
                'Select * ',
                'from  tb_promotion_items ',
                ' where tb_promotion_id =:promotion_id ',
                ' and tb_institution_id=:institution_id '
          ));
      ParamByName('promotion_id').AsInteger := Registro.Promocao;
      ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
      Active := True;
      FetchAll;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TPromotionItems.Create;
        get(Lc_Qry,LITem);
        Lista.Add(LITem);
        Next;
      End;
    End;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;


procedure TControllerPromotionItems.getProductDuplicated;
var
  Lc_Qry : TFDQuery;
begin
  try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat(
                  'select * ',
                  'from tb_promotion_items pmi ',
                  'where ( pmi.tb_product_id =:product_id  )',
                  ' AND  ( pmi.tb_institution_id=:institution_id ) ',
                  ' AND  ( pmi.tb_promotion_id <>:promotion_id)',
                  ' AND  ( pmi.tb_promotion_id > 0 )'
      ));
      ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('promotion_id').AsInteger := Registro.Promocao;
      ParamByName('product_id').AsInteger := Registro.Produto;
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

function TControllerPromotionItems.Insert: boolean;
begin
  Try
    InsertObj(Registro);
    Result := TRue;
  Finally
    Result := False;
  End;
end;


function TControllerPromotionItems.salva: boolean;
begin
  SaveObj(Registro);
end;

function TControllerPromotionItems.update: boolean;
begin
  UpdateObj(Registro);
end;

end.
