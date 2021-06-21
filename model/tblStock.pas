unit tblStock;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_stock')]
  TStock = Class(TGenericEntity)
  private
    Foutline: String;
    Fweight: Real;
    Ftb_measure_id: Integer;
    Fcost_manufactures: Real;
    Fst: String;
    Fcost_price: Real;
    Fheight: Real;
    Ftb_merchandise_id: Integer;
    Ftb_color_id: Integer;
    Fupdated_at: TDAteTime;
    Fminimum: Real;
    Fwidth: Real;
    Flocation: String;
    Fquantity: Real;
    Factual_cost: Real;
    Fcodebar: String;
    Ftb_institution_id: Integer;
    Fnegative: String;
    Flength: Real;
    Fcreated_at: TDAteTime;
    Fdivisor: Integer;
    Ftb_package_id: Integer;
    Flink_url: String;

    procedure setFactual_cost(const Value: Real);
    procedure setFcodebar(const Value: String);
    procedure setFcost_manufactures(const Value: Real);
    procedure setFcost_price(const Value: Real);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdivisor(const Value: Integer);
    procedure setFheight(const Value: Real);
    procedure setFlength(const Value: Real);
    procedure setFlocation(const Value: String);
    procedure setFminimum(const Value: Real);
    procedure setFnegative(const Value: String);
    procedure setFoutline(const Value: String);
    procedure setFquantity(const Value: Real);
    procedure setFst(const Value: String);
    procedure setFtb_color_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_measure_id(const Value: Integer);
    procedure setFtb_merchandise_id(const Value: Integer);
    procedure setFtb_package_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFweight(const Value: Real);
    procedure setFwidth(const Value: Real);
    procedure setFlink_url(const Value: String);



  public

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [KeyField('tb_merchandise_id')]
    [FieldName('tb_merchandise_id')]
     property Mercadoria: Integer read Ftb_merchandise_id write setFtb_merchandise_id;

    [FieldName('tb_package_id')]
     property Embalagem: Integer read Ftb_package_id write setFtb_package_id;

    [FieldName('tb_measure_id')]
     property Medida: Integer read Ftb_measure_id write setFtb_measure_id;

    [FieldName('tb_color_id')]
     property Cor: Integer read Ftb_color_id write setFtb_color_id;

    [FieldName('codebar')]
     property CodigoBarra: String read Fcodebar write setFcodebar;

    [FieldName('st')]
     property TemST: String read Fst write setFst;

    [FieldName('quantity')]
    property Qtde: Real read Fquantity write setFquantity;

    [FieldName('minimum')]
    property QtdeMinima: Real read Fminimum write setFminimum;

    [FieldName('divisor')]
    property Divisor: Integer read Fdivisor write setFdivisor;

    [FieldName('location')]
     property Localizacao: String read Flocation write setFlocation;

    [FieldName('weight')]
    property Peso: Real read Fweight write setFweight;

    [FieldName('width')]
    property Largura: Real read Fwidth write setFwidth;

    [FieldName('length')]
    property Comprimento: Real read Flength write setFlength;

    [FieldName('height')]
    property Altura: Real read Fheight write setFheight;

    [FieldName('cost_manufactures')]
    property CustoFabrica: Real read Fcost_manufactures write setFcost_manufactures;

    [FieldName('actual_cost')]
    property  CustoReal: Real read Factual_cost write setFactual_cost;

    [FieldName('cost_price')]
    property PrecoCusto: Real read Fcost_price write setFcost_price;

    [FieldName('negative')]
     property EstoqueNegativa: String read Fnegative write setFnegative;

    [FieldName('outline')]
     property ForaDeLinha: String read Foutline write setFoutline;

    //Retirado por que a migração do Desktop para Web não há dados
    //[FieldName('link_url')]
    property linkUrl: String read Flink_url write setFlink_url;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;


implementation


{ TStock }

procedure TStock.setFactual_cost(const Value: Real);
begin
  Factual_cost := Value;
end;

procedure TStock.setFcodebar(const Value: String);
begin
  Fcodebar := Value;
end;

procedure TStock.setFcost_manufactures(const Value: Real);
begin
  Fcost_manufactures := Value;
end;

procedure TStock.setFcost_price(const Value: Real);
begin
  Fcost_price := Value;
end;

procedure TStock.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TStock.setFdivisor(const Value: Integer);
begin
  Fdivisor := Value;
end;

procedure TStock.setFheight(const Value: Real);
begin
  Fheight := Value;
end;

procedure TStock.setFlength(const Value: Real);
begin
  Flength := Value;
end;

procedure TStock.setFlink_url(const Value: String);
begin
  Flink_url := Value;
end;

procedure TStock.setFlocation(const Value: String);
begin
  Flocation := Value;
end;

procedure TStock.setFminimum(const Value: Real);
begin
  Fminimum := Value;
end;

procedure TStock.setFnegative(const Value: String);
begin
  Fnegative := Value;
end;

procedure TStock.setFoutline(const Value: String);
begin
  Foutline := Value;
end;

procedure TStock.setFquantity(const Value: Real);
begin
  Fquantity := Value;
end;

procedure TStock.setFst(const Value: String);
begin
  Fst := Value;
end;

procedure TStock.setFtb_color_id(const Value: Integer);
begin
  Ftb_color_id := Value;
end;

procedure TStock.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TStock.setFtb_measure_id(const Value: Integer);
begin
  Ftb_measure_id := Value;
end;

procedure TStock.setFtb_merchandise_id(const Value: Integer);
begin
  Ftb_merchandise_id := Value;
end;

procedure TStock.setFtb_package_id(const Value: Integer);
begin
  Ftb_package_id := Value;
end;

procedure TStock.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

procedure TStock.setFweight(const Value: Real);
begin
  Fweight := Value;
end;

procedure TStock.setFwidth(const Value: Real);
begin
  Fwidth := Value;
end;

end.
