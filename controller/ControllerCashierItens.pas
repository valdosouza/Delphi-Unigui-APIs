unit ControllerCashierItens;

interface
 uses
  System.Classes, System.SysUtils, System.Variants, FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  BaseController, tblCashierItems;
 Type
  TControllerCashierItems = Class(TBaseController)
  private

  public
    Registro : TCashierItems;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function update:boolean;
    function getByKey:Boolean;Virtual;
    function delete: boolean;
    function insert:boolean;
    procedure clear;
  End;
implementation

{ TControllerCashierItems }

procedure TControllerCashierItems.clear;
begin
  clearObj(Registro);
end;

constructor TControllerCashierItems.Create(AOwner: TComponent);
begin
  inherited;
  Registro                    := TCashierItems.Create;

end;

function TControllerCashierItems.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerCashierItems.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;

function TControllerCashierItems.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerCashierItems.insert: boolean;
begin
  try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerCashierItems.save: boolean;
begin
  if Registro.Codigo = 0 then
    Registro.Codigo := getNextByField(Registro,'id',0);
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerCashierItems.update: boolean;
begin
   try
    updateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
