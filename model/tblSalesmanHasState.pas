unit tblSalesmanHasState;

interface

Uses GenericEntity,GenericDao,CAtribEntity, Classes, SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_salesman_has_state')]
  TSalesmanHasState = Class(TGenericEntity)
  private
    Fupdated_at: TDAteTime;
    Ftb_salesman_id: Integer;
    Ftb_institution_id: Integer;
    Ftb_state_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_salesman_id(const Value: Integer);
    procedure setFtb_state_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);

  public


    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_salesman_id')]
    [KeyField('tb_salesman_id')]
    property Vendedor: Integer read Ftb_salesman_id write setFtb_salesman_id;

    [FieldName('tb_state_id')]
    [KeyField('tb_state_id')]
    property Estado: Integer read Ftb_state_id write setFtb_state_id;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation

{ TSalesmanHasState }

procedure TSalesmanHasState.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TSalesmanHasState.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TSalesmanHasState.setFtb_salesman_id(const Value: Integer);
begin
  Ftb_salesman_id := Value;
end;

procedure TSalesmanHasState.setFtb_state_id(const Value: Integer);
begin
  Ftb_state_id := Value;
end;

procedure TSalesmanHasState.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
