unit tas_order_pi_rt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_form, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, base_registry, uniBasicGrid, uniDBGrid, uniLabel, uniEdit,
  tas_order_pi_item, uniMultiItem, uniComboBox, uniDateTimePicker
  , StrUtils, msg_form, Data.DB, Datasnap.DBClient,ControllerMedPriceListRT ;

type
  TTasOrderPiRt = class(TTasOrderPiItem)
    UniLabel6: TUniLabel;
    Cb_tm_duration: TUniComboBox;
    Cb_testimonial: TUniComboBox;
    UniLabel5: TUniLabel;
    UniLabel11: TUniLabel;
    E_increase_testemonial: TUniFormattedNumberEdit;
    E_table_value: TUniFormattedNumberEdit;
    l_table_value: TUniLabel;
    UniLabel13: TUniLabel;
    E_Discount_Aliq: TUniFormattedNumberEdit;
    UniLabel14: TUniLabel;
    E_unit_value_neg: TUniFormattedNumberEdit;
    UniLabel18: TUniLabel;
    E_insertion: TUniEdit;
    abeladePreo1: TUniMenuItem;
    procedure PriceListChange(Sender: TObject);
    procedure Cb_tm_durationChange(Sender: TObject);
    procedure Cb_testimonialChange(Sender: TObject);
    procedure E_insertionExit(Sender: TObject);
    procedure E_total_valueExit(Sender: TObject);
    procedure abeladePreo1Click(Sender: TObject);
    procedure Ub_InsertDateClick(Sender: TObject);
  private
  protected
    procedure InitVariable;Override;
    procedure ShowData;Override;
    Procedure ShowDataRt;
    procedure ShowNoData;Override;
    Procedure EditionControl;Override;
    function ValidaInsert():boolean;
    procedure getTablePriceValue;Override;
    procedure totalizer;Override;
    //Salvar
    function ValidateSave: boolean;Override;
    procedure Save;Override;
    procedure SaveRT;
  public
    PriceList : TControllerMedPriceListRT;
  end;

var
  TasOrderPiRt: TTasOrderPiRt;

implementation

{$R *.dfm}

uses MainModule, unMessages, openForms;

{ TTasOrderPiRt }

procedure TTasOrderPiRt.abeladePreo1Click(Sender: TObject);
begin
  inherited;
  openCadMedPriceListRT(PriceList.Registro.Veiculo);
end;

procedure TTasOrderPiRt.Cb_testimonialChange(Sender: TObject);
begin
  totalizer;
end;

procedure TTasOrderPiRt.Cb_tm_durationChange(Sender: TObject);
begin
  totalizer;
end;

procedure TTasOrderPiRt.EditionControl;
begin
  inherited;
  FrMedMaterial.DBLCB_Lista.ReadOnly := (CodigoRegistro > 0);
  FrMedPosProg.DBLCB_Lista.ReadOnly := (CodigoRegistro > 0);
  E_increase_testemonial.ReadOnly := True;
  E_Discount_Aliq.ReadOnly := True;
  E_table_value.ReadOnly := True;
  E_unit_value_neg.ReadOnly := True;
  E_Discount_Value.ReadOnly := True;
end;

procedure TTasOrderPiRt.E_insertionExit(Sender: TObject);
begin
  totalizer;
end;

procedure TTasOrderPiRt.E_total_valueExit(Sender: TObject);
begin
  totalizer;
end;

procedure TTasOrderPiRt.getTablePriceValue;
begin
  PriceList.Registro.Spot15 := 0;
  PriceList.Registro.Spot30 := 0;
  PriceList.Registro.Spot45 := 0;
  PriceList.Registro.Spot60 := 0;
  if (FrMedPosProg.DBLCB_Lista.KeyValue <> null) then
  Begin
    PriceList.Registro.PosicaoProgramacao := FrMedPosProg.DBLCB_Lista.KeyValue;
    PriceList.getByPosition;
  End;
end;

procedure TTasOrderPiRt.InitVariable;
begin
  inherited;
  PriceList := TControllerMedPriceListRT.Create(Self);
end;


procedure TTasOrderPiRt.PriceListChange(Sender: TObject);
begin
  getTablePriceValue;
end;

procedure TTasOrderPiRt.Save;
begin
  SaveRt;
  inherited;
end;

procedure TTasOrderPiRt.SaveRt;
begin
  if (CodigoRegistro = 0) then  CodigoRegistro := getNext(cds_parts);
  with self.cds_parts do
  Begin
    if not Active then createDataset;
    if EditionState = 'I' then
    Begin
      Append;
      FieldByName('id').AsInteger := CodigoRegistro;
      FieldByName('tb_institution_id').AsInteger    := UMM.GInstitution.registro.Codigo;
      FieldByName('tb_order_id').AsInteger          := 0;
    End
    else
    Begin
       Edit;
    End;
    FieldByName('increase_testemonial').AsFloat  := StrToFloatDef(E_increase_testemonial.Text, 0);
    FieldByName('tittle').AsString                := E_Ttittle.Text;
    FieldByName('insertion').asInteger            := StrToIntDef(E_insertion.Text, 0);
    FieldByName('nr_repetition').asInteger        := StrToIntDef(E_nr_repetition.Text, 0);
    FieldByName('table_value').asFloat            := StrToFloatDef(E_table_value.Text,  0);
    FieldByName('unit_value').AsFloat             := StrToFloatDef(E_unit_value_neg.Text,0);
    FieldByName('total_value').asFloat            := StrToFloatDef(E_total_value.Text, 0);
    FieldByName('aliq_desc').asFloat              := strToFloatDef(E_Discount_Aliq.Text, 0);
    FieldByName('testimonial').AsString           := Cb_testimonial.Text;
    FieldByName('tm_duration').AsString           := Cb_tm_duration.Text;

    FieldByName('tb_med_material_id').AsInteger   := FrMedMaterial.DBLCB_Lista.KeyValue;
    FieldByName('tb_med_pos_prog_id').AsInteger   := FrMedPosProg.DBLCB_Lista.KeyValue;
    FieldByName('mppDescription').AsString        := FrMedPosProg.DBLCB_Lista.Text;
    FieldByName('mmDescription').AsString         := FrMedPosProg.DBLCB_Lista.Text;
    FieldByName('mmID').AsInteger                 := FieldByName('tb_med_material_id').AsInteger;
    FieldByName('mppID').AsInteger                := FieldByName('tb_med_pos_prog_id').AsInteger;
    Post;
    Active := False;
    Active := True;
  End;
