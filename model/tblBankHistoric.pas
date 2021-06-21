unit tblBankHistoric;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_bank_historic')]
  TBankHistoric = Class(TGenericEntity)
  private
    FId: Integer;
    Ftb_institution_id: Integer;
    Ftb_bank_id: Integer;
    Fdescription: String;
    Fcreated_at: TDAteTime;
    Fupdated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFtb_bank_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);

  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_bank_id')]
    [KeyField('tb_bank_id')]
    property Banco: Integer read Ftb_bank_id write setFtb_bank_id;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation


{ TBankHistoric }

procedure TBankHistoric.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TBankHistoric.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TBankHistoric.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TBankHistoric.setFtb_bank_id(const Value: Integer);
begin
  Ftb_bank_id := Value;
end;

procedure TBankHistoric.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TBankHistoric.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
