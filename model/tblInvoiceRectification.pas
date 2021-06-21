unit tblInvoiceRectification;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_invoice_rectification')]
  TInvoiceRectification = Class(TGenericEntity)
  private
    Fnote: String;
    Fsequencce: Integer;
    Fmotive: String;
    Fprotocol: String;
    Ftb_invoice_id: Integer;
    Fid: Integer;
    Fupdated_at: TDatetime;
    Fstatus_code: Integer;
    Fdt_record: TDateTime;
    Ftb_state_id: Integer;
    Ftb_institution_id: Integer;
    Fnr_key: String;
    Fterminal: Integer;
    Fcreated_at: TDatetime;
    procedure setFcreated_at(const Value: TDatetime);
    procedure setFdt_record(const Value: TDateTime);
    procedure setFid(const Value: Integer);
    procedure setFmotive(const Value: String);
    procedure setFnote(const Value: String);
    procedure setFnr_key(const Value: String);
    procedure setFprotocol(const Value: String);
    procedure setFsequencce(const Value: Integer);
    procedure setFstatus_code(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_invoice_id(const Value: Integer);
    procedure setFtb_state_id(const Value: Integer);
    procedure setFterminal(const Value: Integer);
    procedure setFupdated_at(const Value: TDatetime);

  public

    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read Fid write setFid;

	  [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('terminal')]
    [KeyField('terminal')]
    property Terminal: Integer read Fterminal write setFterminal;

    [FieldName('tb_invoice_id')]
    property NotaFiscal: Integer read Ftb_invoice_id write setFtb_invoice_id;

    [FieldName('dt_record')]
    property DataEmissao: TDateTime read Fdt_record write setFdt_record;

    [FieldName('nr_key')]
    property Chave: String read Fnr_key  write setFnr_key ;

    [FieldName('protocol')]
    property protocolo: String read Fprotocol write setFprotocol;

    [FieldName('tb_state_id')]
    property CodigoUF: Integer read Ftb_state_id write setFtb_state_id;

    [FieldName('sequencce')]
    property Sequencia: Integer read Fsequencce write setFsequencce;

    [FieldName('note')]
    property Observacao: String read Fnote write setFnote;

    [FieldName('status_code')]
    property Status: Integer read Fstatus_code write setFstatus_code;

    [FieldName('motive')]
    property Motivo: String read Fmotive write setFmotive;

  	[FieldName('created_at')]
    property RegistroCriado: TDatetime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDatetime read Fupdated_at write setFupdated_at;

	End;

implementation

{ TInvoiceRectification }

procedure TInvoiceRectification.setFcreated_at(const Value: TDatetime);
begin
  Fcreated_at := Value;
end;

procedure TInvoiceRectification.setFdt_record(const Value: TDateTime);
begin
  Fdt_record := Value;
end;

procedure TInvoiceRectification.setFid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TInvoiceRectification.setFmotive(const Value: String);
begin
  Fmotive := Value;
end;

procedure TInvoiceRectification.setFnote(const Value: String);
begin
  Fnote := Value;
end;

procedure TInvoiceRectification.setFnr_key(const Value: String);
begin
  Fnr_key := Value;
end;

procedure TInvoiceRectification.setFprotocol(const Value: String);
begin
  Fprotocol := Value;
end;

procedure TInvoiceRectification.setFsequencce(const Value: Integer);
begin
  Fsequencce := Value;
end;

procedure TInvoiceRectification.setFstatus_code(const Value: Integer);
begin
  Fstatus_code := Value;
end;

procedure TInvoiceRectification.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TInvoiceRectification.setFtb_invoice_id(const Value: Integer);
begin
  Ftb_invoice_id := Value;
end;

procedure TInvoiceRectification.setFtb_state_id(const Value: Integer);
begin
  Ftb_state_id := Value;
end;

procedure TInvoiceRectification.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TInvoiceRectification.setFupdated_at(const Value: TDatetime);
begin
  Fupdated_at := Value;
end;

end.
