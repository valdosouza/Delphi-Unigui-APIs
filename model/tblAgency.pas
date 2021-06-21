unit tblAgency;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_agency')]
  TAgency = Class(TGenericEntity)
  private
    FId: Integer;
    Ftb_institution_id: Integer;
    Fdt_record: TDateTime;
    FActive: String;
    Fcreated_at: TDAteTime;
    Fupdated_at: TDAteTime;
    Faliq_com: REal;
    procedure setFActive(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdt_record(const Value: TDateTime);
    procedure setFId(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFaliq_com(const Value: REal);



  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('dt_record')]
    property DataRegistro: TDateTime read Fdt_record write setFdt_record;

    [FieldName('aliq_com')]
    property AliqComissao: REal read Faliq_com write setFaliq_com;

    [FieldName('active')]
    property Ativo: String read FActive write setFActive;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation


{ TAgency }

procedure TAgency.setFActive(const Value: String);
begin
  FActive := Value;
end;

procedure TAgency.setFaliq_com(const Value: REal);
begin
  Faliq_com := Value;
end;

procedure TAgency.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TAgency.setFdt_record(const Value: TDateTime);
begin
  Fdt_record := Value;
end;

procedure TAgency.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TAgency.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TAgency.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
