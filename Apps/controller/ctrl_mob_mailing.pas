unit ctrl_mob_mailing;

interface

uses System.Classes,ctrl_mob_base,ctrl_mob_mailing_group,System.SysUtils,
    tblMailing,ctrl_mob_entity_has_mailing,FireDAC.Comp.Client, FireDAC.Stan.Param;

Type
  TCtrlMobMailing = class(TCtrlMobBase)
    private

    public
      Registro : TMailing;
      MGrupo :TCtrlMobMailingGroup;
      MEntityHas : TCtrlMobEntityHasMailing;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function save:Boolean;
      function deleteHasEntity(entity,group:Integer):Boolean;
      procedure getbyKind(tbEntityId:Integer;Kind:String);
  end;

implementation


uses MainModule;


constructor TCtrlMobMailing.Create(AOwner: TComponent);
begin
  Registro := TMailing.create;
  MGrupo := TCtrlMobMailingGroup.Create(Self);
  MEntityHas := TCtrlMobEntityHasMailing.Create(Self);
  createTable;
end;

procedure TCtrlMobMailing.createTable;
begin
  execcmd(concat(
              'CREATE TABLE if not exists tb_mailing ( ',
              '  id int(11) NOT NULL, ',
              '  email varchar(100) NOT NULL, ',
              '  created_at datetime NOT NULL, ',
              '  updated_at datetime NOT NULL) '
      ));
end;

function TCtrlMobMailing.deleteHasEntity(entity, group: Integer): Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add(Concat(
              'delete from tb_entity_has_mailing ',
              'where (tb_entity_id =:entity) ',
              '  and (tb_mailing_group_id =:group) '
      ));
      ParamByName('entity').AsInteger := entity;
      ParamByName('group').AsInteger   := group;
      ExecSQL;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;


end;

destructor TCtrlMobMailing.Destroy;
begin
  {$IFDEF WIN32}
  Registro.disposeof;
  MGrupo.DisposeOf;
  MEntityHas.DisposeOf;
  {$ENDIF }
end;

procedure TCtrlMobMailing.getbyKind(tbEntityId: Integer; Kind: String);
Var
  Lc_Qry : TFDQuery;
begin
  Try
    TRy
      MGrupo.Registro.Descricao := kind;
      MGrupo.getByDescription;
      Lc_Qry := createQuery;
      with Lc_Qry do
      Begin
        Active := False;
        SQL.Clear;
        SQL.Add(
          Concat('SELECT ma.*                                                               ',
                 'from tb_mailing ma                                                        ',
                 '  inner join tb_entity_has_mailing ehm on (ehm.tb_mailing_id = ma.id)     ',
                 '  left outer join tb_mailing_group mg on (mg.id = ehm.tb_mailing_group_id)     ',
                 'where ehm.tb_mailing_group_id =:group and ehm.tb_entity_id =:entity       ')
                );
        ParamByName('group').Value := MGrupo.Registro.Codigo;
        ParamByName('entity').Value := tbEntityId;
        active := True;
        FetchAll;
        exist := (RecordCount > 0);
        if exist then
          get(Lc_Qry, Registro);
      End;
    except
      on E : Exception do
        geralog('TCtrlMobMailing - getbyKind - ',E.Message);
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

function TCtrlMobMailing.save: Boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

end.

