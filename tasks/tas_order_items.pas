unit tas_order_items;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_form, uniButton, uniBitBtn,
  uniSpeedButton, uniCheckBox, uniGUIClasses, uniEdit, uniLabel,ControllerMerchandise,
  uniGUIBaseClasses, uniPanel, uniMultiItem, uniComboBox,fm_stock_list,ControllerStockBalance,
  Datasnap.DBClient,System.Math,   Data.DB, Datasnap.Provider, fm_merchandise,
  uniDBComboBox, uniDBLookupComboBox, uniDateTimePicker, Vcl.Menus, uniMainMenu;

type
  TTasOrderItems = class(TBaseForm)
    pnl_Top: TUniPanel;
    pnl_Fundo: TUniPanel;
    Pnl_Botao: TUniPanel;
    Sb_Save: TUniSpeedButton;
    Sb_Cancel: TUniSpeedButton;
    UniLabel11: TUniLabel;
    E_Unit_Value: TUniFormattedNumberEdit;
    UniLabel18: TUniLabel;
    E_Qtty: TUniFormattedNumberEdit;
    UniLabel17: TUniLabel;
    E_Measure: TUniEdit;
    UniLabel16: TUniLabel;
    E_Total_Product: TUniFormattedNumberEdit;
    UniLabel15: TUniLabel;
    E_Aliq_Desconto: TUniFormattedNumberEdit;
    UniLabel14: TUniLabel;
    E_Vl_Desconto: TUniFormattedNumberEdit;
    UniLabel5: TUniLabel;
    E_Total_Value: TUniFormattedNumberEdit;
    UniLabel1: TUniLabel;
    E_Stock_Balance: TUniFormattedNumberEdit;
    ctn_merchandise: TUniContainerPanel;
    ctn_Stock_List: TUniContainerPanel;
    pnl_detalhes: TUniPanel;
    lb_work_front: TUniLabel;
    E_Work_Front: TUniEdit;
    UniLabel2: TUniLabel;
    E_Note: TUniEdit;
    L_DtRegistry: TUniLabel;
    E_DateForecast: TUniDateTimePicker;
    procedure InitVariable;Override;
    procedure formatScreen;Override;
    procedure SetVariable;Override;
    procedure setImages;Override;
    procedure ShowData;Virtual;
    procedure ShowNoData;Virtual;
    procedure EditionControl;Virtual;
    procedure UniFormShow(Sender: TObject);
    procedure Sb_CancelClick(Sender: TObject);
    procedure Sb_SaveClick(Sender: TObject);
    procedure E_Unit_ValueExit(Sender: TObject);
    procedure E_QttyExit(Sender: TObject);
    procedure E_Vl_DescontoExit(Sender: TObject);
    procedure E_Aliq_DescontoExit(Sender: TObject);
    procedure StockListExit(Sender: TObject);
    procedure MerchandiseExit(Sender: TObject);

  private

    { Private declarations }

  protected
    Mercadoria : TControllerMerchandise;
    FrStockList : TFmStockList;
    FrMerchandise : TFmMerchandise;

    procedure getStockBalance;Virtual;
    procedure getUnitValue;Virtual;
    procedure ShowStockList;
    procedure ShowMerchandise;
    procedure totalizer;


  public
    { Public declarations }
    EditionState : String;
    cds_Item: TClientDataSet;

    function validateSave:Boolean;Virtual;
    procedure save;Virtual;
    procedure finalizeSave;Virtual;
    function validateCancel:Boolean;Virtual;
    procedure Cancel;Virtual;

  end;

var
  TasOrderItems: TTasOrderItems;

implementation

{$R *.dfm}

uses MainModule, unMessages;

procedure TTasOrderItems.Cancel;
begin
  Close;
end;


procedure TTasOrderItems.StockListExit(Sender: TObject);
begin
  getStockBalance;
end;

procedure TTasOrderItems.EditionControl;
begin
  FrMerchandise.DBLCB_Lista.ReadOnly := (CodigoRegistro > 0);
end;