end;

procedure TTasOrderPiRt.Showdata;
begin
  ShowDataRt;
  inherited;
end;

procedure TTasOrderPiRt.ShowDataRt;
Var
  LcPosicao : Integer;
begin
  with cds_Parts do
  Begin
    E_Ttittle.Text                      := FieldByName('tittle').AsString;
    FrMedMaterial.DBLCB_Lista.KeyValue  := FieldByName('tb_med_material_id').AsInteger;
    FrMedPosProg.DBLCB_Lista.KeyValue   := FieldByName('tb_med_pos_prog_id').AsInteger ;
    LcPosicao := Cb_testimonial.Items.IndexOf(FieldByName('testimonial').AsString);
    Cb_testimonial.ItemIndex            := LcPosicao;
    LcPosicao := Cb_tm_duration.Items.IndexOf(FieldByName('tm_duration').AsString);
    Cb_tm_duration.ItemIndex            := LcPosicao;
    E_increase_testemonial.Text         := FieldByName('increase_testemonial').AsString;
    E_table_value.Text                  := FloatToStrF(FieldByName('table_value').asFloat, ffFixed,10,2);
    E_Discount_Aliq.Text                := FloatToStrF(FieldByName('aliq_desc').asFloat, ffFixed,10,2);
    E_unit_value_neg.Text               := FloatToStrF(FieldByName('unit_value').AsFloat, ffFixed,10,2);
    E_insertion.Text                    := IntToStr(FieldByName('insertion').asInteger);
    E_nr_repetition.Text                := FieldByName('nr_repetition').AsString;
    E_total_value.Text                  := FloatToStrF(FieldByName('total_value').asFloat, ffFixed,10,2)
  End;
  getTablePriceValue;
  totalizer;
end;


procedure TTasOrderPiRt.ShowNoData;
begin
  ClearAllFields;
  inherited;
end;

procedure TTasOrderPiRt.totalizer;
Var
  LcValorTabela : Real;
  LcAqTestemonial : Real;
  LcInsercao : Integer;
  LcVLTotal : Real;
  LcVLUnitNeg  : real;
  LcAliqDesc : Real;
begin
  case Cb_tm_duration.ItemIndex of
    0:LcValorTabela := PriceList.Registro.Spot15;
    1:LcValorTabela := PriceList.Registro.Spot30;
    2:LcValorTabela := PriceList.Registro.Spot45;
    3:LcValorTabela := PriceList.Registro.Spot60;
    else
      LcValorTabela := PriceList.Registro.Spot15;
  end;
  if Cb_testimonial.Text = 'SIM' then
    LcAqTestemonial := 30
  else
    LcAqTestemonial := 0;

  LcValorTabela := LcValorTabela + ( (LcValorTabela * LcAqTestemonial) / 100 );
  E_increase_testemonial.Text := FloatToStrF(LcAqTestemonial,ffFixed,10,2);
  E_table_value.Text := FloatToStrF(LcValorTabela,ffFixed,10,2);

  LcInsercao    := StrToIntDef(E_insertion.Text,1);

  LcVLTotal     := StrtoFloatDef(E_total_value.Text,0);
  E_unit_value_neg.Text := FloatToStrF(LcVLTotal,ffFixed,10,2);
  if (LcInsercao > 0) then
    LcVLUnitNeg   := (LcVLTotal / LcInsercao)
  else
    LcVLUnitNeg   := 0;

  E_unit_value_neg.Text := FloatToStrF(LcVLUnitNeg,ffFixed,10,2);

  if (LcValorTabela >0 ) then
    LcAliqDesc    := (1 - (LcVLUnitNeg / LcValorTabela))  * 100
  else
    LcAliqDesc    := 0;
  if LcAliqDesc < 0 then LcAliqDesc := 0;
  E_Discount_Aliq.Text := FloatToStrf(LcAliqDesc,ffFixed,10,2);

  E_TableGross.Text := FloatToStrF(LcValorTabela * LcInsercao,ffFixed,10,2);
  E_Negotiaded.Text := FloatToStrF((LcVLUnitNeg * LcInsercao),ffFixed,10,2);
  E_Discount_Value.Text := FloatToStrf(((LcValorTabela * LcInsercao) - (LcVLUnitNeg * LcInsercao)),ffFixed,10,2);

end;


procedure TTasOrderPiRt.Ub_InsertDateClick(Sender: TObject);
begin
  inherited;
  E_insertion.Text := getNumberInsrtion.ToString;
end;

function TTasOrderPiRt.ValidaInsert: boolean;
begin
  Result := True;
end;

function TTasOrderPiRt.ValidateSave: boolean;
begin
  Result := True;
  if not ValidateParts then
  Begin
    Result := False;
    exit;
   End;

  if trim(E_increase_testemonial.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo %Testemunhal não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

      if trim(E_table_value.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Valor da Tabela não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(E_insertion.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Inserções não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(Cb_testimonial.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Testemunhal não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(Cb_tm_duration.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Tempo  não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;
end;

end.
