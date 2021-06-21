unit ctrl_mob_person;

interface

uses System.Classes,ctrl_mob_base, tblPerson,
    FireDAC.Comp.Client, FireDAC.Stan.Param;

Type
  TCtrlMobPerson = class(TCtrlMobBase)
    private

    public
      Registro : TPerson;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function getByKey:Boolean;
      Function getIDbyCPF(cpf:String):Integer;
      Function getCpfById:String;
      function insert:boolean;
      function save:boolean;
      function Delete:boolean;
      procedure Clear;
  end;

implementation


uses MainModule;


procedure TCtrlMobPerson.Clear;
begin
  clearObj(Registro);
end;

constructor TCtrlMobPerson.Create(AOwner: TComponent);
begin
  Registro := TPerson.Create;
  createTable;
end;

procedure TCtrlMobPerson.createTable;
begin
  execcmd(concat(
            'CREATE TABLE  if not exists tb_person ( ',
            '  id int(11) , ',
            '  cpf char(11) , ',
            '  rg char(20) , ',
            '  rg_dt_emission date , ',
            '  rg_organ_issuer varchar(45) , ',
            '  rg_state_issuer int(11) , ',
            '  birthday date , ',
            '  tb_profession_id int(11) , ',
            '  created_at datetime , ',
            '  updated_at datetime  ) ;'
    ));
end;

function TCtrlMobPerson.Delete: boolean;
begin
  try
    deleteObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

destructor TCtrlMobPerson.Destroy;
begin
  {$IFDEF WIN32}
	Registro.DisposeOf;
  {$ENDIF }

end;

function TCtrlMobPerson.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TCtrlMobPerson.getCpfById: String;
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
    FinalizaQuery(Lc_Qry);
  End;



end;

function TCtrlMobPerson.getIDbyCPF(cpf: String): Integer;
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
    FinalizaQuery(Lc_Qry);
  End;


end;

function TCtrlMobPerson.insert: boolean;
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

function TCtrlMobPerson.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
