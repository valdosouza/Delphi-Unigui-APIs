unit tblSalesmanHasStock;

interface

Uses GenericEntity,GenericDao,CAtribEntity, Classes, SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_salesman_has_stock')]
  TSalesmanHasStock = Class(TGenericEntity)
  private
    Ftb_stock_id: Integer;
    Fupdated_at: TDAteTime;
    Ftb_salesman_id: Integer;
    Ftb_institution_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_salesman_id(const Value: Integer);
    procedure setFtb_stock_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);

  public

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_salesman_id')]
    [KeyField('tb_salesman_id')]
    property Vendedor: Integer read Ftb_salesman_id write setFtb_salesman_id;

    [FieldName('tb_stock_id')]
    [KeyField('tb_stock_id')]
    property Estoque: Integer read Ftb_stock_id write setFtb_stock_id;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation

{ TSalesmanHasStock }

procedure TSalesmanHasStock.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TSalesmanHasStock.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TSalesmanHasStock.setFtb_salesman_id(const Value: Integer);
begin
  Ftb_salesman_id := Value;
end;

procedure TSalesmanHasStock.setFtb_stock_id(const Value: Integer);
begin
  Ftb_stock_id := Value;
end;

procedure TSalesmanHasStock.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
