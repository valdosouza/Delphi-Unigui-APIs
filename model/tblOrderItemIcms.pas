unit tblOrderItemIcms;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_order_item_icms')]
  TOrderItemIcms = Class(TGenericEntity)
  private
    Ffreight_value: Real;
    Fcred_calc_aliq: Real;
    Fvalue: Real;
    Fpass_through: String;
    Fwithheld_base_value_st: Real;
    Faliq_rd_base: Real;
    Faliq_st: Real;
    Fdeterm_base_st: String;
    Fmva: Real;
    Fsharing: String;
    Fupdated_at: TDAteTime;
    Fwithheld_value_st: Real;
    Faliq_rd_st: Real;
    Ftb_order_item_id: Integer;
    Ftb_cfop_id: String;
    Finsurance_value: Real;
    Fcred_expl_value: Real;
    Fwithheld_base_value: Real;
    Fbase_value_st: Real;
    Faliq: Real;
    Fdeterm_base: String;
    Ftb_institution_id: Integer;
    Fexpenses_value: Real;
    Fwithheld_value: Real;
    Fvalue_st: Real;
    Faliq_rd: Real;
    Fbase_value: Real;
    Faliq_rd_base_st: Real;
    Forigem: String;
    Ftb_taxation_nr_icms_id: String;
    Fcreated_at: TDAteTime;
    Fdischarge: Integer;
    Ftb_order_id: Integer;
    Fterminal: Integer;
    procedure setFaliq(const Value: Real);
    procedure setFAliq_rd(const Value: Real);
    procedure setFaliq_rd_base(const Value: Real);
    procedure setFaliq_rd_base_st(const Value: Real);
    procedure setFAliq_rd_st(const Value: Real);
    procedure setFaliq_st(const Value: Real);
    procedure setFbase_value(const Value: Real);
    procedure setFbase_value_st(const Value: Real);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFcred_calc_aliq(const Value: Real);
    procedure setFcred_expl_value(const Value: Real);
    procedure setFcst(const Value: String);
    procedure setFdeterm_base(const Value: String);
    procedure setFdeterm_base_st(const Value: String);
    procedure setFdischarge(const Value: Integer);
    procedure setFexpenses_value(const Value: Real);
    procedure setFfreight_value(const Value: Real);
    procedure setFinsurance_value(const Value: Real);
    procedure setFmva(const Value: Real);
    procedure setForigem(const Value: String);
    procedure setFpass_through(const Value: String);
    procedure setFsharing(const Value: String);
    procedure setFtb_cfop_id(const Value: String);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_order_item_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFvalue(const Value: Real);
    procedure setFvalue_st(const Value: Real);
    procedure setFwithheld_base_value(const Value: Real);
    procedure setFwithheld_base_value_st(const Value: Real);
    procedure setFwithheld_value(const Value: Real);
    procedure setFwithheld_value_st(const Value: Real);
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
    property cst: String read Ftb_taxation_nr_icms_id write setFcst;

    [FieldName('origem')]
    property Origem: String read Forigem write setForigem;

    [FieldName('determ_base')]
    property DetermincaoBase: String read Fdeterm_base write setFdeterm_base;

    [FieldName('determ_base_st')]
    property DetermincaoBaseST: String read Fdeterm_base_st write setFdeterm_base_st;

    [FieldName('discharge')]
    property Desoneracao: Integer read Fdischarge write setFdischarge;

    [FieldName('aliq_rd_base')]
    property AliqReducaoBase: Real read Faliq_rd_base write setFaliq_rd_base;

    [FieldName('base_value')]
    property ValorBase: Real read Fbase_value write setFbase_value;

    [FieldName('aliq')]
    property Aliquota: Real read Faliq write setFaliq;

    [FieldName('aliq_rd')]
    property ReducaoAliquota: Real read Faliq_rd write setFAliq_rd;

    [FieldName('value')]
    property Valor: Real read Fvalue write setFvalue;

    [FieldName('aliq_rd_base_st')]
    property AliqReducaoBaseST: Real read Faliq_rd_base_st write setFaliq_rd_base_st;

    [FieldName('base_value_st')]
    property ValorBaseST: Real read Fbase_value_st write setFbase_value_st;

    [FieldName('aliq_st')]
    property AliquotaST: Real read Faliq_st write setFaliq_st;

    [FieldName('aliq_rd_st')]
    property ReducaoAliquotaST: Real read Faliq_rd_st write setFAliq_rd_st;

    [FieldName('value_st')]
    property ValorST: Real read Fvalue_st write setFvalue_st;

    [FieldName('mva')]
    property MVA: Real read Fmva write setFmva;

    [FieldName('withheld_base_value')]
    property ValorBaseRetido: Real read Fwithheld_base_value write setFwithheld_base_value;

    [FieldName('withheld_value')]
    property ValorRetido: Real read Fwithheld_value write setFwithheld_value;

    [FieldName('withheld_base_value_st')]
    property ValorBaseRetidoST: Real read Fwithheld_base_value_st write setFwithheld_base_value_st;

    [FieldName('withheld_value_st')]
    property ValorRetidoST: Real read Fwithheld_value_st write setFwithheld_value_st;

    [FieldName('sharing')]
    property PArtilha: String read Fsharing write setFsharing;

    [FieldName('pass_through')]
    property Repasse: String read Fpass_through write setFpass_through;

    [FieldName('cred_calc_aliq')]
    property Aliquota_CalcCred: Real read Fcred_calc_aliq write setFcred_calc_aliq;

    [FieldName('cred_expl_value')]
    property Valor_CredExpl: Real read Fcred_expl_value write setFcred_expl_value;


    [FieldName('freight_value')]
    property ValorFrete: Real read Ffreight_value write setFfreight_value;

	  [FieldName('insurance_value')]
    property ValorSeguro: Real read Finsurance_value write setFinsurance_value;

	  [FieldName('expenses_value')]
    property ValorDespesas: Real read Fexpenses_value write setFexpenses_value;

	  [FieldName('tb_cfop_id')]
    property Cfop: String read Ftb_cfop_id write setFtb_cfop_id;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

	End;

