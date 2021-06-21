unit tblMedPartsRt;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_med_parts_rt')]
  TMedPartsRt = Class(TGenericEntity)
  private
    FId: Integer;
    Fupdated_at: TDAteTime;
    Ftb_institution_id: Integer;
    Ftb_order_id :Integer;
    Ftm_duration : String;
    Ftestimonial : String;
    Fincrease_testemonial : Real;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFId(const Value: Integer);
    procedure setFincrease_testemonial(const Value: Real);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFtestimonial(const Value: String);
    procedure setFtm_duration(const Value: String);
    procedure setFupdated_at(const Value: TDAteTime);


   public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_order_id')]
    [KeyField('tb_order_id')]
    property Ordem: Integer read Ftb_order_id write setFtb_order_id;

    [FieldName('tm_duration')]
    property TempoDuracao: String read Ftm_duration write setFtm_duration;

    [FieldName('testimonial')]
    property Testemunhal: String read Ftestimonial write setFtestimonial;

    [FieldName('increase_testemonial')]
    property AumentoTestemunhal: Real read Fincrease_testemonial write setFincrease_testemonial;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;


implementation

{ TMedPartsRt }

procedure TMedPartsRt.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TMedPartsRt.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TMedPartsRt.setFincrease_testemonial(const Value: Real);
begin
  Fincrease_testemonial := Value;
end;

procedure TMedPartsRt.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TMedPartsRt.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TMedPartsRt.setFtestimonial(const Value: String);
begin
  Ftestimonial := Value;
end;

procedure TMedPartsRt.setFtm_duration(const Value: String);
begin
  Ftm_duration := Value;
end;

procedure TMedPartsRt.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
