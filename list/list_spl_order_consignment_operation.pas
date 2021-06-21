unit list_spl_order_consignment_operation;

interface
type
  TListSplOrderConsignmentOperation = class
    private
    FValor: String;
    FCodigo: Integer;
    FQtde: String;
    FData: String;
    FEstabelecimento: Integer;
    FOrdem: Integer;
    FTerminal: Integer;
    procedure setFCodigo(const Value: Integer);
    procedure setFData(const Value: String);
    procedure setFQtde(const Value: String);
    procedure setFValor(const Value: String);
    procedure setFEstabelecimento(const Value: Integer);
    procedure setFOrdem(const Value: Integer);
    procedure setFTerminal(const Value: Integer);


    public
      property Estabelecimento : Integer read FEstabelecimento write setFEstabelecimento;
      property Terminal : Integer read FTerminal write setFTerminal;
      property Ordem : Integer read FOrdem write setFOrdem;

      property Codigo : Integer read FCodigo write setFCodigo;
      property Data : String read FData write setFData;
      property Qtde : String read FQtde write setFQtde;
      property Valor : String read FValor write setFValor;
  end;


implementation


{ TListSplOrderConsignmentOperation }

procedure TListSplOrderConsignmentOperation.setFCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TListSplOrderConsignmentOperation.setFData(const Value: String);
begin
  FData := Value;
end;

procedure TListSplOrderConsignmentOperation.setFEstabelecimento(
  const Value: Integer);
begin
  FEstabelecimento := Value;
end;

procedure TListSplOrderConsignmentOperation.setFOrdem(const Value: Integer);
begin
  FOrdem := Value;
end;

procedure TListSplOrderConsignmentOperation.setFQtde(const Value: String);
begin
  FQtde := Value;
end;

procedure TListSplOrderConsignmentOperation.setFTerminal(const Value: Integer);
begin
  FTerminal := Value;
end;

procedure TListSplOrderConsignmentOperation.setFValor(const Value: String);
begin
  FValor := Value;
end;

end.
