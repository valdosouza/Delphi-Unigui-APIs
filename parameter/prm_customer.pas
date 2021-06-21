unit prm_customer;

interface

uses tblcustomer,tblentity,tbladdress, System.SysUtils, prm_base,prm_entity;

Type
  TPrmCustomer = class(TPrmBase)
  private
    FEntidade: TEntity;
    FCliente: TCustomer;
    FEndereco: TAddress;
    procedure setFCliente(const Value: TCustomer);
    procedure setFEndereco(const Value: TAddress);
    procedure setFEntidade(const Value: TEntity);

    public
      constructor Create;Override;
      destructor Destroy;Override;
      property Cliente : TCustomer read FCliente write setFCliente;
      property Entidade : TEntity read FEntidade write setFEntidade;
      property Endereco : TAddress read FEndereco write setFEndereco;
  end;

implementation
{ TPrmCustomer }

constructor TPrmCustomer.Create;
begin
  inherited;
  FCliente  := TCustomer.Create;
  FCliente.RegistroCriado := 0;
  FCliente.RegistroAlterado := 0;

  FEntidade := TEntity.Create;
  FEntidade.RegistroCriado := 0;
  FEntidade.RegistroAlterado := 0;

  FEndereco := TAddress.Create;
  FEntidade.RegistroCriado := 0;
  FEntidade.RegistroAlterado := 0;

end;


destructor TPrmCustomer.Destroy;
begin
  FCliente.DisposeOf;
  FEntidade.DisposeOf;
  FEndereco.DisposeOf;
  inherited;
end;

procedure TPrmCustomer.setFCliente(const Value: TCustomer);
begin
  FCliente := Value;
end;

procedure TPrmCustomer.setFEndereco(const Value: TAddress);
begin
  FEndereco := Value;
end;

procedure TPrmCustomer.setFEntidade(const Value: TEntity);
begin
  FEntidade := Value;
end;

end.
