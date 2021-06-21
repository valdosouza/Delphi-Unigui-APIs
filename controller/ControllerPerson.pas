unit ControllerPerson;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblPerson,tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerPerson = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TPerson;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function getByKey:Boolean;
    procedure verifyDuplicate;
    Function getIDbyCPF(cpf:String):Integer;
    Function getCpfById:String;
    function insert:boolean;
    Function delete:boolean;
    procedure getByCPf;
  End;

implementation

{ ControllerPerson }

procedure TControllerPerson.clear;
begin
  inherited;
  clearObj(Registro);
end;

constructor TControllerPerson.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TPerson.Create;
end;

function TControllerPerson.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerPerson.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;


function TControllerPerson.insert: boolean;
begin
  try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(Registro,'id',0);
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerPerson.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

procedure TControllerPerson.verifyDuplicate;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add('Select p.* '+
              'from tb_entity e '+
              '  inner join tb_person p '+
              '  on (p.id = e.id) '+
              'where (p.cpf =:cpf) '+
              ' and (p.id <> :id)');
      ParamByName('cpf').AsString := Registro.CPF;
      ParamByName('id').AsInteger := Registro.Codigo;
      active := True;
      FetchAll;
      exist := (RecordCount > 0);
      if (exist) then get(Lc_Qry,Registro);
    End;

  Finally
    finalizaQuery(Lc_Qry);
  End;

end;

procedure TControllerPerson.getByCPf;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := getByField('tb_person','cpf',registro.CPF);
    if exist then get(Lc_Qry,Registro);

  Finally
    finalizaQuery(Lc_Qry);
  End;

end;

function TControllerPerson.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerPerson.getCpfById: String;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add('Select p.cpf '+
              'from tb_person p '+
              'where (p.id =:id) ');
      ParamByName('id').AsInteger := Registro.Codigo;
      active := True;
      FetchAll;
      Result := FieldByName('cpf').AsString;
    End;
  Finally
    finalizaQuery(Lc_Qry);
  End;

end;

function TControllerPerson.getIDbyCPF(cpf: String): Integer;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add('Select p.id '+
              'from tb_person p '+
              'where (p.cpf =:cpf) ');
      ParamByName('cpf').AsString := cpf;
      active := True;
      FetchAll;
      if RecordCount > 0 then
        Result := FieldByName('id').AsInteger
      else
        Result := 0;
    End;
  Finally
    finalizaQuery(Lc_Qry);
  End;
end;

end.
