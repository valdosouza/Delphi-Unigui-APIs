unit ctrl_mob_phone;

interface

uses System.Classes,ctrl_mob_base, tblPhone, FireDAC.Comp.Client;

Type
  TCtrlMobPhone = class(TCtrlMobBase)
    private

    public
      Registro : TPhone;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function save:Boolean;
      function delete:Boolean;
      function getByKey:Boolean;
      function clear:Boolean;
      function deleteAll:boolean;
  end;

implementation

uses MainModule;


function TCtrlMobPhone.clear: Boolean;
begin
  clearObj(Registro);
end;

constructor TCtrlMobPhone.Create(AOwner: TComponent);
begin
  Registro := TPhone.Create;
  createTable;
end;

procedure TCtrlMobPhone.createTable;
begin
  execcmd(concat(
              'CREATE TABLE if not exists  tb_phone ( ',
              '  id int(11), ',
              '  kind varchar(20) , ',
              '  contact varchar(100) , ',
              '  number varchar(20) , ',
              '  address_kind varchar(100) , ',
              '  created_at datetime , ',
              '  updated_at datetime ) ;'
    ));
end;

function TCtrlMobPhone.delete: Boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TCtrlMobPhone.deleteAll: boolean;
Var
  Lc_Qry : TFDQuery;
Begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
                'delete from tb_phone where ( id=:id )'
      ));
      ParamByName('id').AsInteger := Registro.Codigo;
      ExecSQL;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

destructor TCtrlMobPhone.Destroy;
begin
  {$IFDEF WIN32}
	Registro.DisposeOf;
  {$ENDIF }

end;

function TCtrlMobPhone.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TCtrlMobPhone.save: Boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

end.
