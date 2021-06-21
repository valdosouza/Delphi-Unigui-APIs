unit tblMedInsertDate;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_med_insert_date')]
  TMedInsertDate = Class(TGenericEntity)
  private
    FId: Integer;
    Fqt_insertion: Integer;
    Fupdated_at: TDAteTime;
    Fdt_insertion: TDateTime;
    Ftb_institution_id: Integer;
    Fweek_day: String;
    Ftb_order_id: Integer;
    Ftb_med_parts_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdt_insertion(const Value: TDateTime);
    procedure setFId(const Value: Integer);
    procedure setFqt_insertion(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_med_parts_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFweek_day(const Value: String);


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

    [FieldName('tb_med_parts_id')]
    [KeyField('tb_med_parts_id')]
    property PosicaoPecas: Integer read Ftb_med_parts_id write setFtb_med_parts_id;

    [FieldName('dt_insertion')]
    property DataInsercao: TDateTime read Fdt_insertion write setFdt_insertion;

    [FieldName('week_day')]
    property DiaSemana: String read Fweek_day write setFweek_day;

    [FieldName('qt_insertion')]
    property QuantidadeInsercao: Integer read Fqt_insertion write setFqt_insertion;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;


implementation




{ TMedInsertDate }

procedure TMedInsertDate.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TMedInsertDate.setFdt_insertion(const Value: TDateTime);
begin
  Fdt_insertion := Value;
end;

procedure TMedInsertDate.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TMedInsertDate.setFqt_insertion(const Value: Integer);
begin
  Fqt_insertion := Value;
end;

procedure TMedInsertDate.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TMedInsertDate.setFtb_med_parts_id(const Value: Integer);
begin
  Ftb_med_parts_id := Value;
end;

procedure TMedInsertDate.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TMedInsertDate.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

procedure TMedInsertDate.setFweek_day(const Value: String);
begin
  Fweek_day := Value;
end;

end.

