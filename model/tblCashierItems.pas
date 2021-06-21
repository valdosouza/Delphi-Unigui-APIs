unit tblCashierItems;

interface
Uses GenericEntity,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_cashier_items')]
  TCashierItems = Class(TGenericEntity)

  private
    FSET_VALUE: Real;
    FId: Integer;
    Ftb_payment_types_id: Integer;
    Fupdated_at: TDAteTime;
    Ftb_cashier_id: Integer;
    Ftb_institution_id: integer;
    Fkind: String;
    Fterminal: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFId(const Value: Integer);
    procedure setFkind(const Value: String);
    procedure setFSET_VALUE(const Value: Real);
    procedure setFtb_cashier_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: integer);
    procedure setFtb_payment_types_id(const Value: Integer);
    procedure setFterminal(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);



  public

    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('terminal')]
    [KeyField('terminal')]
    property Terminal: Integer read Fterminal write setFterminal;

    [KeyField('tb_cashier_id')]
    [FieldName('tb_cashier_id')]
    property Caixa: Integer read Ftb_cashier_id write setFtb_cashier_id;

    [FieldName('kind')]
    property Tipo: String read Fkind write setFkind;

    [FieldName('tb_payment_types_id')]
    property TipoPagamento: Integer read Ftb_payment_types_id write setFtb_payment_types_id;

    [FieldName('SET_VALUE')]
    property Valor: Real read FSET_VALUE write setFSET_VALUE;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation

{ TCashierItems }

procedure TCashierItems.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TCashierItems.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TCashierItems.setFkind(const Value: String);
begin
  Fkind := Value;
end;

procedure TCashierItems.setFSET_VALUE(const Value: Real);
begin
  FSET_VALUE := Value;
end;

procedure TCashierItems.setFtb_cashier_id(const Value: Integer);
begin
  Ftb_cashier_id := Value;
end;

procedure TCashierItems.setFtb_institution_id(const Value: integer);
begin
  Ftb_institution_id := Value;
end;

procedure TCashierItems.setFtb_payment_types_id(const Value: Integer);
begin
  Ftb_payment_types_id := Value;
end;

procedure TCashierItems.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TCashierItems.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
