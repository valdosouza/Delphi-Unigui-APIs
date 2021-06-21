unit tblKickback;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_kickback')]
  TKickback = Class(TGenericEntity)
  private
    Fhistoric: String;
    Fvl_payment: Real;
    Ftb_customer_id: Integer;
    Fupdated_at: TDAteTime;
    Fdt_payment: TDateTime;
    Ftb_collaborator_id: Integer;
    Ftb_order_item_id: Integer;
    Faliq: Real;
    Ftb_institution_id: Integer;
    Fbase_value: Real;
    Ftb_order_id: Integer;
    Fterminal: Integer;
    Fdt_record: TDateTime;
    Fcreated_at: TDAteTime;
    Fparcel: Integer;
    procedure setFaliq(const Value: Real);
    procedure setFbase_value(const Value: Real);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdt_payment(const Value: TDateTime);
    procedure setFdt_record(const Value: TDateTime);
    procedure setFhistoric(const Value: String);
    procedure setFparcel(const Value: Integer);
    procedure setFtb_collaborator_id(const Value: Integer);
    procedure setFtb_customer_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFtb_order_item_id(const Value: Integer);
    procedure setFterminal(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFvl_payment(const Value: Real);


  public

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [KeyField('terminal')]
    [FieldName('terminal')]
    property Terminal: Integer read Fterminal write setFterminal;

    //Vincula a Ordem ou ao financeiro relaciodo a ordem
    [KeyField('tb_order_id')]
    [FieldName('tb_order_id')]
    property Ordem: Integer read Ftb_order_id write setFtb_order_id;

    //Maior que zero, define que a comissão vem de um item da ordem.
    [KeyField('tb_order_item_id')]
    [FieldName('tb_order_item_id')]
    property ItemOrdem: Integer read Ftb_order_item_id write setFtb_order_item_id;

    //MArio que zero, define que a comissão foi paga conforme o recebimento no financeiro
    [KeyField('parcel')]
    [FieldName('parcel')]
    property Parcela: Integer read Fparcel write setFparcel;

    [FieldName('dt_record')]
    property Data: TDateTime read Fdt_record write setFdt_record;

    [FieldName('tb_customer_id')]
    property Cliente: Integer read Ftb_customer_id write setFtb_customer_id;

    [FieldName('tb_collaborator_id')]
    property Colaborador: Integer read Ftb_collaborator_id write setFtb_collaborator_id;

    [FieldName('historic')]
    property Historico: String read Fhistoric write setFhistoric;

   [FieldName('base_value')]
    property ValorBase: Real read Fbase_value write setFbase_value;

   [FieldName('aliq')]
    property Aliquota: Real read Faliq write setFaliq;

   [FieldName('vl_payment')]
    property Valor: Real read Fvl_payment write setFvl_payment;

   [FieldName('dt_payment')]
    property DataPagamento: TDateTime read Fdt_payment write setFdt_payment;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation


{ TKickback }

procedure TKickback.setFaliq(const Value: Real);
begin
  Faliq := Value;
end;

procedure TKickback.setFbase_value(const Value: Real);
begin
  Fbase_value := Value;
end;

procedure TKickback.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TKickback.setFdt_payment(const Value: TDateTime);
begin
  Fdt_payment := Value;
end;

procedure TKickback.setFdt_record(const Value: TDateTime);
begin
  Fdt_record := Value;
end;

procedure TKickback.setFhistoric(const Value: String);
begin
  Fhistoric := Value;
end;

procedure TKickback.setFparcel(const Value: Integer);
begin
  Fparcel := Value;
end;

procedure TKickback.setFtb_collaborator_id(const Value: Integer);
begin
  Ftb_collaborator_id := Value;
end;

procedure TKickback.setFtb_customer_id(const Value: Integer);
begin
  Ftb_customer_id := Value;
end;

procedure TKickback.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TKickback.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TKickback.setFtb_order_item_id(const Value: Integer);
begin
  Ftb_order_item_id := Value;
end;

procedure TKickback.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TKickback.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

procedure TKickback.setFvl_payment(const Value: Real);
begin
  Fvl_payment := Value;
end;

end.
