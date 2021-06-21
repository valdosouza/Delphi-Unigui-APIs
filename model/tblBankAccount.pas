unit tblBankAccount;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_bank_account')]
  TBankAccount = Class(TGenericEntity)
  private
    FId: Integer;
    Ftb_institution_id: Integer;
    Fdt_opening: TDateTime;
    Fdt_contract: TDateTime;
    Ftb_bank_id: Integer;
    Fagency: String;
    Fagency_dv: String;
    Fnumber: String;
    Fnumber_dv: String;
    Fphone: String;
    Fmanager: String;
    Flimit_value: Real;
    Fcreated_at: TDAteTime;
    Fupdated_at: TDAteTime;
    procedure setFagency(const Value: String);
    procedure setFagency_dv(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdt_contract(const Value: TDateTime);
    procedure setFdt_opening(const Value: TDateTime);
    procedure setFId(const Value: Integer);
    procedure setFlimit_value(const Value: Real);
    procedure setFmanager(const Value: String);
    procedure setFnumber(const Value: String);
    procedure setFnumber_dv(const Value: String);
    procedure setFphone(const Value: String);
    procedure setFtb_bank_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);


  public
    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read FId write setFId;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_bank_id')]
    property Banco: Integer read Ftb_bank_id write setFtb_bank_id;

    [FieldName('dt_opening')]
    property DataAbertura: TDateTime read Fdt_opening write setFdt_opening;

    [FieldName('agency')]
    property Agencia: String read Fagency write setFagency;

    [FieldName('agency_dv')]
    property AgenciaDv: String read Fagency_dv write setFagency_dv;

    [FieldName('number')]
    property Numero: String read Fnumber write setFnumber;

    [FieldName('number_dv')]
    property NumeroDv: String read Fnumber_dv write setFnumber_dv;

    [FieldName('phone')]
    property Fone: String read Fphone write setFphone;

    [FieldName('manager')]
    property Gerente: String read Fmanager write setFmanager;

    [FieldName('limit_value')]
    property ValorLimite: Real read Flimit_value write setFlimit_value;

    [FieldName('dt_contract')]
    property DataContrato: TDateTime read Fdt_contract write setFdt_contract;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation


{ TBankAccount }

procedure TBankAccount.setFagency(const Value: String);
begin
  Fagency := Value;
end;

procedure TBankAccount.setFagency_dv(const Value: String);
begin
  Fagency_dv := Value;
end;

procedure TBankAccount.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TBankAccount.setFdt_contract(const Value: TDateTime);
begin
  Fdt_contract := Value;
end;

procedure TBankAccount.setFdt_opening(const Value: TDateTime);
begin
  Fdt_opening := Value;
end;

procedure TBankAccount.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TBankAccount.setFlimit_value(const Value: Real);
begin
  Flimit_value := Value;
end;

procedure TBankAccount.setFmanager(const Value: String);
begin
  Fmanager := Value;
end;

procedure TBankAccount.setFnumber(const Value: String);
begin
  Fnumber := Value;
end;

procedure TBankAccount.setFnumber_dv(const Value: String);
begin
  Fnumber_dv := Value;
end;

procedure TBankAccount.setFphone(const Value: String);
begin
  Fphone := Value;
end;

procedure TBankAccount.setFtb_bank_id(const Value: Integer);
begin
  Ftb_bank_id := Value;
end;

procedure TBankAccount.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TBankAccount.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
