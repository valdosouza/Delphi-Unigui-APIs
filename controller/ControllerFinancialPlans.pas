unit ControllerFinancialPlans;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblFinancialPlans,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param, System.Contnrs,
       System.Generics.Defaults, System.Generics.Collections, objFinancialPlans;

Type

  TListaFinancialPlans = TObjectList<TFinancialPlans>;

  TControllerFinancialPlans = Class(TBaseController)


  private

  public
    Registro : TFinancialPlans;
    Lista: TListaFinancialPlans;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure clear;
    function save:boolean;
    procedure getAll;
    procedure OrderLista;
    procedure updateLista;
    function insert:boolean;
    procedure setLevelPosit;
    function deleteByLevel:Boolean;
    function getByKey:Boolean;
    function saveDataObjeto(DObj : TObjFinancialPlans):Boolean;
  End;

implementation

{ ControllerFinancialPlans }

uses UnFunctions;


procedure TControllerFinancialPlans.clear;
begin
  clearObj(Registro);
end;

constructor TControllerFinancialPlans.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TFinancialPlans.Create;
  Lista := TListaFinancialPlans.Create;
end;

function TControllerFinancialPlans.deleteByLevel: Boolean;
Var
  Qry : TFDQuery;
Begin
  Qry := createQuery;
  with Qry do
  Begin
    sql.add('DELETE  '+
            'FROM tb_financial_plans '+
            'WHERE ( tb_institution_id =:tb_institution_id ) '+
            ' and (posit_level like :posit_level) ');

    ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
    ParamByName('posit_level').AsString := Registro.NivelPosicao + '%';
    ExecSQL;
  End;
  Qry.Close;
  FreeAndNil(Qry);
end;

destructor TControllerFinancialPlans.Destroy;
begin
  Registro.disposeOf;
  Lista.disposeOf;
  inherited;
end;


function TControllerFinancialPlans.insert: boolean;
begin
  Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerFinancialPlans.save: boolean;
begin
  if Registro.Codigo = 0 then
  Begin
    Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
    setLevelPosit;
  End;
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerFinancialPlans.saveDataObjeto(
  DObj: TObjFinancialPlans): Boolean;
begin
  try
    Registro := DObj.PlanoContas;
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

procedure TControllerFinancialPlans.setLevelPosit;
Var
  Lc_Nivel : String;
Begin
  Lc_Nivel := StrZero( Registro.Codigo,3,0);
  if  Trim( Registro.NivelPosicao) ='' then
    Registro.NivelPosicao := Lc_Nivel
  else
    Registro.NivelPosicao := Registro.NivelPosicao  + '.' + Lc_Nivel;
end;

procedure TControllerFinancialPlans.updateLista;
Var
  I : Integer;
  lFinancialPlans: TFinancialPlans;

Begin
  for I := 0 to Self.Lista.Count - 1  do
  Begin
    if ( registro.Codigo = TFinancialPlans( Self.Lista.Items[I]).Codigo ) then
    Begin
      lFinancialPlans  := TFinancialPlans.Create;
      lFinancialPlans := TFinancialPlans( Self.Lista[I] );
      break;
    End;
  End;
  if ( lFinancialPlans.Codigo = 0 ) then
    lista.Add(lFinancialPlans);
end;

procedure TControllerFinancialPlans.OrderLista;
var
  comparison: TComparison<TFinancialPlans>;
  delegateComparer: TDelegatedComparer<TFinancialPlans>;
begin
  // método anonimo para ordenação crescente por ID
  comparison := function (const P1, P2: TFinancialPlans): Integer
    begin
      Result := CompareText(P1.NivelPosicao, P2.NivelPosicao);
    end;

  // método anonimo para ordenação decrescente por ID
  { comparison := function (const P1, P2: TPessoa): Integer
    begin
      Result := - CompareText(P1.Id, P2.Id);
    end; }

  // classe que implementa TComparer<T> e facilita o uso.
  // passe o método de comparação para o delegate!
  delegateComparer := TDelegatedComparer<TFinancialPlans>.Create(comparison);
  try
    // Usando método Sort da nossa lista passando nosso "ordenador"
    Lista.Sort(delegateComparer);
  finally
    delegateComparer.Free;
  end;
end;

procedure TControllerFinancialPlans.getAll;
var
  Qry : TFDQuery;
  lFinancialPlans : TFinancialPlans;
begin
  Qry := createQuery;
  with Qry do
  Begin
    sql.add('SELECT * '+
            'FROM tb_financial_plans '+
            'WHERE tb_institution_id =:tb_institution_id '+
            ' ORDER BY posit_level ');

    ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
    Active := True;
    FetchAll;
    First;
    Lista.Clear;
    while not eof do
    Begin
      lFinancialPlans := TFinancialPlans.Create;
      with lFinancialPlans do
      Begin
        Codigo            := FieldByName('id').AsInteger;
        Estabelecimento   := FieldByName('tb_institution_id').asInteger;
        Agrupador         := FieldByName('cluster').asString;
        Descricao         := FieldByName('description').asString;
        Fonte             := FieldByName('source_').asString;
        NivelPosicao      := FieldByName('posit_level').asString;
        Tipo              := FieldByName('kind').asString;
        Ativo             := FieldByName('active').AsString;
        RegistroCriado    := FieldByName('created_at').AsDateTime;
        RegistroAlterado  := FieldByName('updated_at').AsDateTime;
      end;
      Lista.add(lFinancialPlans);
      next;
    end;
    Close;
  end;
  FreeAndNil(Qry);
end;

function TControllerFinancialPlans.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.

