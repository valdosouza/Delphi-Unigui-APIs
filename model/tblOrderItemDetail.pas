unit tblOrderItemDetail;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_order_item_detail')]
  TOrderItemDetail = Class(TGenericEntity)
  private
    FId: Integer;
    Fnote: String;
    Fupdated_at: TDAteTime;
    Ftb_order_item_id: Integer;
    Ftb_order_item_detached_id: Integer;
    Ftb_institution_id: Integer;
    FKind: String;
    Fterminal: Integer;
    Ftb_order_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFId(const Value: Integer);
    procedure setFKind(const Value: String);
    procedure setFnote(const Value: String);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFtb_order_item_detached_id(const Value: Integer);
    procedure setFtb_order_item_id(const Value: Integer);
    procedure setFterminal(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);



  public
    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read FId write setFId;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [KeyField('tb_order_id')]
    [FieldName('tb_order_id')]
    property Ordem: Integer read Ftb_order_id write setFtb_order_id;

    [KeyField('terminal')]
    [FieldName('terminal')]
    property Terminal: Integer read Fterminal write setFterminal;

    [FieldName('tb_order_item_id')]
    property Item: Integer read Ftb_order_item_id write setFtb_order_item_id;

    [FieldName('tb_order_item_detached_id')]
    property ItemAvulso: Integer read Ftb_order_item_detached_id write setFtb_order_item_detached_id;

    [FieldName('kind')]
    property Tipo: String read FKind write setFKind;

    [FieldName('note')]
    property Detalhes: String read Fnote write setFnote;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;


implementation

{ TOrderItemDetail }

procedure TOrderItemDetail.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TOrderItemDetail.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TOrderItemDetail.setFKind(const Value: String);
begin
  FKind := Value;
end;

procedure TOrderItemDetail.setFnote(const Value: String);
begin
  Fnote := Value;
end;

procedure TOrderItemDetail.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TOrderItemDetail.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TOrderItemDetail.setFtb_order_item_detached_id(const Value: Integer);
begin
  Ftb_order_item_detached_id := Value;
end;

procedure TOrderItemDetail.setFtb_order_item_id(const Value: Integer);
begin
  Ftb_order_item_id := Value;
end;

procedure TOrderItemDetail.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TOrderItemDetail.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
