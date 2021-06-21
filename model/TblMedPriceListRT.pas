unit TblMedPriceListRT;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_med_price_list_rt')]
  TMedPriceListRT = Class(TGenericEntity)
  private
    Fschedule: String;
    Fspot30_value: Real;
    Fspot60_value: Real;
    Fspot15_value: Real;
    FId: Integer;
    Fspot45_value: Real;
    Fupdated_at: TDAteTime;
    Ftb_med_pos_prog_id: Integer;
    Ftb_institution_id: Integer;
    Ftb_broadcaster_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFId(const Value: Integer);
    procedure setFschedule(const Value: String);
    procedure setFspot15_value(const Value: Real);
    procedure setFspot30_value(const Value: Real);
    procedure setFspot45_value(const Value: Real);
    procedure setFspot60_value(const Value: Real);
    procedure setFtb_broadcaster_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_med_pos_prog_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);



  public
    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read FId write setFId;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [KeyField('tb_broadcaster_id')]
    [FieldName('tb_broadcaster_id')]
    property Veiculo: Integer read Ftb_broadcaster_id write setFtb_broadcaster_id;

    [FieldName('tb_med_pos_prog_id')]
    property PosicaoProgramacao: Integer read Ftb_med_pos_prog_id write setFtb_med_pos_prog_id;

    [FieldName('spot15_value')]
    property Spot15: Real read Fspot15_value write setFspot15_value;

    [FieldName('spot30_value')]
    property Spot30: Real read Fspot30_value write setFspot30_value;

    [FieldName('spot45_value')]
    property Spot45: Real read Fspot45_value write setFspot45_value;

    [FieldName('spot60_value')]
    property Spot60: Real read Fspot60_value write setFspot60_value;

    [FieldName('schedule')]
    property Horario: String read Fschedule write setFschedule;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation



{ TMedPriceListRT }

procedure TMedPriceListRT.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TMedPriceListRT.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TMedPriceListRT.setFschedule(const Value: String);
begin
  Fschedule := Value;
end;

procedure TMedPriceListRT.setFspot15_value(const Value: Real);
begin
  Fspot15_value := Value;
end;

procedure TMedPriceListRT.setFspot30_value(const Value: Real);
begin
  Fspot30_value := Value;
end;

procedure TMedPriceListRT.setFspot45_value(const Value: Real);
begin
  Fspot45_value := Value;
end;

procedure TMedPriceListRT.setFspot60_value(const Value: Real);
begin
  Fspot60_value := Value;
end;

procedure TMedPriceListRT.setFtb_broadcaster_id(const Value: Integer);
begin
  Ftb_broadcaster_id := Value;
end;

procedure TMedPriceListRT.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TMedPriceListRT.setFtb_med_pos_prog_id(const Value: Integer);
begin
  Ftb_med_pos_prog_id := Value;
end;

procedure TMedPriceListRT.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
