unit ObjAdvertiser;

interface

uses objEntityFiscal, tblAdvertiser, objBase;

Type

  TObjAdvertiser = Class(TObjBase)
  private
    FAnunciante: TAdvertiser;
    FFiscal: TObjEntityFiscal;
    procedure setFAnunciante(const Value: TAdvertiser);
    procedure setFFiscal(const Value: TObjEntityFiscal);

  public
      constructor Create;
      destructor Destroy;
      property Anunciante : TAdvertiser read FAnunciante write setFAnunciante;
      property Fiscal : TObjEntityFiscal read FFiscal write setFFiscal;
  End;

implementation

{ TObjAdvertiser }

constructor TObjAdvertiser.Create;
begin
  FAnunciante := TAdvertiser.Create;
  FFiscal := TObjEntityFiscal.Create;
end;

destructor TObjAdvertiser.Destroy;
begin
  FAnunciante.DisposeOf;
  FFiscal.DisposeOf;
end;

procedure TObjAdvertiser.setFAnunciante(const Value: TAdvertiser);
begin
  FAnunciante := Value;
end;

procedure TObjAdvertiser.setFFiscal(const Value: TObjEntityFiscal);
begin
  FFiscal := Value;
end;

end.
