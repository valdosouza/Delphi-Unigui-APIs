unit ControllerBankChargeTicket;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblBankChargeTicket, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerEntity;

Type
  TControllerBankChargeTicket = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TBankChargeTicket;
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

{ ControllerBankChargeTicket }

procedure TControllerBankChargeTicket.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerBankChargeTicket.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TBankChargeTicket.Create;
  Entity := TControllerEntity.Create(Self);

end;

function TControllerBankChargeTicket.delete: boolean;
begin
  inherited;
end;

destructor TControllerBankChargeTicket.Destroy;
begin
  Entity.DisposeOf;
  Registro.DisposeOf;
  inherited;
end;


function TControllerBankChargeTicket.insert: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerBankChargeTicket.save: boolean;
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


function TControllerBankChargeTicket.getAllByKey: boolean;
begin
   getByKey;
  Entity.Registro.Codigo := Registro.Codigo;
  Entity.getAllByKey;
End;

function TControllerBankChargeTicket.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerBankChargeTicket.getCRT: String;
begin
 //
end;

function TControllerBankChargeTicket.getPessoa: String;
begin
 //
end;

end.
