unit ControllerIteration;

interface
 uses
  System.Classes, System.SysUtils, System.Variants, FireDAC.Comp.Client,
  FireDAC.Stan.Param,ControllerIterationAttachment, intInteration,TypesCollection,
  BaseController, tblIteration, ControllerOrder, controllerIterationHasIteration,
  ControllerTask, ControllerProposal, ControllerProgress, System.Generics.Collections;
 Type
  TListIntInterattion = TObjectList<TIntInteration>;

  TControllerIteration = Class(TBaseController)
  private

  protected
    function getNext:Integer;
  public
    Registro : TIteration;
    Order    : TControllerOrder;
    HasInteration : TControllerIterationHasIteration;
    Task : TControllerTask;
    Anexo : TControllerIterationAttachment;
    Proposal : TControllerProposal;
    Progress : TControllerProgress;
    ListaInterface : TListIntInterattion;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function update:boolean;
    function getByKey:Boolean;
    function delete: boolean;
    function deletebyIteration:Boolean;
    function insert:boolean;
    procedure clear;
    procedure IntgetList(par:TIntInteration);
  End;
implementation

{ TControllerIteration }

procedure TControllerIteration.clear;
begin
  clearObj(Registro);
end;

constructor TControllerIteration.Create(AOwner: TComponent);
begin
  inherited;
  Registro          := TIteration.Create;
  Order             := TControllerOrder.Create(self);
  HasInteration     := TControllerIterationHasIteration.Create(self);
  Task              := TControllerTask.Create(self);
  Proposal          := TControllerProposal.Create(self);
  Progress          := TControllerProgress.Create(self);
  Anexo             := TControllerIterationAttachment.Create(self);
  ListaInterface    := TListIntInterattion.Create;
end;

function TControllerIteration.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerIteration.deletebyIteration: Boolean;
var
  Lc_qry: TFDQuery;
begin
  Try
    Lc_qry := createQuery;
    with Lc_qry do
    Begin
      sql.Clear;
      sql.Add(concat(
                  'delete from tb_Iteration ' +
                  'where (tb_institution_id =:tb_institution_id) '+
                  'and (tb_order_id =:tb_order_id) '
                  ));
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('tb_order_id').AsInteger := Registro.Ordem;
      ExecSQL
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

destructor TControllerIteration.Destroy;
begin
  ListaInterface.DisposeOf;
  Registro.DisposeOf;
  Order.DisposeOf;
  HasInteration.DisposeOf;
  Task.DisposeOf;
  Proposal.DisposeOf;
  Progress.DisposeOf;
  Anexo.DisposeOf;
  inherited;
end;


function TControllerIteration.getByKey: Boolean;
begin
  _getByKey(Registro);
  Order.Registro.Codigo := Registro.Ordem;
  Order.Registro.Estabelecimento := Registro.Estabelecimento;
  Order.Registro.Terminal := 0;
  Order.getByKey;
end;

function TControllerIteration.getNext: Integer;
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
                  'FROM tb_Iteration ',
                  ' where ( tb_institution_id =:tb_institution_id ) ',
                  ' and (tb_order_id =:tb_order_id) '
                  ));
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('tb_order_id').AsInteger := Registro.Ordem;
      Active := True;
      First;
      result := StrToIntDef(FieldByName('id').AsString,0) + 1;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerIteration.insert: boolean;
begin
  try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNext;
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

procedure TControllerIteration.IntgetList(par:TIntInteration);
Var
  Lc_Qry : TFDQuery;
  item : TIntInteration;
begin
  try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Add(concat(
          'select i.tb_institution_id, i.id, i.tb_order_id, i.updated_at, i.description comentario,',
          ' s.description situacao ,i.kind, i.tb_customer_id ',
          'from tb_iteration i ',
          '  inner join tb_situation s ',
          '  on (i.tb_situation_id = s.id ) ',
          '    and (i.tb_institution_id = s.tb_institution_id ) ',
          '  inner join tb_order o ',
          '  on (o.id = i.tb_order_id) ',
          '    and (o.tb_institution_id = i.tb_institution_id ) ',
          'where (i.tb_institution_id=:tb_institution_id) ',
          'and i.tb_order_id =:tb_order_id '
       ));
       if  par.Tipo > 0 then
          sql.Add('and i.kind =:kind');

       sql.Add('order by i.updated_at desc ');

      ParamByName('tb_institution_id').AsInteger := par.Estabelecimento;
      ParamByName('tb_order_id').AsInteger := Par.Ordem;
      if  par.Tipo > 0 then
        ParamByName('kind').AsInteger := par.Tipo;   
      Active := True;
      First;
      ListaInterface.Clear;
      while not eof do
      Begin
        item := TIntInteration.create;
        item.Estabelecimento := FieldByName('tb_institution_id').AsInteger;
        item.id              := FieldByName('id').AsInteger;
        item.Ordem           := FieldByName('tb_order_id').AsInteger;
        item.Atualizacao     := FieldByName('updated_at').AsDateTime;
        item.commentatio     := FieldByName('comentario').AsString;
        item.situacao        := FieldByName('situacao').AsString;
        item.Tipo            := FieldByName('kind').asInteger;
        item.Cliente         := FieldByName('tb_customer_id').asInteger;
        ListaInterface.Add(item);
        Next;
      End;
    End;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;

function TControllerIteration.save: boolean;
begin
    if Registro.Codigo = 0 then
      Registro.Codigo := getNext;
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerIteration.update: boolean;
begin
   try
    updateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
