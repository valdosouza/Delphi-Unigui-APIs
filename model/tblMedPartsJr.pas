unit tblMedPartsJr;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_med_parts_jr')]
  TMedPartsJr = Class(TGenericEntity)
  private
    FId: Integer;
    Fupdated_at: TDAteTime;
    Ftb_institution_id: Integer;
    Ftb_order_id :Integer;
    Fnr_column : String;
    Fnr_height : String;
    Fcolor : String;
    Fday : String;
    Fcreated_at: TDAteTime;
    procedure setFcolor(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFday(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFnr_column(const Value: String);
    procedure setFnr_height(const Value: String);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
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

    [FieldName('nr_column')]
    property NumeroColuna: String read Fnr_column write setFnr_column;

    [FieldName('nr_height')]
    property NumeroAltura: String read Fnr_height write setFnr_height;

    [FieldName('color')]
    property Cor: String read Fcolor write setFcolor;

    [FieldName('day')]
    property Dia: String read Fday write setFday;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;


implementation






{ TMedPartsJr }

procedure TMedPartsJr.setFcolor(const Value: String);
begin
  Fcolor := Value;
end;

procedure TMedPartsJr.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TMedPartsJr.setFday(const Value: String);
begin
  Fday := Value;
end;

procedure TMedPartsJr.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TMedPartsJr.setFnr_column(const Value: String);
begin
  Fnr_column := Value;
end;

procedure TMedPartsJr.setFnr_height(const Value: String);
begin
  Fnr_height := Value;
end;

procedure TMedPartsJr.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TMedPartsJr.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TMedPartsJr.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
