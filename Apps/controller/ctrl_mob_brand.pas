unit ctrl_mob_brand;


interface

uses System.Classes, System.SysUtils, FireDAC.Comp.Client,
    tblBrand,ctrl_mob_base;

Type
  TCtrlMobBrand = class(TCtrlMobBase)
    private

    public
      Registro : TBrand;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function save:boolean;
      procedure assign(ObjOri : TBrand);
  end;

implementation


uses MainModule;


procedure TCtrlMobBrand.assign(ObjOri: TBrand);
begin
  _assign(ObjOri,Registro);
end;

constructor TCtrlMobBrand.Create(AOwner: TComponent);
begin
  Registro := TBrand.create;
  createTable;
end;

procedure TCtrlMobBrand.createTable;
Begin
  execcmd(concat(
               ' CREATE TABLE if not exists  tb_brand (                 ',
               '   id int(11) ,                  ',
               '   description varchar(100) ,    ',
               '   tb_provider_id int(11) ,  ',
               '   created_at datetime ,     ',
               '   updated_at datetime );    '
      ));
end;

destructor TCtrlMobBrand.Destroy;
begin
  {$IFDEF WIN32}
	Registro.DisposeOf;
  {$ENDIF }

end;

function TCtrlMobBrand.save: boolean;
begin
  SaveObj(Registro);
end;

end.

