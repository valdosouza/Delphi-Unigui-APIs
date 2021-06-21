unit prm_print_entities;

interface
uses prm_base_report;

type
  TPrmPrintEntities = class(TPrmBaseReport)
  private
    FCidade: String;
    FEstado: String;
    procedure setFCidade(const Value: String);
    procedure setFEstado(const Value: String);

  public
    property Estado: String read FEstado write setFEstado;
    property Cidade: String read FCidade write setFCidade;
  end;
implementation



{ TPrmPrintEntities }

procedure TPrmPrintEntities.setFCidade(const Value: String);
begin
  FCidade := Value;
end;

procedure TPrmPrintEntities.setFEstado(const Value: String);
begin
  FEstado := Value;
end;

end.
