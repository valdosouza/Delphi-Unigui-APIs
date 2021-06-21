unit tblAdvertiser;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_advertiser')]
  TAdvertiser = Class(TGenericEntity)
  private
    FId: Integer;
    Ftb_institution_id: Integer;
    Fdt_record: TDateTime;
    FActive: String;
    Fcreated_at: TDAteTime;
    Fupdated_at: TDAteTime;
    procedure setFActive(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdt_record(const Value: TDateTime);
    procedure setFId(const Value: Integer);
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

    [FieldName('Active')]
    property Ativo: String read FActive write setFActive;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation



{ TAdvertiser }

procedure TAdvertiser.setFActive(const Value: String);
begin
  FActive := Value;
end;

procedure TAdvertiser.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TAdvertiser.setFdt_record(const Value: TDateTime);
begin
  Fdt_record := Value;
end;

procedure TAdvertiser.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TAdvertiser.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TAdvertiser.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
