unit tblPerson;

interface

Uses GenericEntity,CAtribEntity, System.SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_person')]
  TPerson = Class(TGenericEntity)
  private
    Frg: String;
    Ftb_profession_id: Integer;
    Frg_state_issuer: Integer;
    FID: Integer;
    Fcpf: String;
    Fbirthday: TDateTime;
    Fupdated_at: TDAteTime;
    Frg_dt_emission: TDateTime;
    Frg_organ_issuer: String;
    Fcreated_at: TDAteTime;
    procedure setFbirthday(const Value: TDateTime);
    procedure setFcpf(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFID(const Value: Integer);
    procedure setFrg(const Value: String);
    procedure setFrg_dt_emission(const Value: TDateTime);
    procedure setFrg_organ_issuer(const Value: String);
    procedure setFrg_state_issuer(const Value: Integer);
    procedure setFtb_profession_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
  public

    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read FID write setFID;


    [FieldName('cpf')]
    property CPF: String read Fcpf write setFcpf;

    [FieldName('rg')]
    property RG: String read Frg write setFrg;

    [FieldName('rg_dt_emission')]
    property DataEmissao: TDateTime read Frg_dt_emission write setFrg_dt_emission;

    [FieldName('rg_organ_issuer')]
    property OrgaoEmissor: String read Frg_organ_issuer write setFrg_organ_issuer;

    [FieldName('rg_state_issuer')]
    property CodigoEstadoEmissor: Integer read Frg_state_issuer write setFrg_state_issuer;

    [FieldName('birthday')]
    property Aniversario: TDateTime read Fbirthday write setFbirthday;

    [FieldName('tb_profession_id')]
    property CodigoCargo: Integer read Ftb_profession_id write setFtb_profession_id;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation


{ TPerson }

procedure TPerson.setFbirthday(const Value: TDateTime);
begin
  Fbirthday := Value;
end;

procedure TPerson.setFcpf(const Value: String);
begin
  Fcpf := Value;
end;

procedure TPerson.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TPerson.setFID(const Value: Integer);
begin
  FID := Value;
end;

procedure TPerson.setFrg(const Value: String);
begin
  Frg := Value;
end;

procedure TPerson.setFrg_dt_emission(const Value: TDateTime);
begin
  Frg_dt_emission := Value;
end;

procedure TPerson.setFrg_organ_issuer(const Value: String);
begin
  Frg_organ_issuer := Value;
end;

procedure TPerson.setFrg_state_issuer(const Value: Integer);
begin
  Frg_state_issuer := Value;
end;

procedure TPerson.setFtb_profession_id(const Value: Integer);
begin
  Ftb_profession_id := Value;
end;

procedure TPerson.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