implementation


{ TOrderItemIcms }

procedure TOrderItemIcms.setFaliq(const Value: Real);
begin
  Faliq := Value;
end;

procedure TOrderItemIcms.setFAliq_rd(const Value: Real);
begin
  Faliq_rd := Value;
end;

procedure TOrderItemIcms.setFaliq_rd_base(const Value: Real);
begin
  Faliq_rd_base := Value;
end;

procedure TOrderItemIcms.setFaliq_rd_base_st(const Value: Real);
begin
  Faliq_rd_base_st := Value;
end;

procedure TOrderItemIcms.setFAliq_rd_st(const Value: Real);
begin
  Faliq_rd_st := Value;
end;

procedure TOrderItemIcms.setFaliq_st(const Value: Real);
begin
  Faliq_st := Value;
end;

procedure TOrderItemIcms.setFbase_value(const Value: Real);
begin
  Fbase_value := Value;
end;

procedure TOrderItemIcms.setFbase_value_st(const Value: Real);
begin
  Fbase_value_st := Value;
end;

procedure TOrderItemIcms.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TOrderItemIcms.setFcred_calc_aliq(const Value: Real);
begin
  Fcred_calc_aliq := Value;
end;

procedure TOrderItemIcms.setFcred_expl_value(const Value: Real);
begin
  Fcred_expl_value := Value;
end;

procedure TOrderItemIcms.setFcst(const Value: String);
begin
  Ftb_taxation_nr_icms_id := Value;
end;

procedure TOrderItemIcms.setFdeterm_base(const Value: String);
begin
  Fdeterm_base := Value;
end;

procedure TOrderItemIcms.setFdeterm_base_st(const Value: String);
begin
  Fdeterm_base_st := Value;
end;

procedure TOrderItemIcms.setFdischarge(const Value: Integer);
begin
  Fdischarge := Value;
end;

procedure TOrderItemIcms.setFexpenses_value(const Value: Real);
begin
  Fexpenses_value := Value;
end;

procedure TOrderItemIcms.setFfreight_value(const Value: Real);
begin
  Ffreight_value := Value;
end;

procedure TOrderItemIcms.setFinsurance_value(const Value: Real);
begin
  Finsurance_value := Value;
end;

procedure TOrderItemIcms.setFmva(const Value: Real);
begin
  Fmva := Value;
end;

procedure TOrderItemIcms.setForigem(const Value: String);
begin
  Forigem := Value;
end;

procedure TOrderItemIcms.setFpass_through(const Value: String);
begin
  Fpass_through := Value;
end;

procedure TOrderItemIcms.setFsharing(const Value: String);
begin
  Fsharing := Value;
end;

procedure TOrderItemIcms.setFtb_cfop_id(const Value: String);
begin
  Ftb_cfop_id := Value;
end;

procedure TOrderItemIcms.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TOrderItemIcms.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TOrderItemIcms.setFtb_order_item_id(const Value: Integer);
begin
  Ftb_order_item_id := Value;
end;

procedure TOrderItemIcms.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TOrderItemIcms.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

procedure TOrderItemIcms.setFvalue(const Value: Real);
begin
  Fvalue := Value;
end;

procedure TOrderItemIcms.setFvalue_st(const Value: Real);
begin
  Fvalue_st := Value;
end;

procedure TOrderItemIcms.setFwithheld_base_value(const Value: Real);
begin
  Fwithheld_base_value := Value;
end;

procedure TOrderItemIcms.setFwithheld_base_value_st(const Value: Real);
begin
  Fwithheld_base_value_st := Value;
end;

procedure TOrderItemIcms.setFwithheld_value(const Value: Real);
begin
  Fwithheld_value := Value;
end;

procedure TOrderItemIcms.setFwithheld_value_st(const Value: Real);
begin
  Fwithheld_value_st := Value;
end;

end.
