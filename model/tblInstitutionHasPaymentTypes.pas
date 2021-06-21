unit tblInstitutionHasPaymentTypes;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_institution_has_payment_types')]
  TInstitutionHasPaymentTypes = Class(TGenericEntity)
  private
    Factive: String;
    FTb_payment_types_id: Integer;
    Fupdated_at: TDAteTime;
    FTb_institution_id: Integer;
    Fcreated_at: TDAteTime;
    Fapp_delivery: String;
    procedure setFactive(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFTb_institution_id(const Value: Integer);
    procedure setFTb_payment_types_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFapp_delivery(const Value: String);


  public
    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read FTb_institution_id write setFTb_institution_id;

    [FieldName('tb_payment_types_id')]
    [KeyField('tb_payment_types_id')]
    property TipoPagamento: Integer read FTb_payment_types_id write setFTb_payment_types_id;

    [FieldName('active')]
    property Ativo: String read Factive write setFactive;

    [FieldName('app_delivery')]
    property DisponivelDelivery: String read Fapp_delivery write setFapp_delivery;


    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;

implementation

{ TInstitutionHasPaymentTypes }

procedure TInstitutionHasPaymentTypes.setFactive(const Value: String);
begin
  Factive := Value;
end;

procedure TInstitutionHasPaymentTypes.setFapp_delivery(const Value: String);
begin
  Fapp_delivery := Value;
end;

procedure TInstitutionHasPaymentTypes.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TInstitutionHasPaymentTypes.setFTb_institution_id(
  const Value: Integer);
begin
  FTb_institution_id := Value;
end;

procedure TInstitutionHasPaymentTypes.setFTb_payment_types_id(
  const Value: Integer);
begin
  FTb_payment_types_id := Value;
end;

procedure TInstitutionHasPaymentTypes.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