procedure TTasOrderItems.E_Aliq_DescontoExit(Sender: TObject);
Var
  Lc_Aq_Desconto:Real;
  Lc_Vl_Produto : Real;
  Lc_Vl_Desconto : Real;
begin
  Lc_Vl_Produto := StrtoFloatDef(E_Total_Product.Text,0);
  Lc_Aq_Desconto := StrToFloatDef(E_Aliq_Desconto.Text,0);
  if Lc_Aq_Desconto > 0 then
  Begin
    Lc_Vl_Desconto := Lc_Vl_Produto * (Lc_Aq_Desconto/100);
    E_VL_Desconto.Text := FloatToStrf(Lc_Vl_Desconto,ffFixed,10,2);
    if (Lc_Aq_Desconto < 0) then Lc_Aq_Desconto := 0;
  End;
  totalizer;
end;

procedure TTasOrderItems.E_QttyExit(Sender: TObject);
begin
  totalizer
end;

procedure TTasOrderItems.E_Unit_ValueExit(Sender: TObject);
begin
  totalizer
end;

procedure TTasOrderItems.E_Vl_DescontoExit(Sender: TObject);
Var
  Lc_VL_Desconto:Real;
  Lc_Vl_Produto : Real;
  Lc_Aq_Desconto : Real;
begin
  Lc_Vl_Produto := StrtoFloatDef(E_Total_Product.Text,0);
  Lc_VL_Desconto := StrtoFloatDef(E_VL_Desconto.Text,0);
  if ( Lc_Vl_Produto >0 ) then
  begin
    Lc_Aq_Desconto := RoundTo((Lc_VL_Desconto / Lc_Vl_Produto) * 100,-2);
    if (Lc_Aq_Desconto < 0) then Lc_Aq_Desconto := 0;
    E_Aliq_Desconto.Text := FloatToStrF(Lc_Aq_Desconto,ffFixed,10,2);
  end;
  totalizer;
end;

procedure TTasOrderItems.finalizeSave;
begin
  if EditionState = 'I' then
  Begin
    ShowNoData;
    UniSession.AddJS('setTimeout(function(){'+ FrMerchandise.DBLCB_Lista.JSName +'.focus()}, 100)');
  End
  else
  Begin
    Self.Close;
  End;
end;

procedure TTasOrderItems.formatScreen;
begin
  if EditionState = 'I' then
  Begin
    FrMerchandise.DBLCB_Lista.ReadOnly := False;
    FrMerchandise.Sb_Register.Enabled := True;
    FrMerchandise.Sb_Search.Enabled := True;
  End
  else
  Begin
    FrMerchandise.DBLCB_Lista.ReadOnly := True;
    FrMerchandise.Sb_Register.Enabled := False;
    FrMerchandise.Sb_Search.Enabled := False;
  End;
end;

procedure TTasOrderItems.getStockBalance;
Var
  SaldoEstoque : TControllerStockBalance;
begin
  if (FrStockList.DBLCB_Lista.Text <> '') and (FrMerchandise.DBLCB_Lista.Text <> '') then
  Begin
    SaldoEstoque  := TControllerStockBalance.Create(Self);
    with SaldoEstoque do
    Begin
      Registro.Estabelecimento  := UMM.GInstitution.registro.Codigo;
      Registro.Tabela           := FrStockList.DBLCB_Lista.KeyValue;
      Registro.Mercadoria       := FrMerchandise.DBLCB_Lista.KeyValue;
    End;
    SaldoEstoque.getByKey;
    E_Stock_Balance.Text := FloatToStrF(SaldoEstoque.Registro.Quantidade,ffFixed,10,2);
    if SaldoEstoque.Registro.Quantidade > 0 then
      E_Stock_Balance.Color := clGreen
    else
      E_Stock_Balance.Color := clRed;
    FreeAndNil(SaldoEstoque);
  End;
end;


