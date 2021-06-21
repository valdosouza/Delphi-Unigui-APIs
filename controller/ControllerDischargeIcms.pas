unit ControllerDischargeIcms;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblDischargeIcms, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerDischargeIcms= Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TDischargeIcms;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function getByKey:Boolean;
    function delete: boolean;
  End;

implementation

{ ControllerDischargeIcms }

procedure TControllerDischargeIcms.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerDischargeIcms.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TDischargeIcms.Create;
  end;

function TControllerDischargeIcms.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerDischargeIcms.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerDischargeIcms.save: boolean;
begin
if Registro.Codigo = 0 then
    Registro.Codigo := getNextByField(Registro,'id',0);
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerDischargeIcms.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.
