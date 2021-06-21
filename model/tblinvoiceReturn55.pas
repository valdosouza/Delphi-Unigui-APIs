unit tblInvoiceReturn55;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_invoice_return_55')]
  TInvoiceReturn55 = Class(TGenericEntity)
  private
    Fmotive: String;
    Fid: Integer;
    Fupdated_at: TDatetime;
    Fstatus_code: Integer;
    Ffile_name: String;
    Ftb_institution_id: Integer;
    Fcreated_at: TDatetime;
    Fterminal: Integer;
    FSerie: String;
    Fnumber: String;
    procedure setFcreated_at(const Value: TDatetime);
    procedure setFfile_name(const Value: String);
    procedure setFid(const Value: Integer);
    procedure setFmotive(const Value: String);
    procedure setFstatus_code(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDatetime);
    procedure setFterminal(const Value: Integer);
    procedure setFnumber(const Value: String);
    procedure setFSerie(const Value: String);

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

    [FieldName('number')]
    property Numero: String read Fnumber write setFnumber;

    [FieldName('serie')]
    property Serie: String read FSerie write setFSerie;

    [FieldName('status_code')]
    property Status: Integer read Fstatus_code write setFstatus_code;

    [FieldName('file_name')]
    property NomeArquivo: String read Ffile_name write setFfile_name;

    [FieldName('motive')]
    property Motivo: String read Fmotive write setFmotive;

    [FieldName('created_at')]
    property RegistroCriado: TDatetime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDatetime read Fupdated_at write setFupdated_at;

	End;

implementation



{ TInvoiceReturn55 }

procedure TInvoiceReturn55.setFcreated_at(const Value: TDatetime);
begin
  Fcreated_at := Value;
end;

procedure TInvoiceReturn55.setFfile_name(const Value: String);
begin
  Ffile_name := Value;
end;

procedure TInvoiceReturn55.setFid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TInvoiceReturn55.setFmotive(const Value: String);
begin
  Fmotive := Value;
end;

procedure TInvoiceReturn55.setFnumber(const Value: String);
begin
  Fnumber := Value;
end;

procedure TInvoiceReturn55.setFSerie(const Value: String);
begin
  FSerie := Value;
end;

procedure TInvoiceReturn55.setFstatus_code(const Value: Integer);
begin
  Fstatus_code := Value;
end;

procedure TInvoiceReturn55.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TInvoiceReturn55.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TInvoiceReturn55.setFupdated_at(const Value: TDatetime);
begin
  Fupdated_at := Value;
end;

end.

