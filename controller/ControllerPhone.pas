unit ControllerPhone;


interface
uses  System.Classes, System.SysUtils,BaseController,
      tblPhone,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      System.Generics.Collections,TypesCollection;

Type

  TControllerPhone = Class(TBaseController)


    procedure clear;
  private

  public
    Registro : TPhone;
    Lista: TListPhone;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    procedure verifyDuplicate;
    function insert:boolean;
    function getByKey:Boolean;
    function Valida():boolean;
    function delete:Boolean;
    function deleteAll():boolean;
    Function getList:Boolean;
  End;

implementation

{ ControllerMailing }

procedure TControllerPhone.clear;
begin
  clearObj(Registro);
end;

constructor TControllerPhone.Create(AOwner: TComponent);
begin
  inherited;
  Registro  := TPhone.Create;
  Lista     := TListPhone.create;
end;

function TControllerPhone.delete: Boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerPhone.deleteAll: boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    _getByKey(Registro);
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add('delete '+
              'from tb_phone  '+
              'where (id =:id)');
      ParamByName('id').AsInteger := Registro.Codigo;
      ExecSQL;
    End;
  Finally
    Lc_Qry.Close;
    FreeAndNil(Lc_Qry);
  End;
end;

destructor TControllerPhone.Destroy;
begin
  Lista.DisposeOf;
  Registro.DisposeOf;
  inherited;
end;

function TControllerPhone.insert: boolean;
begin
  Try
    SaveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerPhone.save: boolean;
begin
  Try
    SaveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

procedure TControllerPhone.verifyDuplicate;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    _getByKey(Registro);
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add('Select * '+
              'from tb_phone  '+
              'where (number =:number) '+
              ' and (kind =:kind) '+
              ' and (id <> :id)');
      ParamByName('number').AsString := Registro.Numero;
      ParamByName('kind').AsString := Registro.Tipo;
      ParamByName('id').AsInteger := Registro.Codigo;
      active := True;
      FetchAll;
      exist := (RecordCount > 0);
      if (exist) then get(Lc_Qry,Registro);
    End;
  Finally
    Lc_Qry.Close;
    FreeAndNil(Lc_Qry);
  End;
end;


function TControllerPhone.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerPhone.getList: Boolean;
var
  Qry : TFDQuery;
  LITem : TPhone;
begin
  Qry := createQuery;
  with Qry do
  Begin
    sql.add(concat('SELECT * ',
                   'FROM tb_phone ph ',
                   'WHERE (ph.id =:id )  '
                    ));
    ParamByName('id').AsInteger := Registro.Codigo;;
    Active := True;
    FetchAll;
    First;
    Lista.Clear;
    while not eof do
    Begin
      LITem := TPhone.Create;
      get(qry,LITem);
      Lista.add(LITem);
      next;
    end;
    Close;
  end;
  FreeAndNil(Qry);

end;

function TControllerPhone.Valida():boolean;
begin
  Result := True;
end;

end.
