unit TblMedPriceListOL;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_med_price_list_ol')]
  TMedPriceListOL = Class(TGenericEntity)
  private
    Fprice_value: Real;
    Fnote: String;
    Fdimensions: String;
    Fdetermination: integer;
    Fdescription: String;
    FId: Integer;
    Fposition: Integer;
    Fexpansible: integer;
    Fupdated_at: TDAteTime;
    Fformats: String;
    Ftb_institution_id: Integer;
    Ftb_broadcaster_id: Integer;
    Fdaily: Real;
    Fcreated_at: TDAteTime;
    Fonline_price: Real;
    Fpageview_max: Integer;
    Fpageview_min: Integer;
    Fpath_file: String;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdaily(const Value: Real);
    procedure setFdescription(const Value: String);
    procedure setFdetermination(const Value: integer);
    procedure setFdimensions(const Value: String);
    procedure setFexpansible(const Value: integer);
    procedure setFformats(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFnote(const Value: String);
    procedure setFposition(const Value: Integer);
    procedure setFprice_value(const Value: Real);
    procedure setFtb_broadcaster_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFonline_price(const Value: Real);
    procedure setFpageview_max(const Value: Integer);
    procedure setFpageview_min(const Value: Integer);
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


    [FieldName('description')]
    property DEscricao: String  read Fdescription write setFdescription;

    [FieldName('formats')]
    property Formato: String  read Fformats write setFformats;

    [FieldName('price_value')]
    property Valor: Real  read Fprice_value write setFprice_value;

    [FieldName('online_price')]
     property OnlinePreco :  Real read Fonline_price write setFonline_price;

    [FieldName('determination')]
    property Determinacao: integer  read Fdetermination write setFdetermination;

    [FieldName('expansible')]
    property Expansivel:integer  read Fexpansible write setFexpansible;

    [FieldName('daily')]
    property Diaria: Real  read Fdaily write setFdaily;

    [FieldName('dimensions')]
    property Dimensoes: String read Fdimensions write setFdimensions;

    [FieldName('position')]
    property Posicao: Integer  read Fposition write setFposition;

    [FieldName('pageview_min')]
    property PAgeViewMinimo: Integer  read Fpageview_min write setFpageview_min;

    [FieldName('pageview_max')]
    property PAgeViewMaximo: Integer  read Fpageview_max write setFpageview_max;

    [FieldName('note')]
    property Observacao: String read Fnote write setFnote;

    [FieldName('path_file')]
     property ImageLink :  String read Fpath_file write setFpath_file;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation



{ TMedPriceListOL }

procedure TMedPriceListOL.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TMedPriceListOL.setFdaily(const Value: Real);
begin
  Fdaily := Value;
end;

procedure TMedPriceListOL.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TMedPriceListOL.setFdetermination(const Value: integer);
begin
  Fdetermination := Value;
end;

procedure TMedPriceListOL.setFdimensions(const Value: String);
begin
  Fdimensions := Value;
end;

procedure TMedPriceListOL.setFexpansible(const Value: integer);
begin
  Fexpansible := Value;
end;

procedure TMedPriceListOL.setFformats(const Value: String);
begin
  Fformats := Value;
end;

procedure TMedPriceListOL.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TMedPriceListOL.setFnote(const Value: String);
begin
  Fnote := Value;
end;

procedure TMedPriceListOL.setFonline_price(const Value: Real);
begin
  Fonline_price := Value;
end;

procedure TMedPriceListOL.setFpageview_max(const Value: Integer);
begin
  Fpageview_max := Value;
end;

procedure TMedPriceListOL.setFpageview_min(const Value: Integer);
begin
  Fpageview_min := Value;
end;

procedure TMedPriceListOL.setFpath_file(const Value: String);
begin
  Fpath_file := Value;
end;

procedure TMedPriceListOL.setFposition(const Value: Integer);
begin
  Fposition := Value;
end;

procedure TMedPriceListOL.setFprice_value(const Value: Real);
begin
  Fprice_value := Value;
end;

procedure TMedPriceListOL.setFtb_broadcaster_id(const Value: Integer);
begin
  Ftb_broadcaster_id := Value;
end;

procedure TMedPriceListOL.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TMedPriceListOL.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
