unit tblSalesman;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_salesman')]
  TSalesman = Class(TGenericEntity)
  private
    Faliq_kickback: Real;
    Factive: String;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Fkickback_product: String;
    Ftb_institution_id: Integer;
    Fcreated_at: TDAteTime;
    FValorFlex: Real;
    procedure setFactive(const Value: String);
    procedure setFaliq_kickback(const Value: Real);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFId(const Value: Integer);
    procedure setFkickback_product(const Value: String);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFValorFlex(const Value: Real);

  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('active')]
    property Ativo: String read Factive write setFactive;

    [FieldName('aliq_kickback')]
    property AliquotaComissao: Real read Faliq_kickback write setFaliq_kickback;

    [FieldName('flex_value')]
    property ValorFlex: Real read FValorFlex write setFValorFlex;

    [FieldName('kickback_product')]
    property ComissaoProduto: String read Fkickback_product write setFkickback_product;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation


{ TSalesman }

procedure TSalesman.setFactive(const Value: String);
begin
  Factive := Value;
end;

procedure TSalesman.setFaliq_kickback(const Value: Real);
begin
  Faliq_kickback := Value;
end;

procedure TSalesman.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TSalesman.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TSalesman.setFkickback_product(const Value: String);
begin
  Fkickback_product := Value;
end;

procedure TSalesman.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TSalesman.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

procedure TSalesman.setFValorFlex(const Value: Real);
begin
  FValorFlex := Value;
end;

end.
