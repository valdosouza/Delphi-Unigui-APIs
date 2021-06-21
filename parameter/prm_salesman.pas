unit prm_salesman;

interface

uses objEntityFiscal,prm_base, TypesCollection, System.SysUtils, tblSalesman, tblCollaborator ;

Type
  TPrmSalesMan = class(TPrmBase)
  private
    FVendedor: TSalesman;
    FColaborador: TCollaborator;
    FFiscal: TObjEntityFiscal;
    procedure setFColaborador(const Value: TCollaborator);
    procedure setFFiscal(const Value: TObjEntityFiscal);
    procedure setFVendedor(const Value: TSalesman);

  public
    constructor Create;override;
    destructor Destroy;override;
    property Fiscal :TObjEntityFiscal read FFiscal write setFFiscal;
    property Colaborador : TCollaborator read FColaborador write setFColaborador;
    property Vendedor : TSalesman read FVendedor write setFVendedor;
  end;

implementation

{ TPrmSalesMan }



constructor TPrmSalesMan.Create;
begin
  inherited;
  FFiscal   := TObjEntityFiscal.Create;

  FColaborador := TCollaborator.Create;
  FColaborador.RegistroCriado := 0;
  FColaborador.RegistroAlterado := 0;

  FVendedor := TSalesman.Create;
  FVendedor.RegistroCriado := 0;
  FVendedor.RegistroAlterado := 0;

end;

destructor TPrmSalesMan.Destroy;
begin
  FFiscal.Destroy;
  FColaborador.DisposeOf;
  FVendedor.DisposeOf;
  inherited;
end;


procedure TPrmSalesMan.setFColaborador(const Value: TCollaborator);
begin
  FColaborador := Value;
end;

procedure TPrmSalesMan.setFFiscal(const Value: TObjEntityFiscal);
begin
  FFiscal := Value;
end;

procedure TPrmSalesMan.setFVendedor(const Value: TSalesman);
begin
  FVendedor := Value;
end;

end.
