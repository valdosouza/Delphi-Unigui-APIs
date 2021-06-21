unit ControllerOrder;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrder, FireDAC.Comp.Client,FireDAC.Stan.Param,
      ControllerInstitution,ControllerFinancialBills,
      ControllerOrderTotalizer;

Type
  TControllerOrder = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TOrder;
    Totalizador : TControllerOrderTotalizer;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function saveMobile:boolean;
    function insert:boolean;
    Function delete:boolean;
    function deletebyIteration:Boolean;
    function getByKey:Boolean;
    function setStatus:Boolean;
    function getStatus:String;
  End;

implementation


{ TControllerOrder }

procedure TControllerOrder.clear;
begin
  clearObj(Registro);
end;

constructor TControllerOrder.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TOrder.Create;
end;

function TControllerOrder.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerOrder.deletebyIteration: Boolean;
var
  Lc_qry: TFDQuery;
begin
  Try
    Lc_qry := createQuery;
    with Lc_qry do
    Begin
      sql.Clear;
      sql.Add(concat(
                  'delete from tb_order ' +
                  'where (tb_institution_id =:tb_institution_id) '+
                  'and (id =:id) '+
                  'and (terminal =:terminal) '
                  ));
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('id').AsInteger := Registro.Codigo;
      ParamByName('terminal').AsInteger := Registro.Terminal;
      ExecSQL
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

destructor TControllerOrder.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;

function TControllerOrder.getByKey: Boolean;
begin
  _getByKey(Registro);
end;


function TControllerOrder.getStatus: String;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Result := 'N';
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
              'select ord.status ',
              'from tb_order ord  ',
              'where ord.tb_institution_id =:institution_id ',
              ' and (ord.id =:id) '
      ));
      ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('id').AsInteger := Registro.Codigo;
      Active := True;
      Result := FieldByName('status').AsString;
    End;
  Finally
    Lc_Qry.Close;
    FreeAndNil(Lc_Qry);
  End;
end;

function TControllerOrder.insert: boolean;
begin
  try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerOrder.save: boolean;
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

function TControllerOrder.saveMobile: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerOrder.setStatus: Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    REsult := True;
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
              'update tb_order ord set ',
              'ord.status =:status ',
              'where ord.tb_institution_id =:institution_id ',
              ' and (ord.id =:id) '
      ));
      ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('id').AsInteger := Registro.Codigo;
      ParamByName('status').AsString := Registro.Status;
      ExecSQL;
    End;
  Finally
    Lc_Qry.Close;
    FreeAndNil(Lc_Qry);
  End;
end;

end.
