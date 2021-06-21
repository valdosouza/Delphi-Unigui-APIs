unit tblInvoiceReturnService;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_invoice_return_service')]
  TInvoiceReturnService = Class(TGenericEntity)
  private
    Fcode_verif: String;
    Fsynchronous: String;
    Fmotive: String;
    Fnr_rps: Integer;
    Fprotocol: String;
    Fid: Integer;
    Fupdated_at: TDatetime;
    Fnumber: String;
    Fstatus_code: Integer;
    Fnr_lot: Integer;
    Ffile_name: String;
    Ftb_institution_id: Integer;
    Fkind: String;
    Fterminal: Integer;
    Fcreated_at: TDatetime;
    procedure setFcode_verif(const Value: String);
    procedure setFcreated_at(const Value: TDatetime);
    procedure setFfile_name(const Value: String);
    procedure setFid(const Value: Integer);
    procedure setFkind(const Value: String);
    procedure setFmotive(const Value: String);
    procedure setFnr_lot(const Value: Integer);
    procedure setFnr_rps(const Value: Integer);
    procedure setFnumber(const Value: String);
    procedure setFprotocol(const Value: String);
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

    [FieldName('nr_rps')]
    property Rps: Integer read Fnr_rps write setFnr_rps;

    [FieldName('nr_lot')]
    property Lote: Integer read Fnr_lot write setFnr_lot;

    [FieldName('protocol')]
    property protocolo: String read Fprotocol write setFprotocol;

    [FieldName('code_verif')]
    property CodigoVerificacao: String read Fcode_verif write setFcode_verif;

    [FieldName('kind')]
    property Tipo: String read Fkind write setFkind;

    [FieldName('synchronous')]
    property Sincrono: String read Fsynchronous write setFsynchronous;

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



{ TInvoiceReturnService }

procedure TInvoiceReturnService.setFcode_verif(const Value: String);
begin
  Fcode_verif := Value;
end;

procedure TInvoiceReturnService.setFcreated_at(const Value: TDatetime);
begin
  Fcreated_at := Value;
end;

procedure TInvoiceReturnService.setFfile_name(const Value: String);
begin
  Ffile_name := Value;
end;

procedure TInvoiceReturnService.setFid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TInvoiceReturnService.setFkind(const Value: String);
begin
  Fkind := Value;
end;

procedure TInvoiceReturnService.setFmotive(const Value: String);
begin
  Fmotive := Value;
end;

procedure TInvoiceReturnService.setFnr_lot(const Value: Integer);
begin
  Fnr_lot := Value;
end;

procedure TInvoiceReturnService.setFnr_rps(const Value: Integer);
begin
  Fnr_rps := Value;
end;

procedure TInvoiceReturnService.setFnumber(const Value: String);
begin
  Fnumber := Value;
end;

procedure TInvoiceReturnService.setFprotocol(const Value: String);
begin
  Fprotocol := Value;
end;

procedure TInvoiceReturnService.setFstatus_code(const Value: Integer);
begin
  Fstatus_code := Value;
end;

procedure TInvoiceReturnService.setFsynchronous(const Value: String);
begin
  Fsynchronous := Value;
end;

procedure TInvoiceReturnService.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TInvoiceReturnService.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TInvoiceReturnService.setFupdated_at(const Value: TDatetime);
begin
  Fupdated_at := Value;
end;

end.
