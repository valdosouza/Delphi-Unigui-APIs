unit list_spl_order_Consignment;

interface
type
  TListSplOrderConsignment = class
    private
    FCodigo: Integer;
    FApelidoFantasia: String;
    FNomeRazao: String;
    procedure setFApelidoFantasia(const Value: String);
    procedure setFCodigo(const Value: Integer);
    procedure setFNomeRazao(const Value: String);

    public
      property Codigo : Integer read FCodigo write setFCodigo;
      property NomeRazao : String read FNomeRazao write setFNomeRazao;
      property ApelidoFantasia : String read FApelidoFantasia write setFApelidoFantasia;
  end;


implementation


{ TListSplOrderConsignment }

procedure TListSplOrderConsignment.setFApelidoFantasia(const Value: String);
begin
  FApelidoFantasia := Value;
end;

procedure TListSplOrderConsignment.setFCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TListSplOrderConsignment.setFNomeRazao(const Value: String);
begin
  FNomeRazao := Value;
end;

end.
