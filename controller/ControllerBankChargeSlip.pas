unit ControllerBankChargeSlip;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblBankChargeSlip, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerEntity, ControllerBank;

Type
  TControllerBankChargeSlip = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TBankChargeSlip;
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

{ ControllerBankChargeSlip }

procedure TControllerBankChargeSlip.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerBankChargeSlip.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TBankChargeSlip.Create;
  Entity := TControllerEntity.Create(Self);

end;

function TControllerBankChargeSlip.delete: boolean;
begin
  inherited;
end;

destructor TControllerBankChargeSlip.Destroy;
begin
  Entity.DisposeOf;
  Registro.DisposeOf;
  inherited;
end;


function TControllerBankChargeSlip.insert: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerBankChargeSlip.save: boolean;
begin
  if Registro.Codigo = 0 then
    Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;


function TControllerBankChargeSlip.getAllByKey: boolean;
begin
   getByKey;
  Entity.Registro.Codigo := Registro.Codigo;
  Entity.getAllByKey;
End;

function TControllerBankChargeSlip.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerBankChargeSlip.getCRT: String;
begin
 //
end;

function TControllerBankChargeSlip.getPessoa: String;
begin
 //
end;

end.
