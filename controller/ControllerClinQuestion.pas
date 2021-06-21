unit ControllerClinQuestion;

interface
uses System.Classes, System.SysUtils,BaseController,TypesCollection,
      tblClinQuestion, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerClinQuestion = Class(TBaseController)

  private
   function getNext:Integer;
  public
    Registro : TClinQuestion;
    Lista : TListClinQuestion;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure clear;
    function save:boolean;
    function update:boolean;
    function insert:boolean;
    Function delete:boolean;
    function deleteByQuestionnaire:Boolean;
    function getByKey:Boolean;
    procedure getlist;


  End;
implementation

{ TControllerClinQuestion }

procedure TControllerClinQuestion.clear;
begin
  clearObj(Registro);
  Lista.Clear;
end;

constructor TControllerClinQuestion.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TClinQuestion.Create;
  Lista := TListClinQuestion.Create;
end;

function TControllerClinQuestion.delete: boolean;
begin
 try
    deleteObj(Registro);
    Result := True;
  except
    Result := FAlse;
  end;
end;

function TControllerClinQuestion.deleteByQuestionnaire: Boolean;
var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('DELETE ',
                     'FROM tb_clin_question ',
                     'WHERE ( tb_institution_id =:tb_institution_id ) ',
                     ' and (tb_clin_questionnaire_id =:tb_clin_questionnaire_id) '
      ));
      //Passagem de parametros
      parambyname('tb_institution_id').AsInteger := Registro.Estabelecimento;
      parambyname('tb_clin_questionnaire_id').AsInteger := Registro.Questionario;
      ExecSQL;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

destructor TControllerClinQuestion.Destroy;
begin
  Lista.DisposeOf;
  Registro.DisposeOf;
  inherited;
end;

function TControllerClinQuestion.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerClinQuestion.getlist;
var
  Lc_Qry : TFDQuery;
  LITem : TClinQuestion;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT * ',
                     'FROM tb_clin_question ',
                     'WHERE ( tb_institution_id =:tb_institution_id ) ',
                     ' and (tb_clin_questionnaire_id =:tb_clin_questionnaire_id) '
      ));
      //Incrementa SQL
      sql.Add(orderby);//external set
      //Passagem de parametros
      parambyname('tb_institution_id').AsInteger := Registro.Estabelecimento;
      parambyname('tb_clin_questionnaire_id').AsInteger := Registro.Questionario;

      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TClinQuestion.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerClinQuestion.getNext: Integer;
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
                'FROM tb_clin_question ',
                'where ( tb_institution_id =:tb_institution_id ) ',
                'and (tb_clin_questionnaire_id=:tb_clin_questionnaire_id '
      ));
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('tb_clin_questionnaire_id').AsInteger := Registro.Questionario;
      Active := True;
      First;
      result := StrToIntDef(FieldByName('id').AsString,0) + 1;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerClinQuestion.insert: boolean;
begin
  try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNext;
    insertObj(Registro);
    Result := True;
  except
    Result := FAlse;
  end;
end;

function TControllerClinQuestion.save: boolean;
begin
  try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNext;
    SaveObj(Registro);
    Result := True;
  except
    Result := FAlse;
  end;
end;

function TControllerClinQuestion.update: boolean;
begin
  try
    updateObj(Registro);
    Result := True;
  except
    Result := FAlse;
  end;
end;

end.

