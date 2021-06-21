unit tblBudgAdvertiseweb;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_budg_advertise_web')]
  TBudgAdvertiseWeb = Class(TGenericEntity)

  private
    Fid: Integer;
    Fupdated_at: TDAteTime;
    Fdays: Integer;
    Fformats: String;
    Ftb_institution_id: Integer;
    Ftb_broadcaster_id: Integer;
    Fpage_views: Integer;
    Ftb_city_id: Integer;
    Ftb_budg_advertise_id: Integer;
    Fcreated_at: TDAteTime;
    Funit_value: real;
    Ftb_med_price_list_ol: Integer;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdays(const Value: Integer);
    procedure setFformats(const Value: String);
    procedure setFid(const Value: Integer);
    procedure setFpage_views(const Value: Integer);
    procedure setFtb_broadcaster_id(const Value: Integer);
    procedure setFtb_budg_advertise_id(const Value: Integer);
    procedure setFtb_city_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFunit_value(const Value: real);
    procedure setFtb_med_price_list_ol(const Value: Integer);

  public

    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read Fid write setFid;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [KeyField('tb_budg_advertise_id')]
    [FieldName('tb_budg_advertise_id')]
    property Anuncio: Integer read Ftb_budg_advertise_id write setFtb_budg_advertise_id;

    [FieldName('tb_city_id')]
    property Cidade: Integer read Ftb_city_id write setFtb_city_id;

    [FieldName('tb_broadcaster_id')]
    property Veiculo: Integer read Ftb_broadcaster_id write setFtb_broadcaster_id;

    [FieldName('formats')]
    property Formato: String read Fformats write setFformats;

    [FieldName('tb_med_price_list_ol_id')]
    property TabelaPreco: Integer read Ftb_med_price_list_ol write setFtb_med_price_list_ol;

    [FieldName('days')]
    property Dias: Integer read Fdays write setFdays;

    [FieldName('page_views')]
    property PageViews: Integer read Fpage_views write setFpage_views;

    [FieldName('unit_value')]
    property ValorUnitario: real read Funit_value write setFunit_value;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;

implementation

{ TBudgAdvertiseWeb }

procedure TBudgAdvertiseWeb.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TBudgAdvertiseWeb.setFdays(const Value: Integer);
begin
  Fdays := Value;
end;

procedure TBudgAdvertiseWeb.setFformats(const Value: String);
begin
  Fformats := Value;
end;

procedure TBudgAdvertiseWeb.setFid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TBudgAdvertiseWeb.setFpage_views(const Value: Integer);
begin
  Fpage_views := Value;
end;

procedure TBudgAdvertiseWeb.setFtb_broadcaster_id(const Value: Integer);
begin
  Ftb_broadcaster_id := Value;
end;

procedure TBudgAdvertiseWeb.setFtb_budg_advertise_id(const Value: Integer);
begin
  Ftb_budg_advertise_id := Value;
end;

procedure TBudgAdvertiseWeb.setFtb_city_id(const Value: Integer);
begin
  Ftb_city_id := Value;
end;

procedure TBudgAdvertiseWeb.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TBudgAdvertiseWeb.setFtb_med_price_list_ol(const Value: Integer);
begin
  Ftb_med_price_list_ol := Value;
end;

procedure TBudgAdvertiseWeb.setFunit_value(const Value: real);
begin
  Funit_value := Value;
end;

procedure TBudgAdvertiseWeb.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
