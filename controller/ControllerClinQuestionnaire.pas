unit ControllerClinQuestionnaire;

interface
uses System.Classes, System.SysUtils,BaseController,TypesCollection,
      tblClinQuestionnaire, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
  ControllerClinQuestion;

Type
  TControllerClinQuestionnaire = Class(TBaseController)

  private

  public
    Registro : TClinQuestionnaire;
    Pergunta : TControllerClinQuestion;
    Lista : TListClinQuestionnaire;
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

{ TControllerClinQuestionnaire }

procedure TControllerClinQuestionnaire.clear;
begin
  clearObj(Registro);
  Pergunta.clear;
  Lista.Clear;
end;

constructor TControllerClinQuestionnaire.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TClinQuestionnaire.Create;
  Pergunta := TControllerClinQuestion.Create(Self);
  Lista := TListClinQuestionnaire.Create;
end;

function TControllerClinQuestionnaire.delete: boolean;
begin
 try
    deleteObj(Registro);
    Result := True;
  except
    Result := FAlse;
  end;
end;

destructor TControllerClinQuestionnaire.Destroy;
begin
  Lista.DisposeOf;
  Pergunta.DisposeOf;
  Registro.DisposeOf;
  inherited;
end;

function TControllerClinQuestionnaire.getAllByKey: boolean;
begin
  _getByKey(Registro);
  if exist then
  begin
    Pergunta.Registro.Estabelecimento := Registro.Estabelecimento;
    Pergunta.Registro.Questionario    := Registro.Codigo;
    Pergunta.getlist;
  end;
end;

function TControllerClinQuestionnaire.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerClinQuestionnaire.getlist;
var
  Lc_Qry : TFDQuery;
  LITem : TClinQuestionnaire;
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
        LITem := TClinQuestionnaire.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerClinQuestionnaire.insert: boolean;
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

function TControllerClinQuestionnaire.save: boolean;
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

end.
