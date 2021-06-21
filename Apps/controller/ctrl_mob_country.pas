unit ctrl_mob_country;

interface

uses System.Classes, ctrl_mob_base, FireDAC.Comp.Client,
  System.SysUtils, tblCountry;

Type
  TCtrlMobCountry = class(TCtrlMobBase)
    private

    public
      Registro : TCountry;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function getByKey:boolean;
      function save:Boolean;
      procedure assign(ObjOri : TCountry);
  end;

implementation

Uses MainModule;


procedure TCtrlMobCountry.assign(ObjOri: TCountry);
begin
  _assign(ObjOri,Registro);
end;

constructor TCtrlMobCountry.Create(AOwner: TComponent);
begin
  Registro := TCountry.create;
  createTable;
end;

procedure TCtrlMobCountry.createTable;
begin
  execcmd(concat(
              ' CREATE TABLE if not exists  tb_country (  ',
              '  id int(11),                              ',
              '  name varchar(100),                       ',
              '  created_at datetime,                     ',
              '  updated_at datetime );                   '
        ));
end;


destructor TCtrlMobCountry.Destroy;
begin
  {$IFDEF WIN32}
	Registro.DisposeOf;
  {$ENDIF }

end;

function TCtrlMobCountry.getByKey: boolean;
begin
  _getByKey(Registro);
end;

function TCtrlMobCountry.save: Boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
