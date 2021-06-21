unit ControllerClinAnwer;

interface
uses System.Classes, System.SysUtils,BaseController,TypesCollection,
      tblClinAnwer, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerClinAnwer = Class(TBaseController)
  private

  public
    Registro : TClinAnwer;

    Lista : TListClinAnwer;
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

{ TControllerClinAnwer }

procedure TControllerClinAnwer.clear;
begin
  clearObj(Registro);
  Lista.Clear;
end;

constructor TControllerClinAnwer.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TClinAnwer.Create;
  Lista := TListClinAnwer.Create;
end;

function TControllerClinAnwer.delete: boolean;
begin
 try
    deleteObj(Registro);
    Result := True;
  except
    Result := FAlse;
  end;
end;

destructor TControllerClinAnwer.Destroy;
begin
  Lista.DisposeOf;
  Registro.DisposeOf;
  inherited;
end;

function TControllerClinAnwer.getAllByKey: boolean;
begin
  _getByKey(Registro);
end;

function TControllerClinAnwer.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerClinAnwer.getlist;
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

function TControllerClinAnwer.insert: boolean;
begin
  try
    insertObj(Registro);
    Result := True;
  except
    Result := FAlse;
  end;

end;

function TControllerClinAnwer.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := True;
  except
    Result := FAlse;
  end;

end;

end.
