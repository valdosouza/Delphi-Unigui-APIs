unit ControllerLineBusiness;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblLineBusiness, tblInstitutionHasPaymentTypes, FireDAC.Comp.Client,
      FireDAC.Stan.Param, tblInstitutionHasLineBusiness, ObjLineBusiness;

Type
  TControllerLineBusiness = Class(TBaseController)
    procedure clear;
  private
    procedure InnerInstitution;

  public
    Registro : TLineBusiness;
    Institution : TInstitutionHasLineBusiness;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function saveByDescription:boolean;
    procedure SaveInstitution;

    procedure getbyKey;
    function insert:boolean;
    Function delete:boolean;
    Function activeRegiter:Boolean;
    Function desactiveRegiter:Boolean;
    function saveDataObjeto(DObj : TObjLineBusiness):Boolean;
  End;

implementation

{ ControllerLineBusiness }

function TControllerLineBusiness.activeRegiter: Boolean;
begin
  with Institution do
  Begin
    if (Registro.Codigo > 0) then
    Begin
      CodigoRamoAtividade := Registro.Codigo;
      Ativo := 'S';
    End;
  End;
  SaveObj(Institution);
end;

procedure TControllerLineBusiness.clear;
begin
  clearObj(Registro);
end;

constructor TControllerLineBusiness.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TLineBusiness.Create;
  Institution := TInstitutionHasLineBusiness.Create;;
end;

function TControllerLineBusiness.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerLineBusiness.desactiveRegiter: Boolean;
begin
  with Institution do
  Begin
    if (Registro.Codigo > 0) then
    Begin
      CodigoRamoAtividade := Registro.Codigo;
      Ativo := 'N';
    End;
  End;
  SaveObj(Institution);
end;

destructor TControllerLineBusiness.Destroy;
begin
  Institution.DisposeOf;
  Registro.DisposeOf;
  inherited;
end;


function TControllerLineBusiness.insert: boolean;
begin
  try
    Registro.Codigo := getNextByField(Registro,'id',0);
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerLineBusiness.saveByDescription:boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Clear;
      sql.Add('SELECT id from tb_LineBusiness where description =:description');
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
      Close;
    End;
    //Vincula o Ramo de atividade ao Estabelecimento
    SaveInstitution;
    Result := true;
  finally
    Lc_Qry.Close;
    FreeAndNil(Lc_Qry);
  end;
End;

function TControllerLineBusiness.saveDataObjeto(
  DObj: TObjLineBusiness): Boolean;
begin
  Registro := DObj.RamoAtividade;
  Institution.Estabelecimento := DObj.Estabelecimento;
  saveByDescription;
end;

procedure TControllerLineBusiness.SaveInstitution;
begin
  Institution.CodigoRamoAtividade := Registro.Codigo;
  SaveObj(Institution);
end;

function TControllerLineBusiness.save: boolean;
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

procedure TControllerLineBusiness.getbyKey;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      sql.Add('SELECT b.*, i.tb_institution_id,  i.active '+
              'from tb_linebusiness b ' +
              '  inner join tb_institution_has_linebusiness i '+
              '   on (i.tb_linebusiness_id = b.id ) '+
              'where (i.tb_institution_id =:tb_institution_id) '+
              ' and  (b.id =:id) ' );

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


procedure TControllerLineBusiness.InnerInstitution;
begin
  with Institution do
  Begin
    CodigoRamoAtividade := Registro.Codigo;
  End;
  SaveObj(Institution);
end;


end.
