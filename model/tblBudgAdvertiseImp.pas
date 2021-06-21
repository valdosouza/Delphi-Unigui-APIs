unit tblBudgAdvertiseImp;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_budg_advertise_imp')]
  TBudgAdvertiseImp = Class(TGenericEntity)

  private
    Fid: Integer;
    Fupdated_at: TDAteTime;
    Fformats: String;
    Ftb_institution_id: Integer;
    Finsertion: Integer;
    Ftb_broadcaster_id: Integer;
    Ftb_city_id: Integer;
    Ftb_budg_advertise_id: Integer;
    Fcreated_at: TDAteTime;
    Funit_value: real;
    Ftb_med_price_list_jr: Integer;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFformats(const Value: String);
    procedure setFid(const Value: Integer);
    procedure setFinsertion(const Value: Integer);
    procedure setFtb_broadcaster_id(const Value: Integer);
    procedure setFtb_budg_advertise_id(const Value: Integer);
    procedure setFtb_city_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFunit_value(const Value: real);
    procedure setFtb_med_price_list_jr(const Value: Integer);

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

    [FieldName('tb_med_price_list_jr_id')]
    property TabelaPreco: Integer read Ftb_med_price_list_jr write setFtb_med_price_list_jr;

    [FieldName('insertion')]
    property Insercao: Integer read Finsertion write setFinsertion;

    [FieldName('unit_value')]
    property ValorUnitario: real read Funit_value write setFunit_value;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;



implementation

{ TBudgAdvertiseImp }

procedure TBudgAdvertiseImp.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TBudgAdvertiseImp.setFformats(const Value: String);
begin
  Fformats := Value;
end;

procedure TBudgAdvertiseImp.setFid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TBudgAdvertiseImp.setFinsertion(const Value: Integer);
begin
  Finsertion := Value;
end;

procedure TBudgAdvertiseImp.setFtb_broadcaster_id(const Value: Integer);
begin
  Ftb_broadcaster_id := Value;
end;

procedure TBudgAdvertiseImp.setFtb_budg_advertise_id(const Value: Integer);
begin
  Ftb_budg_advertise_id := Value;
end;

procedure TBudgAdvertiseImp.setFtb_city_id(const Value: Integer);
begin
  Ftb_city_id := Value;
end;

procedure TBudgAdvertiseImp.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TBudgAdvertiseImp.setFtb_med_price_list_jr(const Value: Integer);
begin
  Ftb_med_price_list_jr := Value;
end;

procedure TBudgAdvertiseImp.setFunit_value(const Value: real);
begin
  Funit_value := Value;
end;

procedure TBudgAdvertiseImp.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
