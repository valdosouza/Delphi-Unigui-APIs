unit tblNoDocNumber;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_no_doc_number')]
  TNoDocNumber = Class(TGenericEntity)
  private
    Fid: Integer;
    Fupdated_at: TDatetime;
    Ftb_institution_id: Integer;
    Freference: Integer;
    Fcreated_at: TDatetime;
    procedure setFcreated_at(const Value: TDatetime);
    procedure setFid(const Value: Integer);
    procedure setFreference(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDatetime);


  public
    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read Fid write setFid;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [KeyField('reference')]
    [FieldName('reference')]
    property Referencia: Integer read Freference write setFreference;

    [FieldName('created_at')]
    property RegistroCriado: TDatetime read Fcreated_at write setFcreated_at;

	  [FieldName('updated_at')]
    property RegistroAlterado: TDatetime read Fupdated_at write setFupdated_at;

	End;

implementation

{ TNoDocNumber }

procedure TNoDocNumber.setFcreated_at(const Value: TDatetime);
begin
  Fcreated_at := Value;
end;

procedure TNoDocNumber.setFid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TNoDocNumber.setFreference(const Value: Integer);
begin
  Freference := Value;
end;

procedure TNoDocNumber.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TNoDocNumber.setFupdated_at(const Value: TDatetime);
begin
  Fupdated_at := Value;
end;

end.
