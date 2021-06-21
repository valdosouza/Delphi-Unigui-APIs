unit tblMerchandiseHasProvider;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_merchandise_has_provider')]
  TMerchandiseHasProvider = Class(TGenericEntity)

  private
    Fupdated_at: TDAteTime;
    Ftb_merchandise_id: Integer;
    Fproduct_provider: String;
    Ftb_provider_id: Integer;
    Ftb_institution_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFproduct_provider(const Value: String);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_merchandise_id(const Value: Integer);
    procedure setFtb_provider_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);

  public

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_merchandise_id')]
    [KeyField('tb_merchandise_id')]
    property Mercadoria: Integer read Ftb_merchandise_id write setFtb_merchandise_id;

    [FieldName('tb_provider_id')]
    [KeyField('tb_provider_id')]
    property Fornecedor: Integer read Ftb_provider_id write setFtb_provider_id;

    [FieldName('product_provider')]
    property ProdutoFornecedor: String read Fproduct_provider write setFproduct_provider;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation


{ TMerchandiseHasProvider }

procedure TMerchandiseHasProvider.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TMerchandiseHasProvider.setFproduct_provider(const Value: String);
begin
  Fproduct_provider := Value;
end;

procedure TMerchandiseHasProvider.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TMerchandiseHasProvider.setFtb_merchandise_id(const Value: Integer);
begin
  Ftb_merchandise_id := Value;
end;

procedure TMerchandiseHasProvider.setFtb_provider_id(const Value: Integer);
begin
  Ftb_provider_id := Value;
end;

procedure TMerchandiseHasProvider.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
