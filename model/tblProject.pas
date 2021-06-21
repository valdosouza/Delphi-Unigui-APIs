unit tblProject;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_project')]
  TProject = Class(TGenericEntity)
  private
    Ftb_situation_id: Integer;
    Fdt_record: TDateTime;
    Fdescription: String;
    FId: Integer;
    Fupdated_at: TDAteTime;
    FNumber: String;
    Fdetail: String;
    Ftb_entity_id: Integer;
    Fdt_final_forecast: TDateTime;
    Ftb_institution_id: Integer;
    Fdt_initi_forecast: TDateTime;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFdetail(const Value: String);
    procedure setFdt_final_forecast(const Value: TDateTime);
    procedure setFdt_initi_forecast(const Value: TDateTime);
    procedure setFdt_record(const Value: TDateTime);
    procedure setFId(const Value: Integer);
    procedure setFNumber(const Value: String);
    procedure setFtb_entity_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_situation_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);


  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

   [FieldName('Number')]
    property Numero: String read FNumber write setFNumber;

   [FieldName('dt_record')]
    property DataRegistro: TDateTime read Fdt_record write setFdt_record;

   [FieldName('tb_entity_id')]
    property CodigoCliente: Integer read Ftb_entity_id write setFtb_entity_id;

   [FieldName('tb_situation_id')]
    property CodigoSituacao: Integer read Ftb_situation_id write setFtb_situation_id;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('detail')]
    property Detalhe: String read Fdetail write setFdetail;

    [FieldName('dt_initi_forecast')]
    property DataInicialPrevista: TDateTime read Fdt_initi_forecast write setFdt_initi_forecast;

    [FieldName('dt_final_forecast')]
    property DataFinalPrevista: TDateTime read Fdt_final_forecast write setFdt_final_forecast;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;



implementation

{ TProject }

procedure TProject.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TProject.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TProject.setFdetail(const Value: String);
begin
  Fdetail := Value;
end;

procedure TProject.setFdt_final_forecast(const Value: TDateTime);
begin
  Fdt_final_forecast := Value;
end;

procedure TProject.setFdt_initi_forecast(const Value: TDateTime);
begin
  Fdt_initi_forecast := Value;
end;

procedure TProject.setFdt_record(const Value: TDateTime);
begin
  Fdt_record := Value;
end;

procedure TProject.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TProject.setFNumber(const Value: String);
begin
  FNumber := Value;
end;

procedure TProject.setFtb_entity_id(const Value: Integer);
begin
  Ftb_entity_id := Value;
end;

procedure TProject.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TProject.setFtb_situation_id(const Value: Integer);
begin
  Ftb_situation_id := Value;
end;

procedure TProject.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
