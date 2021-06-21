unit controllerIterationHasIteration;

interface
 uses
  System.Classes, System.SysUtils, System.Variants, FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  BaseController, tblIterationHasIteration, ControllerOrder;
 Type
  TcontrollerIterationHasIteration = Class(TBaseController)
  private

  public
    Registro : TIterationHasIteration;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function update:boolean;
    function getByKey:Boolean;
    function getByMaster:Boolean;
    function delete: boolean;
    function deletebyIteration:Boolean;
    function insert:boolean;
    procedure clear;
  End;
implementation

{ TControllerIterationHasIteration }

procedure TControllerIterationHasIteration.clear;
begin
  clearObj(Registro);
end;

constructor TControllerIterationHasIteration.Create(AOwner: TComponent);
begin
  inherited;
  Registro                    := TIterationHasIteration.Create;
end;

function TControllerIterationHasIteration.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TcontrollerIterationHasIteration.deletebyIteration: Boolean;
var
  Lc_qry: TFDQuery;
begin
  Try
    Lc_qry := createQuery;
    with Lc_qry do
    Begin
      sql.Clear;
      sql.Add(concat(
                  'delete from tb_iteration_has_iteration ' ,
                  'where (tb_institution_id =:tb_institution_id) ',
                  'and ( tb_order_id =:tb_order_id ) ',
                  ' and ( tb_iteration_id_master=:tb_iteration_id_master ) '
                  ));
      ParamByName('tb_institution_id').AsInteger      := Registro.Estabelecimento;
      ParamByName('tb_order_id').AsInteger            := Registro.Ordem;
      ParamByName('tb_iteration_id_master').AsInteger := Registro.MasterId;
      ExecSQL;
      //lembrando que o tb_order_id é a iteração, e cada master_id e detail sera a resposta
      //da iteração selecionada na tela
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;


end;

destructor TControllerIterationHasIteration.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;


function TControllerIterationHasIteration.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TcontrollerIterationHasIteration.getByMaster: Boolean;
begin

end;

function TControllerIterationHasIteration.insert: boolean;
begin
  try
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerIterationHasIteration.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerIterationHasIteration.update: boolean;
begin
    try
    updateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
