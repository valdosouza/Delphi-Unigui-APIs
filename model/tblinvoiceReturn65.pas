unit tblInvoiceReturn65;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_invoice_return_65')]
  TInvoiceReturn65 = Class(TGenericEntity)
  private
    Fpresen_indi: String;
    Fsynchronous: String;
    Fmotive: String;
    Fid: Integer;
    FSerie: String;
    Fupdated_at: TDatetime;
    Femissi_type: String;
    Fnumber: String;
    Fstatus_code: Integer;
    Fformat_type: String;
    Fnr_lot: Integer;
    Ffile_name: String;
    Ftb_institution_id: Integer;
    Fterminal: Integer;
    Fcreated_at: TDatetime;
    procedure setFcreated_at(const Value: TDatetime);
    procedure setFemissi_type(const Value: String);
    procedure setFfile_name(const Value: String);
    procedure setFformat_type(const Value: String);
    procedure setFid(const Value: Integer);
    procedure setFmotive(const Value: String);
    procedure setFnr_lot(const Value: Integer);
    procedure setFnumber(const Value: String);
    procedure setFpresen_indi(const Value: String);
    procedure setFSerie(const Value: String);
    procedure setFstatus_code(const Value: Integer);
    procedure setFsynchronous(const Value: String);
    procedure setFtb_institution_id(const Value: Integer);
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

    [FieldName('number')]
    property Numero: String read Fnumber write setFnumber;

    [FieldName('serie')]
    property Serie: String read FSerie write setFSerie;

    [FieldName('nr_lot')]
    property Lote: Integer read Fnr_lot write setFnr_lot;

    [FieldName('synchronous')]
    property Sincrono: String read Fsynchronous write setFsynchronous;

    [FieldName('emissi_type')]
    property TipoEmissao: String read Femissi_type write setFemissi_type;

    [FieldName('format_type')]
    property TipoFormato: String read Fformat_type write setFformat_type;

    [FieldName('presen_indi')]
    property IndicadorPresenca: String read Fpresen_indi write setFpresen_indi;

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

{ TInvoiceReturn65 }

procedure TInvoiceReturn65.setFcreated_at(const Value: TDatetime);
begin
  Fcreated_at := Value;
end;

procedure TInvoiceReturn65.setFemissi_type(const Value: String);
begin
  Femissi_type := Value;
end;

procedure TInvoiceReturn65.setFfile_name(const Value: String);
begin
  Ffile_name := Value;
end;

procedure TInvoiceReturn65.setFformat_type(const Value: String);
begin
  Fformat_type := Value;
end;

procedure TInvoiceReturn65.setFid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TInvoiceReturn65.setFmotive(const Value: String);
begin
  Fmotive := Value;
end;

procedure TInvoiceReturn65.setFnr_lot(const Value: Integer);
begin
  Fnr_lot := Value;
end;

procedure TInvoiceReturn65.setFnumber(const Value: String);
begin
  Fnumber := Value;
end;

procedure TInvoiceReturn65.setFpresen_indi(const Value: String);
begin
  Fpresen_indi := Value;
end;

procedure TInvoiceReturn65.setFSerie(const Value: String);
begin
  FSerie := Value;
end;

procedure TInvoiceReturn65.setFstatus_code(const Value: Integer);
begin
  Fstatus_code := Value;
end;

procedure TInvoiceReturn65.setFsynchronous(const Value: String);
begin
  Fsynchronous := Value;
end;

procedure TInvoiceReturn65.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TInvoiceReturn65.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TInvoiceReturn65.setFupdated_at(const Value: TDatetime);
begin
  Fupdated_at := Value;
end;

end.

