unit ctrl_mob_entity_has_mailing;

interface

uses System.Classes,ctrl_mob_base, tblEntityHasMailing, FireDAC.Comp.Client;

Type
  TCtrlMobEntityHasMailing = class(TCtrlMobBase)
    private

    public
      Registro : TEntityHasMailing;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function save:boolean;
      function DeleteAll:Boolean;
  end;

implementation


uses MainModule;


constructor TCtrlMobEntityHasMailing.Create(AOwner: TComponent);
begin
  Registro := TEntityHasMailing.create;
  createTable;
end;

procedure TCtrlMobEntityHasMailing.createTable;
begin
  execcmd(concat(
              'CREATE TABLE if not exists   tb_entity_has_mailing (',
              '  tb_entity_id int(11) NOT NULL,',
              '  tb_mailing_id int(11) NOT NULL,',
              '  tb_mailing_group_id int(11) NOT NULL,',
              '  created_at datetime NOT NULL,',
              '  updated_at datetime NOT NULL )'
    ));
end;

function TCtrlMobEntityHasMailing.DeleteAll: Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Add(concat(
                'delete from tb_entity_has_mailing where tb_entity_id =:tb_entity_id '
      ));
      ParamByName('tb_entity_id').AsInteger := Registro.Entidade;
      ExecSQL;
    End;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;

destructor TCtrlMobEntityHasMailing.Destroy;
begin
  {$IFDEF WIN32}
	Registro.DisposeOf;
  {$ENDIF }

end;

function TCtrlMobEntityHasMailing.save: boolean;
begin
  Try
    SaveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

end.
