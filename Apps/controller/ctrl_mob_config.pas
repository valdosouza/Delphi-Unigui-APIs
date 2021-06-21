unit ctrl_mob_config;


interface

uses System.Classes, tblConfig,ctrl_mob_base,
    FireDAC.Comp.Client, FireDAC.Stan.Param;

Type
  TCtrlMobConfig = class(TCtrlMobBase)
    private

    public
      Registro : TConfig;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      procedure altereTable;
      function save:boolean;
      procedure getbyKey;
  end;

implementation


uses MainModule;


procedure TCtrlMobConfig.altereTable;
begin
  execcmd(concat(
              'CREATE TABLE if not exists tb_config ( ',
              '  tb_institution_id int(11) ,          ',
              '  field varchar(50) ,                  ',
              '  tb_user_id int(11) ,                 ',
              '  content varchar(100) ,               ',
              '  created_at datetime ,    ',
              '  updated_at datetime )    '
    ));
end;

constructor TCtrlMobConfig.Create(AOwner: TComponent);
begin
  Registro := TConfig.create;
  createTable;
end;

procedure TCtrlMobConfig.createTable;
begin
  execcmd(concat(
                'CREATE TABLE if not exists tb_config ( ',
                '  tb_institution_id int(11) ,          ',
                '  field varchar(50) ,                  ',
                '  tb_user_id int(11) ,                 ',
                '  content varchar(100) ,               ',
                '  created_at datetime ,    ',
                '  updated_at datetime )    '
      ));
end;

destructor TCtrlMobConfig.Destroy;
begin
  {$IFDEF WIN32}
  Registro.DisposeOf;
  {$ENDIF }

end;

procedure TCtrlMobConfig.getbyKey;
begin
  _getByKey(Registro);
end;

function TCtrlMobConfig.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
