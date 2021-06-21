unit prm_rep_budg_advertise;

interface

uses prm_base_report;

Type
  TPrmRepBudgAdvertise = Class(TPrmBaseReport)
  private
    FCodigo: Integer;
    FLocal: String;
    procedure setFCodigo(const Value: Integer);
    procedure setFLocal(const Value: String);

  public
    property Codigo: Integer read FCodigo write setFCodigo;
    property Local : String read FLocal write setFLocal;
  End;
implementation

{ TPrmRepBudgAdvertise }

procedure TPrmRepBudgAdvertise.setFCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TPrmRepBudgAdvertise.setFLocal(const Value: String);
begin
  FLocal := Value;
end;

end.
