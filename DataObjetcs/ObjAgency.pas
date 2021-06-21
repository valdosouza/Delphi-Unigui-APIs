unit ObjAgency;

interface

uses objEntityFiscal, tblAgency, objbase;

Type

  TObjAgency = Class(TObjBase)
  private
    FAgencia: TAgency;
    FFiscal: TObjEntityFiscal;
    procedure setFAgencia(const Value: TAgency);
    procedure setFFiscal(const Value: TObjEntityFiscal);
  public
      constructor Create;
      destructor Destroy;
      property Agencia : TAgency read FAgencia write setFAgencia;
      property Fiscal : TObjEntityFiscal read FFiscal write setFFiscal;
  End;

implementation

{ TObjAgency }

constructor TObjAgency.Create;
begin
  FAgencia := TAgency.Create;
  FFiscal := TObjEntityFiscal.Create;
end;

destructor TObjAgency.Destroy;
begin
  FAgencia.DisposeOf;
  FFiscal.DisposeOf;
end;

procedure TObjAgency.setFAgencia(const Value: TAgency);
begin
  FAgencia := Value;
end;

procedure TObjAgency.setFFiscal(const Value: TObjEntityFiscal);
begin
  FFiscal := Value;
end;

end.
