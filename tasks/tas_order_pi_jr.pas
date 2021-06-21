unit tas_order_pi_jr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, tas_order_pi_item, uniBitBtn,
  uniSpeedButton, uniPanel, uniButton, uniBasicGrid, uniDBGrid, uniLabel,
  uniGUIClasses, uniEdit, uniGUIBaseClasses, uniMultiItem, uniComboBox,
  uniDateTimePicker, ControllerMedParts,  Vcl.Menus,
  uniMainMenu, msg_form, Data.DB, Datasnap.DBClient, Datasnap.Provider,
  ControllerMedPriceListJR;

type
  TTasOrderPiJr = class(TTasOrderPiItem)
    UniLabel11: TUniLabel;
    E_insertion: TUniEdit;
    UniLabel18: TUniLabel;
    E_total_cm_col: TUniEdit;
    UniLabel17: TUniLabel;
    E_nr_height: TUniEdit;
    UniLabel16: TUniLabel;
    E_nr_column: TUniEdit;
    UniLabel15: TUniLabel;
    E_unit_value_neg: TUniFormattedNumberEdit;
    UniLabel14: TUniLabel;
    E_Discount_Aliq: TUniFormattedNumberEdit;
    UniLabel13: TUniLabel;
    E_table_value: TUniFormattedNumberEdit;
    l_table_value: TUniLabel;
    E_Aliq_Print: TUniFormattedNumberEdit;
    Cb_Color: TUniComboBox;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    Cb_Day: TUniComboBox;
    abeladePreo1: TUniMenuItem;
    procedure Cb_DayChange(Sender: TObject);
    procedure PriceListChange(Sender: TObject);
    procedure Cb_ColorChange(Sender: TObject);
    procedure abeladePreo1Click(Sender: TObject);
    procedure E_total_valueExit(Sender: TObject);
    procedure E_nr_columnExit(Sender: TObject);
    procedure E_nr_heightExit(Sender: TObject);
    procedure E_insertionExit(Sender: TObject);
    procedure Ub_InsertDateClick(Sender: TObject);
  private

  protected
    procedure InitVariable;Override;
    procedure ShowData;Override;
    Procedure ShowDataJr;
    procedure ShowNoData;Override;
    procedure EditionControl;Override;
    function ValidaInsert():boolean;Override;

    procedure getTablePriceValue;Override;
    procedure totalizer;Override;


    function validateSave:Boolean;Override;
    procedure Save;Override;
    procedure Savejr;


  public
    { Public declarations }
    PriceList : TControllerMedPriceListJR;

  end;

var
  TasOrderPiJr: TTasOrderPiJr;

implementation

{$R *.dfm}

uses unMessages, MainModule, UnFunctions,openForms;

{ TTasOrderPiJr }

procedure TTasOrderPiJr.abeladePreo1Click(Sender: TObject);
begin
  openCadMedPriceListJR(PriceList.Registro.Veiculo);
end;

procedure TTasOrderPiJr.Cb_ColorChange(Sender: TObject);
begin
  getTablePriceValue;
  totalizer;
end;

procedure TTasOrderPiJr.Cb_DayChange(Sender: TObject);
begin
  totalizer;
end;

procedure TTasOrderPiJr.EditionControl;
begin
  inherited;
  E_Aliq_Print.ReadOnly := True;
  E_Discount_Aliq.ReadOnly := True;

  E_unit_value_neg.ReadOnly := True;
  E_total_cm_col.ReadOnly := True;

  E_table_value.ReadOnly := True;
end;

procedure TTasOrderPiJr.E_insertionExit(Sender: TObject);
begin
  totalizer;
end;

procedure TTasOrderPiJr.E_nr_columnExit(Sender: TObject);
begin
  totalizer;
end;

procedure TTasOrderPiJr.E_nr_heightExit(Sender: TObject);
begin
  totalizer;
end;

procedure TTasOrderPiJr.E_total_valueExit(Sender: TObject);
begin
  totalizer;
end;

