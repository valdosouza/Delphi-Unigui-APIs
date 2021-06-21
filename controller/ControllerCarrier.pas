unit ControllerCarrier;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblCarrier, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,tblEntity,
      ControllerCompany, ControllerPerson, ControllerEntityFiscal;

Type
  TControllerCarrier = Class(TBaseController)
   procedure clear;
 private
    TipoPessoa:String;

  public
    Registro : TCarrier;
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

{ ControllerCarrier }

procedure TControllerCarrier.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerCarrier.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TCarrier.Create;
  Fiscal := TControllerEntityFiscal.Create(Self);
end;

function TControllerCarrier.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerCarrier.Destroy;
begin
  Fiscal.Destroy;
  Registro.DisposeOf;
  inherited;
end;


function TControllerCarrier.insert: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerCarrier.save: boolean;
begin
  try
    saveObj(Registro);

    Result := true;
  except
    Result := False;
  end;


end;

function TControllerCarrier.getAllByKey: boolean;
begin
  getByKey;
  Fiscal.Registro.Codigo := Registro.Codigo;
  Fiscal.getAllByKey;
end;

function TControllerCarrier.getByKey: Boolean;
begin
  _getByKey(Registro);
  Fiscal.Registro.Codigo := Self.Registro.Codigo;
  Fiscal.getByKey;

end;

end.
