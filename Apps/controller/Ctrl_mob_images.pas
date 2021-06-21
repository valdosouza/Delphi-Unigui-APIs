unit Ctrl_mob_images;

interface
uses System.Classes, System.SysUtils,ctrl_mob_base,
      tblOrder, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,tblimages;

Type
  TCtrlMobImages = Class(TCtrlMobBase)

  private

  public
    Registro : TImages;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function insert:Boolean;
    function delete:Boolean;
    procedure createTable;
  End;
implementation

{ TCtrlMobImages }

constructor TCtrlMobImages.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TImages.Create;
  createTable;
end;

procedure TCtrlMobImages.createTable;
begin
  execcmd(concat(
                'CREATE TABLE if not exists tb_images ( ',
                '  tb_institution_id int(11) NOT NULL, ',
                '  album varchar(50) NOT NULL, ',
                '  file_name varchar(100) NOT NULL, ',
                '  sequence int(11) NOT NULL, ',
                '  tb_entity_id int(11) NOT NULL, ',
                '  created_at datetime NOT NULL, ',
                '  updated_at datetime NOT NULL)'
      ));
end;

function TCtrlMobImages.delete: Boolean;
begin
  try
    insertObj(Registro);
    result := True;
  except
    result := False;
  end;
end;

destructor TCtrlMobImages.Destroy;
begin
  {$IFDEF WIN32}
  Registro.DisposeOf;
  inherited;
  {$ENDIF }
end;

function TCtrlMobImages.insert: Boolean;
begin
  try
    insertObj(Registro);
    result := True;
  except
    result := False;
  end;
end;

end.

