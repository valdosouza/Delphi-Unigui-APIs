unit tblOrderPacking;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_order_packing')]
  TOrderPacking = Class(TGenericEntity)
  private
    Ftb_order_id: Integer;
    Fid: Integer;
    Ftb_entity_id: Integer;
    Ftb_situation_id : Integer;
    Fupdated_at: TDAteTime;
    Fnumber: Integer;
    Ftb_institution_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFid(const Value: Integer);
    procedure setFnumber(const Value: Integer);
    procedure setFtb_entity_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFtb_situation_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);

 public
    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read Fid write setFid;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('number')]
    property Numero: Integer read Fnumber write setFnumber;

    [FieldName('tb_entity_id')]
    property Entidade: Integer read Ftb_entity_id write setFtb_entity_id;

    [FieldName('tb_situation_id')]
    property Situacao: Integer read Ftb_situation_id write setFtb_situation_id;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

	End;

implementation

{ TOrderPacking }

procedure TOrderPacking.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TOrderPacking.setFid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TOrderPacking.setFnumber(const Value: Integer);
begin
  Fnumber := Value;
end;

procedure TOrderPacking.setFtb_entity_id(const Value: Integer);
begin
  Ftb_entity_id := Value;
end;

procedure TOrderPacking.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TOrderPacking.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TOrderPacking.setFtb_situation_id(const Value: Integer);
begin
  Ftb_situation_id := Value;
end;

procedure TOrderPacking.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
