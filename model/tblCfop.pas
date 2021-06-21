unit tblCfop;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_cfop')]
  TCfop = Class(TGenericEntity)
  private
    Fnote: String;
    Fregister: Integer;
    Fway: String;
    Fdescription: String;
    Fid: String;
    Fupdated_at: TDAteTime;
    Fenabled: String;
    Fconcise: String;
    Fjurisdiction: String;
    Fcreated_at: TDAteTime;
    procedure setFconcise(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFenabled(const Value: String);
    procedure setFid(const Value: String);
    procedure setFjurisdiction(const Value: String);
    procedure setFnote(const Value: String);
    procedure setFregister(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFway(const Value: String);




  public
    [KeyField('id')]
    [FieldName('id')]
    property Codigo: String read Fid write setFid;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('concise')]
    property Conciso: String read Fconcise write setFconcise;

    [FieldName('Active')]
    property ativo: String read Fenabled write setFenabled;

    [FieldName('register')]
    property Registro: Integer read Fregister write setFregister;

    [FieldName('jurisdiction')]
    property Alcada: String read Fjurisdiction write setFjurisdiction;

    [FieldName('way')]
    property Direcao: String read Fway write setFway;

    [FieldName('note')]
    property Observacao: String read Fnote write setFnote;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

	End;

implementation


{ TCfop }

procedure TCfop.setFconcise(const Value: String);
begin
  Fconcise := Value;
end;

procedure TCfop.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TCfop.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TCfop.setFenabled(const Value: String);
begin
  Fenabled := Value;
end;

procedure TCfop.setFid(const Value: String);
begin
  Fid := Value;
end;

procedure TCfop.setFjurisdiction(const Value: String);
begin
  Fjurisdiction := Value;
end;

procedure TCfop.setFnote(const Value: String);
begin
  Fnote := Value;
end;

procedure TCfop.setFregister(const Value: Integer);
begin
  Fregister := Value;
end;

procedure TCfop.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

procedure TCfop.setFway(const Value: String);
begin
  Fway := Value;
end;

end.
