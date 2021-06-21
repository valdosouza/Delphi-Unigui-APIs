unit fm_order_items;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniBasicGrid, uniDBGrid, uniGUIClasses, uniEdit, uniLabel,tblOrderItem,
  uniGUIBaseClasses, uniPanel, tas_order_items, Data.DB, Datasnap.DBClient,uniGUIApplication,
  ControllerOrderItem, MainModule, System.Math, UnFunctions, Vcl.Menus,
  uniMainMenu;

type
  TFmOrderItems = class(TFmBaseFrame)
    ds_search: TDataSource;
    cds_items: TClientDataSet;
    Pnl_Items: TUniPanel;
    dbg_List_items: TUniDBGrid;
    sb_Insert_Items: TUniSpeedButton;
    sb_Change_Items: TUniSpeedButton;
    sb_Delete_Items: TUniSpeedButton;
    E_Nr_Items: TUniFormattedNumberEdit;
    E_VL_Expensive: TUniFormattedNumberEdit;
    cds_itemscodepro: TIntegerField;
    cds_itemsidentifier: TStringField;
    cds_itemsdescription: TStringField;
    cds_itemsid: TIntegerField;
    cds_itemstb_institution_id: TIntegerField;
    cds_itemstb_order_id: TIntegerField;
    cds_itemstb_product_id: TIntegerField;
    cds_itemstb_stock_list_id: TIntegerField;
    cds_itemsquantity: TBCDField;
    cds_itemsunit_value: TFMTBCDField;
    cds_itemsdiscount_aliquot: TBCDField;
    cds_itemsdiscount_value: TFMTBCDField;
    cds_itemstotal_value: TFloatField;
    cds_itemsreg_status: TStringField;
    cds_itemswork_front: TStringField;
    cds_itemsnote: TStringField;
    cds_itemsdt_forecast: TDateField;
    cds_itemscomposition: TStringField;
    pop_items: TUniPopupMenu;
    Mercadoria1: TUniMenuItem;
    cds_itemsstatus: TStringField;
    pnl_totalizer: TUniPanel;
    E_total_qtty: TUniFormattedNumberEdit;
    E_total_Product: TUniFormattedNumberEdit;
    E_VL_Discount: TUniFormattedNumberEdit;
    E_Tx_Discount: TUniFormattedNumberEdit;
    E_VL_Freight: TUniFormattedNumberEdit;
    E_VL_Order: TUniFormattedNumberEdit;
    procedure setImages;Override;
    procedure sb_Insert_ItemsClick(Sender: TObject);
    procedure sb_Change_ItemsClick(Sender: TObject);
    procedure sb_Delete_ItemsClick(Sender: TObject);
    procedure dbg_List_itemsTitleClick(Column: TUniDBGridColumn);
    procedure cds_itemsCalcFields(DataSet: TDataSet);
    procedure UniFrameCreate(Sender: TObject);
    procedure E_VL_ExpensiveExit(Sender: TObject);
    procedure E_VL_FreightExit(Sender: TObject);
    procedure E_Tx_DiscountExit(Sender: TObject);
    procedure E_VL_DiscountExit(Sender: TObject);
    procedure Mercadoria1Click(Sender: TObject);
    procedure dbg_List_itemsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cds_itemsAfterPost(DataSet: TDataSet);
    procedure cds_itemsAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
    OrderItem : TControllerOrderItem;
  protected
    function ValidateInserItems:Boolean;Virtual;
    procedure insertItems;Virtual;
    function ValidateChangeItems:Boolean;Virtual;
    procedure ChangeItems;Virtual;
    function ValidateDeleteItems:Boolean;Virtual;
    procedure DeleteItems;Virtual;
    procedure ApplyDiscont(DiscountValue: real);
  public
    { Public declarations }
    procedure totalizerItems;Virtual;
    procedure totalizer;Virtual;
  end;

var
  FmOrderItems: TFmOrderItems;

implementation

{$R *.dfm}

uses unMessages, msg_form, openForms;

procedure TFmOrderItems.cds_itemsAfterDelete(DataSet: TDataSet);
begin
  inherited;
  E_Nr_Items.Value := cds_items.RecordCount;
end;

procedure TFmOrderItems.cds_itemsAfterPost(DataSet: TDataSet);
begin
  inherited;
  E_Nr_Items.Value := cds_items.RecordCount;
end;

