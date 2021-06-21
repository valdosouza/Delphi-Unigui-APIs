unit tblStockBalance;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_stock_balance')]
  TStockBalance = Class(TGenericEntity)
  private
    Ftb_institution_id: Integer;
    Fupdated_at: TDAteTime;
    Fquantity: Real;
    Ftb_stock_list_id: Integer;
    Fminimum: Real;
    Ftb_merchandise_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFminimum(const Value: Real);
    procedure setFquantity(const Value: Real);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_merchandise_id(const Value: Integer);
    procedure setFtb_stock_list_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);


  public

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_stock_list_id')]
    [KeyField('tb_stock_list_id')]
    property Tabela: Integer read Ftb_stock_list_id write setFtb_stock_list_id;

    [FieldName('tb_merchandise_id')]
    [KeyField('tb_merchandise_id')]
    property Mercadoria: Integer read Ftb_merchandise_id write setFtb_merchandise_id;

    [FieldName('quantity')]
    property Quantidade: Real read Fquantity write setFquantity;

    [FieldName('minimum')]
    property Minimo: Real read Fminimum write setFminimum;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;


implementation



{ TStockBalance }

procedure TStockBalance.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TStockBalance.setFminimum(const Value: Real);
begin
  Fminimum := Value;
end;

procedure TStockBalance.setFquantity(const Value: Real);
begin
  Fquantity := Value;
end;

procedure TStockBalance.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TStockBalance.setFtb_merchandise_id(const Value: Integer);
begin
  Ftb_merchandise_id := Value;
end;

procedure TStockBalance.setFtb_stock_list_id(const Value: Integer);
begin
  Ftb_stock_list_id := Value;
end;

procedure TStockBalance.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
