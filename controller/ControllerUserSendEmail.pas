unit ControllerUserSendEmail;

interface
uses System.Classes, System.SysUtils,BaseController,TypesCollection,
      tblUserSendEmail, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerUserSendEmail = Class(TBaseController)
  private

  public
    Registro : TUserSendEmail;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure clear;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;

  End;

implementation

{ TControllerUserSendEmail }

procedure TControllerUserSendEmail.clear;
begin
  clearObj(Registro);
end;

constructor TControllerUserSendEmail.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TUserSendEmail.Create;
end;

function TControllerUserSendEmail.delete: boolean;
begin
 try
    deleteObj(Registro);
    Result := True;
  except
    Result := FAlse;
  end;
end;

destructor TControllerUserSendEmail.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;


function TControllerUserSendEmail.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerUserSendEmail.insert: boolean;
begin
  try
    insertObj(Registro);
    Result := True;
  except
    Result := FAlse;
  end;

end;

function TControllerUserSendEmail.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := True;
  except
    Result := FAlse;
  end;

end;

end.
