unit objCollaborator;

interface

uses System.SysUtils, objEntityFiscal, tblCollaborator,ObjBase;

Type
  TobjCollaborator = Class (TObjBase)
  private
    FColaborador: TCollaborator;
    FFiscal: TObjEntityFiscal;
    procedure setFColaborador(const Value: TCollaborator);
    procedure setFFiscal(const Value: TObjEntityFiscal);

  public
    constructor Create;
    destructor Destroy;
    procedure clear;
    property Colaborador : TCollaborator read FColaborador write setFColaborador;
    property Fiscal : TObjEntityFiscal read FFiscal write setFFiscal;

  End;

implementation

uses GenericDao;
{ TobjCollaborator }

procedure TobjCollaborator.clear;
begin
  TGenericDAO._Clear(FColaborador);
  FFiscal.clear

end;

constructor TobjCollaborator.Create;
begin
  inherited;
  FColaborador := TCollaborator.create;
  FFiscal := TObjEntityFiscal.create;
end;

destructor TobjCollaborator.Destroy;
begin
  {$IFDEF WIN32}
    FColaborador.DisposeOf;
    FFiscal.Destroy;
    inherited;
  {$ENDIF }
end;

procedure TobjCollaborator.setFColaborador(const Value: TCollaborator);
begin
  FColaborador := Value;
end;

procedure TobjCollaborator.setFFiscal(const Value: TObjEntityFiscal);
begin
  FFiscal := Value;
end;

end.
