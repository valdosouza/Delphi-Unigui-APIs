unit ControllerClinModule;

interface
uses System.Classes, System.SysUtils,BaseController,Rest.Json,
      tblClinModule,FireDAC.Comp.Client, FireDAC.Stan.Param, TypesCollection;

Type

  TControllerClinModule = Class(TBaseController)


  private

  public
    Registro : TClinModule;
    Lista : TListClinModule;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    procedure clear;
    procedure getbyKey;
    function insert:boolean;
    Function delete:boolean;
    procedure getList;
  End;

implementation

{ TControllerClinModule }

procedure TControllerClinModule.clear;
begin
  clearObj(Registro);
end;

constructor TControllerClinModule.Create(AOwner: TComponent);
begin
  inherited;
  Registro  := TClinModule.create;
  Lista     := TListClinModule.create;

end;

function TControllerClinModule.delete: boolean;
begin
  try
    DeleteObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

destructor TControllerClinModule.Destroy;
begin
  Registro.disposeof;
  Lista.disposeof;
  inherited;
end;

procedure TControllerClinModule.getbyKey;
begin
  _getByKey(Registro);
end;

procedure TControllerClinModule.getList;
begin

end;

function TControllerClinModule.insert: boolean;
begin
  try
   if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
    InsertObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

function TControllerClinModule.save: boolean;
begin
  try
   if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
