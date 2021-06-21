unit tblInvoiceObs;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_invoice_obs')]
  TInvoiceObs = Class(TGenericEntity)
  private
    FId: Integer;
    Ftb_institution_id: Integer;
    Ftb_invoice_id: Integer;
    Fobs: String;
    Fcreated_at: TDAteTime;
    Fupdated_at: TDAteTime;
    Fterminal: Integer;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFId(const Value: Integer);
    procedure setFobs(const Value: String);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_invoice_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFterminal(const Value: Integer);

  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_invoice_id')]
    [KeyField('tb_invoice_id')]
    property NotaFiscal: Integer read Ftb_invoice_id write setFtb_invoice_id;

    [FieldName('terminal')]
    [KeyField('terminal')]
    property Terminal: Integer read Fterminal write setFterminal;

    [FieldName('obs')]
    property Observacao: String read Fobs write setFobs;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation



{ TInvoiceObs }

procedure TInvoiceObs.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TInvoiceObs.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TInvoiceObs.setFobs(const Value: String);
begin
  Fobs := Value;
end;

procedure TInvoiceObs.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TInvoiceObs.setFtb_invoice_id(const Value: Integer);
begin
  Ftb_invoice_id := Value;
end;

procedure TInvoiceObs.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TInvoiceObs.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
