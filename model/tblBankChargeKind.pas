unit tblBankChargeKind;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_bank_charge_kind')]
  TBankChargeKind = Class(TGenericEntity)
  private
    FId: Integer;
    Fabbreviation: String;
    Ftb_bank_id: Integer;
    Fdescription: String;
    Fcreated_at: TDAteTime;
    Fupdated_at: TDAteTime;
    procedure setFabbreviation(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFtb_bank_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);



  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_bank_id')]
    [KeyField('tb_bank_id')]
    property Banco: Integer read Ftb_bank_id write setFtb_bank_id;

    [FieldName('abbreviation')]
    property Abreviacao: String read Fabbreviation write setFabbreviation;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation


{ TBankChargeKind }

procedure TBankChargeKind.setFabbreviation(const Value: String);
begin
  Fabbreviation := Value;
end;

procedure TBankChargeKind.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TBankChargeKind.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TBankChargeKind.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TBankChargeKind.setFtb_bank_id(const Value: Integer);
begin
  Ftb_bank_id := Value;
end;

procedure TBankChargeKind.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
