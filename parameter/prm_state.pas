unit prm_state;

interface

uses System.SysUtils, prm_base,tblstate;

Type
  TPrmState = class(TPrmbase)
  private
    FEstado: TState;
    FVendedor: Integer;
    procedure setFEstado(const Value: TState);
    procedure setFVendedor(const Value: Integer);
  public
    constructor Create;Override;
    destructor Destroy;Override;
    property Estado: TState read FEstado write setFEstado;
    property Vendedor : Integer read FVendedor write setFVendedor;
  end;

implementation

{ TPrmState }

constructor TPrmState.Create;
begin
  inherited;
  FEstado := TState.Create;
  FEstado.RegistroCriado := 0;
  FEstado.RegistroAlterado := 0;

end;

destructor TPrmState.Destroy;
begin
  FEstado.DisposeOf;
  inherited;
end;

procedure TPrmState.setFEstado(const Value: TState);
begin
  FEstado := Value;
end;

procedure TPrmState.setFVendedor(const Value: Integer);
begin
  FVendedor := Value;
end;

end.
