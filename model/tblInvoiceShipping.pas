unit tblInvoiceShipping;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_invoice_shipping')]
  TInvoiceShipping = Class(TGenericEntity)
  private
    Fgross_weight: String;
    Fvolume_number: String;
    Fid: Integer;
    Frntc_plaque: String;
    Fupdated_at: TDatetime;
    Fvehicle_plaque: String;
    Fnet_weight: String;
    Ftotal_qtty: Real;
    Ftb_institution_id: Integer;
    Fstate_plaque: String;
    Fbrand_tag: String;
    Fsort_tag: String;
    Fcreated_at: TDatetime;
    Fterminal: Integer;
    procedure setFbrand_tag(const Value: String);
    procedure setFcreated_at(const Value: TDatetime);
    procedure setFgross_weight(const Value: String);
    procedure setFid(const Value: Integer);
    procedure setFnet_weight(const Value: String);
    procedure setFrntc_plaque(const Value: String);
    procedure setFsort_tag(const Value: String);
    procedure setFstate_plaque(const Value: String);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtotal_qtty(const Value: Real);
    procedure setFupdated_at(const Value: TDatetime);
    procedure setFvehicle_plaque(const Value: String);
    procedure setFvolume_number(const Value: String);
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

    [FieldName('total_qtty')]
    property Quantidade: Real read Ftotal_qtty write setFtotal_qtty;

    [FieldName('sort_tag')]
    property Classificacao: String read Fsort_tag write setFsort_tag;

    [FieldName('brand_tag')]
    property Marca: String read Fbrand_tag write setFbrand_tag;

    [FieldName('gross_weight')]
    property PesoBruto: String read Fgross_weight write setFgross_weight;

    [FieldName('net_weight')]
    property PesoLiquido: String read Fnet_weight write setFnet_weight;

    [FieldName('volume_number')]
    property NumeroVolume: String read Fvolume_number write setFvolume_number;

    [FieldName('vehicle_plaque')]
    property PlacaVeiculo: String read Fvehicle_plaque write setFvehicle_plaque;

    [FieldName('state_plaque')]
    property PlacaEstado: String read Fstate_plaque write setFstate_plaque;

    [FieldName('rntc_plaque')]
    property PlacaRntc: String read Frntc_plaque write setFrntc_plaque;

    [FieldName('created_at')]
    property RegistroCriado: TDatetime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDatetime read Fupdated_at write setFupdated_at;

	End;

implementation

{ TInvoiceShipping }

procedure TInvoiceShipping.setFbrand_tag(const Value: String);
begin
  Fbrand_tag := Value;
end;

procedure TInvoiceShipping.setFcreated_at(const Value: TDatetime);
begin
  Fcreated_at := Value;
end;

procedure TInvoiceShipping.setFgross_weight(const Value: String);
begin
  Fgross_weight := Value;
end;

procedure TInvoiceShipping.setFid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TInvoiceShipping.setFnet_weight(const Value: String);
begin
  Fnet_weight := Value;
end;

procedure TInvoiceShipping.setFrntc_plaque(const Value: String);
begin
  Frntc_plaque := Value;
end;

procedure TInvoiceShipping.setFsort_tag(const Value: String);
begin
  Fsort_tag := Value;
end;

procedure TInvoiceShipping.setFstate_plaque(const Value: String);
begin
  Fstate_plaque := Value;
end;

procedure TInvoiceShipping.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TInvoiceShipping.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TInvoiceShipping.setFtotal_qtty(const Value: Real);
begin
  Ftotal_qtty := Value;
end;

procedure TInvoiceShipping.setFupdated_at(const Value: TDatetime);
begin
  Fupdated_at := Value;
end;

procedure TInvoiceShipping.setFvehicle_plaque(const Value: String);
begin
  Fvehicle_plaque := Value;
end;

procedure TInvoiceShipping.setFvolume_number(const Value: String);
begin
  Fvolume_number := Value;
end;

end.
