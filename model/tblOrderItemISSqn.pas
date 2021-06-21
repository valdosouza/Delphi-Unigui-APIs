unit tblOrderItemISSqn;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_order_item_issqn')]
  TOrderItemIssQN = Class(TGenericEntity)
  private
    Ftb_order_item_id : integer;
    Ftb_institution_id : integer;
    Fbase_value : Real;
    Faliq_value : Real;
    Ftag_value : Real;
    Flistservice : String;
    Ftax_code : String;
    Fcreated_at : TDateTime;
	  Fupdated_at : TDateTime;
    Fterminal: Integer;

    procedure setFtb_order_item_id(Value : integer);
    procedure setFtb_institution_id(Value : integer);
    procedure setFbase_value(Value : Real);
    procedure setFaliq_value(Value : Real);
    procedure setFtag_value(Value : Real);
    procedure setFlistservice(Value : String);
    procedure setFtax_code(Value : String);
    procedure setFcreated_at(Value : tdatetime);
	  procedure setFupdated_at(Value : tdatetime);
    procedure setFterminal(const Value: Integer);

  public
    [KeyField('tb_order_item_id')]
    [FieldName('tb_order_item_id')]
    property ItemOrdem: Integer read Ftb_order_item_id write setFtb_order_item_id;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('terminal')]
    [KeyField('terminal')]
    property Terminal: Integer read Fterminal write setFterminal;

    [FieldName('base_value')]
    property ValorBase: Real read Fbase_value write setFbase_value;

    [FieldName('aliq_value')]
    property ValorAliquota: Real read Faliq_value write setFaliq_value;

    [FieldName('tag_value')]
    property Valor: Real read Ftag_value write setFtag_value;

    [FieldName('listservice')]
    property ListaServicos: String read Flistservice write setFlistservice;

	  [FieldName('tax_code')]
    property CodigoTaxa: String read Ftax_code write setFtax_code;

    [FieldName('created_at')]
    property RegistroCriado: TDatetime read Fcreated_at write setFcreated_at;

	  [FieldName('updated_at')]
    property RegistroAlterado: TDatetime read Fupdated_at write setFupdated_at;

	End;

implementation





{ TOrderItemIssQN }

procedure TOrderItemIssQN.setFaliq_value(Value: Real);
begin
  Faliq_value := Value;
end;

procedure TOrderItemIssQN.setFbase_value(Value: Real);
begin
  Fbase_value := Value;
end;

procedure TOrderItemIssQN.setFcreated_at(Value: tdatetime);
begin
  Fcreated_at := Value;
end;

procedure TOrderItemIssQN.setFlistservice(Value: String);
begin
  Flistservice := Value;
end;

procedure TOrderItemIssQN.setFtag_value(Value: Real);
begin
  Ftag_value := Value;
end;

procedure TOrderItemIssQN.setFtax_code(Value: String);
begin
  Ftax_code := Value;
end;

procedure TOrderItemIssQN.setFtb_institution_id(Value: integer);
begin
  Ftb_institution_id := Value;
end;

procedure TOrderItemIssQN.setFtb_order_item_id(Value: integer);
begin
  Ftb_order_item_id := Value;
end;

procedure TOrderItemIssQN.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TOrderItemIssQN.setFupdated_at(Value: tdatetime);
begin
  Fupdated_at := Value;
end;

end.
