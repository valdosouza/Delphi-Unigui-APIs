unit ControllerPaymentTypes;

interface
uses System.Classes, System.SysUtils,BaseController, Rest.json, prm_payment_types,
      tblPaymentTypes, tblInstitutionHasPaymentTypes, FireDAC.Comp.Client,Md5,
      FireDAC.Stan.Param,  System.Generics.Collections, TypesCollection,
      ObjPaymentTypes;

Type

  TControllerPaymentTypes = Class(TBaseController)

    procedure clear;
  private
    procedure InnerInstitution;

    procedure getHas;
  protected

  public
    Registro : TPaymentTypes;
    Institution : TInstitutionHasPaymentTypes;
    Lista : TListPaymentTypes;
    Parametro :TPrmPaymentTypes;
    Obj : TObjPaymentTypes;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure setParametro(par:String);
    function save:boolean;
    procedure SaveInstitution;
    function saveByDescription:boolean;
    procedure getbyKey;
    function getByDescripton:Boolean;
    function insert:boolean;
    Function delete:boolean;
    Function activeRegiter:Boolean;
    Function desactiveRegiter:Boolean;
    procedure getList;
    procedure assign(ObjOri : TPaymentTypes);
    function saveDataObjeto(DObj : TObjPaymentTypes):Boolean;
  End;

implementation

{ ControllerPaymentTypes }

function TControllerPaymentTypes.activeRegiter: Boolean;
begin
  with Institution do
  Begin
    if (Registro.Codigo > 0) then
    Begin
      //Estabelecimento := Deve ser preenchido pelo interface
      TipoPagamento := Registro.Codigo;
      Ativo := 'S';
    End;
  End;
  updateObj(Institution);
end;

procedure TControllerPaymentTypes.assign(ObjOri: TPaymentTypes);
begin
  _assign(ObjOri,Registro);
end;

procedure TControllerPaymentTypes.clear;
begin
  clearObj(Registro);
end;

constructor TControllerPaymentTypes.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TPaymentTypes.Create;
  Institution := TInstitutionHasPaymentTypes.create;
  Lista := TListPaymentTypes.Create;
  Parametro := TPrmPaymentTypes.Create;
  Obj := TObjPaymentTypes.create;
end;

function TControllerPaymentTypes.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerPaymentTypes.desactiveRegiter: Boolean;
begin
  with Institution do
  Begin
    if (Registro.Codigo > 0) then
    Begin
      //Estabelecimento := Deve ser preenchido pelo interface
      TipoPagamento := Registro.Codigo;
      Ativo := 'N';
    End;
  End;
  updateObj(Institution);
end;

destructor TControllerPaymentTypes.Destroy;
begin
  Parametro.Destroy;
  Institution.DisposeOf;
  Registro.DisposeOf;
  Lista.DisposeOf;
  Obj.Destroy;
  inherited;
end;


function TControllerPaymentTypes.insert: boolean;
begin
  try
    Registro.Codigo := getNextByField(Registro,'id',0);
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerPaymentTypes.saveByDescription:boolean;
Var
  Lc_Qry : TFDQuery;
begin
  try
    Try
      Lc_Qry := createQuery;
      with Lc_Qry do
      Begin
        sql.Clear;
        sql.Add('SELECT id from tb_payment_types where description =:description');
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

function TControllerPaymentTypes.saveDataObjeto(
  DObj: TObjPaymentTypes): Boolean;
begin
  TRy
    //Colocar zero para que a gravação aconteça pela descrição
    ClonarObj(Obj.Forma, Registro);
    Institution.Estabelecimento := Obj.Estabelecimento;
    Institution.Ativo := 'S';
    Institution.DisponivelDelivery := Obj.DisponivelApp;
    save;
    REsult := True;
  except
    REsult := False;
  End;
end;

function TControllerPaymentTypes.save: boolean;
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

procedure TControllerPaymentTypes.getbyKey;
Var
  Lc_Qry : TFDQuery;
begin
  _getByKey(Registro);
end;


procedure TControllerPaymentTypes.getHas;
Var
  qry : TFDQuery;
begin
  qry := createQuery;
  with qry do
  BEgin


  End;
end;

procedure TControllerPaymentTypes.getList;
Var
  Qry :TFDQuery;
  LcLista : TPaymentTypes;
begin
  Try
    Qry := createQuery;
    with qry do
    Begin
      sql.Clear;
      sql.Add(concat(
               'Select pt.* ',
               'from tb_payment_types pt ',
               '  inner join tb_institution_has_payment_types ihpt ',
               '  on (pt.id = ihpt.tb_payment_types_id)  ',
               'where ihpt.tb_institution_id =:institution_id '
          ));

      //Incrementa SQL
      if Trim( Parametro.UltimaAtualizacao ) <> '' then
      Begin
        sql.add(' AND ( ihpt.updated_at >:updated_at ) ');
        sql.add(' order by ihpt.updated_at asc ');
      End
      else
      Begin
        sql.add(' ORDER BY pt.id  asc ');
      End;


      //Passagem de parametros
      parambyname('institution_id').AsInteger := Parametro. Estabelecimento;

      if Trim( Parametro.UltimaAtualizacao ) <> '' then
        parambyname('updated_at').AsString := Parametro.UltimaAtualizacao;

      Active := True;
      FetchAll;
      First;
      while not eof do
      Begin
        LcLista := TPaymentTypes.Create;
        get(qry,LcLista);
        //add lista
        Lista.Add(LcLista);
        Next;
      End;
    End;
  Finally
    qry.Close;
    FreeAndNil(Qry);
  End;

end;


procedure TControllerPaymentTypes.InnerInstitution;
begin
  with Institution do
  Begin
    //Estabelecimento := Deve ser preenchido pelo interface
    TipoPagamento := Registro.Codigo;
    //Ativo := 'S'; - Este campo é preenchido na interface
  End;
  SaveObj(Institution);
end;

procedure TControllerPaymentTypes.SaveInstitution;
begin
  Institution.TipoPagamento := Registro.Codigo;
  SaveObj(Institution);
end;


procedure TControllerPaymentTypes.setParametro(par: String);
begin
  try
    Parametro := TPrmPaymentTypes.Create;
    Parametro:= TJson.JsonToObject<TPrmPaymentTypes>(par);
  //Tratar Data
    Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);
  Except
    Parametro.UltimaAtualizacao := '1900-01-01 01:00:00'
  end;

end;

function TControllerPaymentTypes.getByDescripton: Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      sql.Add(' SELECT p.* '+
              ' from tb_payment_types p ' +
              ' inner join tb_institution_has_payment_types i '+
              ' on (i.tb_payment_types_id = p.id ) '+
              ' where (i.tb_institution_id =:tb_institution_id) '+
              ' and  (p.description =:description) ' );

      ParamByName('tb_institution_id').AsInteger := Institution.Estabelecimento;
      ParamByName('description').AsString := Registro.Descricao;
      Active := true;
      FetchAll;
      exist := ( RecordCount > 0 );
      if exist then
      Begin
        get(Lc_Qry, Registro);
      End
      else
      Begin
        Self.insert;
        Institution.TipoPagamento := Registro.Codigo;
        Institution.Ativo := 'S';
        insertObj(Institution);
      End;
    End;
  Finally
    Lc_Qry.Close;
    FreeAndNil(Lc_Qry);
  End;
end;

end.
