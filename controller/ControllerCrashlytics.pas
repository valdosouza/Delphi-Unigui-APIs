unit ControllerCrashlytics;

interface

uses System.Classes, System.SysUtils,BaseController,
      FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      tblCrashlytics;

Type
  TControllerCrashlytics = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TCrashlytics;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function insert:boolean;
  End;


implementation

{ TControllerCrashlytics }

procedure TControllerCrashlytics.clear;
begin
  clearObj(Registro);
end;

constructor TControllerCrashlytics.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TCrashlytics.Create;
end;

destructor TControllerCrashlytics.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;

function TControllerCrashlytics.insert: boolean;
begin
  try
    Registro.Codigo := 0;
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
