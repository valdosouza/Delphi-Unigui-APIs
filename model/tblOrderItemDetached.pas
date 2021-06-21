unit tblOrderItemDetached;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_order_item_detached')]
  TOrderItemDetached = Class(TGenericEntity)

  private
    Fparts_flavor: Integer;
    Fdescription: String;
    FId: Integer;
    Funit_value: Real;
    Fnr_item: Integer;
    Fupdated_at: TDAteTime;
    Fquantity: Real;
    Ftb_institution_id: Integer;
    Fterminal: Integer;
    Ftb_order_id: Integer;
    Fcreated_at: TDAteTime;
    Ftb_measure_id: Integer;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFnr_item(const Value: Integer);
    procedure setFparts_flavor(const Value: Integer);
    procedure setFquantity(const Value: Real);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_measure_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFterminal(const Value: Integer);
    procedure setFunit_value(const Value: Real);
    procedure setFupdated_at(const Value: TDAteTime);

  public

    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read FId write setFId;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [KeyField('tb_order_id')]
    [FieldName('tb_order_id')]
    property Ordem: Integer read Ftb_order_id write setFtb_order_id;

    [KeyField('terminal')]
    [FieldName('terminal')]
    property Terminal: Integer read Fterminal write setFterminal;

    [FieldName('nr_item')]
    property NrItem: Integer read Fnr_item write setFnr_item;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('tb_measure_id')]
    property Tamanho: Integer read Ftb_measure_id write setFtb_measure_id;

    [FieldName('parts_flavor')]
    property PartesSabor: Integer read Fparts_flavor write setFparts_flavor;

    [FieldName('quantity')]
    property Quantidade: Real read Fquantity write setFquantity;

    [FieldName('unit_value')]
    property ValorUnitario: Real read Funit_value write setFunit_value;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;

implementation

{ TOrderItemDetached }

procedure TOrderItemDetached.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TOrderItemDetached.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TOrderItemDetached.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TOrderItemDetached.setFnr_item(const Value: Integer);
begin
  Fnr_item := Value;
end;

procedure TOrderItemDetached.setFparts_flavor(const Value: Integer);
begin
  Fparts_flavor := Value;
end;

procedure TOrderItemDetached.setFquantity(const Value: Real);
begin
  Fquantity := Value;
end;

procedure TOrderItemDetached.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TOrderItemDetached.setFtb_measure_id(const Value: Integer);
begin
  Ftb_measure_id := Value;
end;

procedure TOrderItemDetached.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TOrderItemDetached.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TOrderItemDetached.setFunit_value(const Value: Real);
begin
  Funit_value := Value;
end;

procedure TOrderItemDetached.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
