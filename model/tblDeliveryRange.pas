unit tblDeliveryRange;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_delivery_range')]
  TDeliveryRange = Class(TGenericEntity)
  private
    Fkm_value: Real;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Fkm_from: Integer;
    Ftb_institution_id: Integer;
    Fkm_to: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFId(const Value: Integer);
    procedure setFkm_from(const Value: Integer);
    procedure setFkm_to(const Value: Integer);
    procedure setFkm_value(const Value: Real);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);



  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('km_from')]
    property DoKM: Integer read Fkm_from write setFkm_from;

    [FieldName('km_to')]
    property AteKM: Integer read Fkm_to write setFkm_to;

    [FieldName('km_value')]
    property ValorKM: Real read Fkm_value write setFkm_value;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;


implementation

{ TDeliveryRange }

procedure TDeliveryRange.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TDeliveryRange.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TDeliveryRange.setFkm_from(const Value: Integer);
begin
  Fkm_from := Value;
end;

procedure TDeliveryRange.setFkm_to(const Value: Integer);
begin
  Fkm_to := Value;
end;

procedure TDeliveryRange.setFkm_value(const Value: Real);
begin
  Fkm_value := Value;
end;

procedure TDeliveryRange.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TDeliveryRange.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
