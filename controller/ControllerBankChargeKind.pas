unit ControllerBankChargeKind;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblBankChargeKind, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerEntity;

Type
  TControllerBankChargeKind = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TBankChargeKind;
    Entity : TControllerEntity;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function getAllByKey:boolean;
    function getCRT: String;
    function getPessoa: String;
  End;

implementation

{ ControllerBankChargeKind }

procedure TControllerBankChargeKind.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerBankChargeKind.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TBankChargeKind.Create;
  Entity := TControllerEntity.Create(Self);

end;

function TControllerBankChargeKind.delete: boolean;
begin
  inherited;
end;

destructor TControllerBankChargeKind.Destroy;
begin
  Entity.DisposeOf;
  Registro.DisposeOf;
  inherited;
end;


function TControllerBankChargeKind.insert: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerBankChargeKind.save: boolean;
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


function TControllerBankChargeKind.getAllByKey: boolean;
begin
   getByKey;
  Entity.Registro.Codigo := Registro.Codigo;
  Entity.getAllByKey;
End;

function TControllerBankChargeKind.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerBankChargeKind.getCRT: String;
begin
 //
end;

function TControllerBankChargeKind.getPessoa: String;
begin
 //
end;

end.
