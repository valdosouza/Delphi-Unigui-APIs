unit ControllerAccounting;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblAccounting, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerEntityFiscal, ControllerCompany, ControllerPerson;

Type
  TControllerAccounting = Class(TBaseController)
    procedure clear;
  private
  public
    Registro : TAccounting;
    Fiscal : TControllerEntityFiscal;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function getAllByKey:boolean;
  End;

implementation

{ ControllerAccounting }

procedure TControllerAccounting.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerAccounting.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TAccounting.Create;
  Fiscal := TControllerEntityFiscal.Create(Self);
end;

function TControllerAccounting.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerAccounting.Destroy;
begin
  Registro.DisposeOf;
  Fiscal.Destroy;
  inherited;
end;


function TControllerAccounting.insert: boolean;
begin
  try
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerAccounting.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerAccounting.getAllByKey: boolean;
begin
  getByKey;
  Fiscal.Registro.Codigo := Registro.Codigo;
  Fiscal.getAllByKey;

end;

function TControllerAccounting.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.
