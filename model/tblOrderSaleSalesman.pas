unit tblOrderSaleSalesman;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_order_sale_salesman')]
  TtblOrderSaleSalesman = Class(TGenericEntity)

  private
    FId: Integer;
    Fupdated_at: TDAteTime;
    Ftb_salesman_id: Integer;
    Fnumber: Integer;
    Ftb_institution_id: Integer;
    Fcreated_at: TDAteTime;
    Fterminal: Integer;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFId(const Value: Integer);
    procedure setFnumber(const Value: Integer);
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

    [FieldName('tb_salesman_id')]
    [KeyField('tb_salesman_id')]
    property Vendedor: Integer read Ftb_salesman_id write setFtb_salesman_id;

    [FieldName('terminal')]
    [KeyField('terminal')]
    property Terminal: Integer read Fterminal write setFterminal;

    [FieldName('number')]
    property Numero: Integer read Fnumber write setFnumber;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation

{ TtblOrderSaleSalesman }

procedure TtblOrderSaleSalesman.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TtblOrderSaleSalesman.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TtblOrderSaleSalesman.setFnumber(const Value: Integer);
begin
  Fnumber := Value;
end;

procedure TtblOrderSaleSalesman.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TtblOrderSaleSalesman.setFtb_salesman_id(const Value: Integer);
begin
  Ftb_salesman_id := Value;
end;

procedure TtblOrderSaleSalesman.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TtblOrderSaleSalesman.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
