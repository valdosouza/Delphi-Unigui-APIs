unit ctrl_mob_order;

interface

uses System.Classes,tblOrder, ctrl_mob_base,FireDAC.Comp.Client, FireDAC.Stan.Param;

Type
  TCtrlMobOrder = class(TCtrlMobBase)
    private

    public
      Registro : TORder;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function save:Boolean;
      function update:Boolean;
      function getByKey : Boolean;
      function delete:Boolean;
      function clear:Boolean;
  end;

implementation

  { TCtrlMobOrder }

uses MainModule;


function TCtrlMobOrder.clear: Boolean;
begin
  clearObj(registro);
end;

constructor TCtrlMobOrder.Create(AOwner: TComponent);
begin
  Registro := TOrder.create;
  createTable;
end;

procedure TCtrlMobOrder.createTable;
begin
  execcmd(concat(
                'CREATE TABLE if not exists tb_order ( ',
                '  id int(11) , ',
                '  tb_institution_id int(11) , ',
                '  terminal int(11), ',
                '  tb_user_id int(11) , ',
                '  dt_record date , ',
                '  note blob, ',
                '  origin char(1) , ',
                '  status varchar(1) , ',
                '  being_used varchar(50) , ',
                '  created_at datetime , ',
                '  updated_at datetime ) ;'
      ));
end;

function TCtrlMobOrder.delete: Boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

destructor TCtrlMobOrder.Destroy;
begin
  {$IFDEF WIN32}
	Registro.DisposeOf;
  {$ENDIF }

end;

function TCtrlMobOrder.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TCtrlMobOrder.save: Boolean;
begin
  try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

function TCtrlMobOrder.update: Boolean;
begin
  try
    UpdateObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

end.
