unit ControllerCommand;

interface
uses System.Classes, System.SysUtils,BaseController,
      GenericDao, tblCommand,System.Generics.Collections,
  FireDAC.Comp.Client, ControllerCheckOutItems;


Type
  TListaCommand = TObjectList<TCommand>;

  TControllerCommand = Class(TBaseController)
  private

  public
    Registro : TCommand;
    Lista : TListaCommand;
    Items : TControllerCheckOutItems;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    procedure getByComanda;
    function veriryDuplicity:Boolean;
    procedure getbyKey;
    procedure clear;
    procedure getList;
  End;

implementation

{ TControllerCommand }

procedure TControllerCommand.clear;
begin
  clearObj(Registro);
end;

constructor TControllerCommand.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TCommand.Create;
  Lista := TListaCommand.create;
  Items := TControllerCheckOutItems.create(Self);
end;

destructor TControllerCommand.Destroy;
begin
  Registro.disposeOf;
  Lista.disposeOf;
  Items.disposeOf;
  inherited;
end;

procedure TControllerCommand.getByComanda;
Var
  Lc_Qry : TFdQuery;
begin
  Try
    Lc_Qry := geraQuery;
    with Lc_Qry do
    Begin
      active := False;
      sql.Clear;
      sql.add(concat(
                  'SELECT c.* ',
                  'FROM tb_command c ',
                  ' inner join tb_pedido p ',
                  ' on (p.ped_codigo = c.tb_order_id) ',
                  'where c.control_id =:control_id ',
                  ' and tb_institution_id =:institution_id '
              ));
      parambyname('control_id').asString := Registro.Numero;
      parambyname('institution_id').AsInteger := Registro.Estabelecimento;
      active := True;
      fetchall;
      exist := (RecordCount > 0);
      if exist then
        get(Lc_Qry,Registro);
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

procedure TControllerCommand.getbyKey;
begin
  _getByKey(Registro);
end;

procedure TControllerCommand.getList;
begin

end;

function TControllerCommand.insert: boolean;
begin
  SaveObj(Registro);
end;

function TControllerCommand.save: boolean;
begin
  SaveObj(Registro);
end;

function TControllerCommand.veriryDuplicity: Boolean;
Var
  Lc_Qry : TFdQuery;
begin
  Try
    Lc_Qry := geraQuery;
    with Lc_Qry do
    Begin
      active := False;
      sql.Clear;
      sql.add(concat(
                'SELECT c.control_id ',
                'FROM tb_command c ',
                ' inner join tb_pedido p ',
                ' on (p.ped_codigo = c.tb_order_id) ',
                'where c.control_id =:control_id ',
                ' and tb_institution_id =:institution_id ',
                ' AND (PED_FATURADO = ''N'' )'
            ));
      parambyname('control_id').asString := Registro.Numero;
      parambyname('institution_id').AsInteger := Registro.Estabelecimento;
      active := True;
      fetchall;
      Result := (RecordCount > 0);
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

end.
