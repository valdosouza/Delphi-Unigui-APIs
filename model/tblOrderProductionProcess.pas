unit tblOrderProductionProcess;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_order_production_process')]
  TOrderProductionProcess = Class(TGenericEntity)
  private
    Ftb_stock_id_out: Integer;
    Ftb_order_id: Integer;
    Fupdated_at: TDatetime;
    Ftb_stock_id_in: Integer;
    Fdt_start: TDateTime;
    Ftb_situation_id: Integer;
    Fqtty: Real;
    Ftb_institution_id: Integer;
    Fstage: Integer;
    Fterminal: Integer;
    Fdt_end: TDateTime;
    Fcreated_at: TDatetime;
    procedure setFcreated_at(const Value: TDatetime);
    procedure setFdt_end(const Value: TDateTime);
    procedure setFdt_start(const Value: TDateTime);
    procedure setFqtty(const Value: Real);
    procedure setFstage(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFtb_situation_id(const Value: Integer);
    procedure setFtb_stock_id_in(const Value: Integer);
    procedure setFtb_stock_id_out(const Value: Integer);
    procedure setFterminal(const Value: Integer);
    procedure setFupdated_at(const Value: TDatetime);

  public
    [KeyField('tb_order_id')]
    [FieldName('tb_order_id')]
    property CodigoOrdem: Integer read Ftb_order_id write setFtb_order_id;

	  [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('terminal')]
    [KeyField('terminal')]
    property Terminal: Integer read Fterminal write setFterminal;

    [FieldName('stage')]
    property Fase: Integer read Fstage write setFstage;

    [FieldName('tb_stock_id_out')]
    property CodigoEstoque_Saida: Integer read Ftb_stock_id_out write setFtb_stock_id_out;

    [FieldName('tb_stock_id_in')]
    property CodigoEstoque_Entrada: Integer read Ftb_stock_id_in write setFtb_stock_id_in;

    [FieldName('tb_situation_id')]
    property Situacao: Integer read Ftb_situation_id write setFtb_situation_id;

    [FieldName('dt_start')]
    property DataInicio: TDateTime read Fdt_start write setFdt_start;

    [FieldName('dt_end')]
    property DataFinal: TDateTime read Fdt_end write setFdt_end;

    [FieldName('quantity')]
    property Quantidade: Real read Fqtty write setFqtty;

	  [FieldName('created_at')]
    property RegistroCriado: TDatetime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDatetime read Fupdated_at write setFupdated_at;

	End;

implementation

{ TOrderProductionProcess }

procedure TOrderProductionProcess.setFcreated_at(const Value: TDatetime);
begin
  Fcreated_at := Value;
end;

procedure TOrderProductionProcess.setFdt_end(const Value: TDateTime);
begin
  Fdt_end := Value;
end;

procedure TOrderProductionProcess.setFdt_start(const Value: TDateTime);
begin
  Fdt_start := Value;
end;

procedure TOrderProductionProcess.setFqtty(const Value: Real);
begin
  Fqtty := Value;
end;

procedure TOrderProductionProcess.setFstage(const Value: Integer);
begin
  Fstage := Value;
end;

procedure TOrderProductionProcess.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TOrderProductionProcess.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TOrderProductionProcess.setFtb_situation_id(const Value: Integer);
begin
  Ftb_situation_id := Value;
end;

procedure TOrderProductionProcess.setFtb_stock_id_in(const Value: Integer);
begin
  Ftb_stock_id_in := Value;
end;

procedure TOrderProductionProcess.setFtb_stock_id_out(const Value: Integer);
begin
  Ftb_stock_id_out := Value;
end;

procedure TOrderProductionProcess.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TOrderProductionProcess.setFupdated_at(const Value: TDatetime);
begin
  Fupdated_at := Value;
end;

end.
