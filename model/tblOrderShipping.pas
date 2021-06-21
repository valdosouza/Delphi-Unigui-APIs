unit tblOrderShipping;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_order_shipping')]
  TOrderShipping = Class(TGenericEntity)
  private
    Fdelivery_date: TDateTime;
    Fvalue: Real;
    Ftb_carrier_id: Integer;
    Fid: Integer;
    Fupdated_at: TDatetime;
    Ftb_freight_mode_id: String;
    Ftb_institution_id: Integer;
    Fhelp_reference: String;
    Fkind: Integer;
    Ftb_address_id: Integer;
    Fcreated_at: TDatetime;
    Fterminal: Integer;
    procedure setFcreated_at(const Value: TDatetime);
    procedure setFdelivery_date(const Value: TDateTime);
    procedure setFhelp_reference(const Value: String);
    procedure setFid(const Value: Integer);
    procedure setFkind(const Value: Integer);
    procedure setFtb_address_id(const Value: Integer);
    procedure setFtb_carrier_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDatetime);
    procedure setFvalue(const Value: Real);
    procedure settb_freight_mode_id(const Value: String);
    procedure setFterminal(const Value: Integer);

  public
    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read Fid write setFid;

	  [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('terminal')]
    [KeyField('terminal')]
    property Terminal: Integer read Fterminal write setFterminal;

    [FieldName('tb_carrier_id')]
    property Transportadora: Integer read Ftb_carrier_id write setFtb_carrier_id;

    [FieldName('tb_address_id')]
    property Endereco: Integer read Ftb_address_id write setFtb_address_id;

    [FieldName('help_reference')]
    property PontoReferencia: String read Fhelp_reference write setFhelp_reference;

    [FieldName('delivery_date')]
    property DiaEntrega: TDateTime read Fdelivery_date write setFdelivery_date;

    [FieldName('kind')]
    property Tipo: Integer read Fkind write setFkind;

    [FieldName('tb_freight_mode_id')]
    property ModalidadeFrete: String read Ftb_freight_mode_id write settb_freight_mode_id;

    [FieldName('value')]
    property Valor: Real read Fvalue write setFvalue;

  	[FieldName('created_at')]
    property RegistroCriado: TDatetime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDatetime read Fupdated_at write setFupdated_at;

	End;

implementation



{ TOrderShipping }

procedure TOrderShipping.setFcreated_at(const Value: TDatetime);
begin
  Fcreated_at := Value;
end;

procedure TOrderShipping.setFdelivery_date(const Value: TDateTime);
begin
  Fdelivery_date := Value;
end;

procedure TOrderShipping.setFhelp_reference(const Value: String);
begin
  Fhelp_reference := Value;
end;

procedure TOrderShipping.setFid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TOrderShipping.setFkind(const Value: Integer);
begin
  Fkind := Value;
end;

procedure TOrderShipping.setFtb_address_id(const Value: Integer);
begin
  Ftb_address_id := Value;
end;

procedure TOrderShipping.setFtb_carrier_id(const Value: Integer);
begin
  Ftb_carrier_id := Value;
end;

procedure TOrderShipping.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TOrderShipping.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TOrderShipping.setFupdated_at(const Value: TDatetime);
begin
  Fupdated_at := Value;
end;

procedure TOrderShipping.setFvalue(const Value: Real);
begin
  Fvalue := Value;
end;

procedure TOrderShipping.settb_freight_mode_id(const Value: String);
begin
  Ftb_freight_mode_id := Value;
end;

end.
