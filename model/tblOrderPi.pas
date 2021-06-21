unit tblOrderPi;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_order_pi')]
  TOrderPi = Class(TGenericEntity)
  private
    Fproduct: String;
    Fgross_value: Real;
    Fkind_calculation: Integer;
    Fkickback: Real;
    Fcampaign: String;
    Fextra_note: String;
    FId: Integer;
    Fdt_expiration: TDateTime;
    Fkickback_agency: Real;
    Fnr_original: String;
    Fupdated_at: TDAteTime;
    Fowner_value: Real;
    Ftb_advertiser_id: Integer;
    Fdt_internal: TDateTime;
    Fnet_value: Real;
    Fkickback_value: Real;
    Ftb_institution_id: Integer;
    Ftb_broadcaster_id: Integer;
    Ftb_agency_id: Integer;
    Fdt_original: TDateTime;
    Fkind_media: Integer;
    Fnr_internal: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcampaign(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdt_expiration(const Value: TDateTime);
    procedure setFdt_internal(const Value: TDateTime);
    procedure setFdt_original(const Value: TDateTime);
    procedure setFextra_note(const Value: String);
    procedure setFgross_value(const Value: Real);
    procedure setFId(const Value: Integer);
    procedure setFkickback(const Value: Real);
    procedure setFkickback_agency(const Value: Real);
    procedure setFkickback_value(const Value: Real);
    procedure setFkind_calculation(const Value: Integer);
    procedure setFkind_media(const Value: Integer);
    procedure setFnet_value(const Value: Real);
    procedure setFnr_internal(const Value: Integer);
    procedure setFnr_original(const Value: String);
    procedure setFowner_value(const Value: Real);
    procedure setFproduct(const Value: String);
    procedure setFtb_advertiser_id(const Value: Integer);
    procedure setFtb_agency_id(const Value: Integer);
    procedure setFtb_broadcaster_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);


  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('nr_original')]
    property NumeroOriginal: String read Fnr_original write setFnr_original;

    [FieldName('dt_original')]
    property DataOriginal: TDateTime read Fdt_original write setFdt_original;

    [FieldName('dt_expiration')]
    property DataVencimento: TDateTime read Fdt_expiration write setFdt_expiration;

    [FieldName('nr_internal')]
    property NumeroInterno: Integer read Fnr_internal write setFnr_internal;

    [FieldName('dt_internal')]
    property DataInterna: TDateTime read Fdt_internal write setFdt_internal;

    [FieldName('tb_agency_id')]
    property Agencia: Integer read Ftb_agency_id write setFtb_agency_id;

    [FieldName('tb_advertiser_id')]
    property Anunciante: Integer read Ftb_advertiser_id write setFtb_advertiser_id;

    [FieldName('tb_broadcaster_id')]
    property Veiculo: Integer read Ftb_broadcaster_id write setFtb_broadcaster_id;

    [FieldName('kickback_agency')]
    property ComissaoAgencia: Real read Fkickback_agency write setFkickback_agency;

    [FieldName('kickback_owner')]
    property ComissaoEmpresa: Real read Fkickback write setFkickback;

    [FieldName('kind_calculation')]
    property TipoCalculo: Integer read Fkind_calculation write setFkind_calculation;

    [FieldName('gross_value')]
    property ValorBruto: Real read Fgross_value write setFgross_value;

    [FieldName('kickback_value')]
    property ValorComissao: Real read Fkickback_value write setFkickback_value;

    [FieldName('net_value')]
    property ValorLiquido: Real read Fnet_value write setFnet_value;

    [FieldName('owner_value')]
    property ValorProprio: Real read Fowner_value write setFowner_value;

    [FieldName('kind_media')]
    property TipoMidia: Integer read Fkind_media write setFkind_media;

    [FieldName('extra_note')]
    property NotaExtra: String read Fextra_note write setFextra_note;

    [FieldName('product')]
    property Produto: String read Fproduct write setFproduct;

    [FieldName('campaign')]
    property Campanha: String read Fcampaign write setFcampaign;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;


implementation

{ TOrderPi }

procedure TOrderPi.setFcampaign(const Value: String);
begin
  Fcampaign := Value;
end;

procedure TOrderPi.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TOrderPi.setFdt_expiration(const Value: TDateTime);
begin
  Fdt_expiration := Value;
end;

procedure TOrderPi.setFdt_internal(const Value: TDateTime);
begin
  Fdt_internal := Value;
end;

procedure TOrderPi.setFdt_original(const Value: TDateTime);
begin
  Fdt_original := Value;
end;

procedure TOrderPi.setFextra_note(const Value: String);
begin
  Fextra_note := Value;
end;

procedure TOrderPi.setFgross_value(const Value: Real);
begin
  Fgross_value := Value;
end;

procedure TOrderPi.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TOrderPi.setFkickback(const Value: Real);
begin
  Fkickback := Value;
end;

procedure TOrderPi.setFkickback_agency(const Value: Real);
begin
  Fkickback_agency := Value;
end;

procedure TOrderPi.setFkickback_value(const Value: Real);
begin
  Fkickback_value := Value;
end;

procedure TOrderPi.setFkind_calculation(const Value: Integer);
begin
  Fkind_calculation := Value;
end;

procedure TOrderPi.setFkind_media(const Value: Integer);
begin
  Fkind_media := Value;
end;

procedure TOrderPi.setFnet_value(const Value: Real);
begin
  Fnet_value := Value;
end;

procedure TOrderPi.setFnr_internal(const Value: Integer);
begin
  Fnr_internal := Value;
end;

procedure TOrderPi.setFnr_original(const Value: String);
begin
  Fnr_original := Value;
end;

procedure TOrderPi.setFowner_value(const Value: Real);
begin
  Fowner_value := Value;
end;

procedure TOrderPi.setFproduct(const Value: String);
begin
  Fproduct := Value;
end;

procedure TOrderPi.setFtb_advertiser_id(const Value: Integer);
begin
  Ftb_advertiser_id := Value;
end;

procedure TOrderPi.setFtb_agency_id(const Value: Integer);
begin
  Ftb_agency_id := Value;
end;

procedure TOrderPi.setFtb_broadcaster_id(const Value: Integer);
begin
  Ftb_broadcaster_id := Value;
end;

procedure TOrderPi.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TOrderPi.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
