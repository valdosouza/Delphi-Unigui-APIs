unit ControllerDskPromotion;

interface

uses IBX.IBDatabase,System.Classes, Vcl.Grids,IBQuery, System.SysUtils,BaseController,
      Un_sistema,Un_funcoes,Un_Regra_Negocio, tblDskpromotion ,GenericDao, Un_MSg,
      System.Generics.Collections, ControllerDskPromotionItems;

Type
  TListPromotion  =  TObjectList<TDskPromotion>;
  TControllerDskPromotion = Class(TBaseController)
    Lista : TListPromotion;
  private
  protected
    Procedure setDataModel;Override;
  public
    Registro : TDskPromotion;
    Items  : TControllerDskPromotionItems;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function salva:boolean;
    function Insert:boolean;
    procedure getList;
    function update:boolean;
    Function delete:boolean;
    function tempromocao:Boolean;
    procedure getbyId;
    procedure getbyProduct(product:Integer);
  End;
implementation

{ TControllerDskPromotion }

constructor TControllerDskPromotion.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TDskPromotion.Create;
  Items  := TControllerDskPromotionItems.Create(Self);
  Lista := TListPromotion.Create;
end;


destructor TControllerDskPromotion.Destroy;
begin
  FreeAndNil(Registro);
  FreeAndNil(Items);
  FreeAndNil(Lista);
  inherited;
end;


function TControllerDskPromotion.salva: boolean;
begin
  if Registro.Codigo = 0 then
    Registro.Codigo := Generator('GN_PROMOTION');
  SaveObj(Registro);
end;

procedure TControllerDskPromotion.setDataModel;
begin
  inherited;
  Items.DataMod := FDataMod;
end;

function TControllerDskPromotion.tempromocao: Boolean;
var
  Qry : TIBQuery;
begin
  try
    Qry := GeraQuery;
    with Qry do
    Begin
      sql.add(concat(
                  'select first 1 1 ',
                  'from tb_promotion ',
                  'where  (REG_ACTIVE = ''S'') '
      ));
      Active := True;
      First;
      result := (RecordCount > 0 );
      Close;
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

function TControllerDskPromotion.update: boolean;
begin
  Try
    UpdateObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;


function TControllerDskPromotion.Insert: boolean;
begin
  Try
    if Registro.Codigo = 0 then
      Registro.Codigo := Generator('GN_PROMOTION');
    InsertObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;



function TControllerDskPromotion.delete: boolean;
begin
  Try
    DeleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

procedure TControllerDskPromotion.getById;
var
  Qry : TIBQuery;
begin
  try
    Qry := GeraQuery;
    with Qry do
    Begin
      sql.add(concat(
                  'select * ',
                  'from tb_promotion  ',
                  'where id =:id '
      ));
      ParamByName('id').AsInteger := Registro.Codigo;
      Active := True;
      First;
      exist := (RecordCount > 0 );
      if exist then
        get(Qry,Registro);

    end;
  finally
    Qry.Close;
    Qry.DisposeOf;
  end;

end;



procedure TControllerDskPromotion.getbyProduct(product:Integer);
var
  Qry : TIBQuery;
begin
  try
    Qry := GeraQuery;
    with Qry do
    Begin
      sql.add(concat(
                  'select pm.* ',
                  'from tb_promotion pm ',
                  '  inner join tb_promotion_items pmi ',
                  '  on (pmi.tb_institution_id = pm.tb_institution_id) and ',
                  '     (pmi.tb_promotion_id = pm.id) ',
                  'where pmi.tb_product_id =:product_id ',
                  ' and (REG_ACTIVE = ''S'') '
      ));
      ParamByName('product_id').AsInteger := product;
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

procedure TControllerDskPromotion.getList;
var
  Qry : TIBQuery;
  LITem : TDskPromotion;
begin
  try
    Qry := GeraQuery;
    with Qry do
    Begin
      sql.add(concat('SELECT * ',
                      'FROM tb_promotion ',
                      ' ORDER BY description '));
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TDskPromotion.Create;
        get(Qry,LITem);
        Lista.add(LITem);
        next;
      end;
      Close;
    end;
  finally
    FreeAndNil(Qry);
  end;


end;


end.
