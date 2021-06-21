unit TblBroacasterHasCirculaton;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_broadcaster_has_circulation')]
  TBroacasterHasCirculation = Class(TGenericEntity)
  private
    Fupdated_at: TDAteTime;
    Fnumber: Integer;
    Ftb_broadcaster_id: Integer;
    Ftb_city_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFnumber(const Value: Integer);
    procedure setFtb_broadcaster_id(const Value: Integer);
    procedure setFtb_city_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);


  public
    [KeyField('tb_city_id')]
    [FieldName('tb_city_id')]
    property Cidade: Integer read Ftb_city_id write setFtb_city_id;

    [KeyField('tb_broadcaster_id')]
    [FieldName('tb_broadcaster_id')]
    property Veiculo: Integer read Ftb_broadcaster_id write setFtb_broadcaster_id;

    [FieldName('number')]
    property Numero: Integer read Fnumber write setFnumber;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation

{ TBroacasterHasCirculation }

procedure TBroacasterHasCirculation.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TBroacasterHasCirculation.setFnumber(const Value: Integer);
begin
  Fnumber := Value;
end;

procedure TBroacasterHasCirculation.setFtb_broadcaster_id(const Value: Integer);
begin
  Ftb_broadcaster_id := Value;
end;

procedure TBroacasterHasCirculation.setFtb_city_id(const Value: Integer);
begin
  Ftb_city_id := Value;
end;

procedure TBroacasterHasCirculation.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
