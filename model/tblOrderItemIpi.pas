unit tblOrderItemIpi;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_order_item_ipi')]
  TOrderItemIpi = Class(TGenericEntity)
  private
    Fstamp_ctrl: String;
    Fstamp_qtty: Real;
    Fclass_frame: String;
    Funit_value: Real;
    Fupdated_at: TDatetime;
    Ftb_order_item_id: Integer;
    Fclass_frame_code: String;
    Funit_qtty: Real;
    Ftb_institution_id: Integer;
    Fproducer_cnpj: String;
    Faliq_value: Real;
    Fbase_value: Real;
    Fcst: String;
    Fcreated_at: TDatetime;
    Ftb_order_id: Integer;
    Fterminal: Integer;
    procedure setFaliq_value(const Value: Real);
    procedure setFbase_value(const Value: Real);
    procedure setFclass_frame(const Value: String);
    procedure setFclass_frame_code(const Value: String);
    procedure setFcreated_at(const Value: TDatetime);
    procedure setFcst(const Value: String);
    procedure setFproducer_cnpj(const Value: String);
    procedure setFstamp_ctrl(const Value: String);
    procedure setFstamp_qtty(const Value: Real);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_order_item_id(const Value: Integer);
    procedure setFunit_qtty(const Value: Real);
    procedure setFunit_value(const Value: Real);
    procedure setFupdated_at(const Value: TDatetime);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFterminal(const Value: Integer);

  public
    [KeyField('tb_order_item_id')]
    [FieldName('tb_order_item_id')]
    property ItemOrdem: Integer read Ftb_order_item_id write setFtb_order_item_id;

    [KeyField('tb_order_id')]
    [FieldName('tb_order_id')]
    property Ordem: Integer read Ftb_order_id write setFtb_order_id;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('terminal')]
    [KeyField('terminal')]
    property Terminal: Integer read Fterminal write setFterminal;

    [FieldName('cst')]
    property CST: String read Fcst write setFcst;

    [FieldName('class_frame')]
    property Classe_Frame: String read Fclass_frame write setFclass_frame;

    [FieldName('producer_cnpj')]
    property CnpjFabricante: String read Fproducer_cnpj write setFproducer_cnpj;

    [FieldName('stamp_ctrl')]
    property Selo_ctrl: String read Fstamp_ctrl write setFstamp_ctrl;

    [FieldName('stamp_qtty')]
    property Selo_Quant: Real read Fstamp_qtty write setFstamp_qtty;

    [FieldName('class_frame_code')]
    property Classe_FrameCode: String read Fclass_frame_code write setFclass_frame_code;

    [FieldName('base_value')]
    property ValorBase: Real read Fbase_value write setFbase_value;

    [FieldName('aliq_value')]
    property ValorAliquota: Real read Faliq_value write setFaliq_value;

    [FieldName('unit_qtty')]
    property QuantUnidade: Real read Funit_qtty write setFunit_qtty;

	  [FieldName('unit_value')]
    property ValorUnitario: Real read Funit_value write setFunit_value;

    [FieldName('created_at')]
    property RegistroCriado: TDatetime read Fcreated_at write setFcreated_at;

	  [FieldName('updated_at')]
    property RegistroAlterado: TDatetime read Fupdated_at write setFupdated_at;

	End;

implementation


{ TOrderItemIpi }

procedure TOrderItemIpi.setFaliq_value(const Value: Real);
begin
  Faliq_value := Value;
end;

procedure TOrderItemIpi.setFbase_value(const Value: Real);
begin
  Fbase_value := Value;
end;

procedure TOrderItemIpi.setFclass_frame(const Value: String);
begin
  Fclass_frame := Value;
end;

procedure TOrderItemIpi.setFclass_frame_code(const Value: String);
begin
  Fclass_frame_code := Value;
end;

procedure TOrderItemIpi.setFcreated_at(const Value: TDatetime);
begin
  Fcreated_at := Value;
end;

procedure TOrderItemIpi.setFcst(const Value: String);
begin
  Fcst := Value;
end;

procedure TOrderItemIpi.setFproducer_cnpj(const Value: String);
begin
  Fproducer_cnpj := Value;
end;

procedure TOrderItemIpi.setFstamp_ctrl(const Value: String);
begin
  Fstamp_ctrl := Value;
end;

procedure TOrderItemIpi.setFstamp_qtty(const Value: Real);
begin
  Fstamp_qtty := Value;
end;

procedure TOrderItemIpi.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TOrderItemIpi.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TOrderItemIpi.setFtb_order_item_id(const Value: Integer);
begin
  Ftb_order_item_id := Value;
end;

procedure TOrderItemIpi.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TOrderItemIpi.setFunit_qtty(const Value: Real);
begin
  Funit_qtty := Value;
end;

procedure TOrderItemIpi.setFunit_value(const Value: Real);
begin
  Funit_value := Value;
end;

procedure TOrderItemIpi.setFupdated_at(const Value: TDatetime);
begin
  Fupdated_at := Value;
end;

end.
