unit tblOrderProduction;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_order_production')]
  TOrderProduction = Class(TGenericEntity)
  private
    Ftb_stock_list_id_des: Integer;
    Ftb_stock_list_id_ori: Integer;
    Fid: Integer;
    Fupdated_at: TDatetime;
    Fnumber: Integer;
    Ftb_merchandise_id: Integer;
    Fqtty_forecast: Real;
    Fdt_start: TDateTime;
    Ftb_situation_id: Integer;
    Ftb_institution_id: Integer;
    Fterminal: Integer;
    Fdt_end: TDateTime;
    Fcreated_at: TDatetime;
    procedure setFcreated_at(const Value: TDatetime);
    procedure setFdt_end(const Value: TDateTime);
    procedure setFdt_start(const Value: TDateTime);
    procedure setFid(const Value: Integer);
    procedure setFnumber(const Value: Integer);
    procedure setFqtty_forecast(const Value: Real);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_merchandise_id(const Value: Integer);
    procedure setFtb_situation_id(const Value: Integer);
    procedure setFtb_stock_list_id_des(const Value: Integer);
    procedure setFtb_stock_list_id_ori(const Value: Integer);
    procedure setFterminal(const Value: Integer);
    procedure setFupdated_at(const Value: TDatetime);

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

    [FieldName('number')]
    property Numero: Integer read Fnumber write setFnumber;

    [FieldName('dt_start')]
    property DataInicio: TDateTime read Fdt_start write setFdt_start;

    [FieldName('dt_end')]
    property DataFinal: TDateTime read Fdt_end write setFdt_end;

    [FieldName('tb_merchandise_id')]
    property Mercadoria: Integer read Ftb_merchandise_id write setFtb_merchandise_id;

    [FieldName('tb_situation_id')]
    property Situacao: Integer read Ftb_situation_id write setFtb_situation_id;

    [FieldName('qtty_forecast')]
    property PrevisaoQtde: Real read Fqtty_forecast write setFqtty_forecast;

    [FieldName('tb_stock_list_id_des')]
    property EstoqueDestino: Integer read Ftb_stock_list_id_des write setFtb_stock_list_id_des;

    [FieldName('tb_stock_list_id_ori')]
    property EstoqueOrigem: Integer read Ftb_stock_list_id_ori write setFtb_stock_list_id_ori;

	  [FieldName('created_at')]
    property RegistroCriado: TDatetime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDatetime read Fupdated_at write setFupdated_at;

	End;

implementation

{ TOrderProduction }

procedure TOrderProduction.setFcreated_at(const Value: TDatetime);
begin
  Fcreated_at := Value;
end;

procedure TOrderProduction.setFdt_end(const Value: TDateTime);
begin
  Fdt_end := Value;
end;

procedure TOrderProduction.setFdt_start(const Value: TDateTime);
begin
  Fdt_start := Value;
end;

procedure TOrderProduction.setFid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TOrderProduction.setFnumber(const Value: Integer);
begin
  Fnumber := Value;
end;

procedure TOrderProduction.setFqtty_forecast(const Value: Real);
begin
  Fqtty_forecast := Value;
end;

procedure TOrderProduction.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TOrderProduction.setFtb_merchandise_id(const Value: Integer);
begin
  Ftb_merchandise_id := Value;
end;

procedure TOrderProduction.setFtb_situation_id(const Value: Integer);
begin
  Ftb_situation_id := Value;
end;

procedure TOrderProduction.setFtb_stock_list_id_des(const Value: Integer);
begin
  Ftb_stock_list_id_des := Value;
end;

procedure TOrderProduction.setFtb_stock_list_id_ori(const Value: Integer);
begin
  Ftb_stock_list_id_ori := Value;
end;

procedure TOrderProduction.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TOrderProduction.setFupdated_at(const Value: TDatetime);
begin
  Fupdated_at := Value;
end;

end.
