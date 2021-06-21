unit tblOrderBudgedItemPi;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_order_bud_it_med_jr')]
  TOrderBudItMedJr = Class(TGenericEntity)
  private
    Faliq_desc: real;
    Fcolor: string;
    Fnr_height: String;
    FId: Integer;
    Funit_value: real;
    Ftb_med_pos_prog_id: Integer;
    Fupdated_at: TDAteTime;
    Ftable_value: real;
    Ftb_institution_id: Integer;
    Finsertion: Integer;
    Fday: string;
    Ftb_broadcaster_id: Integer;
    Fnr_column: String;
    Ftb_order_id: Integer;
    Fcreated_at: TDAteTime;
    Fterminal: Integer;
    procedure setFaliq_desc(const Value: real);
    procedure setFcolor(const Value: string);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFday(const Value: string);
    procedure setFId(const Value: Integer);
    procedure setFinsertion(const Value: Integer);
    procedure setFnr_column(const Value: String);
    procedure setFnr_height(const Value: String);
    procedure setFtable_value(const Value: real);
    procedure setFtb_broadcaster_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_med_pos_prog_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFunit_value(const Value: real);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFterminal(const Value: Integer);

  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_order_id')]
    [KeyField('tb_order_id')]
    property Ordem: Integer read Ftb_order_id write setFtb_order_id;

    [FieldName('terminal')]
    [KeyField('terminal')]
    property Terminal: Integer read Fterminal write setFterminal;

    [FieldName('tb_broadcaster_id')]
    property Veiculo: Integer read Ftb_broadcaster_id write setFtb_broadcaster_id;

    [FieldName('tb_med_pos_prog_id')]
    property Posicao: Integer read Ftb_med_pos_prog_id write setFtb_med_pos_prog_id;

    [FieldName('day')]
    property Dia: string read Fday write setFday;

    [FieldName('color')]
    property Cor: string read Fcolor write setFcolor;

    [FieldName('table_value')]
    property ValorTabela: real read Ftable_value write setFtable_value;

    [FieldName('aliq_desc')]
    property Desconto: real read Faliq_desc write setFaliq_desc;

    [FieldName('unit_value')]
    property ValorUnitario: real read Funit_value write setFunit_value;

    [FieldName('nr_column')]
    property Coluna: String read Fnr_column write setFnr_column;

    [FieldName('nr_height')]
    property Altura: String read Fnr_height write setFnr_height;

    [FieldName('insertion')]
    property insercao: Integer read Finsertion write setFinsertion;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation


{ TOrderBudItMedJr }

procedure TOrderBudItMedJr.setFaliq_desc(const Value: real);
begin
  Faliq_desc := Value;
end;

procedure TOrderBudItMedJr.setFcolor(const Value: string);
begin
  Fcolor := Value;
end;

procedure TOrderBudItMedJr.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TOrderBudItMedJr.setFday(const Value: string);
begin
  Fday := Value;
end;

procedure TOrderBudItMedJr.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TOrderBudItMedJr.setFinsertion(const Value: Integer);
begin
  Finsertion := Value;
end;

procedure TOrderBudItMedJr.setFnr_column(const Value: String);
begin
  Fnr_column := Value;
end;

procedure TOrderBudItMedJr.setFnr_height(const Value: String);
begin
  Fnr_height := Value;
end;

procedure TOrderBudItMedJr.setFtable_value(const Value: real);
begin
  Ftable_value := Value;
end;

procedure TOrderBudItMedJr.setFtb_broadcaster_id(const Value: Integer);
begin
  Ftb_broadcaster_id := Value;
end;

procedure TOrderBudItMedJr.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TOrderBudItMedJr.setFtb_med_pos_prog_id(const Value: Integer);
begin
  Ftb_med_pos_prog_id := Value;
end;

procedure TOrderBudItMedJr.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TOrderBudItMedJr.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TOrderBudItMedJr.setFunit_value(const Value: real);
begin
  Funit_value := Value;
end;

procedure TOrderBudItMedJr.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
