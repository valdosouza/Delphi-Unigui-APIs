unit ctrl_mob_address;


interface

uses System.Classes,tblAddress, ctrl_mob_base,
     ctrl_mob_country,ctrl_mob_state, ctrl_mob_city, TypesCollection,
  FireDAC.Comp.Client;

Type
  TCtrlMobAddress = class(TCtrlMobBase)
    private

    public
      Registro : TAddress;
      MPais : TCtrlMobCountry;
      MEstado : TCtrlMobState;
      MCidade : TCtrlMobCity;
      Lista : TListAddress;

      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function save:Boolean;
      function getAllByKey:boolean;
      function getByKey:boolean;
      function deleteAll:Boolean;
  end;

implementation


uses MainModule;


constructor TCtrlMobAddress.Create(AOwner: TComponent);
begin
  Registro  := TAddress.create;
  MPais     := TCtrlMobCountry.Create(Self);
  MEstado   := TCtrlMobState.Create(Self);
  MCidade   := TCtrlMobCity.Create(Self);
  Lista     := TListAddress.Create;
  createTable;
end;

procedure TCtrlMobAddress.createTable;
begin
  execcmd(concat(
              'CREATE TABLE if not exists  tb_address ( ',
              '  id int(11) ,                           ',
              '  street varchar(100) ,                  ',
              '  nmbr varchar(10) ,                     ',
              '  complement varchar(100) ,              ',
              '  neighborhood varchar(100) ,            ',
              '  region varchar(100) ,                  ',
              '  kind varchar(100) ,                    ',
              '  zip_code varchar(15) ,                 ',
              '  tb_country_id int(11) ,                ',
              '  tb_state_id int(11) ,                  ',
              '  tb_city_id int(11) ,                   ',
              '  main char(1),                          ',
              '  created_at datetime ,                  ',
              '  updated_at datetime );                 '
    ));
end;

function TCtrlMobAddress.deleteAll: Boolean;
Var
  Lc_Qry : TFDQuery;
Begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Add(concat(
                'delete from tb_address where ( id=:id )'
      ));
      ParamByName('id').AsInteger := Registro.Codigo;
      ExecSQL;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

destructor TCtrlMobAddress.Destroy;
begin
  {$IFDEF WIN32}
  Registro.disposeOf;
  MPais.disposeOf;
  MEstado.disposeOf;
  MCidade.disposeOf;
  Lista.disposeOf;
  {$ENDIF }

end;

function TCtrlMobAddress.getAllByKey: boolean;
begin
  _getByKey(Registro);

  MPais.Registro.Codigo := Registro.CodigoPais;
  MPais.getByKey;

  MEstado.Registro.Codigo := Registro.CodigoEstado;
  MEstado.getByKey;

  MCidade.Registro.Codigo := Registro.CodigoCidade;
  MCidade.getByKey;

end;

function TCtrlMobAddress.getByKey: boolean;
begin
  _getByKey(Registro);
end;

function TCtrlMobAddress.save: Boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

end.
