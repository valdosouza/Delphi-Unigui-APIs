unit ctrl_mob_institution_has_line_business;

interface

uses System.Classes,ctrl_mob_base, System.SysUtils,FireDAC.Comp.Client, FireDAC.Stan.Param,
    tblInstitutionHasLineBusiness;

Type
  TCtrlMobInstitutionHasLineBusiness = class(TCtrlMobBase)
    private

    public
      Registro : TInstitutionHasLineBusiness;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
  end;

implementation

{ TCtrlMobInstitutionHasLineBusiness }

uses MainModule;


constructor TCtrlMobInstitutionHasLineBusiness.Create(AOwner: TComponent);
begin
  Registro := TInstitutionHasLineBusiness.create;
  createTable;
end;

procedure TCtrlMobInstitutionHasLineBusiness.createTable;
begin
  execcmd(concat(
          'CREATE TABLE if not exists tb_institution_has_linebusiness ( ',
          '  tb_institution_id int(11) NOT NULL, ',
          '  tb_linebusiness_id int(11) NOT NULL, ',
          '  active char(1) DEFAULT NULL, ',
          '  created_at datetime DEFAULT NULL, ',
          '  updated_at datetime DEFAULT NULL, ',
          '  PRIMARY KEY (tb_institution_id,tb_linebusiness_id)) '
    ));
end;

destructor TCtrlMobInstitutionHasLineBusiness.Destroy;
begin
  {$IFDEF WIN32}
	Registro.DisposeOf;
  {$ENDIF }

end;

end.
