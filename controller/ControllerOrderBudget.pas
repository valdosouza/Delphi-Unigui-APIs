unit ControllerOrderBudget;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderBudget, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerOrderBudget= Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TOrderBudget;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;

  End;

implementation

{ ControllerOrderBudget}

procedure TControllerOrderBudget.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderBudget.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TOrderBudget.Create
  end;

destructor TControllerOrderBudget.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerOrderBudget.save: boolean;
begin
  if Registro.Numero = 0 then
    Registro.Numero := getNextByField(Registro,'number',Registro.Estabelecimento);
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


end.
