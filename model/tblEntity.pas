unit tblEntity;

interface

Uses GenericEntity,CAtribEntity, System.SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_entity')]
  TEntity = Class(TGenericEntity)
  private
    FNote: String;
    Ftb_line_business_id: Integer;
    FAniversary: TDateTime;
    FID: Integer;
    FNickTrade: String;
    Fupdated_at: TDAteTime;
    FNameCompany: String;
    Fcreated_at: TDAteTime;
    procedure setFAniversary(const Value: TDateTime);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFID(const Value: Integer);
    procedure setFNameCompany(const Value: String);
    procedure setFNickTrade(const Value: String);
    procedure setFNote(const Value: String);
    procedure setFtb_line_business_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);


  public
    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read FID write setFID;

    [FieldName('name_company')]
    property NomeRazao: String read FNameCompany write setFNameCompany;

    [FieldName('nick_trade')]
    property ApelidoFantasia: String read FNickTrade write setFNickTrade;

    [FieldName('aniversary')]
    property AniversarioFundacao: TDateTime read FAniversary write setFAniversary;

    [FieldName('tb_line_business_id')]
    property RamoAtividade: Integer read Ftb_line_business_id write setFtb_line_business_id;

    [FieldName('note')]
    property Observacao: String read FNote write setFNote;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation


{ TEntity }

procedure TEntity.setFAniversary(const Value: TDateTime);
begin
  FAniversary := Value;
end;

procedure TEntity.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TEntity.setFID(const Value: Integer);
begin
  FID := Value;
end;

procedure TEntity.setFNameCompany(const Value: String);
begin
  FNameCompany := Value;
end;

procedure TEntity.setFNickTrade(const Value: String);
begin
  FNickTrade := Value;
end;

procedure TEntity.setFNote(const Value: String);
begin
  FNote := Value;
end;

procedure TEntity.setFtb_line_business_id(const Value: Integer);
begin
  Ftb_line_business_id := Value;
end;

procedure TEntity.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
