unit ctrl_mob_package;


interface

uses System.Classes, FireDAC.Comp.Client, System.SysUtils,
      tblPackage, ctrl_mob_base;

Type
  TCtrlMobPackage = class(TCtrlMobBase)
    private

    public
      Registro : TPAckage;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function save:boolean;
      procedure assign(ObjOri : TPackage);
  end;

implementation


uses MainModule;


procedure TCtrlMobPackage.assign(ObjOri: TPackage);
begin
  _assign(ObjOri,Registro);
end;

constructor TCtrlMobPackage.Create(AOwner: TComponent);
begin
  Registro := TPackage.create;
  createTable;
end;

procedure TCtrlMobPackage.createTable;
begin
  execcmd(concat(
               ' CREATE TABLE if not exists  tb_package (                ',
               '   id int(11) ,                   ',
               '   description varchar(100) ,     ',
               '   abbreviation varchar(3) ,  ',
               '   created_at datetime ,      ',
               '   updated_at datetime );     '
      ));
end;

destructor TCtrlMobPackage.Destroy;
begin
  {$IFDEF WIN32}
	Registro.DisposeOf;
  {$ENDIF }
end;

function TCtrlMobPackage.save: boolean;
begin
  SaveObj(Registro);
end;

end.

