unit ControllerSalesmanHasState;

interface
 uses
  System.Classes, System.SysUtils, System.Variants, FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  BaseController, tblSalesmanHasState,
   objCashier, TypesCollection, System.Generics.Collections;
 Type

  TControllerSalesmanHasState = Class(TBaseController)
  private

  public
    Registro : TSalesmanHasState;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function update:boolean;
    procedure getList;
    procedure getListObjCashier;
    function delete: boolean;
    function insert:boolean;
    procedure clear;

  End;

implementation

{ TControllerSalesmanHasState }

procedure TControllerSalesmanHasState.clear;
begin
  clearObj(Registro);
end;

constructor TControllerSalesmanHasState.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TSalesmanHasState.Create;
end;

function TControllerSalesmanHasState.delete: boolean;
begin
  try
    DeleteObj(Registro);
    REsult := True;
  except
    REsult := False;
  end;
end;

destructor TControllerSalesmanHasState.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;

procedure TControllerSalesmanHasState.getList;
begin

end;

procedure TControllerSalesmanHasState.getListObjCashier;
begin

end;

function TControllerSalesmanHasState.insert: boolean;
begin
  try
    InsertObj(Registro);
    REsult := True;
  except
    REsult := False;
  end;
end;

function TControllerSalesmanHasState.save: boolean;
begin
  try
    SaveObj(Registro);
    REsult := True;
  except
    REsult := False;
  end;
end;

function TControllerSalesmanHasState.update: boolean;
begin
  try
    UpdateObj(Registro);
    REsult := True;
  except
    REsult := False;
  end;
end;

end.
