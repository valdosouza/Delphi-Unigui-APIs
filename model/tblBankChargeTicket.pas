unit tblBankChargeTicket;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_bank_charge_ticket')]
  TBankChargeTicket = Class(TGenericEntity)
  private
    FId: Integer;
    Fnumber: String;
    Femission_by: String;
    Ftb_bank_id: Integer;
    Fdescription: String;
    Fcreated_at: TDAteTime;
    Fupdated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFemission_by(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFnumber(const Value: String);
    procedure setFtb_bank_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);


  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_bank_id')]
    [KeyField('tb_bank_id')]
    property Banco: Integer read Ftb_bank_id write setFtb_bank_id;

    [FieldName('number')]
    [KeyField('number')]
    property Numero: String read Fnumber write setFnumber;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('emission_by')]
    property Emissao: String read Femission_by write setFemission_by;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation

{ TBankChargeTicket }

procedure TBankChargeTicket.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TBankChargeTicket.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TBankChargeTicket.setFemission_by(const Value: String);
begin
  Femission_by := Value;
end;

procedure TBankChargeTicket.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TBankChargeTicket.setFnumber(const Value: String);
begin
  Fnumber := Value;
end;

procedure TBankChargeTicket.setFtb_bank_id(const Value: Integer);
begin
  Ftb_bank_id := Value;
end;

procedure TBankChargeTicket.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
