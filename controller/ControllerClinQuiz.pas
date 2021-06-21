unit ControllerClinQuiz;

interface
uses System.Classes, System.SysUtils,BaseController,TypesCollection,
      tblClinQuiz, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerClinAnwer, ControllerClinQuestion;

Type
  TControllerClinQuiz = Class(TBaseController)
  private

  public
    Registro : TClinQuiz;
    Lista : TListClinQuiz;
    Perguntas : TControllerClinQuestion;
    Respostas : TControllerClinAnwer;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure clear;
    function save:boolean;
    function updateReached:Boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function getAllByKey:boolean;
    procedure getlist;

  End;
implementation

{ TControllerClinQuiz }

procedure TControllerClinQuiz.clear;
begin
  clearObj(Registro);
  Lista.Clear;
end;

constructor TControllerClinQuiz.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TClinQuiz.Create;
  Lista := TListClinQuiz.Create;
  Perguntas := TControllerClinQuestion.Create(self);
  Respostas := TControllerClinAnwer.Create(self);
end;

function TControllerClinQuiz.delete: boolean;
begin
 try
    deleteObj(Registro);
    Result := True;
  except
    Result := FAlse;
  end;
end;

destructor TControllerClinQuiz.Destroy;
begin
  Perguntas.DisposeOf;
  Respostas.DisposeOf;
  Lista.DisposeOf;
  Registro.DisposeOf;
  inherited;
end;

function TControllerClinQuiz.getAllByKey: boolean;
begin
  _getByKey(Registro);
end;

function TControllerClinQuiz.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerClinQuiz.getlist;
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

function TControllerClinQuiz.insert: boolean;
begin
  try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
    insertObj(Registro);
    Result := True;
  except
    Result := FAlse;
  end;

end;

function TControllerClinQuiz.save: boolean;
begin
  try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
    SaveObj(Registro);
    Result := True;
  except
    Result := FAlse;
  end;

end;

function TControllerClinQuiz.updateReached: Boolean;
var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('UPDATE tb_clin_quiz SET ',
                      'reached_tx =:reached_tx ',
                     'WHERE ( tb_institution_id =:tb_institution_id ) ',
                     ' AND  ( id=:id) '
      ));

      //Incrementa SQL

      //Passagem de parametros
      parambyname('tb_institution_id').AsInteger := Registro.Estabelecimento;
      parambyname('id').AsInteger                 := Registro.Codigo;
      parambyname('reached_tx').Asfloat           := Registro.TaxaAlcance;
      ExecSQL;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

end.
