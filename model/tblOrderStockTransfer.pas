unit tblOrderStockTransfer;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_order_stock_transfer')]
  TOrderStockTransfer = Class(TGenericEntity)
  private
		Fid : Integer;
    Ftb_order_id : Integer;
		Ftb_institution_id : Integer;
  	Fnumber : Integer;
  	Ftb_situation_id : Integer;
  	Ftb_stock_id_ori : Integer;
    Ftb_stock_id_des : Integer;
		Fcreated_at : TDateTime;
		Fupdated_at : TDateTime;
    Ftb_entity_id: Integer;
    Fterminal: Integer;
    procedure setFcreated_at(const Value: TDatetime);
    procedure setFid(const Value: Integer);
    procedure setFnumber(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFtb_situation_id(const Value: Integer);
    procedure setFtb_stock_id_des(const Value: Integer);
    procedure setFtb_stock_id_ori(const Value: Integer);
    procedure setFupdated_at(const Value: TDatetime);
    procedure setFtb_entity_id(const Value: Integer);
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

    [FieldName('number')]
    property Numero: Integer read Fnumber write setFnumber;

    [FieldName('tb_entity_id')]
    property Entidade: Integer read Ftb_entity_id write setFtb_entity_id;

    [FieldName('tb_situation_id')]
    property Situacao: Integer read Ftb_situation_id write setFtb_situation_id;

    [FieldName('tb_stock_list_id_ori')]
    property EstoqueOrigem: Integer read Ftb_stock_id_ori write setFtb_stock_id_ori;

    [FieldName('tb_stock_list_id_des')]
    property EstoqueDestino: Integer read Ftb_stock_id_des write setFtb_stock_id_des;

	  [FieldName('created_at')]
    property RegistroCriado: TDatetime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDatetime read Fupdated_at write setFupdated_at;

	End;

implementation


{ TOrderStockTransfer }

procedure TOrderStockTransfer.setFcreated_at(const Value: TDatetime);
begin
  Fcreated_at := Value;
end;

procedure TOrderStockTransfer.setFid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TOrderStockTransfer.setFnumber(const Value: Integer);
begin
  Fnumber := Value;
end;

procedure TOrderStockTransfer.setFtb_entity_id(const Value: Integer);
begin
  Ftb_entity_id := Value;
end;

procedure TOrderStockTransfer.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TOrderStockTransfer.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TOrderStockTransfer.setFtb_situation_id(const Value: Integer);
begin
  Ftb_situation_id := Value;
end;

procedure TOrderStockTransfer.setFtb_stock_id_des(const Value: Integer);
begin
  Ftb_stock_id_des := Value;
end;

procedure TOrderStockTransfer.setFtb_stock_id_ori(const Value: Integer);
begin
  Ftb_stock_id_ori := Value;
end;

procedure TOrderStockTransfer.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TOrderStockTransfer.setFupdated_at(const Value: TDatetime);
begin
  Fupdated_at := Value;
end;

end.
