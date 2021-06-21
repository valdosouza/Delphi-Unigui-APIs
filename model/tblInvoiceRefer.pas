unit tblInvoiceRefer;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_invoice_refer')]
  TInvoiceRefer = Class(TGenericEntity)
  private
    Fdescription: String;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Fnumber: String;
    Fcreated_at: TDAteTime;
    Ftb_institution_id: Integer;
    Fterminal: Integer;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFnumber(const Value: String);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFterminal(const Value: Integer);


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

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('number')]
    property Numero: String read Fnumber write setFnumber;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation

{ TInvoiceRefer }

procedure TInvoiceRefer.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TInvoiceRefer.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TInvoiceRefer.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TInvoiceRefer.setFnumber(const Value: String);
begin
  Fnumber := Value;
end;

procedure TInvoiceRefer.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TInvoiceRefer.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TInvoiceRefer.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
