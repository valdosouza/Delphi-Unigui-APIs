unit tblTaxRuler;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_tax_ruler')]
  TTaxRuler = Class(TGenericEntity)
  private
    Ftb_product_id: Integer;
    Ffor_icms_st: String;
    Ftb_observation_id: Integer;
    Firrj_aliq: Real;
    Ficms_base_reduced: Real;
    Fpis_aliq: Real;
    Ftb_deter_base_tax_icms_id: String;
    Fcofins_aliq: Real;
    Fdirection: String;
    Fpropag_base_reduc: String;
    Fid: Integer;
    Fafrmm_aliq: Real;
    Fupdated_at: TDAteTime;
    Ftb_cfop_id: String;
    Ftb_tax_pis_id: String;
    Ftax_substitute: String;
    Ftb_tax_cofins_id: String;
    Fipi_aliq: Real;
    Fncm: String;
    Ftransaction_kind: String;
    Fsiscomex_aliq: Real;
    Ftb_institution_id: Integer;
    Fii_aliq: Real;
    Ficms_aliq_reduced: Real;
    Ffor_consumer: String;
    Ftb_tax_ipi_id: String;
    Ficms_aliq: Real;
    Ftb_deter_base_tax_icms_st_id: String;
    Fcrt: String;
    Ftb_tax_icms_nr_id: String;
    Forigem: String;
    Fcsll_aqli: Real;
    Ftb_state_id: Integer;
    Fcreated_at: TDAteTime;
    Ftb_discharge_icms_id: Integer;
    Ftb_tax_icms_sn_id: String;
    procedure setFafrmm_aliq(const Value: Real);
    procedure setFcofins_aliq(const Value: Real);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFcrt(const Value: String);
    procedure setFcsll_aqli(const Value: Real);
    procedure setFdirection(const Value: String);
    procedure setFfor_consumer(const Value: String);
    procedure setFfor_icms_st(const Value: String);
    procedure setFicms_aliq(const Value: Real);
    procedure setFicms_aliq_reduced(const Value: Real);
    procedure setFicms_base_reduced(const Value: Real);
    procedure setFid(const Value: Integer);
    procedure setFii_aliq(const Value: Real);
    procedure setFipi_aliq(const Value: Real);
    procedure setFirrj_aliq(const Value: Real);
    procedure setFncm(const Value: String);
    procedure setForigem(const Value: String);
    procedure setFpis_aliq(const Value: Real);
    procedure setFpropag_base_reduc(const Value: String);
    procedure setFsiscomex_aliq(const Value: Real);
    procedure setFtax_substitute(const Value: String);
    procedure setFtb_cfop_id(const Value: String);
    procedure setFtb_deter_base_tax_icms_id(const Value: String);
    procedure setFtb_deter_base_tax_icms_st_id(const Value: String);
    procedure setFtb_discharge_icms_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_observation_id(const Value: Integer);
    procedure setFtb_product_id(const Value: Integer);
    procedure setFtb_state_id(const Value: Integer);
    procedure setFtb_tax_cofins_id(const Value: String);
    procedure setFtb_tax_icms_nr_id(const Value: String);
    procedure setFtb_tax_icms_sn_id(const Value: String);
    procedure setFtb_tax_ipi_id(const Value: String);
    procedure setFtb_tax_pis_id(const Value: String);
    procedure setFtransaction_kind(const Value: String);
    procedure setFupdated_at(const Value: TDAteTime);

  public
    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read Fid write setFid;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_product_id')]
    property Produto: Integer read Ftb_product_id write setFtb_product_id;

    [FieldName('origem')]
    property Origem: String read Forigem write setForigem;

    [FieldName('for_icms_st')]
    property ParaIcmsSt: String read Ffor_icms_st write setFfor_icms_st;

    [FieldName('for_consumer')]
    property ParaConsumidor: String read Ffor_consumer write setFfor_consumer;

    [FieldName('crt')]
    property CRT: String read Fcrt write setFcrt;

 	  [FieldName('ncm')]
    property NCM: String read Fncm write setFncm;

	  [FieldName('tb_state_id')]
    property Estado: Integer read Ftb_state_id write setFtb_state_id;

 	  [FieldName('transaction_kind')]
    property TipoTransacao: String read Ftransaction_kind write setFtransaction_kind;

    [FieldName('tb_tax_icms_nr_id')]
    property CST: String read Ftb_tax_icms_nr_id write setFtb_tax_icms_nr_id;

    [FieldName('tb_tax_icms_sn_id')]
    property CSOSN: String read Ftb_tax_icms_sn_id write setFtb_tax_icms_sn_id;

    [FieldName('tb_deter_base_tax_icms_id')]
    property DeterminacaoBaseIcms: String read Ftb_deter_base_tax_icms_id write setFtb_deter_base_tax_icms_id;

    [FieldName('tb_deter_base_tax_icms_st_id')]
    property DeterminacaoBaseIcmsSt: String read Ftb_deter_base_tax_icms_st_id write setFtb_deter_base_tax_icms_st_id;

    [FieldName('tb_discharge_icms_id')]
    property Desoneracao: Integer read Ftb_discharge_icms_id write setFtb_discharge_icms_id;

    [FieldName('icms_aliq')]
    property AliquotaICMS: Real read Ficms_aliq write setFicms_aliq;

    [FieldName('icms_aliq_reduced')]
    property ReducaoAliqICMS: Real read Ficms_aliq_reduced write setFicms_aliq_reduced;

    [FieldName('icms_base_reduced')]
    property ReducaoBaseICMS: Real read Ficms_base_reduced write setFicms_base_reduced;

    [FieldName('tb_tax_ipi_id')]
    property CstIpi: String read Ftb_tax_ipi_id write setFtb_tax_ipi_id;

    [FieldName('ipi_aliq')]
    property AliquotaIPI: Real read Fipi_aliq write setFipi_aliq;

    [FieldName('tb_tax_pis_id')]
    property CstPis: String read Ftb_tax_pis_id write setFtb_tax_pis_id;

    [FieldName('pis_aliq')]
    property AliquotaPIS: Real read Fpis_aliq write setFpis_aliq;

    [FieldName('tb_tax_cofins_id')]
    property CstCofins: String read Ftb_tax_cofins_id write setFtb_tax_cofins_id;

    [FieldName('cofins_aliq')]
    property AliquotaCofins: Real read Fcofins_aliq write setFcofins_aliq;

    [FieldName('irrj_aliq')]
    property AliquotaIRRJ: Real read Firrj_aliq write setFirrj_aliq;

    [FieldName('csll_aqli')]
    property AliquotaCSLL: Real read Fcsll_aqli write setFcsll_aqli;

    [FieldName('ii_aliq')]
    property AliquotaII: Real read Fii_aliq write setFii_aliq;

    [FieldName('tb_observation_id')]
    property Observacao: Integer read Ftb_observation_id write setFtb_observation_id;

	  [FieldName('tb_cfop_id')]
    property Cfop: String read Ftb_cfop_id write setFtb_cfop_id;

 	  [FieldName('tax_substitute')]
    property SubistitutoTributario: String read Ftax_substitute write setFtax_substitute;

 	  [FieldName('afrmm_aliq')]
    property AliquotaAFRMM: Real read Fafrmm_aliq write setFafrmm_aliq;

 	  [FieldName('siscomex_aliq')]
    property AliquotaSiscomex: Real read Fsiscomex_aliq write setFsiscomex_aliq;

 	  [FieldName('propag_base_reduc')]
    property PropagaReducaoBase: String read Fpropag_base_reduc write setFpropag_base_reduc;

    [FieldName('direction')]
    property Direcao: String read Fdirection write setFdirection;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

	End;

