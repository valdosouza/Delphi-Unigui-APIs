unit ctrl_mob_price_list;

interface

uses System.Classes,ctrl_mob_base, FireDAC.Comp.Client,
  System.SysUtils,tblPriceList;

Type
  TCtrlMobPriceList = class(TCtrlMobBase)
    private

    public
      Registro : TPriceList;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function save:Boolean;
      procedure assign(ObjOri : TPriceList);
  end;

implementation

uses MainModule;


procedure TCtrlMobPriceList.assign(ObjOri: TPriceList);
begin
  _assign(ObjOri,Registro);
end;

constructor TCtrlMobPriceList.Create(AOwner: TComponent);
begin
  Registro := TPriceList.Create;
  createTable;
end;

procedure TCtrlMobPriceList.createTable;
begin
  execcmd(concat(
                'CREATE TABLE if not exists tb_price_list ( ',
                '  id int(11) , ',
                '  tb_institution_id int(11) , ',
                '  description varchar(45) , ',
                '  validity date , ',
                '  modality varchar(1) , ',
                '  aliq_profit decimal(10,0) , ',
                '  created_at datetime , ',
                '  updated_at datetime ) ;'
      ));
end;

destructor TCtrlMobPriceList.Destroy;
begin
  {$IFDEF WIN32}
  Registro.DisposeOf;
  {$ENDIF }
end;

function TCtrlMobPriceList.save: Boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

end.
