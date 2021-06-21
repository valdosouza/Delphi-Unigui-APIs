unit ctrl_mob_measure;


interface

uses System.Classes, FireDAC.Comp.Client, System.SysUtils,
      tblMeasure, ctrl_mob_base;

Type
  TCtrlMobMeasure = class(TCtrlMobBase)
    private

    public
      Registro : TMeasure;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function save:boolean;
      procedure assign(ObjOri : TMeasure);
  end;

implementation


uses MainModule;


procedure TCtrlMobMeasure.assign(ObjOri: TMeasure);
begin
  _assign(ObjOri,Registro);
end;

constructor TCtrlMobMeasure.Create(AOwner: TComponent);
begin
  Registro := TMeasure.create;
  createTable;
end;

procedure TCtrlMobMeasure.createTable;
begin
  execcmd(concat(
                'CREATE TABLE if not exists tb_measure (                ',
                '  id int(11) ,                   ',
                '  description varchar(100) ,     ',
                '  abbreviation varchar(3) ,  ',
                '  escale decimal(10,2) ,     ',
                '  created_at datetime ,      ',
                '  updated_at datetime )      '
      ));
end;

destructor TCtrlMobMeasure.Destroy;
begin
  {$IFDEF WIN32}
	Registro.DisposeOf;
  {$ENDIF }

end;

function TCtrlMobMeasure.save: boolean;
begin
  SaveObj(Registro);
end;

end.
