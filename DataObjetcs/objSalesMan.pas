unit objSalesMan;

interface

uses
  System.SysUtils, objEntityFiscal,tblCollaborator, tblSalesMan, objCollaborator, ObjBase  ;

Type
  TObjSalesMan = Class (TObjBase)
  private
    FColaborador: TCollaborator;
    FVendedor: TSalesMan;
    FFiscal: TObjEntityFiscal;
    procedure setFColaborador(const Value: TCollaborator);
    procedure setFFiscal(const Value: TObjEntityFiscal);
    procedure setFVendedor(const Value: TSalesMan);

  public
    constructor Create;
    destructor Destroy;
    procedure clear;
    property Vendedor : TSalesMan read FVendedor write setFVendedor;
    property Colaborador : TCollaborator read FColaborador write setFColaborador;
    property Fiscal : TObjEntityFiscal read FFiscal write setFFiscal;
  End;

implementation

uses GenericDao;

{ TObjSalesMan }

procedure TObjSalesMan.clear;
begin
  TGenericDAO._Clear(FVendedor);
  TGenericDAO._Clear(FColaborador);
  FFiscal.clear;
end;

constructor TObjSalesMan.Create;
begin
  inherited;
  FVendedor := tSalesMan.create;
  FColaborador := TCollaborator.create;
  FFiscal := TObjEntityFiscal.Create;
end;


destructor TObjSalesMan.Destroy;
begin
  {$IFDEF WIN32}
  FVendedor.DisposeOf;
  FColaborador.Destroy;
  {$ENDIF }
  inherited;
end;



procedure TObjSalesMan.setFColaborador(const Value: TCollaborator);
begin
  FColaborador := Value;
end;

procedure TObjSalesMan.setFFiscal(const Value: TObjEntityFiscal);
begin
  FFiscal := Value;
end;

procedure TObjSalesMan.setFVendedor(const Value: TSalesMan);
begin
  FVendedor := Value;
end;

end.