procedure TFmOrderItems.cds_itemsCalcFields(DataSet: TDataSet);
begin
  //Controla se o item foi editado ou inserido
  UMM.regUpdater(DataSet);
  with cds_items do
  Begin
    FieldByName('total_value').AsFloat := ( FieldByName('quantity').AsFloat *
                                            FieldByName('unit_value').AsFloat ) -
                                            FieldByName('discount_value').AsFloat;
  End;
end;

procedure TFmOrderItems.ChangeItems;
Var
  Form : TTasOrderItems;
Begin
  if Form = nil then
    Form := TTasOrderItems.Create(UniApplication);
  Form.cds_Item := self.cds_items;
  Form.EditionState := 'E';
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
      self.totalizerItems;
      self.totalizer;
    end
  );
end;

procedure TFmOrderItems.dbg_List_itemsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then
  begin
    pop_items.Popup(X, Y, Pnl_Items);
  end;

end;

procedure TFmOrderItems.dbg_List_itemsTitleClick(Column: TUniDBGridColumn);
begin
  cds_items.IndexFieldNames := Column.FieldName;
end;

procedure TFmOrderItems.DeleteItems;
begin
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja realmente excluir este registro?',
                'clique em SIM para confirmar.'],mpAlerta);
  FormMsg.ShowModal(
  Procedure(Sender: TComponent; AResult:Integer)
  begin
    if (Sender as TMsgForm).BotaoEscolhido > 0 then
    Begin
      self.cds_items.Delete;
      self.totalizerItems;
      self.totalizer;
    End;
  end
  );

end;

procedure TFmOrderItems.ApplyDiscont(DiscountValue: real);
var
  LcSubtotal : Real;
  Lc_tx_cal : real;
  Lc_vl_cal : Real;
  Lc_vl_cal_Total : Real;
begin
  with cds_items do
  Begin
    LcSubtotal := 0;
    Lc_tx_cal := 0;
    Lc_vl_cal := 0;
    Lc_vl_cal_Total := 0;
    First;
    while not Eof do
    begin
      //Calculo pega o valor do subtotal do item
      LcSubtotal := (FieldByName('unit_value').AsFloat * FieldByName('quantity').AsFloat);
      //Faz o calculo da aliquota
      Lc_tx_cal := RoundTo((LcSubtotal / E_total_Product.Value),-4);
      Lc_vl_cal := RoundTo(DiscountValue * Lc_tx_cal,-2);
      Lc_tx_cal := RoundTo((Lc_vl_cal/E_total_Product.Value)*100,-2);
      Lc_vl_cal_Total := Lc_vl_cal_Total + Lc_vl_cal;
      //Atualiza o regitro atual
      edit;
      cds_itemsdiscount_aliquot.AsFloat := Lc_tx_cal;
      cds_itemsdiscount_value.AsFloat := Lc_vl_cal;
      post;
      //Avança para o proximo registro
      Next;
      //Verifica se e o ultimo registro para fazer compensação de arredondamento
      if eof then
      Begin
        if ( (DiscountValue - Lc_vl_cal_Total) <> 0 ) then
        Begin
          if (DiscountValue > Lc_vl_cal_Total) then
            Lc_vl_cal := Lc_vl_cal + (DiscountValue - Lc_vl_cal_Total)
          else
          Begin
            Lc_vl_cal := Lc_vl_cal - (Lc_vl_cal_Total - DiscountValue);
            if (Lc_vl_cal < 0) then
            Begin
              Prior;
              Lc_vl_cal :=  cds_itemsdiscount_value.AsFloat + Lc_vl_cal;
            end;
          end;
          Lc_tx_cal := RoundTo((Lc_vl_cal/E_total_Product.Value)*100,-2);
          edit;
          cds_itemsdiscount_aliquot.AsFloat := Lc_tx_cal;
          cds_itemsdiscount_value.AsFloat := Lc_vl_cal;
          post;
        End;
      end;
    end;
  end;
end;

procedure TFmOrderItems.E_Tx_DiscountExit(Sender: TObject);
begin
  E_VL_Discount.Value := RoundTo((E_total_Product.Value * (E_Tx_Discount.Value/100)),-2);
  ApplyDiscont(E_VL_Discount.Value);
  totalizer;
end;

procedure TFmOrderItems.E_VL_DiscountExit(Sender: TObject);
begin
  E_Tx_Discount.Value := RoundTo((E_VL_Discount.Value / E_total_Product.Value)*100,-2);
  ApplyDiscont(E_VL_Discount.Value);
  totalizer
