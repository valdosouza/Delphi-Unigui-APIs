unit ControllerSocialMedia;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblSocialMedia,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerSocialMedia = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TSocialMedia;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    function getByKey:Boolean;
    function delete: boolean;

  End;

implementation

{ ControllerCity }

procedure TControllerSocialMedia.clear;
begin
  clearObj(Registro);
end;

constructor TControllerSocialMedia.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TSocialMedia.Create;
end;

function TControllerSocialMedia.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerSocialMedia.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;


function TControllerSocialMedia.insert: boolean;
begin
  Registro.Codigo := getNextByField(Registro,'id',0);
  Try
    SaveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerSocialMedia.save: boolean;
begin
  if Registro.Codigo = 0 then
    Registro.Codigo := getNextByField(Registro,'id',0);
  Try
    SaveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;


function TControllerSocialMedia.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.
