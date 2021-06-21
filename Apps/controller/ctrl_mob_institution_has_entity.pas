unit ctrl_mob_institution_has_entity;

interface

uses System.Classes,ctrl_mob_base, System.SysUtils,FireDAC.Comp.Client, FireDAC.Stan.Param,
      tblInstitutionHasEntity;

Type
  TCtrlMobInstitutionHasEntity = class(TCtrlMobBase)
    private

    public
      Registro : TInstitutionHasEntity;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function save:boolean;
  end;

implementation

{ TCtrlMobInstitutionHasEntity }

uses MainModule;


constructor TCtrlMobInstitutionHasEntity.Create(AOwner: TComponent);
begin
  Registro := TInstitutionHasEntity.create;
  createTable;
end;

procedure TCtrlMobInstitutionHasEntity.createTable;
begin
  execcmd(concat(
              'CREATE TABLE if not exists tb_institution_has_entity ( ',
              '  tb_institution_id int(11) , ',
              '  tb_entity_id int(11) , ',
              '  created_at datetime , ',
              '  updated_at datetime  ) '
      ));
end;

destructor TCtrlMobInstitutionHasEntity.Destroy;
begin
  {$IFDEF WIN32}
	Registro.DisposeOf;
  {$ENDIF }

end;

function TCtrlMobInstitutionHasEntity.save: boolean;
begin
  Try
    SaveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

end.
