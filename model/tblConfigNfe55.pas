unit tblConfigNfe55;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_config_nfe_55')]
  TConfigNfe55 = Class(TGenericEntity)
  private
    Fset_duplicate: String;
    FsendNfeToaccounting: String;
    Forientation: String;
    Fupdated_at: TDAteTime;
    Fset_invoice: String;
    Ftb_institution_id: Integer;
    FsendNfeToyourSelf: String;
    Freceipt_posit: String;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setForientation(const Value: String);
    procedure setFreceipt_posit(const Value: String);
    procedure setFsendNfeToaccounting(const Value: String);
    procedure setFsendNfeToyourSelf(const Value: String);
    procedure setFset_duplicate(const Value: String);
    procedure setFset_invoice(const Value: String);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);

  public

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('orientation')]
    property Orientacao: String read Forientation write setForientation;

    [FieldName('receipt_posit')]
    property Recebimento: String read Freceipt_posit write setFreceipt_posit;

    [FieldName('set_invoice')]
    property Fatura: String read Fset_invoice write setFset_invoice;

    [FieldName('set_duplicate')]
    property Duplicata: String read Fset_duplicate write setFset_duplicate;

    [FieldName('sendNfeToaccounting')]
    property EnviarContabilidade: String read FsendNfeToaccounting write setFsendNfeToaccounting;

    [FieldName('sendNfeToyourSelf')]
    property ReceberCopia: String read FsendNfeToyourSelf write setFsendNfeToyourSelf;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation




{ TConfigNfe55 }

procedure TConfigNfe55.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TConfigNfe55.setForientation(const Value: String);
begin
  Forientation := Value;
end;

procedure TConfigNfe55.setFreceipt_posit(const Value: String);
begin
  Freceipt_posit := Value;
end;

procedure TConfigNfe55.setFsendNfeToaccounting(const Value: String);
begin
  FsendNfeToaccounting := Value;
end;

procedure TConfigNfe55.setFsendNfeToyourSelf(const Value: String);
begin
  FsendNfeToyourSelf := Value;
end;

procedure TConfigNfe55.setFset_duplicate(const Value: String);
begin
  Fset_duplicate := Value;
end;

procedure TConfigNfe55.setFset_invoice(const Value: String);
begin
  Fset_invoice := Value;
end;

procedure TConfigNfe55.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TConfigNfe55.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.

