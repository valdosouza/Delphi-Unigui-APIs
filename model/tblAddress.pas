unit tblAddress;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_address')]
  TAddress = Class(TGenericEntity)

  private
    Fupdated_at: TDAteTime;
    Fcreated_at: TDAteTime;
    Fstreet: String;
    Fregion: String;
    Fneighborhood: String;
    Fmain: String;
    Ftb_city_id: Integer;
    Ftb_country_id: Integer;
    Ftb_state_id: Integer;
    FId: Integer;
    Fnmbr: String;
    Fzip_code: String;
    Fcomplement: String;
    FKind: String;
    procedure setFcomplement(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFId(const Value: Integer);
    procedure setFKind(const Value: String);
    procedure setFmain(const Value: String);
    procedure setFneighborhood(const Value: String);
    procedure setFnmbr(const Value: String);
    procedure setFregion(const Value: String);
    procedure setFstreet(const Value: String);
    procedure setFtb_city_id(const Value: Integer);
    procedure setFtb_country_id(const Value: Integer);
    procedure setFtb_state_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFzip_code(const Value: String);


  public

    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('street')]
    property Logradouro: String read Fstreet write setFstreet;

    [FieldName('nmbr')]
    property NumeroPredial: String read Fnmbr write setFnmbr;

    [FieldName('complement')]
    property Complemento: String read Fcomplement write setFcomplement;

    [FieldName('neighborhood')]
    property Bairro: String read Fneighborhood write setFneighborhood;

    [FieldName('region')]
    property Regiao: String read Fregion write setFregion;

    [FieldName('kind')]
    [KeyField('kind')]
    property Tipo: String read FKind write setFKind;

    [FieldName('zip_code')]
    property Cep: String read Fzip_code write setFzip_code;

    [FieldName('tb_country_id')]
    property CodigoPais: Integer read Ftb_country_id write setFtb_country_id;

    [FieldName('tb_state_id')]
    property CodigoEstado: Integer read Ftb_state_id write setFtb_state_id;

    [FieldName('tb_city_id')]
    property CodigoCidade: Integer read Ftb_city_id write setFtb_city_id;

    [FieldName('main')]
    property Principal: String read Fmain write setFmain;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation


{ TAddress }

procedure TAddress.setFcomplement(const Value: String);
begin
  Fcomplement := Value;
end;

procedure TAddress.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TAddress.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TAddress.setFKind(const Value: String);
begin
  FKind := Value;
end;

procedure TAddress.setFmain(const Value: String);
begin
  Fmain := Value;
end;

procedure TAddress.setFneighborhood(const Value: String);
begin
  Fneighborhood := Value;
end;

procedure TAddress.setFnmbr(const Value: String);
begin
  Fnmbr := Value;
end;

procedure TAddress.setFregion(const Value: String);
begin
  Fregion := Value;
end;

procedure TAddress.setFstreet(const Value: String);
begin
  Fstreet := Value;
end;

procedure TAddress.setFtb_city_id(const Value: Integer);
begin
  Ftb_city_id := Value;
end;

procedure TAddress.setFtb_country_id(const Value: Integer);
begin
  Ftb_country_id := Value;
end;

procedure TAddress.setFtb_state_id(const Value: Integer);
begin
  Ftb_state_id := Value;
end;

procedure TAddress.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

procedure TAddress.setFzip_code(const Value: String);
begin
  Fzip_code := Value;
end;

end.
