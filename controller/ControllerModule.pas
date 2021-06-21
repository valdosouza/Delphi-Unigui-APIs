unit ControllerModule;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblModule,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerInterface, ControllerModuleHasInterface, System.Generics.Collections;

Type
  TListaModule = TObjectList<TModule>;

  TControllerModule = Class(TBaseController)

    procedure clear;

  private

  public
    Registro : TModule;
    Interfaces : TControllerInterface;
    ModuleHasInterface : TControllerModuleHasInterface;
    Lista: TListaModule;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure getAvailableList(Institution:Integer);
    procedure getUsedList(Institution:Integer);

    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
  End;

implementation

{ ControllerModule }

procedure TControllerModule.clear;
begin
  clearObj(Registro);
end;

constructor TControllerModule.Create(AOwner: TComponent);
begin
  inherited;
  Registro            := TModule.Create;
  Lista               := TListaModule.Create;
  Interfaces          := TControllerInterface.Create(Self);
  ModuleHasInterface  := TControllerModuleHasInterface.Create(self);
end;

function TControllerModule.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerModule.Destroy;
begin
  Registro.DisposeOf;
  Lista.DisposeOf;
  Interfaces.DisposeOf;
  ModuleHasInterface.DisposeOf;
  inherited;
end;

function TControllerModule.save: boolean;
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


procedure TControllerModule.getAvailableList(Institution: Integer);
var
  Lc_Qry : TFDQuery;
  LITem : TModule;
begin
  Lc_Qry := createQuery;
  with Lc_Qry do
  Begin
    sql.Add(concat(
              'Select mo.id, mo.description ',
              'from tb_Module mo ',
              'left outer join tb_Institution_has_Module ihm ',
              'on (mo.id = ihm.tb_modules_id) and (ihm.tb_institution_id =:tb_institution_id) ',
              'where ihm.tb_institution_id is null ',
              'Order by mo.description '
            ));
    ParamByName('tb_institution_id').AsInteger := institution ;
    Active := True;
    FetchAll;
    First;
    Lista.Clear;
    while not eof do
    Begin
      LITem := TModule.Create;
      with LITem do
      Begin
        Codigo                := FieldByName('id').asInteger;
        Descricao             := FieldByName('description').asString;
      end;
      Lista.add(LITem);
      next;
    end;
  end;
    FinalizaQuery(Lc_Qry);
end;

function TControllerModule.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerModule.getUsedList(Institution: Integer);
var
  Lc_Qry : TFDQuery;
  LITem : TModule;
begin
  try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Add(concat(
                'Select mo.* ',
                'from tb_module mo ',
                'inner join tb_institution_has_module ihm ',
                'on (mo.id = ihm.tb_modules_id) ',
                'WHERE ihm.tb_institution_id =:tb_institution_id ',
                'Order by mo.id '
              ));

      ParamByName('tb_institution_id').AsInteger := Institution;
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TModule.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;

end;


function TControllerModule.insert: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
