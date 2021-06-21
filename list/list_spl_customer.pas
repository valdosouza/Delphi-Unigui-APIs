unit list_spl_customer;

interface
type
  TListSplCustomer = class
  private
    FLogradouro: String;
    FBairro: String;
    FCodigo: Integer;
    FNumeroPredial: String;
    FApelidoFantasia: String;
    FNomeRazao: String;
    FTipoEndereco: String;
    FVendedor: Integer;
    procedure setFApelidoFantasia(const Value: String);
    procedure setFBairro(const Value: String);
    procedure setFCodigo(const Value: Integer);
    procedure setFLogradouro(const Value: String);
    procedure setFNomeRazao(const Value: String);
    procedure setFNumeroPredial(const Value: String);
    procedure setFTipoEndereco(const Value: String);
    procedure setFVendedor(const Value: Integer);

    public
      property Codigo : Integer read FCodigo write setFCodigo;
      property NomeRazao : String Read FNomeRazao write setFNomeRazao;
      property ApelidoFantasia : String read FApelidoFantasia write setFApelidoFantasia;
      property Logradouro : String read FLogradouro write setFLogradouro;
      property NumeroPredial : String read FNumeroPredial write setFNumeroPredial;
      property Bairro :String  read FBairro write setFBairro;
      property TipoEndereco : String read FTipoEndereco write setFTipoEndereco;
      property Vendedor : Integer read FVendedor write setFVendedor;
  end;
implementation

{ TListSplCustomer }

procedure TListSplCustomer.setFApelidoFantasia(const Value: String);
begin
  FApelidoFantasia := Value;
end;

procedure TListSplCustomer.setFBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TListSplCustomer.setFCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TListSplCustomer.setFLogradouro(const Value: String);
begin
  FLogradouro := Value;
end;

procedure TListSplCustomer.setFNomeRazao(const Value: String);
begin
  FNomeRazao := Value;
end;

procedure TListSplCustomer.setFNumeroPredial(const Value: String);
begin
  FNumeroPredial := Value;
end;

procedure TListSplCustomer.setFTipoEndereco(const Value: String);
begin
  FTipoEndereco := Value;
end;

procedure TListSplCustomer.setFVendedor(const Value: Integer);
begin
  FVendedor := Value;
end;

end.
