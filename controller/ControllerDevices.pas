unit ControllerDevices;

interface

uses System.Classes, System.SysUtils,BaseController,
      tblUser, ControllerMailing,ControllerEntity ,FireDAC.Comp.Client,
      Md5, FireDAC.Stan.Param,tblDevices;

Type
  TControllerDevices = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TDevices;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function save:boolean;
    function update:boolean;
    function getByKey:Boolean;
    function getByIdentificacao:Boolean;
    function getauthorization:boolean;
  End;


implementation

{ TControllerDevices }

procedure TControllerDevices.clear;
begin
  clear
end;

constructor TControllerDevices.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TDevices.create;
end;

destructor TControllerDevices.Destroy;
begin
  Registro.disposeOf;
  inherited;
end;

function TControllerDevices.getauthorization: boolean;
begin

end;

function TControllerDevices.getByIdentificacao: Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add(concat(
                  'SELECT * ',
                  'from tb_devices ',
                  ' where ( identification =:identification ) '
              ));
      if Registro.Identificacao ='' then
        Registro.Identificacao := 'H7AZB1011419LJK';
      ParamByName('identification').AsString := Registro.Identificacao;
      active := True;
      exist := ( recordcount >  0);
      if exist then
        get(Lc_Qry,Registro);
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerDevices.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerDevices.save: boolean;
begin
  if Registro.Codigo = 0  then
    Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
  SaveObj(Registro);
end;

function TControllerDevices.update: boolean;
begin
  try
    updateObj(Registro);
    result := True;
  except
    result := False;
  end;
end;

end.
