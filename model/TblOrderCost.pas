unit TblOrderCost;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_order_cost')]
  TOrderCost = Class(TGenericEntity)

  private
    FId: Integer;
    Ftb_order_id: Integer;
    Ftb_order_item_id: Integer;
    Ftb_product_id: Integer;
    Fdescription: String;
    Fcalc_basis: Real;
    Fmethod: String;
    Findex_value: Real;
    Fupdated_at: TDAteTime;
    Fcreated_at: TDAteTime;
    Fterminal: Integer;
    procedure setFcalc_basis(const Value: Real);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFindex_value(const Value: Real);
    procedure setFmethod(const Value: String);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFtb_order_item_id(const Value: Integer);
    procedure setFtb_product_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFterminal(const Value: Integer);

  public

    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_order_id')]
    [KeyField('tb_order_id')]
    property Ordem : Integer read Ftb_order_id write setFtb_order_id;

    [FieldName('tb_order_item_id')]
    property ItemOrdem : Integer read Ftb_order_item_id write setFtb_order_item_id;

    [FieldName('terminal')]
    [KeyField('terminal')]
    property Terminal: Integer read Fterminal write setFterminal;

    [FieldName('tb_product_id')]
    property Produto: Integer read Ftb_product_id write setFtb_product_id;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('calc_basis')]
    property CalculoBasico: Real read Fcalc_basis write setFcalc_basis;

    [FieldName('method')]
    property Metodo: String read Fmethod write setFmethod;

    [FieldName('index_value')]
    property ValorIndice: Real read Findex_value write setFindex_value;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation

{ TOrderCost }

procedure TOrderCost.setFcalc_basis(const Value: Real);
begin
  Fcalc_basis := Value;
end;

procedure TOrderCost.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TOrderCost.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TOrderCost.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TOrderCost.setFindex_value(const Value: Real);
begin
  Findex_value := Value;
end;

procedure TOrderCost.setFmethod(const Value: String);
begin
  Fmethod := Value;
end;

procedure TOrderCost.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TOrderCost.setFtb_order_item_id(const Value: Integer);
begin
  Ftb_order_item_id := Value;
end;

procedure TOrderCost.setFtb_product_id(const Value: Integer);
begin
  Ftb_product_id := Value;
end;

procedure TOrderCost.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TOrderCost.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
