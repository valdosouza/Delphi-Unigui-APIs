unit tblOrder;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_order')]
  TOrder = Class(TGenericEntity)
  private
    Fnote: String;
    Fbeing_used: String;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Fstatus: String;
    Ftb_institution_id: Integer;
    Ftb_user_id: Integer;
    Fterminal: Integer;
    Forigin: String;
    Fdt_record: TDateTime;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdt_record(const Value: TDateTime);
    procedure setFId(const Value: Integer);
    procedure setFnote(const Value: String);
    procedure setForigin(const Value: String);
    procedure setFsendousado(const Value: String);
    procedure setFstatus(const Value: String);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFterminal(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFusuario(const Value: Integer);



  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('terminal')]
    [KeyField('terminal')]
    property Terminal: Integer read Fterminal write setFterminal;

    [FieldName('dt_record')]
    property Data: TDateTime read Fdt_record write setFdt_record;

    [FieldName('note')]
    property Observacao: String read Fnote write setFnote;

    [FieldName('origin')]
    property Origem: String read Forigin write setForigin;

    [FieldName('status')]
    property Status: String read Fstatus write setFstatus;

    [FieldName('being_used')]
    property SendoUsado: String read Fbeing_used write setFsendousado;

    [FieldName('tb_user_id')]
    property Usuario: Integer read Ftb_user_id write setFusuario;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;


implementation


{ TOrder }

procedure TOrder.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TOrder.setFdt_record(const Value: TDateTime);
begin
  Fdt_record := Value;
end;

procedure TOrder.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TOrder.setFnote(const Value: String);
begin
  Fnote := Value;
end;

procedure TOrder.setForigin(const Value: String);
begin
  Forigin := Value;
end;

procedure TOrder.setFsendousado(const Value: String);
begin
  Fbeing_used := Value;
end;

procedure TOrder.setFstatus(const Value: String);
begin
  Fstatus := Value;
end;

procedure TOrder.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TOrder.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TOrder.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

procedure TOrder.setFusuario(const Value: Integer);
begin
  Ftb_user_id := Value;
end;

end.
