unit step_advertise;

interface

Type

  TStepAdvertise = class

    private
    FName: String;
    FAnterior: Integer;
    FMessagem: String;
    FProximo: Integer;
    FAtual: Integer;
    procedure setFAnterior(const Value: Integer);
    procedure setFAtual(const Value: Integer);
    procedure setFMessagem(const Value: String);
    procedure setFName(const Value: String);
    procedure setFProximo(const Value: Integer);


    public
      property Anterior : Integer read FAnterior write setFAnterior;
      property Atual : Integer read FAtual write setFAtual;
      property Proximo : Integer read FProximo write setFProximo;
      property Name : String read FName write setFName;
      property Messagem : String read FMessagem write setFMessagem;

  end;

implementation

{ TStepAdvertise }

procedure TStepAdvertise.setFAnterior(const Value: Integer);
begin
  FAnterior := Value;
end;

procedure TStepAdvertise.setFAtual(const Value: Integer);
begin
  FAtual := Value;
end;

procedure TStepAdvertise.setFMessagem(const Value: String);
begin
  FMessagem := Value;
end;

procedure TStepAdvertise.setFName(const Value: String);
begin
  FName := Value;
end;

procedure TStepAdvertise.setFProximo(const Value: Integer);
begin
  FProximo := Value;
end;

end.