procedure TTasOrderItems.getUnitValue;
begin
  E_Unit_Value.Text := '0,00';
  if  (FrMerchandise.DBLCB_Lista.Text <> '') then
  Begin
    Mercadoria.Estoque.Registro.Mercadoria := FrMerchandise.DBLCB_Lista.KeyValue;
    Mercadoria.Estoque.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Mercadoria.Estoque.getByKey;
    E_Unit_Value.Text := FloatToStrF(Mercadoria.Estoque.Registro.PrecoCusto,ffFixed,10,2);
  End;
end;

procedure TTasOrderItems.InitVariable;
begin
  inherited;
  Mercadoria  := TControllerMerchandise.Create(Self);
end;

procedure TTasOrderItems.MerchandiseExit(Sender: TObject);
begin
  getStockBalance;
  getUnitValue;
end;

procedure TTasOrderItems.save;
begin
  with self.cds_Item do
  Begin
    if not Active then createDataset;
    if EditionState = 'I' then
    Begin
      Append;
      FieldByName('codepro').AsString := FrMerchandise.DBLCB_Lista.KeyValue; //E_ID_Product.Text;
      FieldByName('identifier').AsString := FrMerchandise.DBLCB_Lista.KeyValue;
      FieldByName('description').AsString := UpperCase( FrMerchandise.DBLCB_Lista.Text );
      FieldByName('id').AsInteger := 0;
      FieldByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
      FieldByName('tb_order_id').AsInteger := 0;
      FieldByName('tb_product_id').AsString := FrMerchandise.DBLCB_Lista.KeyValue;;
    End
    else
    Begin
      Edit;
    End;
    if  FrStockList.chbx_UpdateStock.Checked then
      FieldByName('tb_stock_list_id').AsInteger := FrStockList.DBLCB_Lista.KeyValue
    else
      FieldByName('tb_stock_list_id').AsInteger := 0;
    FieldByName('quantity').AsFloat := StrToFloatDef(E_Qtty.Text,0);
    FieldByName('unit_value').AsFloat := StrToFloatDef(E_Unit_Value.Text,0);
    FieldByName('discount_aliquot').AsFloat := StrToFloatDef(E_Aliq_Desconto.Text,0);
    FieldByName('discount_value').AsFloat := StrToFloatDef(E_Vl_Desconto.Text,0);
    FieldByName('work_front').AsString := E_Work_Front.Text;
    FieldByName('note').AsString := E_note.Text;
    if E_DateForecast.Text = '30/12/1899' then
      FieldByName('dt_forecast').AsDateTime := 0.0
    else
      FieldByName('dt_forecast').AsDateTime := E_DateForecast.DateTime;

    Post;
    Active := False;
    Active := True;
  End;
end;

procedure TTasOrderItems.SetVariable;
begin
  if EditionState = 'I' then
  Begin
    ShowNoData;
    UniSession.AddJS('setTimeout(function(){'+ FrMerchandise.DBLCB_Lista.JSName +'.focus()}, 100)');
  End
  else
  Begin
    ShowData;
    UniSession.AddJS('setTimeout(function(){'+ FrStockList.DBLCB_Lista.JSName +'.focus()}, 100)');
  End;
  totalizer;
end;


procedure TTasOrderItems.ShowData;
begin
  with cds_Item do
  Begin
    FrStockList.DBLCB_Lista.KeyValue    := FieldByName('tb_stock_list_id').AsInteger;
    FrMerchandise.DBLCB_Lista.KeyValue  := cds_Item.fieldByname('tb_product_id').AsString;
    FrMerchandise.DBLCB_Lista.Text      :=  FieldByName('description').AsString;
    E_Qtty.Text                         := FieldByName('quantity').AsString;
    E_Unit_Value.Text                   := FieldByName('unit_value').AsString;
    E_Aliq_Desconto.Text                := FieldByName('discount_aliquot').AsString;
    E_Vl_Desconto.Text                  := FieldByName('discount_value').AsString;
    E_Work_Front.Text                   := FieldByName('work_front').AsString;
    E_Note.Text                         := FieldByName('note').AsString;
    if FieldByName('dt_forecast').AsDateTime = 0.0 then
      E_DateForecast.Text := ''
    else
      E_DateForecast.Text := FieldByName('dt_forecast').AsString;
  End;
