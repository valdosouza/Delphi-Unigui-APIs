unit ControllerCfop;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblCfop, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerCfopToCfop;

Type
  TControllerCfop = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TCfop;
    CfopDePara : TControllerCfopToCfop;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function getByKey:Boolean;
    function delete: boolean;
  End;

implementation

{ ControllerCfop }

procedure TControllerCfop.clear;
begin
  clearObj(Registro);
end;

constructor TControllerCfop.Create(AOwner: TComponent);
begin
  inherited;
  Registro    := TCfop.Create;
  CfopDePara  := TControllerCfopToCfop.Create(Self);
end;

function TControllerCfop.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

destructor TControllerCfop.Destroy;
begin
  Registro.DisposeOf;
  CfopDePara.DisposeOf;
  inherited;
end;

function TControllerCfop.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerCfop.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.

