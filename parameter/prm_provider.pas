unit prm_provider;

interface

uses tblprovider,tblentity,tbladdress, System.SysUtils, prm_base,prm_entity;

Type
  TPrmProvider = class(TPrmBase)
  private
    FEntidade: TEntity;
    FFornecedor: TProvider;
    FEndereco: TAddress;
    procedure setFFornecedor(const Value: TProvider);
    procedure setFEndereco(const Value: TAddress);
    procedure setFEntidade(const Value: TEntity);

    public
      constructor Create;Override;
      destructor Destroy;Override;
      property Fornecedor : TProvider read FFornecedor write setFFornecedor;
      property Entidade : TEntity read FEntidade write setFEntidade;
      property Endereco : TAddress read FEndereco write setFEndereco;
  end;

implementation
{ TPrmProvider }

constructor TPrmProvider.Create;
begin
  inherited;
  FFornecedor  := TProvider.Create;
  FFornecedor.RegistroCriado := 0;
  FFornecedor.RegistroAlterado := 0;

  FEntidade := TEntity.Create;
  FEntidade.RegistroCriado := 0;
  FEntidade.RegistroAlterado := 0;

  FEndereco := TAddress.Create;
  FEntidade.RegistroCriado := 0;
  FEntidade.RegistroAlterado := 0;

end;


destructor TPrmProvider.Destroy;
begin
  FFornecedor.DisposeOf;
  FEntidade.DisposeOf;
  FEndereco.DisposeOf;
  inherited;
end;

procedure TPrmProvider.setFFornecedor(const Value: TProvider);
begin
  FFornecedor := Value;
end;

procedure TPrmProvider.setFEndereco(const Value: TAddress);
begin
  FEndereco := Value;
end;

procedure TPrmProvider.setFEntidade(const Value: TEntity);
begin
  FEntidade := Value;
end;

end.
