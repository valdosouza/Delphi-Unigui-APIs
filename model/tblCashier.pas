unit tblCashier;

interface
Uses GenericEntity,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_Cashier')]
  TCashier = Class(TGenericEntity)

  private
    Fhr_end: TDAteTime;
    Fhr_begin: TDAteTime;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Ftb_institution_id: integer;
    Ftb_userid: Integer;
    Fterminal: Integer;
    Fdt_record: TDAteTime;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdt_record(const Value: TDAteTime);
    procedure setFhr_begin(const Value: TDAteTime);
    procedure setFhr_end(const Value: TDAteTime);
    procedure setFId(const Value: Integer);
    procedure setFtb_institution_id(const Value: integer);
    procedure setFtb_userid(const Value: Integer);
    procedure setFterminal(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);


  public

    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('terminal')]
    [KeyField('terminal')]
    property Terminal: Integer read Fterminal write setFterminal;

    [FieldName('dt_record')]
    property Data: TDAteTime read Fdt_record write setFdt_record;

    [FieldName('tb_userid')]
    property Usuario: Integer read Ftb_userid write setFtb_userid;

    [FieldName('hr_begin')]
    property Abertura: TDAteTime read Fhr_begin write setFhr_begin;

    [FieldName('hr_end')]
    property Fechamento: TDAteTime read Fhr_end write setFhr_end;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation
{ TCashier }

procedure TCashier.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TCashier.setFdt_record(const Value: TDAteTime);
begin
  Fdt_record := Value;
end;

procedure TCashier.setFhr_begin(const Value: TDAteTime);
begin
  Fhr_begin := Value;
end;

procedure TCashier.setFhr_end(const Value: TDAteTime);
begin
  Fhr_end := Value;
end;

procedure TCashier.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TCashier.setFtb_institution_id(const Value: integer);
begin
  Ftb_institution_id := Value;
end;

procedure TCashier.setFtb_userid(const Value: Integer);
begin
  Ftb_userid := Value;
end;

procedure TCashier.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TCashier.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
