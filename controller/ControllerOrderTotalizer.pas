unit ControllerOrderTotalizer;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderTotalizer, FireDAC.Comp.Client,FireDAC.Stan.Param;

Type
  TControllerOrderTotalizer = Class(TBaseController)

  private

  public
    Registro : TOrderTotalizer;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    procedure clear;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
  End;

implementation


{ TControllerOrderTotalizer }

procedure TControllerOrderTotalizer.clear;
begin
  clearObj(Registro);
end;

constructor TControllerOrderTotalizer.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TOrderTotalizer.Create;
end;

function TControllerOrderTotalizer.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerOrderTotalizer.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;

function TControllerOrderTotalizer.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerOrderTotalizer.insert: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerOrderTotalizer.save: boolean;
begin
  try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
