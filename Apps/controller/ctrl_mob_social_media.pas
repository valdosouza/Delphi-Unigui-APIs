unit ctrl_mob_social_media;

interface

uses System.Classes,ctrl_mob_base, tblSocialMedia, FireDAC.Comp.Client,System.SysUtils;

Type
  TCtrlMobSocialMedia = class(TCtrlMobBase)
    private

    public
      Registro : TSocialMEdia;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function getByKey:Boolean;
      function deleteAll:Boolean;
  end;

implementation

uses MainModule;


constructor TCtrlMobSocialMedia.Create(AOwner: TComponent);
begin
  Registro := TSocialMedia.Create;
  createTable;
end;

procedure TCtrlMobSocialMedia.createTable;
begin
  execcmd(concat(
            'CREATE TABLE if not exists tb_social_media ( ',
            '  id int(11) NOT NULL, ',
            '  kind varchar(50) NOT NULL, ',
            '  link varchar(100) DEFAULT NULL, ',
            '  created_at datetime NOT NULL, ',
            '  updated_at datetime NOT NULL, ',
            '  PRIMARY KEY (id,kind)) '
  ));
end;

function TCtrlMobSocialMedia.deleteAll: Boolean;
Var
  Lc_Qry : TFDQuery;
Begin
  Try
    Try
      Lc_Qry := createQuery;
      Lc_Qry.Active := False;
      Lc_Qry.sql.Clear;
      Lc_Qry.sql.Add(concat(
                  'delete from tb_social_media where ( id=:id )'
        ));
      Lc_Qry.ParamByName('id').AsInteger := Registro.Codigo;
      Lc_Qry.ExecSQL;
    Except
      on E: Exception do
        geralog('TBaseController.execcmd',concat(E.Message,' - SQL: ',Lc_Qry.SQL.text) );
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

destructor TCtrlMobSocialMedia.Destroy;
begin
  {$IFDEF WIN32}
  Registro.disposeOf;
  {$ENDIF }

end;

function TCtrlMobSocialMedia.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.
