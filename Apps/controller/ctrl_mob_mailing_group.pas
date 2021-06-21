unit ctrl_mob_mailing_group;

interface

uses System.Classes,ctrl_mob_base, tblMailingGroup,
    FireDAC.Comp.Client,FireDAC.Stan.Param;

Type
  TCtrlMobMailingGroup = class(TCtrlMobBase)
    private

    public
      Registro : TMailingGroup;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      procedure getByDescription;
  end;

implementation


uses MainModule;


constructor TCtrlMobMailingGroup.Create(AOwner: TComponent);
begin
  Registro := TMailingGroup.create;
  createTable;
end;

procedure TCtrlMobMailingGroup.createTable;
begin
  execcmd(concat(
              'CREATE TABLE if not exists  tb_mailing_group ( ',
              '  id int(11) NOT NULL, ',
              '  description varchar(100) DEFAULT NULL, ',
              '  created_at datetime NOT NULL, ',
              '  updated_at datetime NOT NULL) '
    ));
end;

destructor TCtrlMobMailingGroup.Destroy;
begin
  {$IFDEF WIN32}
	Registro.DisposeOf;
  {$ENDIF }

end;

procedure TCtrlMobMailingGroup.getByDescription;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := getByField('tb_mailing_group','description',Registro.Descricao);
    if exist then get(Lc_Qry,Registro);
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

end.
