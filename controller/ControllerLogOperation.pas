unit ControllerLogOperation;

interface
uses System.Classes, System.SysUtils,BaseController,TypesCollection,
      tblLogOperation, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerLogOperation = Class(TBaseController)
  private
    function getnext:Integer;
  public
    Registro : TLogOperation;

    Lista : TListLogOperation;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure clear;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function getAllByKey:boolean;
    procedure getlist;

  End;
implementation

{ TControllerLogOperation }

procedure TControllerLogOperation.clear;
begin
  clearObj(Registro);
  Lista.Clear;
end;

constructor TControllerLogOperation.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TLogOperation.Create;
  Lista := TListLogOperation.Create;
end;

function TControllerLogOperation.delete: boolean;
begin
 try
    deleteObj(Registro);
    Result := True;
  except
    Result := FAlse;
  end;
end;

destructor TControllerLogOperation.Destroy;
begin
  Lista.DisposeOf;
  Registro.DisposeOf;
  inherited;
end;

function TControllerLogOperation.getAllByKey: boolean;
begin
  _getByKey(Registro);
end;

function TControllerLogOperation.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerLogOperation.getlist;
var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT * ',
                     'FROM tb_clin_questionnaire ',
                     'WHERE ( tb_institution_id =:institution_id ) '
      ));

      //Incrementa SQL

      //Passagem de parametros
      parambyname('institution_id').AsInteger := Registro.Estabelecimento;

      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        //LITem := TClinQuestionnaire.Create;
        //get(Lc_Qry,LITem);
        //Lista.add(LITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerLogOperation.getnext: Integer;
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
                  'FROM tb_log_operation ',
                  ' where ( tb_institution_id =:tb_institution_id ) ',
                  ' and (tb_user_id =:tb_user_id) '
                  ));
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('tb_user_id').AsInteger := Registro.Usuario;
      Active := True;
      First;
      result := StrToIntDef(FieldByName('id').AsString,0) + 1;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerLogOperation.insert: boolean;
begin
  try
    Registro.Codigo := getNext;
    insertObj(Registro);
    Result := True;
  except
    Result := FAlse;
  end;

end;

function TControllerLogOperation.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := True;
  except
    Result := FAlse;
  end;

end;

end.
