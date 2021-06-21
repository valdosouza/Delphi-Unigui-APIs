unit ControllerIterationAttachment;

interface
 uses
  System.Classes, System.SysUtils, System.Variants, FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  BaseController, tblIterationAttachment;
  Type
  TControllerIterationAttachment = Class(TBaseController)
  private

  public
    Registro  : TIterationAttachment;
    function getnext:Integer;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function update:boolean;
    function getByKey:Boolean;Virtual;
    function delete: boolean;
    function deletebyIteration:Boolean;
    function insert:boolean;
    procedure clear;
  End;

implementation


{ TControllerIterationAttachment }

procedure TControllerIterationAttachment.clear;
begin
  clearObj(Registro);
end;

constructor TControllerIterationAttachment.Create(AOwner: TComponent);
begin
  inherited;
  Registro          := TIterationAttachment.Create;
end;

function TControllerIterationAttachment.delete: boolean;
begin
   Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerIterationAttachment.deletebyIteration: Boolean;
var
  Lc_qry: TFDQuery;
begin
  Try
    Lc_qry := createQuery;
    with Lc_qry do
    Begin
      sql.Clear;
      sql.Add(concat(
                  'delete from tb_iteration_attachment ' +
                  'where (tb_institution_id =:tb_institution_id) '+
                  ' and ( tb_order_id =:tb_order_id ) ',
                  ' and ( tb_iteration_id=:tb_iteration_id ) '
                  ));
      ParamByName('tb_institution_id').AsInteger  := Registro.Estabelecimento;
      ParamByName('tb_order_id').AsInteger        := Registro.Ordem;
      ParamByName('tb_iteration_id').AsInteger    := Registro.Codigo;
      ExecSQL;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

destructor TControllerIterationAttachment.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;

function TControllerIterationAttachment.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerIterationAttachment.getnext: Integer;
var
  Lc_qry: TFDQuery;
begin
  Try
    Lc_qry := createQuery;
    with Lc_qry do
    Begin
      sql.Clear;
      sql.Add(concat(
                  'SELECT MAX(id) id ',
                  'FROM tb_iteration_attachment ',
                  ' where ( tb_institution_id =:tb_institution_id ) ',
                  ' and (tb_order_id =:tb_order_id) ',
                  ' and (tb_iteration_id =:tb_iteration_id) '
                  ));
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('tb_order_id').AsInteger := Registro.Ordem;
      ParamByName('tb_iteration_id').AsInteger := Registro.Iteracao;
      Active := True;
      First;
      result := StrToIntDef(FieldByName('id').AsString,0) + 1;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

function TControllerIterationAttachment.insert: boolean;
begin
  try
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerIterationAttachment.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerIterationAttachment.update: boolean;
begin
   try
    updateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
