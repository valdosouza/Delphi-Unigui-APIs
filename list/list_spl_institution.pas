unit list_spl_institution;

interface
type
  TListSplInstitution = class
  private
    FLogradouro: String;
    FBairro: String;
    FCodigo: Integer;
    FNumeroPredial: String;
    FApelidoFantasia: String;
    FTipoEndereco: String;
    FNomeRazao: String;
    procedure setFApelidoFantasia(const Value: String);
    procedure setFBairro(const Value: String);
    procedure setFCodigo(const Value: Integer);
    procedure setFLogradouro(const Value: String);
    procedure setFNomeRazao(const Value: String);
    procedure setFNumeroPredial(const Value: String);
    procedure setFTipoEndereco(const Value: String);

    public
      property Codigo : Integer read FCodigo write setFCodigo;
      property NomeRazao : String Read FNomeRazao write setFNomeRazao;
      property ApelidoFantasia : String read FApelidoFantasia write setFApelidoFantasia;
      property Logradouro : String read FLogradouro write setFLogradouro;
      property NumeroPredial : String read FNumeroPredial write setFNumeroPredial;
      property Bairro :String  read FBairro write setFBairro;
      property TipoEndereco : String read FTipoEndereco write setFTipoEndereco;
  end;
implementation

{ TListSplInstitution }

procedure TListSplInstitution.setFApelidoFantasia(const Value: String);
begin
  FApelidoFantasia := Value;
end;

procedure TListSplInstitution.setFBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TListSplInstitution.setFCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TListSplInstitution.setFLogradouro(const Value: String);
begin
  FLogradouro := Value;
end;

procedure TListSplInstitution.setFNomeRazao(const Value: String);
begin
  FNomeRazao := Value;
end;

procedure TListSplInstitution.setFNumeroPredial(const Value: String);
begin
  FNumeroPredial := Value;
end;

procedure TListSplInstitution.setFTipoEndereco(const Value: String);
begin
  FTipoEndereco := Value;
end;

end.
