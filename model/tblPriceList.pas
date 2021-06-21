unit tblPriceList;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_price_list')]
  TPriceList = Class(TGenericEntity)
  private
    Fdescription: String;
    FId: Integer;
    Faliq_profit: Real;
    Fupdated_at: TDAteTime;
    Ftb_institution_id: Integer;
    Fmodality: String;
    Fvalidity: TDateTime;
    Fcreated_at: TDAteTime;
    procedure setFaliq_profit(const Value: Real);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFmodality(const Value: String);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFvalidity(const Value: TDateTime);


  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('validity')]
    property Validade: TDateTime read Fvalidity write setFvalidity;

    [FieldName('modality')]
    property Modalidade: String read Fmodality write setFmodality;

    [FieldName('aliq_profit')]
    property MargemLucro: Real read Faliq_profit write setFaliq_profit;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;


implementation


{ TPriceList }

procedure TPriceList.setFaliq_profit(const Value: Real);
begin
  Faliq_profit := Value;
end;

procedure TPriceList.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TPriceList.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TPriceList.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TPriceList.setFmodality(const Value: String);
begin
  Fmodality := Value;
end;

procedure TPriceList.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TPriceList.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

procedure TPriceList.setFvalidity(const Value: TDateTime);
begin
  Fvalidity := Value;
end;

end.

