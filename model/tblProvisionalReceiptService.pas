unit tblProvisionalReceiptService;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_provisional_receipt_service')]
  TProvisionalReceiptService = Class(TGenericEntity)
  private
    Fnote: String;
    Fprotocol: String;
    Fid: Integer;
    Fupdated_at: TDatetime;
    Fnumber: Integer;
    Fdt_record: TDateTime;
    Fnr_lot: Integer;
    Ftb_institution_id: Integer;
    Fterminal: Integer;
    Fcreated_at: TDatetime;
    procedure setFcreated_at(const Value: TDatetime);
    procedure setFdt_record(const Value: TDateTime);
    procedure setFid(const Value: Integer);
    procedure setFnote(const Value: String);
    procedure setFnr_lot(const Value: Integer);
    procedure setFnumber(const Value: Integer);
    procedure setFprotocol(const Value: String);
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

    [FieldName('dt_record')]
    property DataEmissao: TDateTime read Fdt_record write setFdt_record;

    [FieldName('number')]
    property Numero: Integer read Fnumber write setFnumber;

    [FieldName('nr_lot')]
    property Lote: Integer read Fnr_lot write setFnr_lot;

    [FieldName('protocol')]
    property protocolo: String read Fprotocol write setFprotocol;

    [FieldName('note')]
    property Observacao: String read Fnote write setFnote;

  	[FieldName('created_at')]
    property RegistroCriado: TDatetime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDatetime read Fupdated_at write setFupdated_at;

  End;

implementation

{ TProvisionalReceiptService }

procedure TProvisionalReceiptService.setFcreated_at(const Value: TDatetime);
begin
  Fcreated_at := Value;
end;

procedure TProvisionalReceiptService.setFdt_record(const Value: TDateTime);
begin
  Fdt_record := Value;
end;

procedure TProvisionalReceiptService.setFid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TProvisionalReceiptService.setFnote(const Value: String);
begin
  Fnote := Value;
end;

procedure TProvisionalReceiptService.setFnr_lot(const Value: Integer);
begin
  Fnr_lot := Value;
end;

procedure TProvisionalReceiptService.setFnumber(const Value: Integer);
begin
  Fnumber := Value;
end;

procedure TProvisionalReceiptService.setFprotocol(const Value: String);
begin
  Fprotocol := Value;
end;

procedure TProvisionalReceiptService.setFtb_institution_id(
  const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TProvisionalReceiptService.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TProvisionalReceiptService.setFupdated_at(const Value: TDatetime);
begin
  Fupdated_at := Value;
end;

end.
