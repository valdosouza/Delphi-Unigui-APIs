unit TblMedPriceList;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_med_price_list')]
  TMedPriceList = Class(TGenericEntity)
  private
    Ftag_value: Real;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Ftb_med_pos_prog_id: Integer;
    Ftb_institution_id: Integer;
    Ftb_broadcaster_id: Integer;
    Fkind: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFId(const Value: Integer);
    procedure setFkind(const Value: Integer);
    procedure setFtag_value(const Value: Real);
    procedure setFtb_broadcaster_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_med_pos_prog_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);

  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [KeyField('tb_broadcaster_id')]
    [FieldName('tb_broadcaster_id')]
    property Veiculo: Integer read Ftb_broadcaster_id write setFtb_broadcaster_id;

    [FieldName('tb_med_pos_prog_id')]
    property PosicaoProgramacao: Integer read Ftb_med_pos_prog_id write setFtb_med_pos_prog_id;


    [FieldName('tag_value')]
    property Valor: Real read Ftag_value write setFtag_value;

    [FieldName('kind')]
    property Tipo: Integer read Fkind write setFkind;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation



{ TMedPriceList }

procedure TMedPriceList.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TMedPriceList.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TMedPriceList.setFkind(const Value: Integer);
begin
  Fkind := Value;
end;

procedure TMedPriceList.setFtag_value(const Value: Real);
begin
  Ftag_value := Value;
end;

procedure TMedPriceList.setFtb_broadcaster_id(const Value: Integer);
begin
  Ftb_broadcaster_id := Value;
end;

procedure TMedPriceList.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TMedPriceList.setFtb_med_pos_prog_id(const Value: Integer);
begin
  Ftb_med_pos_prog_id := Value;
end;

procedure TMedPriceList.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
