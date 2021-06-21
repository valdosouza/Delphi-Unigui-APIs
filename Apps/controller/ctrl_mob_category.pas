unit ctrl_mob_category;


interface

uses System.Classes,ctrl_mob_base, FireDAC.Comp.Client,
  System.SysUtils,tblCategory;

Type
  TCtrlMobCategory = class(TCtrlMobBase)
    private

    public
      Registro : TCategory;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function save:boolean;
      procedure assign(ObjOri : TCategory);
  end;

implementation


uses MainModule;


procedure TCtrlMobCategory.assign(ObjOri: TCategory);
begin
  _assign(ObjOri,Registro);
end;

constructor TCtrlMobCategory.Create(AOwner: TComponent);
begin
  Registro := TCategory.create;
  createTable;
end;

procedure TCtrlMobCategory.createTable;
Begin
  execcmd(concat(
                'CREATE TABLE if not exists  tb_category (                 ',
                '  id int(11) ,                     ',
                '  tb_institution_id int(11) ,      ',
                '  description varchar(100) ,       ',
                '  posit_level varchar(40) ,    ',
                '  kind char(1) ,               ',
                '  active varchar(1)  DEFAULT ''S'',  ',
                '  created_at datetime ,        ',
                '  updated_at datetime ) ;       '
      ));
end;

destructor TCtrlMobCategory.Destroy;
begin
  {$IFDEF WIN32}
	Registro.DisposeOf;
  {$ENDIF }

end;

function TCtrlMobCategory.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
