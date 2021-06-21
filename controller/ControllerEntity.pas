unit ControllerEntity;

interface

uses
  System.Classes, System.SysUtils, System.Variants, FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  BaseController,
  tblEntity,
  tblInstitutionHasEntity,
  ControllerEntitySeq,
  ControllerPhone,
  ControllerAddress,
  ControllerMailing,
  ControllerEntityHasMailing,
  ControllerSocialMedia,
  ControllerLineBusiness,
  ControllerInstitutionHasEntity,
  ControllerCompany,
  ControllerPerson, objEntity, typesCollection;

Type
  TControllerEntity = Class(TBaseController)
    procedure clear;
  private
    function getNext:Integer;
  public
    Registro : TEntity;
    Endereco : TControllerAddress;
    Email : TControllerMailing;
    EntityHasMailing : TControllerEntityHasMailing;
    Telefone : TControllerPhone;
    MidiaSocial : TControllerSocialMedia;
    RamoAtividade : TControllerLineBusiness;
    HadInstitution : TControllerInstitutionHasEntity;
    Lista : TListEntity;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function update:boolean;
    function getByKey:Boolean;Virtual;
    function getAllByKey:boolean;Virtual;
    function delete: boolean;
    function insert:boolean;
    function getlist:boolean;
    function getStateAdrress:Integer;
    function saveDataObjeto(DObj : TObjEntity): Boolean; Virtual;
  End;

implementation

{ ControllerAddress }

procedure TControllerEntity.clear;
begin
  clearObj(Registro);
end;

constructor TControllerEntity.Create(AOwner: TComponent);
begin
  inherited;
  Registro          := TEntity.Create;
  HadInstitution    := TControllerInstitutionHasEntity.Create(self);
  Endereco           := TControllerAddress.Create(Self);
  Telefone             := TControllerPhone.Create(Self);
  email           := TControllerMailing.Create(Self);
  MidiaSocial       := TControllerSocialMedia.Create(Self);
  Ramoatividade      := TControllerLineBusiness.Create(Self);
  EntityHasMailing  := TControllerEntityHasMailing.Create(Self);
  Lista := TListEntity.Create;
end;

function TControllerEntity.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

destructor TControllerEntity.Destroy;
begin
  Lista.DisposeOf;
  Registro.DisposeOf;
  HadInstitution.DisposeOf;
  Endereco.DisposeOf;
  Telefone.DisposeOf;
  email.DisposeOf;
  Midiasocial.DisposeOf;
  RamoAtividade.DisposeOf;
  EntityHasMailing.DisposeOf;
  inherited;
end;



function TControllerEntity.save: boolean;
begin
  if Registro.Codigo = 0 then
    Registro.Codigo := getNext;
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerEntity.saveDataObjeto(DObj: TObjEntity): Boolean;
Var
  I : Integer;
  LcEntityId : Integer;
begin
  REsult := False;
  Try
    //Há preponderancia fiscal CPF e CNPJ e só será verificado o email quando
    //não for inserido um pessoa fisica ou juridix
    Self.Email.Registro := DObj.Email;
    LcEntityId := Self.Email.getEntityIdbyEmailGroup(DObj.Email.Email,DObj.TipoEntidade);
    if LcEntityId = 0 then
    Begin
      //Entidade
      Self.Registro := DObj.Entidade;
      Self.Registro.Codigo := 0;
      Self.insert;
    End
    else
    Begin
      Self.Registro.Codigo := LcEntityId;
      getByKey;
      Self.Registro.NomeRazao           := DObj.Entidade.NomeRazao;
      Self.Registro.ApelidoFantasia     := DObj.Entidade.ApelidoFantasia;
      Self.Registro.AniversarioFundacao := DObj.Entidade.AniversarioFundacao;
      Self.Registro.RamoAtividade       := DObj.Entidade.RamoAtividade;
      Self.Registro.Observacao          := DObj.Entidade.Observacao;
      update;
    End;
    Self.Email.Grupo.Registro.Descricao := DObj.TipoEntidade;
    Self.Email.Grupo.getByDescription;
    //Não deleta o email do mailing, apenas delete o vinculo deste email à Entidade
    Self.Email.deleteHasEntity(Self.Registro.Codigo,
                               Self.Email.Registro.Codigo );
    //Mailing
    Self.Email.Registro := DObj.Email;
    Self.Email.save;
    //Entidade Has Mailin
    Self.Email.EntityHas.Registro.Entidade := Self.Registro.Codigo;
    Self.Email.EntityHas.Registro.Mailing  := Self.Email.Registro.Codigo;
    Self.Email.EntityHas.Registro.Grupo    := Self.Email.Grupo.Registro.Codigo;
    Self.Email.EntityHas.Save;

    //Endereço
    for I := 0 to DObj.ListaEndereco.Count -1 do
    Begin
      Self.Endereco.Registro := DObj.ListaEndereco[I];
      Self.Endereco.Registro.Codigo := Self.Registro.Codigo;
      Self.Endereco.save;
    End;
    //Telefone
    for I := 0 to DObj.ListaFones.Count -1 do
    Begin
      Self.Telefone.Registro := DObj.ListaFones[I];
      Self.Telefone.Registro.Codigo := Self.Registro.Codigo;
      Self.Telefone.save;
    End;
    REsult := True;
  Except
    REsult := False;
  End;
end;

function TControllerEntity.update: boolean;
begin
  try
    updateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerEntity.getAllByKey: boolean;
begin
  Result := True;
  getByKey;

  Endereco.Registro.Codigo := Self.Registro.Codigo;
  Endereco.Registro.Tipo := 'COMERCIAL';
  Endereco.getAllByKey;

  RamoAtividade.Registro.Codigo := Self.Registro.RamoAtividade;
  RamoAtividade.getByKey;

  //O grupo de email a ser utilizado deve ser deinfido no setVariable
  Email.getbyKind(Registro.Codigo,Email.Grupo.Registro.descricao);

  //O fone por ter tres será chamado individualmente
  //Phone : TControllerPhone;

  MidiaSocial.Registro.Codigo := Self.Registro.Codigo;
  MidiaSocial.Registro.Tipo := 'www';
  MidiaSocial.getByKey;
end;

function TControllerEntity.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerEntity.getlist: boolean;
Var
  Lc_Qry : TFDQuery;
  item : TEntity;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
                  'select * ',
                  'from tb_entity  ',
                  'order by id '
              ));
      Active := True;
      First;
      Lista.Clear;
      while not eof do
      Begin
        item := TEntity.Create;
        get(Lc_Qry,item);
        lista.Add(item);
        Next;
      End;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerEntity.getNext: Integer;
Var
  LcSeq:TControllerEntitySeq;
begin
  Try
    LcSeq := TControllerEntitySeq.create(Self);
    if( LcSeq.getfree ) then
      result := LcSeq.Registro.Codigo
    else
      result := getNextByField(Registro,'id',0);
  Finally
    LcSeq.DisposeOf;
  End;
end;

function TControllerEntity.getStateAdrress: Integer;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
                  'select a.tb_state_id ',
                  'from tb_address a ',
                  'where (a.id =:id)',
                  ' and (main = ''S'') '
              ));
      ParamByName('id').AsInteger := Registro.Codigo;
      Active := True;
      Result := FieldByname('tb_state_id').AsInteger;
    End;
  Finally
    finalizaQuery(Lc_Qry);
  End;
end;

function TControllerEntity.insert: boolean;
begin
  try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNext;
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.

