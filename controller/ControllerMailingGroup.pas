unit ControllerMailingGroup;
interface
uses System.Classes, System.SysUtils,BaseController,
      tblMailingGroup ,FireDAC.Comp.Client,FireDAC.Stan.Param;

Type
  TControllerMailingGroup = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TMailingGroup;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    procedure getByDescription;
  End;

implementation

{ ControllerMailingGroup }

uses UnFunctions;



{ TControllerMailing }

procedure TControllerMailingGroup.clear;
begin
  clearObj(Registro);
end;

constructor TControllerMailingGroup.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TMailingGroup.Create;
end;

destructor TControllerMailingGroup.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;


procedure TControllerMailingGroup.getByDescription;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := getByField('tb_mailing_group','description',Registro.Descricao);
    if exist then get(Lc_Qry,Registro);
  Finally
    Lc_Qry.Close;
    FreeAndNil(Lc_Qry);
  End;
end;

function TControllerMailingGroup.insert: boolean;
begin
  Try
    Registro.Codigo := getNextByField(Registro,'id',0);
    SaveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerMailingGroup.save: boolean;
begin
  Try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(Registro,'id',0);
    SaveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

end.
