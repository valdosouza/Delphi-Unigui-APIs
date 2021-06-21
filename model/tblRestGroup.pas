unit tblRestGroup;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_rest_group')]
  TRestGroup = Class(TGenericEntity)

  private
    Fsequence_id: Integer;
    Fdescription: String;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Ftb_institution_id: Integer;
    Fcreated_at: TDAteTime;
    FAtivo: String;
    Flink_url: String;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFsequence_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFAtivo(const Value: String);
    procedure setFlink_url(const Value: String);


  public

    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('sequence_id')]
    property Sequencia: Integer read Fsequence_id write setFsequence_id;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    //Retirado por que a migração do Desktop para Web não há dados
    //[FieldName('link_url')]
    property LinkUrl: String read Flink_url write setFlink_url;

    [FieldName('active')]
    property Ativo: String read FAtivo write setFAtivo;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;


implementation

{ TRestGroup }

procedure TRestGroup.setFAtivo(const Value: String);
begin
  FAtivo := Value;
end;

procedure TRestGroup.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TRestGroup.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TRestGroup.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TRestGroup.setFlink_url(const Value: String);
begin
  Flink_url := Value;
end;

procedure TRestGroup.setFsequence_id(const Value: Integer);
begin
  Fsequence_id := Value;
end;

procedure TRestGroup.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TRestGroup.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
