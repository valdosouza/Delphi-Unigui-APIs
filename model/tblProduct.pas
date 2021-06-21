unit tblProduct;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_product')]
  TProduct = Class(TGenericEntity)
  private
    Fhighlights: String;
    Fidentifier: String;
    Fnote: String;
    Fpublished: String;
    Fdescription: String;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Fpromotion: String;
    Ftb_institution_id: Integer;
    Ftb_category_id: Integer;
    Fcreated_at: TDAteTime;
    Factive: String;
    Ftb_financial_plans_id: Integer;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);

    procedure setFhighlights(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFidentifier(const Value: String);
    procedure setFnote(const Value: String);
    procedure setFpromotion(const Value: String);
    procedure setFpublished(const Value: String);
    procedure setFtb_category_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFactive(const Value: String);
    procedure setFtb_financial_plans_id(const Value: Integer);


  public
    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('identifier')]
    property Identificador: String read Fidentifier write setFidentifier;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('tb_category_id')]
    property Categoria: Integer read Ftb_category_id write setFtb_category_id;


    [FieldName('tb_financial_plans_id')]
    property CentroCusto: Integer read Ftb_financial_plans_id write setFtb_financial_plans_id;


    [FieldName('promotion')]
    property Promocao: String read Fpromotion write setFpromotion;

    [FieldName('highlights')]
    property Destaque: String read Fhighlights write setFhighlights;

    [FieldName('active')]
    property Ativo: String read Factive write setFactive;

    [FieldName('published')]
    property Publicado: String read Fpublished write setFpublished;

    [FieldName('note')]
    property Observaocao: String read Fnote write setFnote;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;


implementation

{ TProduct }

procedure TProduct.setFactive(const Value: String);
begin
  Factive := Value;
end;

procedure TProduct.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TProduct.setFdescription(const Value: String);
begin
  Fdescription := StringReplace(Value, '&', '\&',
                          [rfReplaceAll, rfIgnoreCase]);


end;


procedure TProduct.setFhighlights(const Value: String);
begin
  Fhighlights := Value;
end;

procedure TProduct.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TProduct.setFidentifier(const Value: String);
begin
  Fidentifier := Value;
end;

procedure TProduct.setFnote(const Value: String);
begin
  Fnote := Value;
end;

procedure TProduct.setFpromotion(const Value: String);
begin
  Fpromotion := Value;
end;

procedure TProduct.setFpublished(const Value: String);
begin
  Fpublished := Value;
end;

procedure TProduct.setFtb_category_id(const Value: Integer);
begin
  Ftb_category_id := Value;
end;

procedure TProduct.setFtb_financial_plans_id(const Value: Integer);
begin
  Ftb_financial_plans_id := Value;
end;

procedure TProduct.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TProduct.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
