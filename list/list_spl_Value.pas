unit list_spl_Value;

interface

uses list_spl_base;

type
  TListSplValue = class (TListSplBase)
  private
    FValor: Real;
    procedure setFValor(const Value: Real);

  public
    property Valor : Real read FValor write setFValor;
  end;

implementation

{ TListSplValue }

procedure TListSplValue.setFValor(const Value: Real);
begin
  FValor := Value;
end;

end.
