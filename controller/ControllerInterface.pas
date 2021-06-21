unit ControllerInterface;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblInterface,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
       System.Generics.Collections, ControllerInterfaceHasPrivilege,
       ControllerPrivilege;

Type
  TListaInterface = TObjectList<TInterface>;

  TControllerInterface = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TInterface;
    Lista: TListaInterface;
    InterfaceHasPrivilege : TControllerInterfaceHasPrivilege;
    privilege : TControllerPrivilege;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure getAvailableList(Module:Integer);
    procedure getUsedList(Module:Integer;Posicao:String);

    function update: Boolean;
    function insert: Boolean;

    function save:boolean;
    function getByKey:Boolean;
    function delete: boolean;

  End;

implementation

{ ControllerInterface }


procedure TControllerInterface.clear;
begin
  clearObj(Registro);
end;

constructor TControllerInterface.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TInterface.Create;
  Lista    := TListaInterface.create;
  InterfaceHasPrivilege := TControllerInterfaceHasPrivilege.Create(self);
  privilege := TControllerPrivilege.Create(self);
end;

function TControllerInterface.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerInterface.Destroy;
begin
  Registro.DisposeOf;
  Lista.DisposeOf;
  InterfaceHasPrivilege.DisposeOf;
  privilege.DisposeOf;
  inherited;
end;

function TControllerInterface.save: boolean;
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

function TControllerInterface.update: Boolean;
begin
   updateObj(registro)
end;


function TControllerInterface.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerInterface.getUsedList(Module:Integer;Posicao:String);
var
  Qry : TFDQuery;
  LITem : Tinterface;
begin
  Try
    Qry := createQuery;
    with Qry do
    Begin
      sql.Add(concat(
                'Select fa.* ',
                'from tb_interface fa ',
                '  inner join tb_module_has_interface mhi ',
                '  on (fa.id = mhi.tb_interface_id)',
                'WHERE mhi.tb_module_id =:tb_module_id '
              ));
      if trim(Posicao) <> '' then
        sql.Add(' and (fa.position =:position)');

      sql.Add('Order by fa.id ');

      ParamByName('tb_module_id').AsInteger := Module;

      if trim(Posicao) <> '' then
        ParamByName('position').AsString := posicao;
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TInterface.Create;
        get(qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    Qry.Close;
    FreeAndNil(Qry);
  End;

end;

function TControllerInterface.insert: Boolean;
begin
  insertObj(Registro)
end;

procedure TControllerInterface.getAvailableList(Module:Integer);
var
  Qry : TFDQuery;
  LITem : Tinterface;
begin
  Try
    Qry := createQuery;
    with Qry do
    Begin
      sql.Add(concat(
                'Select fa.* ',
                'from tb_interface fa ',
                'left outer join tb_module_has_interface mhi ',
                'on (fa.id = mhi.tb_interface_id) and (mhi.tb_module_id =:tb_module_id) ',
                'where mhi.tb_interface_id is null ',
                'Order by fa.id '
              ));
      ParamByName('tb_module_id').AsInteger := Module ;
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TInterface.Create;
        get(Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    Qry.Close;
    FreeAndNil(Qry);
  End;

end;

end.