implementation


{ TTaxRuler }

procedure TTaxRuler.setFafrmm_aliq(const Value: Real);
begin
  Fafrmm_aliq := Value;
end;

procedure TTaxRuler.setFcofins_aliq(const Value: Real);
begin
  Fcofins_aliq := Value;
end;

procedure TTaxRuler.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TTaxRuler.setFcrt(const Value: String);
begin
  Fcrt := Value;
end;

procedure TTaxRuler.setFcsll_aqli(const Value: Real);
begin
  Fcsll_aqli := Value;
end;

procedure TTaxRuler.setFdirection(const Value: String);
begin
  Fdirection := Value;
end;

procedure TTaxRuler.setFfor_consumer(const Value: String);
begin
  Ffor_consumer := Value;
end;

procedure TTaxRuler.setFfor_icms_st(const Value: String);
begin
  Ffor_icms_st := Value;
end;

procedure TTaxRuler.setFicms_aliq(const Value: Real);
begin
  Ficms_aliq := Value;
end;

procedure TTaxRuler.setFicms_aliq_reduced(const Value: Real);
begin
  Ficms_aliq_reduced := Value;
end;

procedure TTaxRuler.setFicms_base_reduced(const Value: Real);
begin
  Ficms_base_reduced := Value;
end;

procedure TTaxRuler.setFid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TTaxRuler.setFii_aliq(const Value: Real);
begin
  Fii_aliq := Value;
