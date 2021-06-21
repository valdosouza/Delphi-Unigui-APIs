unit ControllerProposal;

interface
 uses
  System.Classes, System.SysUtils, System.Variants, FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  BaseController, tblProposal;
  Type
  TControllerProposal = Class(TBaseController)
  private

  public

    Registro  : TProposal;

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

{ TControllerProposal }

procedure TControllerProposal.clear;
begin
  clearObj(Registro);
end;

constructor TControllerProposal.Create(AOwner: TComponent);
begin
  inherited;
  Registro          := TProposal.Create;
end;

function TControllerProposal.delete: boolean;
begin
   Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerProposal.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;


function TControllerProposal.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerProposal.insert: boolean;
begin
  try
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerProposal.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerProposal.update: boolean;
begin
   try
    updateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
