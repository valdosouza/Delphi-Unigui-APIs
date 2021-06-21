unit ControllerMeasure;

interface
uses System.Classes, System.SysUtils,BaseController,rest.json,prm_measure,
      tblMeasure, tblInstitutionHasPaymentTypes, FireDAC.Comp.Client,
      FireDAC.Stan.Param, tblInstitutionHasMeasure, TypesCollection,
      ObjMeasure;

Type
  TControllerMeasure = Class(TBaseController)

    procedure clear;
  private

  public
    Registro : TMeasure;
    Institution : TInstitutionHasMeasure;
    Lista : TListMeasure;
    Obj : TObjMeasure;
    Parametro : TprmMeasure;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure setParametro(par:String);
    function save:boolean;
    function saveByDescription:boolean;
    procedure getbyKey;
    function insert:boolean;
    Function delete:boolean;
    Function activeRegiter:Boolean;
    Function desactiveRegiter:Boolean;
    procedure SaveInstitution;
    procedure getList;
    procedure assign(ObjOri : TMeasure);
    function saveDataObjeto(DObj : TObjMeasure):Boolean;
  End;

implementation

{ TControllerMeasure }

function TControllerMeasure.activeRegiter: Boolean;
begin
  with Institution do
  Begin
    if (Registro.Codigo > 0) then
    Begin
      //Estabelecimento := Deve ser preenchido pelo interface
      CodigoMedida := Registro.Codigo;
      Ativo := 'S';
    End;
  End;
  SaveObj(Institution);
end;

procedure TControllerMeasure.assign(ObjOri: TMeasure);
begin
  _assign(ObjOri,Registro);
end;

procedure TControllerMeasure.clear;
begin
  clearObj(Registro);
end;

constructor TControllerMeasure.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TMeasure.Create;
  Institution := TInstitutionHasMeasure.Create;;
  Lista := TListMeasure.create;
  Parametro := TprmMeasure.create;
  Obj := TObjMeasure.create;
end;

function TControllerMeasure.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerMeasure.desactiveRegiter: Boolean;
begin
  with Institution do
  Begin
    if (Registro.Codigo > 0) then
    Begin
      //Estabelecimento := Deve ser preenchido pelo interface
      CodigoMedida := Registro.Codigo;
      Ativo := 'N';
    End;
  End;
  SaveObj(Institution);
end;

destructor TControllerMeasure.Destroy;
begin
  Obj.Destroy;
  Parametro.Destroy;
  Institution.DisposeOf;
  Registro.DisposeOf;
  Lista.DisposeOf;
  inherited;
end;


function TControllerMeasure.insert: boolean;
begin
  try
    Registro.Codigo := getNextByField(Registro,'id',0);
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerMeasure.saveByDescription:boolean;
Var
  Lc_Qry : TFDQuery;
begin
  try
    TRy
      Lc_Qry := createQuery;
      with Lc_Qry do
      Begin
        sql.Clear;
        sql.Add('SELECT id from tb_Measure where description =:description');
        ParamByName('description').AsString := Registro.Descricao;
        Active := True;
        FetchAll;
        if RecordCount > 0 then
        Begin
          Registro.Codigo := FieldByName('id').AsInteger;
          updateObj(Registro);
        End
        else
        Begin
          Self.insert;
        End;
      End;
    Finally
      Lc_Qry.Close;
      FreeAndNil(Lc_Qry);
    End;
    //Vincula a forma de pagamento ao Estabelecimento
    SaveInstitution;
    Result := true;
  except
    Result := False;
  end;

End;

function TControllerMeasure.saveDataObjeto(DObj: TObjMeasure): Boolean;
begin
  Try
    ClonarObj(DObj.Medida, Registro);
    //Colocar zero para que a gravação aconteça pela descrição
    Registro.Codigo := 0;
    Institution.Estabelecimento := DObj.Estabelecimento;
    Institution.Ativo := 'S';
    save;
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerMeasure.save: boolean;
begin
  try
    if Registro.Codigo > 0 then
     SaveObj(Registro)
    else
      saveByDescription;
    Result := true;
  except
    Result := False;
  end;
end;

procedure TControllerMeasure.getbyKey;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      sql.Add('SELECT m.*, i.tb_institution_id,  i.active '+
              'from tb_measure m ' +
              '  inner join tb_institution_has_Measure i '+
              '   on (i.tb_Measure_id = m.id ) '+
              'where (i.tb_institution_id =:tb_institution_id) '+
              ' and  (m.id =:id) ' );

      ParamByName('tb_institution_id').AsInteger := Institution.Estabelecimento;
      ParamByName('id').AsInteger := Registro.Codigo;
      Active := true;
      FetchAll;
      exist := ( RecordCount > 0 );
      if (exist) then get(Lc_Qry,Registro);
    End;
  Finally
    Lc_Qry.Close;
    FreeAndNil(Lc_Qry);
  End;

end;



procedure TControllerMeasure.getList;
var
  Qry : TFDQuery;
  LITem : TMeasure;
begin
  Try
    Qry := createQuery;
    with Qry do
    Begin
      sql.add(concat('SELECT *                                         ',
                     'FROM tb_measure m                                ',
                     '  inner join tb_institution_has_measure ihm      ',
                     '  on (ihm.tb_measure_id = m.id )                 ',
                     'where ( ihm.tb_institution_id =:institution_id ) '
      ));
      //Incrementa SQL
      if Trim(Parametro.UltimaAtualizacao) <> '' then
      Begin
        sql.add(' AND ( ihm.updated_at >:updated_at ) ');
        sql.add(' order by ihm.updated_at');
      End
      else
      Begin
        sql.add(' ORDER BY m.id ');
      End;


      //Passagem de parametros
      parambyname('institution_id').AsInteger := parametro.Estabelecimento;

      if Trim(Parametro.UltimaAtualizacao) <> '' then
        parambyname('updated_at').AsString := Parametro.UltimaAtualizacao;
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TMeasure.Create;
        get(Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    Qry.Close;
    FreeAndNil(Qry);
  End;


end;

procedure TControllerMeasure.SaveInstitution;
begin
  Institution.CodigoMedida := registro.Codigo;
  SaveObj(Institution);
end;

procedure TControllerMeasure.setParametro(par: String);
begin
  try
    Parametro := TPrmMeasure.Create;
    Parametro:= TJson.JsonToObject<TPrmMeasure>(par);
  //Tratar Data
    Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);
  Except
    Parametro.UltimaAtualizacao := '1900-01-01 01:00:00'
  end;

end;

end.

