unit ControllerOrderBilling;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderBilling, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerEntity;

Type
  TControllerOrderBilling = Class(TBaseController)

  private

  public
    Registro : TOrderBilling;
    Responsavel : TControllerEntity;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    procedure clear;
    function getByKey:Boolean;
    function delete:Boolean;
  End;

implementation

{ ControllerShipping}

procedure TControllerOrderBilling.clear;
begin
  clearObj(Registro);
end;

constructor TControllerOrderBilling.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TOrderBilling.Create;
  Responsavel := TControllerEntity.Create(self);
end;

function TControllerOrderBilling.delete: Boolean;
begin
  try
    deleteObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

destructor TControllerOrderBilling.Destroy;
begin
  Registro.DisposeOf;
  Responsavel.DisposeOf;
  inherited;
end;

function TControllerOrderBilling.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerOrderBilling.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.
