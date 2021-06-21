unit ControllerPrivilege;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblPrivilege,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      System.Generics.Collections;

Type
  TListaPrivilege = TObjectList<TPrivilege>;

  TControllerPrivilege = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TPrivilege;
    Lista : TListaPrivilege;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function getByKey:Boolean;
    function delete: boolean;

    procedure getAvailableList(Interfaces:Integer);
    procedure getUsedList(Interfaces:Integer);

  End;

implementation

{ ControllerPrivilege }

procedure TControllerPrivilege.clear;
begin
  clearObj(Registro);
end;

constructor TControllerPrivilege.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TPrivilege.Create;
  Lista    := TListaPrivilege.create;
end;

function TControllerPrivilege.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerPrivilege.Destroy;
begin
  Registro.DisposeOf;
  Lista.DisposeOf;
  inherited;
end;

function TControllerPrivilege.save: boolean;
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


procedure TControllerPrivilege.getAvailableList(Interfaces: Integer);
var
  Qry : TFDQuery;
  LITem : Tprivilege;
begin
  Qry := createQuery;
  with Qry do
  Begin
    sql.Add(concat(
              'Select pri.id, pri.description ',
              'from tb_Privilege pri ',
              'left outer join tb_interface_has_privilege ihp ',
              'on (pri.id = ihp.tb_privilege_id) and (ihp.tb_interface_id =:tb_interface_id) ',
              'where ihp.tb_interface_id is null ',
              'Order by pri.description '
            ));
    ParamByName('tb_interface_id').AsInteger := Interfaces ;
    Active := True;
    FetchAll;
    First;
    Lista.Clear;
    while not eof do
    Begin
      LITem := Tprivilege.Create;
      with LITem do
      Begin
        Codigo                := FieldByName('id').asInteger;
        Descricao             := FieldByName('description').asString;
      end;
      Lista.add(LITem);
      next;
    end;
    Close;
  end;
  FreeAndNil(Qry);
end;


function TControllerPrivilege.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerPrivilege.getUsedList(Interfaces: Integer);
var
  Qry : TFDQuery;
  LITem : Tprivilege;
begin
  Qry := createQuery;
  with Qry do
  Begin
    sql.Add(concat(
              'Select pri.id, pri.description ',
              'from tb_privilege pri ',
              'inner join tb_interface_has_privilege ihp ',
              'on (pri.id = ihp.tb_privilege_id)',
              'WHERE ihp.tb_interface_id =:tb_interfaces_id ',
              'Order by pri.description '
            ));

    ParamByName('tb_interfaces_id').AsInteger := Interfaces;
    Active := True;
    FetchAll;
    First;
    Lista.Clear;
    while not eof do
    Begin
      LITem := TPrivilege.Create;
      with LITem do
      Begin
        Codigo                := FieldByName('id').asInteger;
        Descricao             := FieldByName('description').asString;

      end;
      Lista.add(LITem);
      next;
    end;
    Close;
  end;
  FreeAndNil(Qry);
end;

end.
