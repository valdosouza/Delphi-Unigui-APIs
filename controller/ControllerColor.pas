unit ControllerColor;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblColor, tblInstitutionHasPaymentTypes, FireDAC.Comp.Client,
      FireDAC.Stan.Param, tblInstitutionHasColor;

Type
  TControllerColor = Class(TBaseController)
    procedure clear;
  private
    procedure InnerInstitution;

  public
    Registro : TColor;
    Institution : TInstitutionHasColor;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function saveByDescription:boolean;
    procedure getbyKey;
    function insert:boolean;
    Function delete:boolean;
    Function activeRegiter:Boolean;
    Function desactiveRegiter:Boolean;
    procedure saveInstitution;
  End;

implementation

{ ControllerCor }

function TControllerColor.activeRegiter: Boolean;
begin
  with Institution do
  Begin
    if (Registro.Codigo > 0) then
    Begin
      //Estabelecimento := Deve ser preenchido pelo interface
      CodigoCor := Registro.Codigo;
      Ativo := 'S';
    End;
  End;
  updateObj(Institution);
end;

procedure TControllerColor.clear;
begin
  clearObj(Registro);
end;

constructor TControllerColor.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TColor.Create;
  Institution := TInstitutionHasColor.Create;;
end;

function TControllerColor.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerColor.desactiveRegiter: Boolean;
begin
  with Institution do
  Begin
    if (Registro.Codigo > 0) then
    Begin
      //Estabelecimento := Deve ser preenchido pelo interface
      CodigoCor := Registro.Codigo;
      Ativo := 'N';
    End;
  End;
  updateObj(Institution);
end;

destructor TControllerColor.Destroy;
begin
  Institution.DisposeOf;
  Registro.DisposeOf;
  inherited;
end;


function TControllerColor.insert: boolean;
begin
  try
    Registro.Codigo := getNextByField(Registro,'id',0);
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerColor.saveByDescription:boolean;
Var
  Lc_Qry : TFDQuery;
begin
  try
    Try
      Lc_Qry := createQuery;
      with Lc_Qry do
      Begin
        sql.Clear;
        sql.Add('SELECT id from tb_color where description =:description');
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
    //Vincula a cor ao Estabelecimento
    SaveInstitution;
    Result := true;
  except
    Result := False;
  end;

End;

procedure TControllerColor.saveInstitution;
begin
  Institution.CodigoCor := Registro.Codigo;
  SaveObj(Institution);
end;

function TControllerColor.save: boolean;
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

procedure TControllerColor.getbyKey;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      sql.Add('SELECT c.*, ihc.tb_institution_id,  ihc.active '+
              'from tb_color c ' +
              '  inner join tb_institution_has_color ihc '+
              '   on (ihc.tb_color_id = c.id ) '+
              'where (ihc.tb_institution_id =:tb_institution_id) '+
              ' and  (c.id =:id) ' );

      ParamByName('tb_institution_id').AsInteger := Institution.Estabelecimento;
      ParamByName('id').AsInteger := Registro.Codigo;
      Active := true;
      FetchAll;
      exist := ( RecordCount > 0 );
      if (exist) then get( Lc_Qry,Registro);
    End;
  Finally
    Lc_Qry.Close;
    FreeAndNil(Lc_Qry);
  End;
end;


procedure TControllerColor.InnerInstitution;
begin
  with Institution do
  Begin
    //Estabelecimento := Deve ser preenchido pelo interface
    CodigoCor := Registro.Codigo;
    //Ativo := 'S'; - Este campo é preenchido na interface
  End;
  SaveObj(Institution);
end;

end.
