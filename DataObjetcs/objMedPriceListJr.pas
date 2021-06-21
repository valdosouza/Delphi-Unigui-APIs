unit objMedPriceListJr;

interface

uses System.SysUtils,objBase,   System.Generics.Collections, TblMedPriceListJR;

Type

  TobjMedPriceListJr = Class(TOBjBase)
  private
    FTabela: TMedPriceListJR;
    FVeiculoCNPJ: String;
    procedure setFTabela(const Value: TMedPriceListJR);
    procedure setFVeiculoCNPJ(const Value: String);

  public
      constructor Create;
      destructor Destroy;
      property Tabela : TMedPriceListJR read FTabela write setFTabela;
      property VeiculoCNPJ : String read FVeiculoCNPJ write setFVeiculoCNPJ;

  End;
implementation

{ TobjMedPriceListJr }

constructor TobjMedPriceListJr.Create;
begin
  FTabela := TMedPriceListJR.Create;
  inherited;
end;

destructor TobjMedPriceListJr.Destroy;
begin
  {$IFDEF WIN32}
  FTabela.DisposeOf;
  Inherited;
  {$ENDIF }
end;


procedure TobjMedPriceListJr.setFTabela(const Value: TMedPriceListJR);
begin
  FTabela := Value;
end;

procedure TobjMedPriceListJr.setFVeiculoCNPJ(const Value: String);
begin
  FVeiculoCNPJ := Value;
end;

end.
