Unit ControllerExtAgent;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblExtAgent, tblInstitutionHasExtAgent, FireDAC.Comp.Client,
      FireDAC.Stan.Param, tblInstitutionHasBrand;

Type
  TControllerExtAgent = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TExtAgent;
    Institution : TInstitutionHasExtAgent;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function saveByDescription:boolean;
    procedure getbyKey;
    function insert:boolean;
    Function delete:boolean;
    Function activeRegiter:Boolean;
    Function desactiveRegiter:Boolean;
    procedure SaveInstitution;
  End;

implementation

{ ControllerExtAgent }

function TControllerExtAgent.activeRegiter: Boolean;
begin
  with Institution do
  Begin
    if (Registro.Codigo > 0) then
    Begin
      AgenteExtintor := Registro.Codigo;
      Ativo := 'S';
      RegistroCriado := Now;
      RegistroAlterado := Now;
    End;
  End;
  saveObj(Institution);
end;

procedure TControllerExtAgent.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerExtAgent.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TExtAgent.Create;
  Institution := TInstitutionHasExtAgent.Create;
end;

function TControllerExtAgent.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerExtAgent.desactiveRegiter: Boolean;
begin
  with Institution do
  Begin
    if (Registro.Codigo > 0) then
    Begin
      AgenteExtintor := Registro.Codigo;
      Ativo := 'N';
      RegistroCriado := Now;
      RegistroAlterado := Now;
    End;
  End;
  saveObj(Institution);
end;

destructor TControllerExtAgent.Destroy;
begin
  FreeAndNil(Institution);
  FreeAndNil(Registro);
  inherited;
end;


function TControllerExtAgent.insert: boolean;
begin
  try
    Registro.Codigo := getNextByField(Registro,'id',0);
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerExtAgent.saveByDescription:boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Clear;
      sql.Add('SELECT id from tb_ext_agent where description =:description');
      ParamByName('description').AsString := Registro.Descricao;
      Active := True;
      FetchAll;
      if RecordCount > 0 then
      Begin
        Registro.Codigo := FieldByName('id').AsInteger;
        UpdateObj(Registro);
      End
      else
      Begin
        Self.insert;
      End;
      Result := true;
    End;
  Finally
    Lc_Qry.close;
    FReeandNil(Lc_Qry)
  End;
End;

function TControllerExtAgent.save: boolean;
begin
  try
    if Registro.Codigo > 0 then
     UpdateObj(Registro)
    else
      saveByDescription;
    Result := true;
  except
    Result := False;
  end;
end;

procedure TControllerExtAgent.getbyKey;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      sql.Add('SELECT ea.*, i.tb_institution_id,  i.active '+
              'from tb_ext_agent ea ' +
              ' inner join tb_institution_has_ext_agent i '+
              ' on (i.tb_ext_agent_id = ea.id ) '+
              ' where (i.tb_institution_id =:tb_institution_id) '+
              ' and  (ea.id =:id) ' );

      ParamByName('tb_institution_id').AsInteger := Institution.Estabelecimento;
      ParamByName('id').AsInteger := Registro.Codigo;
      Active := true;
      FetchAll;
      exist := ( RecordCount > 0 );
      if (exist) then get(Lc_Qry,Registro);
    End;
  Finally
    Lc_Qry.close;
    FReeandNil(Lc_Qry)
  End;
end;


procedure TControllerExtAgent.SaveInstitution;
begin
  saveObj(Institution);
end;


End.