end;

procedure TTasOrderItems.ShowMerchandise;
begin
  FrMerchandise := TFmMerchandise.Create(Self);
  FrMerchandise.Align := alclient;
  FrMerchandise.Parent := ctn_merchandise;
  FrMerchandise.listar;
  FrMerchandise.Show;
  FrMerchandise.DBLCB_Lista.OnExit := MerchandiseExit;
//  UniSession.AddJS('setTimeout(function(){'+ FrMerchandise.DBLCB_Lista.JSName +'.focus()}, 100)');
end;

procedure TTasOrderItems.ShowNoData;
begin
  FrMerchandise.DBLCB_Lista.KeyValue := Null;
  E_Unit_Value.Text := '0,00';
  E_Qtty.Text := '0,00';
  E_Measure.Text := 'UND';
  E_Aliq_Desconto.Text := '0,00';
  E_Unit_Value.Text := '0,00';
  E_Work_Front.Clear;
  E_Note.Clear;
  totalizer;
end;


procedure TTasOrderItems.ShowStockList;
begin
  FrStockList := TFmStockList.Create(Self);
  FrStockList.Align := alclient;
  FrStockList.Parent := ctn_stock_List;
  FrStockList.listar;
  FrStockList.Show;
  FrStockList.DBLCB_Lista.OnExit := StockListExit;
end;

procedure TTasOrderItems.totalizer;
Var
  Lc_Vl_aux : Real;
  Lc_Vl_Total : Real;
  Lc_Qt_aux : Real;
  Lc_VL_IPI : Real;
begin
  Lc_Vl_Total := 0;
  //Quanatidade PRodutos
  Lc_Qt_aux := StrToFloatDef(E_Qtty.Text,1);
  //Valor dos Produtos
  Lc_Vl_aux := StrToFloatDef(E_Unit_Value.Text, 0);
  //Valor Subtotal Do Produto
  Lc_Vl_aux := Lc_Vl_aux * Lc_Qt_aux;
  E_Total_Product.Text := FloatToStrF(Lc_Vl_aux, ffFixed, 10, 2);
  //Desconto
  Lc_Vl_aux := StrToFloatDef(E_Vl_Desconto.Text, 0);
  //Valor total
  Lc_Vl_aux := StrToFloatDef(E_Total_Product.Text,0);
  Lc_Vl_aux := Lc_Vl_aux - StrToFloatDef(E_VL_Desconto.Text, 0);
  E_Total_Value.Text := FloattoStrf(Lc_Vl_aux,ffFixed,10,2);
end;

procedure TTasOrderItems.UniFormShow(Sender: TObject);
begin
  ShowStockList;
  ShowMerchandise;
  inherited;
end;

procedure TTasOrderItems.Sb_SaveClick(Sender: TObject);
begin
  if validateSave then
  begin
    Save;
    finalizeSave;
  end;
end;

procedure TTasOrderItems.setImages;
begin
  inherited;
  buttonIcon(Sb_Save,'save.bmp');
  buttonIcon(Sb_Cancel,'cancel.bmp');
end;

procedure TTasOrderItems.Sb_CancelClick(Sender: TObject);
begin
  if validateCancel then
    Cancel;
end;

function TTasOrderItems.validateCancel: Boolean;
begin
  REsult := True;
end;

function TTasOrderItems.validateSave: Boolean;
begin
  REsult := True;
  if (trim(FrStockList.DBLCB_Lista.Text) = '') and FrStockList.chbx_UpdateStock.Checked then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Estoque não informado.',
                  'Preencha o campo para continuar']);
    Result := False;

    exit;
  end;

  if (trim(FrMerchandise.DBLCB_Lista.Text)='') then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo produto não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if (StrToFloatDef(E_Unit_Value.Text,0) = 0) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Valor Unitário nãoo pode conter zero.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if (StrToFloatDef(E_Qtty.Text,0) = 0) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Quantidade não pode conter zeroS.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

end;

end.
