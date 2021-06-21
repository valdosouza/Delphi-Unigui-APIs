unit tblOrderBilling;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_order_billing')]
  TOrderBilling = Class(TGenericEntity)

  private
    Ftb_payment_types_id: Integer;
    Fid: Integer;
    Ftask_owner: Integer;
    Fdeadline: String;
    Fupdated_at: TDatetime;
    Fplots: String;
    Ftb_institution_id: Integer;
    Fcreated_at: TDatetime;
    Fterminal: Integer;
    procedure setFcreated_at(const Value: TDatetime);
    procedure setFdeadline(const Value: String);
    procedure setFid(const Value: Integer);
    procedure setFplots(const Value: String);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_payment_types_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDatetime);
    procedure settask_owner(const Value: Integer);
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

    [FieldName('tb_payment_types_id')]
    property FormaPagamento: Integer read Ftb_payment_types_id write setFtb_payment_types_id;

    [FieldName('plots')]
    property Parcelas: String read Fplots write setFplots;

    [FieldName('deadline')]
    property Prazo: String read Fdeadline write setFdeadline;

    [FieldName('task_owner')]
    property Responsavel: Integer read Ftask_owner write settask_owner;

  	[FieldName('created_at')]
    property RegistroCriado: TDatetime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDatetime read Fupdated_at write setFupdated_at;

  End;
implementation

{ TOrderBilling }

procedure TOrderBilling.setFcreated_at(const Value: TDatetime);
begin
  Fcreated_at := Value;
end;

procedure TOrderBilling.setFdeadline(const Value: String);
begin
  Fdeadline := Value;
end;

procedure TOrderBilling.setFid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TOrderBilling.setFplots(const Value: String);
begin
  Fplots := Value;
end;

procedure TOrderBilling.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TOrderBilling.setFtb_payment_types_id(const Value: Integer);
begin
  Ftb_payment_types_id := Value;
end;

procedure TOrderBilling.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TOrderBilling.setFupdated_at(const Value: TDatetime);
begin
  Fupdated_at := Value;
end;

procedure TOrderBilling.settask_owner(const Value: Integer);
begin
  Ftask_owner := Value;
end;

end.
