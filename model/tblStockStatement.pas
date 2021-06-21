unit tblStockStatement;

interface

Uses GenericEntity,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_stock_statement')]
  TStockStatement = Class(TGenericEntity)
  private
    Ftb_stock_reserved_id: Integer;
    Ftb_order_id: Integer;
    Flocal: String;
    Fkind: String;
    Ftb_stock_list_id: Integer;
    Fdt_record: TDateTime;
    Fdirection: String;
    Ftb_merchandise_id: Integer;
    Ftb_order_item_id: Integer;
    FQtde: Real;
    Fupdated_at: TDAteTime;
    FTb_institution_id: Integer;
    Fcreated_at: TDAteTime;
    Fterminal: Integer;
    Foperation: String;
    Fid: Integer;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdirection(const Value: String);
    procedure setFdt_record(const Value: TDateTime);
    procedure setFkind(const Value: String);
    procedure setFlocal(const Value: String);
    procedure setFQtde(const Value: Real);
    procedure setFTb_institution_id(const Value: Integer);
    procedure setFtb_merchandise_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFtb_order_item_id(const Value: Integer);
    procedure setFtb_stock_list_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFterminal(const Value: Integer);
    procedure setFoperation(const Value: String);
    procedure setFId(const Value: Integer);

 public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read Fid write setFId;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read FTb_institution_id write setFTb_institution_id;

    [FieldName('terminal')]
    [KeyField('terminal')]
    property Terminal: Integer read Fterminal write setFterminal;

    [FieldName('tb_order_id')]
    [KeyField('tb_order_id')]
    property Ordem: Integer read Ftb_order_id write setFtb_order_id;

    [FieldName('tb_order_item_id')]
    [KeyField('tb_order_item_id')]
    property OrdemItem: Integer read Ftb_order_item_id write setFtb_order_item_id;

    [FieldName('tb_stock_list_id')]
    [KeyField('tb_stock_list_id')]
    property Estoque: Integer read Ftb_stock_list_id write setFtb_stock_list_id;

    [FieldName('local')]
    property Local: String read Flocal write setFlocal;

    [FieldName('kind')]
    property Tipo: String read Fkind write setFkind;

    [FieldName('dt_record')]
    property DataRegistro: TDateTime read Fdt_record write setFdt_record;

    [FieldName('direction')]
    property Direcao: String read Fdirection write setFdirection;

    [FieldName('tb_merchandise_id')]
    property Mercadoria: Integer read Ftb_merchandise_id write setFtb_merchandise_id;

    [FieldName('quantity')]
    property Quantidade: Real read FQtde write setFQtde;

    [FieldName('operation')]
    property Operacao: String read Foperation write setFoperation;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;

implementation



{ TStockStatement }

procedure TStockStatement.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TStockStatement.setFdirection(const Value: String);
begin
  Fdirection := Value;
end;

procedure TStockStatement.setFdt_record(const Value: TDateTime);
begin
  Fdt_record := Value;
end;

procedure TStockStatement.setFId(const Value: Integer);
begin
  Fid := Value;
end;

procedure TStockStatement.setFkind(const Value: String);
begin
  Fkind := Value;
end;

procedure TStockStatement.setFlocal(const Value: String);
begin
  Flocal := Value;
end;

procedure TStockStatement.setFoperation(const Value: String);
begin
  Foperation := Value;
end;

procedure TStockStatement.setFQtde(const Value: Real);
begin
  FQtde := Value;
end;

procedure TStockStatement.setFTb_institution_id(const Value: Integer);
begin
  FTb_institution_id := Value;
end;

procedure TStockStatement.setFtb_merchandise_id(const Value: Integer);
begin
  Ftb_merchandise_id := Value;
end;

procedure TStockStatement.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TStockStatement.setFtb_order_item_id(const Value: Integer);
begin
  Ftb_order_item_id := Value;
end;

procedure TStockStatement.setFtb_stock_list_id(const Value: Integer);
begin
  Ftb_stock_list_id := Value;
end;

procedure TStockStatement.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TStockStatement.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
