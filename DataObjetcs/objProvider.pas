unit objProvider;

interface

uses System.SysUtils, objEntityFiscal, tblProvider, ObjSalesMan,
  System.Classes,objBase;

Type

  TObjProvider = Class(TObjBase)
  private
    FFornecedor: TProvider;
    FFiscal: TObjEntityFiscal;
    procedure setFFornecedor(const Value: TProvider);
    procedure setFFiscal(const Value: TObjEntityFiscal);

  public
      constructor Create;Override;
      destructor Destroy;override;
      procedure clear;
      property Fornecedor : TProvider read FFornecedor write setFFornecedor;
      property Fiscal : TObjEntityFiscal read FFiscal write setFFiscal;
  End;

implementation


{ TObjProvider }

uses GenericDao;

procedure TObjProvider.clear;
begin
  TGenericDAO._Clear(FFornecedor);
end;

constructor TObjProvider.Create;
begin
  inherited;
  FFornecedor := TProvider.Create;
  FFiscal := TObjEntityFiscal.Create;
end;

destructor TObjProvider.Destroy;
begin
  FFornecedor.DisposeOf;
  FFiscal.Destroy;
end;


procedure TObjProvider.setFFiscal(const Value: TObjEntityFiscal);
begin
  FFiscal := Value;
end;

procedure TObjProvider.setFFornecedor(const Value: TProvider);
begin
  FFornecedor := Value;
end;

end.
