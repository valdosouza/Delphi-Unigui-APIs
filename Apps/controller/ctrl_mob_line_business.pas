unit ctrl_mob_line_business;

interface

uses System.SysUtils ,System.Classes,ctrl_mob_base,FireDAC.Comp.Client, FireDAC.Stan.Param,
    ctrl_mob_institution_has_line_business,tblLineBusiness;

Type
  TCtrlMobLineBusiness = class(TCtrlMobBase)
    private

    public
      Registro : TLineBusiness;
      MInstitutionHas : TCtrlMobInstitutionHasLineBusiness;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function getByKey:Boolean;
  end;

implementation

uses MainModule;


constructor TCtrlMobLineBusiness.Create(AOwner: TComponent);
begin
  Registro := TLineBusiness.create;
  MInstitutionHas := TCtrlMobInstitutionHasLineBusiness.Create(Self);
  createTable;
end;

procedure TCtrlMobLineBusiness.createTable;
begin
  execcmd(concat(
              'CREATE TABLE if not exists  tb_linebusiness ( ',
              '  id int(11) NOT NULL, ',
              '  description varchar(100) DEFAULT NULL, ',
              '  created_at datetime NOT NULL, ',
              '  updated_at datetime NOT NULL, ',
              '  PRIMARY KEY (id) ) '
      ));
end;

destructor TCtrlMobLineBusiness.Destroy;
begin
  {$IFDEF WIN32}
  Registro.disposeOf;
  MInstitutionHas.DisposeOf;
  {$ENDIF }

end;

function TCtrlMobLineBusiness.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.
