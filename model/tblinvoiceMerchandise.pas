unit tblinvoicemerchandise;
// Nota fiscal de produto

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_invoice_merchandise')]
  TInvoiceMerchandise = Class(TGenericEntity)
  private
    Fdiscount_value: Real;
    Ffreight_value: Real;
    Ftm_exit: Ttime;
    Fipi_value: Real;
    Fbase_icms_st_value: Real;
    Ftotal_qtty: Real;
    Fbase_icms_value: Real;
    Fid: Integer;
    Ficms_value: Real;
    Fupdated_at: TDatetime;
    Finsurance_value: Real;
    Ftotal_value: Real;
    FindPres: Integer;
    Ftb_institution_id: Integer;
    Fexpenses_value: Real;
    Fdt_exit: TDateTime;
    Fterminal: Integer;
    Fcreated_at: TDatetime;
    procedure setFbase_icms_st_value(const Value: Real);
    procedure setFbase_icms_value(const Value: Real);
    procedure setFcreated_at(const Value: TDatetime);
    procedure setFdiscount_value(const Value: Real);
    procedure setFdt_exit(const Value: TDateTime);
    procedure setFexpenses_value(const Value: Real);
    procedure setFfreight_value(const Value: Real);
    procedure setFicms_value(const Value: Real);
    procedure setFid(const Value: Integer);
    procedure setFindPres(const Value: Integer);
    procedure setFinsurance_value(const Value: Real);
    procedure setFipi_value(const Value: Real);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFterminal(const Value: Integer);
    procedure setFtm_exit(const Value: Ttime);
    procedure setFtotal_qtty(const Value: Real);
    procedure setFtotal_value(const Value: Real);
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

    [FieldName('dt_exit')]
    property DataSaida: TDateTime read Fdt_exit write setFdt_exit;

  	[FieldName('tm_exit')]
    property HoraSaida: Ttime read Ftm_exit write setFtm_exit;

	  [FieldName('base_icms_value')]
    property ValorBaseICMS: Real read Fbase_icms_value write setFbase_icms_value;

  	[FieldName('icms_value')]
    property ValorIcms: Real read Ficms_value write setFicms_value;

	  [FieldName('base_icms_st_value')]
    property ValorBaseIcmsSt: Real read Fbase_icms_st_value write setFbase_icms_st_value;

  	[FieldName('icms_st_value')]
    property ValorIcmsSt: Real read Fbase_icms_st_value write setFbase_icms_st_value;

	  [FieldName('total_value')]
    property ValorTotal: Real read Ftotal_value write setFtotal_value;

	  [FieldName('freight_value')]
    property ValorFrete: Real read Ffreight_value write setFfreight_value;

	  [FieldName('insurance_value')]
    property ValorSeguro: Real read Finsurance_value write setFinsurance_value;

  	[FieldName('expenses_value')]
    property ValorDespesas: Real read Fexpenses_value write setFexpenses_value;

	  [FieldName('ipi_value')]
    property ValorIpi: Real read Fipi_value write setFipi_value;


	  [FieldName('discount_value')]
    property ValorDesc: Real read Fdiscount_value write setFdiscount_value;

	  [FieldName('total_qtty')]
    property QuantidadeTotal: Real read Ftotal_qtty write setFtotal_qtty;


    [FieldName('indPres')]
    property IndicacaoPresenca: Integer read FindPres write setFindPres;

	  [FieldName('created_at')]
    property RegistroCriado: TDatetime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDatetime read Fupdated_at write setFupdated_at;

  End;

implementation


{ TInvoiceMerchandise }

procedure TInvoiceMerchandise.setFbase_icms_st_value(const Value: Real);
begin
  Fbase_icms_st_value := Value;
end;

procedure TInvoiceMerchandise.setFbase_icms_value(const Value: Real);
begin
  Fbase_icms_value := Value;
end;

procedure TInvoiceMerchandise.setFcreated_at(const Value: TDatetime);
begin
  Fcreated_at := Value;
end;

procedure TInvoiceMerchandise.setFdiscount_value(const Value: Real);
begin
  Fdiscount_value := Value;
end;

procedure TInvoiceMerchandise.setFdt_exit(const Value: TDateTime);
begin
  Fdt_exit := Value;
end;

procedure TInvoiceMerchandise.setFexpenses_value(const Value: Real);
begin
  Fexpenses_value := Value;
end;

procedure TInvoiceMerchandise.setFfreight_value(const Value: Real);
begin
  Ffreight_value := Value;
end;

procedure TInvoiceMerchandise.setFicms_value(const Value: Real);
begin
  Ficms_value := Value;
end;

procedure TInvoiceMerchandise.setFid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TInvoiceMerchandise.setFindPres(const Value: Integer);
begin
  FindPres := Value;
end;

procedure TInvoiceMerchandise.setFinsurance_value(const Value: Real);
begin
  Finsurance_value := Value;
end;

procedure TInvoiceMerchandise.setFipi_value(const Value: Real);
begin
  Fipi_value := Value;
end;

procedure TInvoiceMerchandise.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TInvoiceMerchandise.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TInvoiceMerchandise.setFtm_exit(const Value: Ttime);
begin
  Ftm_exit := Value;
end;

procedure TInvoiceMerchandise.setFtotal_qtty(const Value: Real);
begin
  Ftotal_qtty := Value;
end;

procedure TInvoiceMerchandise.setFtotal_value(const Value: Real);
begin
  Ftotal_value := Value;
end;

procedure TInvoiceMerchandise.setFupdated_at(const Value: TDatetime);
begin
  Fupdated_at := Value;
end;

end.
