unit tblMerchandise;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_merchandise')]
  TMerchandise = Class(TGenericEntity)
  private
    Fexclusive_dealer: String;
    Fcest: String;
    FId: Integer;
    Fprint: String;
    Fupdated_at: TDAteTime;
    Fid_tributary: String;
    Fapplication: String;
    Fkind_tributary: String;
    Fid_provider: Integer;
    Ftb_institution_id: Integer;
    Ftb_brand_id: Integer;
    Fid_internal: String;
    Fcontrolseries: String;
    Fcomposition: String;
    Fkind: String;
    Fsource: String;
    Fcreated_at: TDAteTime;
    procedure setFapplication(const Value: String);
    procedure setFcest(const Value: String);
    procedure setFcomposition(const Value: String);
    procedure setFcontrolseries(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFexclusive_dealer(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFid_internal(const Value: String);
    procedure setFid_provider(const Value: Integer);
    procedure setFid_tributary(const Value: String);
    procedure setFkind(const Value: String);
    procedure setFkind_tributary(const Value: String);
    procedure setFprint(const Value: String);
    procedure setFsource(const Value: String);
    procedure setFtb_brand_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);



  public
    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read FId write setFId;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('id_internal')]
    property CodigoInterno: String read Fid_internal write setFid_internal;

    [FieldName('id_provider')]
    property Fornecedor: Integer read Fid_provider write setFid_provider;

    [FieldName('ncm')]
    property NCM: String read Fid_tributary write setFid_tributary;

    [FieldName('cest')]
    property CEST: String read Fcest write setFcest;

    [FieldName('kind_tributary')]
    property TipoTributacao: String read Fkind_tributary write setFkind_tributary;

    [FieldName('source')]
    property Origem: String read Fsource write setFsource;

    [FieldName('kind')]
    property Tipo: String read Fkind write setFkind;

    [FieldName('tb_brand_id')]
    property Marca: Integer read Ftb_brand_id write setFtb_brand_id;

    [FieldName('print')]
    property Imprime: String read Fprint write setFprint;

    [FieldName('controlseries')]
    property ControlarSerie: String read Fcontrolseries write setFcontrolseries;

    [FieldName('exclusive_dealer')]
    property ExclusivoRevenda: String read Fexclusive_dealer write setFexclusive_dealer;

    [FieldName('application')]
    property Aplicacao: String read Fapplication write setFapplication;

    [FieldName('composition')]
    property TipoComposicao: String read Fcomposition write setFcomposition;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;


implementation



{ TMerchandise }

procedure TMerchandise.setFapplication(const Value: String);
begin
  Fapplication := Value;
end;

procedure TMerchandise.setFcest(const Value: String);
begin
  Fcest := Copy(Value,1,7);
end;

procedure TMerchandise.setFcomposition(const Value: String);
begin
  Fcomposition := Value;
end;

procedure TMerchandise.setFcontrolseries(const Value: String);
begin
  Fcontrolseries := Value;
end;

procedure TMerchandise.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TMerchandise.setFexclusive_dealer(const Value: String);
begin
  Fexclusive_dealer := Value;
end;

procedure TMerchandise.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TMerchandise.setFid_internal(const Value: String);
begin
  Fid_internal := Value;
end;

procedure TMerchandise.setFid_provider(const Value: Integer);
begin
  Fid_provider := Value;
end;

procedure TMerchandise.setFid_tributary(const Value: String);
begin
  Fid_tributary := Copy(Value,1,8);
end;

procedure TMerchandise.setFkind(const Value: String);
begin
  Fkind := Value;
end;

procedure TMerchandise.setFkind_tributary(const Value: String);
begin
  Fkind_tributary := Value;
end;

procedure TMerchandise.setFprint(const Value: String);
begin
  Fprint := Value;
end;

procedure TMerchandise.setFsource(const Value: String);
begin
  Fsource := Value;
end;

procedure TMerchandise.setFtb_brand_id(const Value: Integer);
begin
  Ftb_brand_id := Value;
end;

procedure TMerchandise.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TMerchandise.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