end;

procedure TTaxRuler.setFipi_aliq(const Value: Real);
begin
  Fipi_aliq := Value;
end;

procedure TTaxRuler.setFirrj_aliq(const Value: Real);
begin
  Firrj_aliq := Value;
end;

procedure TTaxRuler.setFncm(const Value: String);
begin
  Fncm := Value;
end;

procedure TTaxRuler.setForigem(const Value: String);
begin
  Forigem := Value;
end;

procedure TTaxRuler.setFpis_aliq(const Value: Real);
begin
  Fpis_aliq := Value;
end;

procedure TTaxRuler.setFpropag_base_reduc(const Value: String);
begin
  Fpropag_base_reduc := Value;
end;

procedure TTaxRuler.setFsiscomex_aliq(const Value: Real);
begin
  Fsiscomex_aliq := Value;
end;

procedure TTaxRuler.setFtax_substitute(const Value: String);
begin
  Ftax_substitute := Value;
end;

procedure TTaxRuler.setFtb_cfop_id(const Value: String);
begin
  Ftb_cfop_id := Value;
end;

procedure TTaxRuler.setFtb_deter_base_tax_icms_id(const Value: String);
begin
  Ftb_deter_base_tax_icms_id := Value;
end;

procedure TTaxRuler.setFtb_deter_base_tax_icms_st_id(const Value: String);
begin
  Ftb_deter_base_tax_icms_st_id := Value;
end;

procedure TTaxRuler.setFtb_discharge_icms_id(const Value: Integer);
begin
  Ftb_discharge_icms_id := Value;
end;

procedure TTaxRuler.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TTaxRuler.setFtb_observation_id(const Value: Integer);
begin
  Ftb_observation_id := Value;
end;

procedure TTaxRuler.setFtb_product_id(const Value: Integer);
begin
  Ftb_product_id := Value;
end;

procedure TTaxRuler.setFtb_state_id(const Value: Integer);
begin
  Ftb_state_id := Value;
end;

procedure TTaxRuler.setFtb_tax_cofins_id(const Value: String);
begin
  Ftb_tax_cofins_id := Value;
end;

procedure TTaxRuler.setFtb_tax_icms_nr_id(const Value: String);
begin
  Ftb_tax_icms_nr_id := Value;
end;

procedure TTaxRuler.setFtb_tax_icms_sn_id(const Value: String);
begin
  Ftb_tax_icms_sn_id := Value;
end;

procedure TTaxRuler.setFtb_tax_ipi_id(const Value: String);
begin
  Ftb_tax_ipi_id := Value;
end;

procedure TTaxRuler.setFtb_tax_pis_id(const Value: String);
begin
  Ftb_tax_pis_id := Value;
end;

procedure TTaxRuler.setFtransaction_kind(const Value: String);
begin
  Ftransaction_kind := Value;
end;

procedure TTaxRuler.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
