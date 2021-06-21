unit tblExtSeal;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_ext_seal')]
  TExtSeal = Class(TGenericEntity)
  private
    FId: Integer;
    Ftb_institution_id: Integer;
    Fdt_record: TDateTime;
    Fnr_initial: String;
    Fnr_final: String;
    Fnr_last_used: String;
    Fcreated_at: TDAteTime;
    Fupdated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdt_record(const Value: TDateTime);
    procedure setFId(const Value: Integer);
    procedure setFnr_final(const Value: String);
    procedure setFnr_initial(const Value: String);
    procedure setFnr_last_used(const Value: String);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);

  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('dt_record')]
    property DataRegistro: TDateTime read Fdt_record write setFdt_record;

    [FieldName('nr_initial')]
    property LoteIni: String read Fnr_initial write setFnr_initial;

    [FieldName('nr_final')]
    property LoteFin: String read Fnr_final write setFnr_final;

    [FieldName('nr_last_used')]
    property UltUsado: String read Fnr_last_used write setFnr_last_used;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation


{ TExtSeal }

procedure TExtSeal.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TExtSeal.setFdt_record(const Value: TDateTime);
begin
  Fdt_record := Value;
end;

procedure TExtSeal.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TExtSeal.setFnr_final(const Value: String);
begin
  Fnr_final := Value;
end;

procedure TExtSeal.setFnr_initial(const Value: String);
begin
  Fnr_initial := Value;
end;

procedure TExtSeal.setFnr_last_used(const Value: String);
begin
  Fnr_last_used := Value;
end;

procedure TExtSeal.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TExtSeal.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
