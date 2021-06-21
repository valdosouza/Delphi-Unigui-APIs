unit tblStockReserved;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_stock_reserved')]
  TStockReserved = Class(TGenericEntity)
  private
    Fdt_record: TDateTime;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Ftb_merchandise_id: Integer;
    Ftb_stock_list_id: Integer;
    FQtde: Real;
    Ftb_institution_id: Integer;
    Fcreated_at: TDAteTime;
    Fstatus: String;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdt_record(const Value: TDateTime);
    procedure setFId(const Value: Integer);
    procedure setFQtde(const Value: Real);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_merchandise_id(const Value: Integer);
    procedure setFtb_stock_list_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFstatus(const Value: String);




  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [KeyField('tb_stock_list_id')]
    [FieldName('tb_stock_list_id')]
    property ListaEstoque: Integer read Ftb_stock_list_id write setFtb_stock_list_id;

    [KeyField('tb_merchandise_id')]
    [FieldName('tb_merchandise_id')]
    property Mercadoria: Integer read Ftb_merchandise_id write setFtb_merchandise_id;

    [FieldName('dt_record')]
    property DataRegistro: TDateTime read Fdt_record write setFdt_record;

    [FieldName('quantity')]
    property Quantidade: Real read FQtde write setFQtde;

    [FieldName('status')]
    property Status: String read Fstatus write setFstatus;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

  implementation

{ TStockReserved }



{ TStockReserved }

procedure TStockReserved.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TStockReserved.setFdt_record(const Value: TDateTime);
begin
  Fdt_record := Value;
end;

procedure TStockReserved.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TStockReserved.setFQtde(const Value: Real);
begin
  FQtde := Value;
end;

procedure TStockReserved.setFstatus(const Value: String);
begin
  Fstatus := Value;
end;

procedure TStockReserved.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TStockReserved.setFtb_merchandise_id(const Value: Integer);
begin
  Ftb_merchandise_id := Value;
end;

procedure TStockReserved.setFtb_stock_list_id(const Value: Integer);
begin
  Ftb_stock_list_id := Value;
end;

procedure TStockReserved.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
