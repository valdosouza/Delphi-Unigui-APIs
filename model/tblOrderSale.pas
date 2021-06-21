unit tblOrderSale;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_order_sale')]
  TOrderSale = Class(TGenericEntity)

  private
    FId: Integer;
    Ftb_institution_id: Integer;
    Ftb_salesman_id: Integer;
    Fnumber: Integer;
    Ftb_customer_id: Integer;

    Fcreated_at: TDAteTime;
    Fupdated_at: TDAteTime;

    Fterminal: Integer;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFId(const Value: Integer);
    procedure setFnumber(const Value: Integer);
    procedure setFtb_customer_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_salesman_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);

    procedure setFterminal(const Value: Integer);

  public

    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('terminal')]
    [KeyField('terminal')]
    property Terminal: Integer read Fterminal write setFterminal;

    [FieldName('tb_salesman_id')]
    [KeyField('tb_salesman_id')]
    property Vendedor: Integer read Ftb_salesman_id write setFtb_salesman_id;

    [FieldName('number')]
    property Numero: Integer read Fnumber write setFnumber;

    [FieldName('tb_customer_id')]
    property Cliente: Integer read Ftb_customer_id write setFtb_customer_id;


    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation

{ TOrderSale }

procedure TOrderSale.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TOrderSale.setFId(const Value: Integer);
begin
  FId := Value;
end;


procedure TOrderSale.setFnumber(const Value: Integer);
begin
  Fnumber := Value;
end;

procedure TOrderSale.setFtb_customer_id(const Value: Integer);
begin
  Ftb_customer_id := Value;
end;

procedure TOrderSale.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TOrderSale.setFtb_salesman_id(const Value: Integer);
begin
  Ftb_salesman_id := Value;
end;

procedure TOrderSale.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TOrderSale.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.

