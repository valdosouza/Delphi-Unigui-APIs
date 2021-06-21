unit tblFinancial;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_financial')]
  Tfinancial = Class(TGenericEntity)
  private
    Ftag_value: Real;
    Ftb_payment_types_id: Integer;
    Fupdated_at: TDAteTime;
    Fdt_expiration: TDateTime;
    Ftb_institution_id: Integer;
    FTerminal: Integer;
    Ftb_order_id: Integer;
    Fcreated_at: TDAteTime;
    Fparcel: Integer;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdt_expiration(const Value: TDateTime);
    procedure setFparcel(const Value: Integer);
    procedure setFtag_value(const Value: Real);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFtb_payment_types_id(const Value: Integer);
    procedure setFTerminal(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);

  public
    [KeyField('tb_order_id')]
    [FieldName('tb_order_id')]
    property Ordem: Integer read Ftb_order_id write setFtb_order_id;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [KeyField('terminal')]
    [FieldName('terminal')]
    property Terminal: Integer read FTerminal write setFTerminal;

    [KeyField('parcel')]
    [FieldName('parcel')]
    property Parcela: Integer read Fparcel write setFparcel;

    [FieldName('dt_expiration')]
    property DataExpiracao: TDateTime read Fdt_expiration write setFdt_expiration;

    [FieldName('tb_payment_types_id')]
    property TipoPagamento: Integer read Ftb_payment_types_id write setFtb_payment_types_id;

    [FieldName('tag_value')]
    property Valor: Real read Ftag_value write setFtag_value;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

	End;

implementation

{ Tfinancial }

procedure Tfinancial.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure Tfinancial.setFdt_expiration(const Value: TDateTime);
begin
  Fdt_expiration := Value;
end;

procedure Tfinancial.setFparcel(const Value: Integer);
begin
  Fparcel := Value;
end;

procedure Tfinancial.setFtag_value(const Value: Real);
begin
  Ftag_value := Value;
end;

procedure Tfinancial.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure Tfinancial.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure Tfinancial.setFtb_payment_types_id(const Value: Integer);
begin
  Ftb_payment_types_id := Value;
end;

procedure Tfinancial.setFTerminal(const Value: Integer);
begin
  FTerminal := Value;
end;

procedure Tfinancial.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