procedure TTasOrderPiJr.getTablePriceValue;
begin
  PriceList.Registro.ValorDiaUtil := 0;
  PriceList.Registro.ValorDomingo := 0;
  if (FrMedPosProg.DBLCB_Lista.KeyValue <> null) then
  Begin
    PriceList.Registro.Codigo := FrMedPosProg.DBLCB_Lista.KeyValue;
    PriceList.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    PriceList.Registro.Veiculo := Self.CodigoVeiculo;
    PriceList.getByPosition;
  End;
end;

procedure TTasOrderPiJr.InitVariable;
begin
  inherited;
  PriceList := TControllerMedPriceListJR.Create(Self);
end;

procedure TTasOrderPiJr.PriceListChange(Sender: TObject);
begin
  getTablePriceValue;
end;

procedure TTasOrderPiJr.Save;
begin
  Savejr;
  inherited;
end;


procedure TTasOrderPiJr.Savejr;
begin
  if (CodigoRegistro = 0) then  CodigoRegistro := getNext(cds_Parts);
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
    FieldByName('nr_column').AsString             := E_nr_column.Text;
    FieldByName('nr_height').AsString             := E_nr_height.Text;
    FieldByName('color').AsString                 := Cb_Color.Text;
    FieldByName('day').AsString                   := Cb_Day.Text;
    FieldByName('tittle').AsString                := E_Ttittle.Text;
    FieldByName('nr_repetition').asInteger        := StrToIntDef(E_nr_repetition.Text, 0);
    FieldByName('insertion').asInteger            := StrToIntDef(E_insertion.Text, 0);
    FieldByName('table_value').asFloat            := StrToFloatDef(E_table_value.Text,  0);
    FieldByName('aliq_desc').asFloat              := strToFloatDef(E_Discount_Aliq.Text, 0);
    FieldByName('unit_value').AsFloat             := StrToFloatDef(E_unit_value_neg.Text,0);
    FieldByName('total_value').asFloat            := StrToFloatDef(E_total_value.Text, 0);

    FieldByName('tb_med_material_id').AsInteger   := FrMedMaterial.DBLCB_Lista.KeyValue;
    FieldByName('tb_med_price_list_id').AsInteger   := FrMedPosProg.DBLCB_Lista.KeyValue;
    FieldByName('mppDescription').AsString        := FrMedPosProg.DBLCB_Lista.Text;
    FieldByName('mmDescription').AsString         := FrMedPosProg.DBLCB_Lista.Text;
    FieldByName('mmID').AsInteger                 := FieldByName('tb_med_material_id').AsInteger;
    FieldByName('mppID').AsInteger                := FieldByName('tb_med_price_list_id').AsInteger;
    Post;
    Active := False;
    Active := True;
  End;
end;

procedure TTasOrderPiJr.ShowData;
begin
  ShowDataJr;
  inherited;
End;



procedure TTasOrderPiJr.ShowDataJr;
Var
  LcPosicao : Integer;
begin
  with cds_Parts do
  Begin
    E_Ttittle.Text                      := FieldByName('tittle').AsString;
    FrMedMaterial.DBLCB_Lista.KeyValue  := FieldByName('tb_med_material_id').AsInteger;
    FrMedPosProg.DBLCB_Lista.KeyValue   := FieldByName('tb_med_price_list_id').AsInteger ;
    LcPosicao := Cb_Day.Items.IndexOf(FieldByName('day').AsString);
    Cb_Day.ItemIndex                    := LcPosicao;
    LcPosicao := Cb_Color.Items.IndexOf(FieldByName('color').AsString);
    Cb_Color.ItemIndex                  := LcPosicao;
    E_table_value.Text                  := FloatToStrF(FieldByName('table_value').asFloat, ffFixed,10,2);
    E_Discount_aliq.Text                := FloatToStrF(FieldByName('aliq_desc').asFloat, ffFixed,10,2);
    E_unit_value_neg.Text               := FloatToStrF(FieldByName('unit_value').AsFloat, ffFixed,10,2);
    E_nr_column.Text                    := FieldByName('nr_column').AsString;
    E_nr_height.Text                    := FieldByName('nr_height').AsString;
    //E_total_cm_col.Text
    E_insertion.Text                    := IntToStr(FieldByName('insertion').asInteger);
    //E_Negotiaded.Text
    E_total_value.Text                  := FloatToStrF(FieldByName('total_value').asFloat, ffFixed,10,2)
  End;
  getTablePriceValue;
  totalizer;
