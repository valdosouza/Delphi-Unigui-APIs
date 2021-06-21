unit ControllerChartAccounts;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblChartAccounts, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerChartAccounts= Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TChartAccounts;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;

  End;

implementation

{ ControllerChartAccounts }

procedure TControllerChartAccounts.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerChartAccounts.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TChartAccounts.Create;
  end;

destructor TControllerChartAccounts.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerChartAccounts.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


end.

