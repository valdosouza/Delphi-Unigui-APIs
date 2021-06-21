unit tblNfeEventsSent;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_nfe_events_sent')]
  TNfeEventsSent = Class(TGenericEntity)
  private
    FSequence: String;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Fnumber: String;
    Fstatus: String;
    Fjustification: String;
    Ftb_institution_id: Integer;
    Fnfe_key: String;
    Fdt_record: TDAteTime;
    Ftb_nfe_events_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdt_record(const Value: TDAteTime);
    procedure setFId(const Value: Integer);
    procedure setFjustification(const Value: String);
    procedure setFnfe_key(const Value: String);
    procedure setFnumber(const Value: String);
    procedure setFSequence(const Value: String);
    procedure setFstatus(const Value: String);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_nfe_events_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);

  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;


    [FieldName('number')]
    property Numero: String read Fnumber write setFnumber;

    [FieldName('nfe_key')]
    property ChaveNFE: String read Fnfe_key write setFnfe_key;

    [FieldName('tb_nfe_events_id')]
    property Evento: Integer read Ftb_nfe_events_id write setFtb_nfe_events_id;

    [FieldName('dt_record')]
    property DataEvento: TDAteTime read Fdt_record write setFdt_record;

    [FieldName('Sequence')]
    property Sequencia: String read FSequence write setFSequence;

    [FieldName('justification')]
    property Justificativa: String read Fjustification write setFjustification;

    [FieldName('status')]
    property Status: String read Fstatus write setFstatus;


    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation

{ TNfeEventsSent }

procedure TNfeEventsSent.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TNfeEventsSent.setFdt_record(const Value: TDAteTime);
begin
  Fdt_record := Value;
end;

procedure TNfeEventsSent.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TNfeEventsSent.setFjustification(const Value: String);
begin
  Fjustification := Value;
end;

procedure TNfeEventsSent.setFnfe_key(const Value: String);
begin
  Fnfe_key := Value;
end;

procedure TNfeEventsSent.setFnumber(const Value: String);
begin
  Fnumber := Value;
end;

procedure TNfeEventsSent.setFSequence(const Value: String);
begin
  FSequence := Value;
end;

procedure TNfeEventsSent.setFstatus(const Value: String);
begin
  Fstatus := Value;
end;

procedure TNfeEventsSent.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TNfeEventsSent.setFtb_nfe_events_id(const Value: Integer);
begin
  Ftb_nfe_events_id := Value;
end;

procedure TNfeEventsSent.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