end;

procedure TTasOrderPiJr.ShowNoData;
begin
  ClearAllFields;
  inherited;
end;

procedure TTasOrderPiJr.totalizer;
Var
  LcValorTabela : Real;
  LcAqColor : Real;
  LcColuna : Integer;
  LcAltura : Integer;
  LcCMColuna : Integer;
  LcInsercao : Integer;
  LcVLTotal : Real;
  LcVLUnitNeg  : real;
  LcAliqDesc : Real;
  LcVLDesc : REal;
begin
  if Cb_Day.ItemIndex = 0  then
    LcValorTabela := PriceList.Registro.ValorDiaUtil
  else
    LcValorTabela := PriceList.Registro.ValorDomingo;
  if Cb_Color.Text = 'SIM' then
  Begin
    LcAqColor := PriceList.Registro.AdicionalCor;
    if LcAqColor = 0  then
      LcAqColor := 30;
  End;

  LcValorTabela := LcValorTabela + ( (LcValorTabela * LcAqColor) / 100);

  E_Aliq_Print.Text := FloatToStrF(LcAqColor,ffFixed,10,2);
  E_table_value.Text := FloatToStrF(LcValorTabela,ffFixed,10,2);

  LcColuna := StrToIntDef(E_nr_column.Text,1);
  LcAltura := StrToIntDef(E_nr_height.Text,1);

  LcCMColuna := LcColuna * LcAltura;
  E_total_cm_col  .Text := IntToStr(LcCMColuna);
  LcInsercao := StrToIntDef(E_insertion.Text,1);

  LcVLTotal := StrToFloatDef(E_total_value.Text,1);
  E_total_value.Text := FloatToStrF(LcVLTotal,ffFixed,10,2);

  if (LcInsercao>0)  and (LcCMColuna > 0) then
    LcVLUnitNeg := (LcVLTotal / LcInsercao) / LcCMColuna
  else
    LcVLUnitNeg := 0;
  E_unit_value_neg.Text := FloatToStrF(LcVLUnitNeg,ffFixed,10,2);

  if LcValorTabela > 0 then
    LcAliqDesc := (1 - (LcVLUnitNeg / LcValorTabela))  * 100
  else
    LcAliqDesc := 0;
  if LcAliqDesc < 0 then LcAliqDesc := 0;
  E_Discount_Aliq.Text := FloatToStrf(LcAliqDesc,ffFixed,10,2);

  E_TableGross.Text := FloatToStrF((LcValorTabela * LcInsercao) * LcCMColuna,ffFixed,10,2);
  E_Negotiaded.Text := FloatToStrF((LcVLUnitNeg * LcCMColuna),ffFixed,10,2);
  LcVLDesc := ((LcValorTabela * LcCMColuna) - (LcVLUnitNeg * LcCMColuna));
  if LcVLDesc < 0 then LcVLDesc := 0;
  
  E_Discount_Value.Text := FloatToStrf(LcVLDesc,ffFixed,10,2);
end;

procedure TTasOrderPiJr.Ub_InsertDateClick(Sender: TObject);
begin
  inherited;
  E_insertion.Text := getNumberInsrtion.ToString;
end;

function TTasOrderPiJr.ValidaInsert: boolean;
begin
 Result := True;
end;


function TTasOrderPiJr.ValidateSave: boolean;
begin
   Result := True;
   if not ValidateParts then
   Begin
     Result := False;
    exit;
   End;

  if trim(Cb_Day.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Dia não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(Cb_Color.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Cor não informado.',
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

   if trim(E_nr_height.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Altura não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

   if trim(E_nr_column.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Coluna não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

   if trim(E_insertion.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Inserção da Tabela não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

end;

end.
