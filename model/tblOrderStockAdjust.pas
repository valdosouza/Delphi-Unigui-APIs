unit tblOrderStockAdjust;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_order_stock_adjust')]
  TOrderStockAdjust = Class(TGenericEntity)
  private
    Ftb_entity_id: Integer;
    Fid: Integer;
    Fupdated_at: TDatetime;
    Fnumber: Integer;
    Ftb_institution_id: Integer;
    Fcreated_at: TDatetime;
    Fterminal: Integer;
    procedure setFcreated_at(const Value: TDatetime);
    procedure setFid(const Value: Integer);
    procedure setFnumber(const Value: Integer);
    procedure setFtb_entity_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDatetime);
    procedure setFterminal(const Value: Integer);

  public
    [KeyField('id ')]
    [FieldName(' id ')]
    property Codigo: Integer read Fid write setFid;

	  [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('terminal')]
    [KeyField('terminal')]
    property Terminal: Integer read Fterminal write setFterminal;

    [FieldName('tb_entity_id')]
    property Destinatario: Integer read Ftb_entity_id write setFtb_entity_id;

    [FieldName('number')]
    property Numero: Integer read Fnumber write setFnumber;

    [FieldName('created_at')]
    property RegistroCriado: TDatetime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDatetime read Fupdated_at write setFupdated_at;

	End;

implementation

{ TOrderStockAdjust }

procedure TOrderStockAdjust.setFcreated_at(const Value: TDatetime);
begin
  Fcreated_at := Value;
end;

procedure TOrderStockAdjust.setFid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TOrderStockAdjust.setFnumber(const Value: Integer);
begin
  Fnumber := Value;
end;

procedure TOrderStockAdjust.setFtb_entity_id(const Value: Integer);
begin
  Ftb_entity_id := Value;
end;

procedure TOrderStockAdjust.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TOrderStockAdjust.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TOrderStockAdjust.setFupdated_at(const Value: TDatetime);
begin
  Fupdated_at := Value;
end;

end.
