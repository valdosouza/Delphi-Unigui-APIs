unit ControllerEntityHasMailing;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblEntityHasMailing,FireDAC.Comp.Client,FireDAC.Stan.Param;

Type
  TControllerEntityHasMailing = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TEntityHasMailing;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function delete:boolean;
  End;

implementation

{ ControllerEntityHasMailing }

procedure TControllerEntityHasMailing.clear;
begin
  clearObj(Registro);
end;

constructor TControllerEntityHasMailing.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TEntityHasMailing.Create;
end;

function TControllerEntityHasMailing.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerEntityHasMailing.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;

function TControllerEntityHasMailing.save: boolean;
begin
  Try
    SaveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;


end.
