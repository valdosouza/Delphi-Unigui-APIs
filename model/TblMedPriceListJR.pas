unit TblMedPriceListJR;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_med_price_list_jr')]
  TMedPriceListJR = Class(TGenericEntity)
  private
    Fweek_day_value: Real;
    Fnr_columns: integer;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Fsun_day_value: Real;
    Ftb_med_pos_prog_id: Integer;
    Ftb_institution_id: Integer;
    Ftb_broadcaster_id: Integer;
    Fsize_columns: integer;
    Fcreated_at: TDAteTime;
    Faddition: Real;
    Fonline_discount: Real;
    Fonline_price: Real;
    Fpath_file: String;
    Fformats: String;
    Fmeasure: String;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFId(const Value: Integer);
    procedure setFnr_columns(const Value: integer);
    procedure setFsize_columns(const Value: integer);
    procedure setFsun_day_value(const Value: Real);
    procedure setFtb_broadcaster_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_med_pos_prog_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFweek_day_value(const Value: Real);
    procedure setFaddition(const Value: Real);
    procedure setFformats(const Value: String);
    procedure setFmeasure(const Value: String);
    procedure setFonline_discount(const Value: Real);
    procedure setFonline_price(const Value: Real);
    procedure setFpath_file(const Value: String);

  public
    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read FId write setFId;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [KeyField('tb_broadcaster_id')]
    [FieldName('tb_broadcaster_id')]
    property Veiculo: Integer read Ftb_broadcaster_id write setFtb_broadcaster_id;

    [FieldName('tb_med_pos_prog_id')]
    property PosicaoProgramacao: Integer read Ftb_med_pos_prog_id write setFtb_med_pos_prog_id;

    [FieldName('week_day_value')]
    property ValorDiaUtil: Real read Fweek_day_value write setFweek_day_value;

    [FieldName('sun_day_value')]
    property ValorDomingo: Real read Fsun_day_value write setFsun_day_value;

    [FieldName('addition')]
    property AdicionalCor: Real read Faddition write setFaddition;

    [FieldName('nr_columns')]
    property NumeroColunas: integer read Fnr_columns write setFnr_columns;

    [FieldName('size_columns')]
    property TamanhoColuna: integer read Fsize_columns write setFsize_columns;

    [FieldName('formats')]
    property Formato :  String read Fformats write setFformats;

    [FieldName('measure')]
    property Medida :  String read Fmeasure write setFmeasure;

    [FieldName('path_file')]
     property ImageLink :  String read Fpath_file write setFpath_file;

    [FieldName('online_discount')]
     property OnlineDesconto :  Real read Fonline_discount write setFonline_discount;

    [FieldName('online_price')]
     property OnlinePreco :  Real read Fonline_price write setFonline_price;



    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation



{ TMedPriceListJR }

procedure TMedPriceListJR.setFaddition(const Value: Real);
begin
  Faddition := Value;
end;

procedure TMedPriceListJR.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TMedPriceListJR.setFformats(const Value: String);
begin
  Fformats := Value;
end;

procedure TMedPriceListJR.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TMedPriceListJR.setFmeasure(const Value: String);
begin
  Fmeasure := Value;
end;

procedure TMedPriceListJR.setFnr_columns(const Value: integer);
begin
  Fnr_columns := Value;
end;

procedure TMedPriceListJR.setFonline_discount(const Value: Real);
begin
  Fonline_discount := Value;
end;

procedure TMedPriceListJR.setFonline_price(const Value: Real);
begin
  Fonline_price := Value;
end;

procedure TMedPriceListJR.setFpath_file(const Value: String);
begin
  Fpath_file := Value;
end;

procedure TMedPriceListJR.setFsize_columns(const Value: integer);
begin
  Fsize_columns := Value;
end;

procedure TMedPriceListJR.setFsun_day_value(const Value: Real);
begin
  Fsun_day_value := Value;
end;

procedure TMedPriceListJR.setFtb_broadcaster_id(const Value: Integer);
begin
  Ftb_broadcaster_id := Value;
end;

procedure TMedPriceListJR.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TMedPriceListJR.setFtb_med_pos_prog_id(const Value: Integer);
begin
  Ftb_med_pos_prog_id := Value;
end;

procedure TMedPriceListJR.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

procedure TMedPriceListJR.setFweek_day_value(const Value: Real);
begin
  Fweek_day_value := Value;
end;

end.