end;

procedure TFmOrderItems.E_VL_ExpensiveExit(Sender: TObject);
begin
  totalizer
end;

procedure TFmOrderItems.E_VL_FreightExit(Sender: TObject);
begin
  totalizer;
end;

procedure TFmOrderItems.insertItems;
Var
  Form : TTasOrderItems;
Begin
  if Form = nil then
  Form := TTasOrderItems.Create(UniApplication);
  Form.cds_Item := self.cds_items;
  Form.EditionState := 'I';
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      self.totalizerItems;
      self.totalizer;
      Form := nil;
    end
  );

end;

procedure TFmOrderItems.Mercadoria1Click(Sender: TObject);
begin
  openCadMerchandise(cds_itemscodepro.AsInteger ,nil);
end;

procedure TFmOrderItems.sb_Change_ItemsClick(Sender: TObject);
begin
  if ValidateChangeItems then
    ChangeItems;
end;

procedure TFmOrderItems.sb_Delete_ItemsClick(Sender: TObject);
begin
  inherited;
  if ValidateDeleteItems then
    DeleteItems;
end;

procedure TFmOrderItems.sb_Insert_ItemsClick(Sender: TObject);
begin
  if ValidateInserItems then
    insertItems;
end;

procedure TFmOrderItems.setImages;
begin
  inherited;
  buttonIcon(SB_Insert_Items,'mini_insert.bmp');
  buttonIcon(SB_Change_Items,'mini_change.bmp');
  buttonIcon(Sb_Delete_Items,'mini_delete.bmp');
end;


procedure TFmOrderItems.totalizer;
Var
  Lc_Total : Real;
Begin
  Lc_Total := E_total_Product.Value;
  Lc_Total := Lc_Total + E_VL_Expensive.Value;
  Lc_Total := Lc_Total + E_VL_Freight.Value;
  E_VL_Order.Value := Lc_Total;
end;

procedure TFmOrderItems.totalizerItems;
Var
  Lc_Nr_Items:Integer;
  Lc_Qtty : REal;
  Lc_Total : Real;
begin
  with cds_items do
  Begin
    if not Active  then createdataset;
    first;
    Lc_Nr_Items := 0;
    Lc_Qtty := 0;
    Lc_Total := 0;
    while not eof do
    Begin
      inc(Lc_Nr_Items);
      Lc_Qtty := Lc_Qtty + FieldByName('quantity').AsFloat;
      Lc_Total := Lc_Total + FieldByName('total_value').AsFloat;
      next;
    End;
  End;
  E_Nr_Items.Text := IntToStr(Lc_Nr_Items);
  E_total_qtty.Text := formatfloat('0.00##', Lc_Qtty);
  E_total_Product.Text := formatfloat('0.00##', Lc_Total);

end;

procedure TFmOrderItems.UniFrameCreate(Sender: TObject);
begin
  inherited;
  OrderITem := TControllerOrderItem.Create(Self);
end;

function TFmOrderItems.ValidateChangeItems: Boolean;
begin
  Result := True;
  if cds_items.RecordCount = 0 then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há registros para alterar.',
                  'Verifiqe e tente novamente.']);
    Result := False;
  End;

  if cds_itemsstatus.AsString = 'F' then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não é possível alterar este item.',
                  'Consta que ele já foi faturado.',
                  'Verifique!!']);
    Result := False;
  End;

  if cds_itemsstatus.AsString = 'A' then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Este item foi criado automaticamente pelo sistema.',
                  'Precisamos definir como trataremos destes casos.']);
    Result := False;
  End;
end;

function TFmOrderItems.ValidateDeleteItems: Boolean;
begin
  Result := True;
  if cds_items.RecordCount = 0 then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há registros para Excluir.',
                  'Verifiqe e tente novamente.']);
    Result := False;
  End;

  if cds_itemsstatus.AsString = 'F' then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não é possível excluir este item.',
                  'Consta que ele já foi faturado.',
                  'Verifique!!']);
    Result := False;
  End;

  if cds_itemsstatus.AsString = 'A' then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Este item foi criado automaticamente pelo sistema.',
                  'Precisamos definir como trataremos destes casos.']);
    Result := False;
  End;

end;

function TFmOrderItems.ValidateInserItems: Boolean;
begin
  Result := True;
end;

end.
