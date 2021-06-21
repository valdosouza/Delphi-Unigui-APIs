unit tas_order_production_items_mp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_form, uniButton, uniBitBtn,
  uniSpeedButton, uniCheckBox, uniGUIClasses, uniEdit, uniLabel,ControllerMerchandise,
  uniGUIBaseClasses, uniPanel, uniMultiItem, uniComboBox,fm_stock_list,ControllerStockBalance,
  Datasnap.DBClient,System.Math,   Data.DB, Datasnap.Provider, fm_merchandise,
  uniDBComboBox, uniDBLookupComboBox, uniDateTimePicker, Vcl.Menus, uniMainMenu;

type
  TTasOrderProductionItemsMp = class(TBaseForm)
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
    UniLabel5: TUniLabel;
    E_Total_Value: TUniFormattedNumberEdit;
    ctn_merchandise: TUniContainerPanel;
    ctn_Stock_List: TUniContainerPanel;
    UniLabel1: TUniLabel;
    E_Stock_Balance: TUniFormattedNumberEdit;
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
    TipoInclusao : String;
    function validateSave:Boolean;Virtual;
    procedure save;Virtual;
    procedure finalizeSave;Virtual;
    function validateCancel:Boolean;Virtual;
    procedure Cancel;Virtual;

  end;

var
  TasOrderProductionItemsMp: TTasOrderProductionItemsMp;

implementation

{$R *.dfm}

uses MainModule, unMessages;

procedure TTasOrderProductionItemsMp.Cancel;
begin
  Close;
end;


procedure TTasOrderProductionItemsMp.StockListExit(Sender: TObject);
begin
  getStockBalance;
end;

procedure TTasOrderProductionItemsMp.EditionControl;
begin
  FrMerchandise.DBLCB_Lista.ReadOnly := (CodigoRegistro > 0);
end;

procedure TTasOrderProductionItemsMp.E_QttyExit(Sender: TObject);
begin
  totalizer
end;

procedure TTasOrderProductionItemsMp.E_Unit_ValueExit(Sender: TObject);
begin
  totalizer
end;

procedure TTasOrderProductionItemsMp.finalizeSave;
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

procedure TTasOrderProductionItemsMp.formatScreen;
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

procedure TTasOrderProductionItemsMp.getStockBalance;
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


procedure TTasOrderProductionItemsMp.getUnitValue;
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

procedure TTasOrderProductionItemsMp.InitVariable;
begin
  inherited;
  Mercadoria  := TControllerMerchandise.Create(Self);
end;

procedure TTasOrderProductionItemsMp.MerchandiseExit(Sender: TObject);
begin
  getStockBalance;
  getUnitValue;
end;

procedure TTasOrderProductionItemsMp.save;
begin
  with self.cds_Item do
  Begin
    if not Active then createDataset;
    if EditionState = 'I' then
    Begin
      Append;
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
    FieldByName('kind').AsString := TipoInclusao;
    FieldByName('quantity').AsFloat := StrToFloatDef(E_Qtty.Text,0);
    FieldByName('unit_value').AsFloat := StrToFloatDef(E_Unit_Value.Text,0);
    FieldByName('subtotal').AsFloat := FieldByName('quantity').AsFloat * FieldByName('unit_value').AsFloat;
    Post;
    Active := False;
    Active := True;
  End;
end;

procedure TTasOrderProductionItemsMp.SetVariable;
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


procedure TTasOrderProductionItemsMp.ShowData;
begin
  with cds_Item do
  Begin
    FrStockList.DBLCB_Lista.KeyValue    := FieldByName('tb_stock_list_id').AsInteger;
    FrMerchandise.DBLCB_Lista.KeyValue  := cds_Item.fieldByname('tb_product_id').AsString;
    FrMerchandise.DBLCB_Lista.Text      :=  FieldByName('description').AsString;
    E_Qtty.Text                         := FieldByName('quantity').AsString;
    E_Unit_Value.Text                   := FieldByName('unit_value').AsString;
  End;
end;

procedure TTasOrderProductionItemsMp.ShowMerchandise;
begin
  FrMerchandise := TFmMerchandise.Create(Self);
  FrMerchandise.Align := alclient;
  FrMerchandise.Parent := ctn_merchandise;
  FrMerchandise.listar;
  FrMerchandise.Show;
  FrMerchandise.DBLCB_Lista.OnExit := MerchandiseExit;
//  UniSession.AddJS('setTimeout(function(){'+ FrMerchandise.DBLCB_Lista.JSName +'.focus()}, 100)');
end;

procedure TTasOrderProductionItemsMp.ShowNoData;
begin
  FrMerchandise.DBLCB_Lista.KeyValue := Null;
  E_Unit_Value.Text := '0,00';
  E_Qtty.Text := '0,00';
  E_Measure.Text := 'UND';
  E_Unit_Value.Text := '0,00';
  totalizer;
end;


procedure TTasOrderProductionItemsMp.ShowStockList;
begin
  FrStockList := TFmStockList.Create(Self);
  FrStockList.Align := alclient;
  FrStockList.Parent := ctn_stock_List;
  FrStockList.listar;
  FrStockList.Show;
  FrStockList.DBLCB_Lista.OnExit := StockListExit;
end;

procedure TTasOrderProductionItemsMp.totalizer;
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
  E_Total_Value.Text := FloattoStrf(Lc_Vl_aux,ffFixed,10,2);
end;

procedure TTasOrderProductionItemsMp.UniFormShow(Sender: TObject);
begin
  ShowStockList;
  ShowMerchandise;
  inherited;
end;

procedure TTasOrderProductionItemsMp.Sb_SaveClick(Sender: TObject);
begin
  if validateSave then
  begin
    Save;
    finalizeSave;
  end;
end;

procedure TTasOrderProductionItemsMp.setImages;
begin
  inherited;
  buttonIcon(Sb_Save,'save.bmp');
  buttonIcon(Sb_Cancel,'cancel.bmp');
end;

procedure TTasOrderProductionItemsMp.Sb_CancelClick(Sender: TObject);
begin
  if validateCancel then
    Cancel;
end;

function TTasOrderProductionItemsMp.validateCancel: Boolean;
begin
  REsult := True;
end;

function TTasOrderProductionItemsMp.validateSave: Boolean;
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
