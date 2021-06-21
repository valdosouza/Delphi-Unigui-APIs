unit tblMedParts;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_med_parts')]
  TMedParts = Class(TGenericEntity)
  private
    Ftb_med_material_id: Integer;
    Ftittle: String;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Fnr_repetition: Integer;
    Ftotal_value: Real;
    Ftable_value: Real;
    Faliq_desc: Real;
    Ftb_institution_id: Integer;
    Finsertion: Integer;
    Ftb_med_price_list_id: Integer;
    Funit_value: Real;
    Ftb_order_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFaliq_desc(const Value: Real);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFId(const Value: Integer);
    procedure setFinsertion(const Value: Integer);
    procedure setFnr_repetition(const Value: Integer);
    procedure setFtable_value(const Value: Real);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_med_material_id(const Value: Integer);
    procedure setFtb_med_price_list_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFtittle(const Value: String);
    procedure setFtotal_value(const Value: Real);
    procedure setFunit_value(const Value: Real);
    procedure setFupdated_at(const Value: TDAteTime);




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

    [FieldName('tittle')]
    property Titulo: String read Ftittle write setFtittle;

    [FieldName('tb_med_material_id')]
    property Material: Integer read Ftb_med_material_id write setFtb_med_material_id;

    [FieldName('tb_med_price_list_id')]
    property TabelaPosicao: Integer read Ftb_med_price_list_id write setFtb_med_price_list_id;

    [FieldName('insertion')]
    property Insercao: Integer read Finsertion write setFinsertion;

    [FieldName('nr_repetition')]
    property NumeroRepeticao: Integer read Fnr_repetition write setFnr_repetition;

    [FieldName('table_value')]
    property PrecoTabela: Real read Ftable_value write setFtable_value;

    [FieldName('unit_value')]
    property ValorUnidade: Real read Funit_value write setFunit_value;

    [FieldName('total_value')]
    property ValorTotal: Real read Ftotal_value write setFtotal_value;

    [FieldName('aliq_desc')]
    property DescontoAliquota: Real read Faliq_desc write setFaliq_desc;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;


implementation



{ TMedParts }

procedure TMedParts.setFaliq_desc(const Value: Real);
begin
  Faliq_desc := Value;
end;

procedure TMedParts.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TMedParts.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TMedParts.setFinsertion(const Value: Integer);
begin
  Finsertion := Value;
end;

procedure TMedParts.setFnr_repetition(const Value: Integer);
begin
  Fnr_repetition := Value;
end;

procedure TMedParts.setFtable_value(const Value: Real);
begin
  Ftable_value := Value;
end;

procedure TMedParts.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TMedParts.setFtb_med_material_id(const Value: Integer);
begin
  Ftb_med_material_id := Value;
end;

procedure TMedParts.setFtb_med_price_list_id(const Value: Integer);
begin
  Ftb_med_price_list_id := Value;
end;

procedure TMedParts.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TMedParts.setFtittle(const Value: String);
begin
  Ftittle := Value;
end;

procedure TMedParts.setFtotal_value(const Value: Real);
begin
  Ftotal_value := Value;
end;

procedure TMedParts.setFunit_value(const Value: Real);
begin
  Funit_value := Value;
end;

procedure TMedParts.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.


