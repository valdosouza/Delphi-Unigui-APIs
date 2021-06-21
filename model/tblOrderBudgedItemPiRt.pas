unit tblOrderBudgedItemPiRt;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_order_bud_it_med_rt')]
  TOrderBudItMedRt = Class(TGenericEntity)
  private
    Ftm_duration : string;
    Fnr_height: String;
    FId: Integer;
    Ftb_order_id: Integer;
    Ftb_med_pos_prog_id: Integer;
    Fupdated_at: TDAteTime;
    Ftb_institution_id: Integer;
    Ftestimonial: string;
    Ftb_broadcaster_id: Integer;
    Fincrease_testemonial: Real;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFId(const Value: Integer);
    procedure setFincrease_testemonial(const Value: real);
    procedure setFtb_broadcaster_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_med_pos_prog_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFtestimonial(const Value: string);
    procedure setFtm_duration(const Value: string);
    procedure setFupdated_at(const Value: TDAteTime);



  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_order_id')]
    [KeyField('tb_order_id')]
    property Ordem: Integer read Ftb_order_id write setFtb_order_id;

    [FieldName('tb_broadcaster_id')]
    property Veiculo: Integer read Ftb_broadcaster_id write setFtb_broadcaster_id;

    [FieldName('tb_med_pos_prog_id')]
    property Posicao: Integer read Ftb_med_pos_prog_id write setFtb_med_pos_prog_id;

    [FieldName('tm_duration')]
    property TempoDuracao: string read Ftm_duration write setFtm_duration;

    [FieldName('testimonial')]
    property Testemunhal: string read Ftestimonial write setFtestimonial;

    [FieldName('increase_testemonial')]
    property AumentoTestemunhal: real read Fincrease_testemonial write setFincrease_testemonial;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation


{ TOrderBudItMedRt }

procedure TOrderBudItMedRt.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TOrderBudItMedRt.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TOrderBudItMedRt.setFincrease_testemonial(const Value: real);
begin
  Fincrease_testemonial := Value;
end;

procedure TOrderBudItMedRt.setFtb_broadcaster_id(const Value: Integer);
begin
  Ftb_broadcaster_id := Value;
end;

procedure TOrderBudItMedRt.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TOrderBudItMedRt.setFtb_med_pos_prog_id(const Value: Integer);
begin
  Ftb_med_pos_prog_id := Value;
end;

procedure TOrderBudItMedRt.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TOrderBudItMedRt.setFtestimonial(const Value: string);
begin
  Ftestimonial := Value;
end;

procedure TOrderBudItMedRt.setFtm_duration(const Value: string);
begin
  Ftm_duration := Value;
end;

procedure TOrderBudItMedRt.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
