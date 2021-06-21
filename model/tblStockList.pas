unit tblStockList;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_stock_list')]
  TStockList = Class(TGenericEntity)
  private
    Ftb_institution_id: Integer;
    Fdescription: String;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Fkind: String;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFkind(const Value: String);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);

  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('kind')]
    property Tipo: String read Fkind write setFkind;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;


implementation

{ TStockList }

procedure TStockList.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TStockList.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TStockList.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TStockList.setFkind(const Value: String);
begin
  Fkind := Value;
end;

procedure TStockList.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TStockList.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.

