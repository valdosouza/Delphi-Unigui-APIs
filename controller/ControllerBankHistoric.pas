unit ControllerBankHistoric;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblBankHistoric, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerEntity;

Type
  TControllerBankHistoric = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TBankHistoric;
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

{ ControllerBankHistoric }

procedure TControllerBankHistoric.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerBankHistoric.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TBankHistoric.Create;
  Entity := TControllerEntity.Create(Self);

end;

function TControllerBankHistoric.delete: boolean;
begin
  FreeAndNil(Entity);
  FreeAndNil(Registro);
  inherited;
end;

destructor TControllerBankHistoric.Destroy;
begin
  FreeAndNil(Entity);
  FreeAndNil(Registro);
  inherited;
end;


function TControllerBankHistoric.insert: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerBankHistoric.save: boolean;
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


function TControllerBankHistoric.getAllByKey: boolean;
begin
   getByKey;
  Entity.Registro.Codigo := Registro.Codigo;
  Entity.getAllByKey;
End;

function TControllerBankHistoric.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerBankHistoric.getCRT: String;
begin
 //
end;

function TControllerBankHistoric.getPessoa: String;
begin
 //
end;

end.
