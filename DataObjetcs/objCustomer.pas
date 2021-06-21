unit objCustomer;

interface

uses System.SysUtils, objEntityFiscal, tblCustomer, ObjSalesMan,
  System.Classes,objBase;

Type

  TObjCustomer = Class(TObjBase)
  private
    FDocFiscalVendedor: String;
    FCliente: TCustomer;
    FVendedor: Integer;
    FFiscal: TObjEntityFiscal;
    procedure setFCliente(const Value: TCustomer);
    procedure setFDocFiscalVendedor(const Value: String);
    procedure setFFiscal(const Value: TObjEntityFiscal);
    procedure setFVendedor(const Value: Integer);

  public
      constructor Create;override;
      destructor Destroy;override;
      procedure clear;
      property Cliente : TCustomer read FCliente write setFCliente;
      property Fiscal : TObjEntityFiscal read FFiscal write setFFiscal;
      property Vendedor : Integer read FVendedor write setFVendedor;
      property DocFiscalVendedor : String read FDocFiscalVendedor write setFDocFiscalVendedor;
  End;

implementation


{ TObjCustomer }

uses GenericDao;

procedure TObjCustomer.clear;
begin
  TGenericDAO._Clear(FCliente);
  FFiscal.clear
end;

constructor TObjCustomer.Create;
begin
  inherited;
  FCliente := TCustomer.Create;
  FFiscal := TObjEntityFiscal.Create;
end;

destructor TObjCustomer.Destroy;
begin
  {$IFDEF WIN32}
    FCliente.DisposeOf;
    FFiscal.Destroy;
  {$ENDIF }
end;

procedure TObjCustomer.setFCliente(const Value: TCustomer);
begin
  FCliente := Value;
end;

procedure TObjCustomer.setFDocFiscalVendedor(const Value: String);
begin
  FDocFiscalVendedor := Value;
end;

procedure TObjCustomer.setFFiscal(const Value: TObjEntityFiscal);
begin
  FFiscal := Value;
end;

procedure TObjCustomer.setFVendedor(const Value: Integer);
begin
  FVendedor := Value;
end;

end.

