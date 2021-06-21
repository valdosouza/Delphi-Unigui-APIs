unit ctrl_mob_entity;

interface

uses System.Classes,ctrl_mob_base, ctrl_mob_address,ctrl_mob_mailing,
    ctrl_mob_phone,ctrl_mob_mailing_group,ctrl_mob_entity_has_mailing,
    ctrl_mob_line_business, ctrl_mob_institution_has_line_business,ctrl_mob_social_media,
    FireDAC.Comp.Client, FireDAC.Stan.Param,
  System.SysUtils,ctrl_mob_institution_has_entity,tblentity,objEntity;

Type
  TCtrlMobEntity = class(TCtrlMobBase)
    private
      function getlistSalesman:String;
    public
      Registro : TEntity;
      MEndereco : TCtrlMobAddress;
      MEmail : TCtrlMobMailing;
      MEntityHasMailing : TCtrlMobEntityHasMailing;
      MTelefone : TCtrlMobPhone;
      MMidiaSocial : TCtrlMobSocialMedia;
      MRamoAtividade : TCtrlMobLineBusiness;
      MInstitutionHasEntity : TCtrlMobInstitutionHasEntity ;
      function getNext:Integer;
      function insert:Boolean;
      function update:Boolean;
      function getByKey:Boolean;
      function getAllByKey:boolean;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function delete:Boolean;
  end;

implementation

uses MainModule;


constructor TCtrlMobEntity.Create(AOwner: TComponent);
begin
  Registro              := TEntity.Create;
  MEndereco             := TCtrlMobAddress.Create(Self);
  MEmail                := TCtrlMobMailing.Create(Self);
  MEntityHasMailing     := TCtrlMobEntityHasMailing.Create(Self);
  MTelefone             := TCtrlMobPhone.Create(Self);
  MMidiaSocial          := TCtrlMobSocialMedia.Create(Self);
  MRamoAtividade        := TCtrlMobLineBusiness.Create(Self);
  MInstitutionHasEntity := TCtrlMobInstitutionHasEntity.Create(Self);
  createTable;
end;

procedure TCtrlMobEntity.createTable;
begin
  execcmd(concat(
                'CREATE TABLE if not exists  tb_entity ( ',
                '  id int(11) , ',
                '  name_company varchar(100) , ',
                '  nick_trade varchar(100) , ',
                '  aniversary date , ',
                '  created_at datetime , ',
                '  updated_at datetime , ',
                '  tb_line_business_id int(11) , ',
                '  note blob  ) ;'
      ));
end;

function TCtrlMobEntity.delete: Boolean;
begin
  try
    DeleteObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

destructor TCtrlMobEntity.Destroy;
begin
  {$IFDEF WIN32}
  Registro.DisposeOf;
  MInstitutionHasEntity.Destroy;
  MEndereco.Destroy;
  MEmail.Destroy;
  MEntityHasMailing.Destroy;
  MTelefone.Destroy;
  MMidiaSocial.Destroy;
  MRamoAtividade.Destroy;
  {$ENDIF }
end;


function TCtrlMobEntity.getAllByKey: boolean;
begin
  Result := True;
  getByKey;

  MEndereco.Registro.Codigo := Self.Registro.Codigo;
  MEndereco.Registro.Tipo := 'COMERCIAL';
  MEndereco.getAllByKey;

  MRamoAtividade.Registro.Codigo := Self.Registro.RamoAtividade;
  MRamoAtividade.getByKey;

  //O grupo de email a ser utilizado deve ser deinfido no setVariable
  MEmail.getbyKind(Registro.Codigo,MEmail.MGrupo.Registro.descricao);

  //O fone por ter tres será chamado individualmente
  //Phone : T

  MMidiaSocial.Registro.Codigo := Self.Registro.Codigo;
  MMidiaSocial.Registro.Tipo := 'www';
  MMidiaSocial.getByKey;

end;

function TCtrlMobEntity.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TCtrlMobEntity.getlistSalesman: String;
Var
  Lc_Qry : TFDQuery;
begin
  try
    try
      Lc_Qry := createQuery;
      with Lc_Qry do
      Begin
        SQL.Add (concat(
                    'select id ',
                    'from  tb_salesman '
        ));
        Active := True;
        First;
        while not eof do
        Begin
          if bof then
            Result := FieldByName('id').asstring
          else
            Result := concat(Result,',',FieldByName('id').asstring);
          next;
        End;
      End;
    Except
      on E: Exception do
        geralog('TCtrlMobEntity.getlistSalesman - ',concat(E.Message,'SQL: ',Lc_Qry.SQL.text) );
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;


end;

function TCtrlMobEntity.getNext: Integer;
Var
  Lc_Qry : TFDQuery;
begin
  try
    try
      Lc_Qry := createQuery;
      with Lc_Qry do
      Begin
        SQL.Add (concat(
                    'select max(e.id) id ',
                    'from tb_entity  e ',
                    '  left outer join tb_institution  i ',
                    '  on (i.id = e.id ) ',
                    '  left outer join tb_salesman s ',
                    '   on (s.id = e.id) ',
                    'where i.id is null ',
                    ' and e.id not in (', getlistSalesman,')'
        ));
        Active := True;
        Result := StrToIntDef( FieldByName('id').AsString,0) + 1;
        if Result = MInstitutionHasEntity.Registro.Estabelecimento then
          Result := Result + 1;
      End;
    Except
      on E: Exception do
        geralog('Base - getNextByField - ',concat(E.Message,'SQL: ',Lc_Qry.SQL.text) );
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;

function TCtrlMobEntity.insert: Boolean;
begin
  Try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNext;
    Result := TRue;
    insertObj(Registro);
  Finally
    Result := False;
  End;
end;

function TCtrlMobEntity.update: Boolean;
begin
  Try
    Result := TRue;
    updateObj(Registro);
  Finally
    Result := False;
  End;

end;

end.
