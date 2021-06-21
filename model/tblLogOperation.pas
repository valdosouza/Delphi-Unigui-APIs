unit tblLogOperation;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_log_operation')]
  TLogOperation = Class(TGenericEntity)
  private
    Flog_operation: String;
    Flog_description: String;
    Fid: Integer;
    Flog_timestamp: TDAteTime;
    Ftb_institution_id: Integer;
    Flog_interface: String;
    Ftb_user_id: Integer;
    procedure setFid(const Value: Integer);
    procedure setFlog_description(const Value: String);
    procedure setFlog_interface(const Value: String);
    procedure setFlog_operation(const Value: String);
    procedure setFlog_timestamp(const Value: TDAteTime);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_user_id(const Value: Integer);

  public

    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read Fid write setFid;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_user_id')]
    [KeyField('tb_user_id')]
    property Usuario: Integer read Ftb_user_id write setFtb_user_id;

    [FieldName('log_timestamp')]
    property DataAlteracao: TDAteTime read Flog_timestamp write setFlog_timestamp;

    [FieldName('log_interface')]
    property Tela: String read Flog_interface write setFlog_interface;

    [FieldName('log_operation')]
    property Operacao: String read Flog_operation write setFlog_operation;

    [FieldName('log_description')]
    property Descricao: String read Flog_description write setFlog_description;

  End;

implementation


{ TLogOperation }

procedure TLogOperation.setFid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TLogOperation.setFlog_description(const Value: String);
begin
  Flog_description := Value;
end;

procedure TLogOperation.setFlog_interface(const Value: String);
begin
  Flog_interface := Value;
end;

procedure TLogOperation.setFlog_operation(const Value: String);
begin
  Flog_operation := Value;
end;

procedure TLogOperation.setFlog_timestamp(const Value: TDAteTime);
begin
  Flog_timestamp := Value;
end;

procedure TLogOperation.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TLogOperation.setFtb_user_id(const Value: Integer);
begin
  Ftb_user_id := Value;
end;

end.
