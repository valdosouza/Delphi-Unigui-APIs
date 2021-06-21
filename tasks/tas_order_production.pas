unit tas_order_production;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, tas_order, Vcl.Menus, uniMainMenu,System.AnsiStrings,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniDateTimePicker, uniEdit, uniLabel, uniPageControl, fm_provider,fm_situation,
  ControllerOrderProduction, unmessages, MainModule, msg_form,FireDAC.Stan.Param, fm_merchandise,
  uniBasicGrid, uniDBGrid, Data.DB, Datasnap.DBClient, tblOrderItem, fm_order_items_production,
  UnFunctions, uniCheckBox, uniMemo, fm_stock_list, ControllerStockStatement;

type
  TTasOrderProduction = class(TTasOrder)
    E_Number: TUniEdit;
    Dtp_Registry: TUniDateTimePicker;
    Ctn_Merchandise: TUniContainerPanel;
    pg_Items: TUniPageControl;
    tbs_List: TUniTabSheet;
    pnl_Order_Item: TUniPanel;
    Ctn_Order_itens_production: TUniContainerPanel;
    tbs_other: TUniTabSheet;
    UniPanel2: TUniPanel;
    M_note: TUniMemo;
    UniLabel13: TUniLabel;
    Ctn_Stock_Id_Ori: TUniContainerPanel;
    Ctn_Stock_Id_Des: TUniContainerPanel;
    Ctn_Situacao: TUniContainerPanel;
    UniLabel1: TUniLabel;
    Dtp_Start: TUniDateTimePicker;
    UniLabel2: TUniLabel;
    Dtp_Forecast: TUniDateTimePicker;
    L_Codigo: TUniLabel;
    L_DtRegistry: TUniLabel;
    UniLabel3: TUniLabel;
    E_Qtty: TUniNumberEdit;

    procedure InitVariable;Override;
    procedure FormatScreen;Override;
    procedure setVariable; override;

    procedure ShowData;Override;
    procedure ShowDataOrder;
    procedure ShowDataOrderProduction;
    procedure ShowDataTotalizer;
    procedure ShowNoData;Override;
    procedure ClearAllFields;Override;
    procedure EditionControl;Override;

  private
    { Private declarations }

  protected
    OrderProduction         : TControllerOrderProduction;
    FrMerchandise           : TFmMerchandise;
    frSituation             : TFmSituation;
    frOrderItemsProduction  : TFmOrderItemsProduction;
    FrStockIdOri    : TFmStockList;
    FrStockIdDes    : TFmStockList;

    procedure ShowSituation;
    procedure ShowlistItems;
    procedure ShowMerchandise;
    procedure ShowStockIdOri;
    procedure ShowStockIdDes;


    function  ValidaInsert():boolean;Override;
    procedure Insert;Override;
    function  ValidateSave: boolean;Override;
    procedure Save;Override;
    procedure SaveOrder;
    procedure SaveOrderProduction;
    procedure SaveOrdertotalizer;

    function  ValidateDelete: boolean;Override;
    procedure Delete;Override;

    function ValidateChange():boolean;Override;
    procedure Change;Override;

    function validatePrintOrder:Boolean;Override;
    procedure printOrder;Override;

    function validateInvoice:Boolean;Override;
    procedure toInvoice;Override;
    procedure putStockIn;
    procedure putStockOut;
    procedure finishedInvoice;

  public
      { Public declarations }
end;

var
  TasOrderProduction: TTasOrderProduction;

implementation

{$R *.dfm}

{ TTasOrderProduction }

procedure TTasOrderProduction.Change;
begin
  inherited;

end;

procedure TTasOrderProduction.ClearAllFields;
begin
  inherited;
  OrderProduction.clear;
  ClearFields(FrMerchandise);
  ClearFields(FrSituation);
  ClearFields(FrStockIdOri);
  ClearFields(FrStockIdDes);
  ClearFields(frOrderItemsProduction);
end;

procedure TTasOrderProduction.Delete;
begin
  inherited;
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja realmente excluir este registro?',
                'clique em SIM para confirmar.'],mpAlerta);
    FormMsg.ShowModal(
      Procedure(Sender: TComponent; AResult:Integer)
      begin
        if (Sender as TMsgForm).BotaoEscolhido > 0 then
        Begin
            //OrderProduction.delete;
          //Provider.delete;
          //PaymentType.delete;
          ClearAllFields;
        End;
      end
    );
end;

procedure TTasOrderProduction.EditionControl;
begin
  inherited;
  EditionControler(FrMerchandise);
  EditionControler(FrSituation);
  EditionControler(frOrderItemsProduction);
  EditionControler(FrStockIdOri);
  EditionControler(FrStockIdDes);
  Sb_Invoice.Enabled := ( EditionState = 'B' );
  Sb_print.Enabled := ( EditionState = 'B' );
end;

procedure TTasOrderProduction.finishedInvoice;
begin
  OrderProduction.Order.Registro.Status := 'F';
  OrderProduction.Order.setStatus;
end;

procedure TTasOrderProduction.FormatScreen;
begin
  inherited;
  pg_Items.ActivePage := tbs_List;
  ShowMerchandise;
  ShowSituation;
  ShowlistItems;
  ShowStockIdOri;
  ShowStockIdDes;
end;

procedure TTasOrderProduction.InitVariable;
begin
  inherited;
  OrderProduction := TControllerOrderProduction.Create(self);
end;

procedure TTasOrderProduction.Insert;
begin
  inherited;
  ClearAllFields;
end;

procedure TTasOrderProduction.printOrder;
begin
  inherited;

end;

procedure TTasOrderProduction.putStockIn;
Var
  LcStock : TControllerStockStatement;
begin
  LcStock := TControllerStockStatement.Create(self);
  with LcStock.Registro do
  Begin
    Estabelecimento := OrderProduction.Order.Registro.Estabelecimento;
    Ordem := OrderProduction.Order.Registro.Codigo ;
    OrdemItem := 1;
    Estoque := OrderProduction.Registro.EstoqueDestino;
    Local := 'Matriz';
    Tipo := 'production';
    DataRegistro := Date;
    Direcao := 'E';
    Mercadoria := OrderProduction.Registro.Mercadoria;
    Quantidade := OrderProduction.Registro.PrevisaoQtde;
  End;
  LcStock.save;
  FreeAndNil(LcStock);
end;

procedure TTasOrderProduction.putStockOut;
Var
  LcStock : TControllerStockStatement;
begin
  LcStock := TControllerStockStatement.Create(self);
  with frOrderItemsProduction do
  Begin
    cds_items.first;
    while not cds_items.eof do
    Begin
      with LcStock.Registro do
      Begin
        Estabelecimento := OrderProduction.Order.Registro.Estabelecimento;
        Ordem := OrderProduction.Order.Registro.Codigo ;
        OrdemItem := cds_itemsid.AsInteger;
        Estoque := OrderProduction.Registro.EstoqueOrigem;
        Local := 'Matriz';
        Tipo := 'production';
        DataRegistro := Date;
        Direcao := 'S';
        Mercadoria := cds_itemscodepro.AsInteger;
        Quantidade := cds_itemsquantity.AsFloat;
      End;
      LcStock.save;
      cds_items.Next;
    End;
  End;
  FreeAndNil(LcStock);
end;

procedure TTasOrderProduction.Save;
begin
  SaveOrder;
  SaveOrderProduction;
  SaveOrdertotalizer;
  SaveOrderItems(frOrderItemsProduction.cds_items,OrderProduction.Registro.Codigo);
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := OrderProduction.Registro.Codigo;
end;

procedure TTasOrderProduction.SaveOrder;
begin
  with OrderProduction.Order.Registro do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Data            := Dtp_Registry.DateTime;
    Observacao      := M_Note.text;
    Usuario         := UMM.GInstitution.User.Registro.codigo;
    Status          := 'N';
  End;
  OrderProduction.Order.save;
end;


procedure TTasOrderProduction.SaveOrderProduction;
begin
  with OrderProduction.Registro do
  Begin
    Codigo          := OrderProduction.Order.Registro.Codigo;
    Estabelecimento := OrderProduction.Order.Registro.Estabelecimento;
    if StrToIntDef(E_Number.Text,0) =0 then
      E_Number.Text := OrderProduction.getNexNumber;
    Numero            := StrToIntDef(E_Number.Text,0);
    if Dtp_Start.Text = '30/12/1899' then
      DataInicio         := 0.0
    else
      DataInicio         := Dtp_Start.DateTime;
    if Dtp_Forecast.Text = '30/12/1899' then
      DataFinal         := 0.0
    else
      DataFinal         := Dtp_Forecast.DateTime;
    Mercadoria        := FrMerchandise.DBLCB_Lista.KeyValue;
    PrevisaoQtde      := E_qtty.Value;
    EstoqueOrigem     := FrStockIdOri.DBLCB_Lista.KeyValue;
    EstoqueDestino    := FrStockIdDes.DBLCB_Lista.KeyValue;
    Situacao          := FrSituation.DBLCB_Lista.KeyValue;
  End;
  OrderProduction.save;
end;

procedure TTasOrderProduction.SaveOrdertotalizer;
begin
  with OrderProduction.OrderTotalizer.Registro,frOrderItemsProduction do
  begin
    Codigo            := OrderProduction.Order.Registro.Codigo;
    Estabelecimento   := OrderProduction.Order.Registro.Estabelecimento;
    ItemsQuantidade   := E_Nr_Items.Value;
    ProdutoQuantidade := E_total_qtty.Value;
    ValorProduto      := E_total_Product.Value;
    IPIValor          := 0;
    AlíquotaDesconto  := E_Tx_Discount.Value;
    ValorDesconto     := E_VL_Discount.Value;
    ValorDespesas     := E_VL_Expensive.Value;
    ValorTotal        := E_VL_Order.Value;
  end;
  OrderProduction.OrderTotalizer.save;
end;

procedure TTasOrderProduction.setVariable;
begin
 with OrderProduction do
  Begin
    Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Registro.Codigo := CodigoRegistro;
    getByKey;

    with Order do
    Begin
      Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
      Registro.Codigo := CodigoRegistro;
      Order.getByKey;
    End;

    with OrderTotalizer do
    begin
      registro.Codigo := Order.Registro.Codigo;
      registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
      OrderTotalizer.getByKey;
    end;

  End;
  inherited;
end;

procedure TTasOrderProduction.ShowData;
begin
  ShowDataOrder;
  ShowDataOrderProduction;
  ShowDataTotalizer;
  ShowDatalisttItems(frOrderItemsProduction.cds_items, OrderProduction.Registro.Codigo);
end;

procedure TTasOrderProduction.ShowDataOrder;
begin
  With OrderProduction.Order.Registro do
  begin
    Dtp_Registry.DateTime := Data;
    if DateToStr(Data) <> '30/12/1899' then
      Dtp_Start.DateTime := Data
    else
      Dtp_Start.DateTime := 0.0;
    M_Note.text := Observacao;
  end;
end;

procedure TTasOrderProduction.ShowDataOrderProduction;
begin
  With OrderProduction.Registro do
  Begin
    E_Number.Text   := IntToStr(Numero);
    FrMerchandise.DBLCB_Lista.KeyValue := Mercadoria;
    E_qtty.Value := PrevisaoQtde;
    FrStockIdOri.DBLCB_Lista.KeyValue := EstoqueOrigem;
    FrStockIdDes.DBLCB_Lista.KeyValue := EstoqueDestino;
    frSituation.DBLCB_Lista.KeyValue := Situacao;
    if DateToStr(DataFinal) <> '30/12/1899' then
      Dtp_Forecast.DateTime := DataFinal
    else
      Dtp_Forecast.DateTime := 0.0;
  end;
end;

procedure TTasOrderProduction.ShowDataTotalizer;
begin
  with OrderProduction.OrderTotalizer.Registro,frOrderItemsProduction do
  begin
    E_total_qtty.Value     := ProdutoQuantidade;
    E_total_Product.Value  := ValorProduto;
    E_VL_Expensive.Value   := ValorDespesas;
    E_Tx_Discount.Value    := AlíquotaDesconto;
    E_vl_Discount.Value    := ValorDesconto;
    E_VL_Order.Value       := ValorTotal;
  end;

end;

procedure TTasOrderProduction.ShowlistItems;
begin
  frOrderItemsProduction := TFmOrderItemsProduction.Create(Self);
  frOrderItemsProduction.Parent := Ctn_Order_itens_production;
  frOrderItemsProduction.Align := alClient;
  frOrderItemsProduction.Show;
end;

procedure TTasOrderProduction.ShowNoData;
begin
  ClearAllFields;
  inherited;
end;

procedure TTasOrderProduction.ShowMerchandise;
begin
  FrMerchandise := TFmMerchandise.Create(Self);
  FrMerchandise.Parent := Ctn_Merchandise;
  FrMerchandise.listar;
  FrMerchandise.Align := alClient;
  FrMerchandise.Show;
end;

procedure TTasOrderProduction.ShowSituation;
begin
  FrSituation := TFmSituation.Create(Self);
  FrSituation.Parent := Ctn_Situacao;
  FrSituation.listar;
  FrSituation.Align := alClient;
  FrSituation.Show;
end;

procedure TTasOrderProduction.ShowStockIdDes;
begin
  FrStockIdDes := TFmStockList.Create(Self);
  FrStockIdDes.Name := 'FrStockListdes';
  FrStockIdDes.Parent := Ctn_Stock_Id_Des;
  FrStockIdDes.chbx_UpdateStock.Visible := False;
  FrStockIdDes.DBLCB_Lista.FieldLabel := 'Informe o nome do estoque do Produto Acabado';
  FrStockIdDes.listar;
  FrStockIdDes.Align := alClient;
  FrStockIdDes.Show;
end;

procedure TTasOrderProduction.ShowStockIdOri;
begin
  FrStockIdOri := TFmStockList.Create(Self);
  FrStockIdOri.Name := 'FrStockListori';
  FrStockIdOri.Parent := Ctn_Stock_Id_Ori;
  FrStockIdOri.chbx_UpdateStock.Visible := False;
  FrStockIdOri.DBLCB_Lista.FieldLabel := 'Informe o nome do estoque de Matéria Prima';
  FrStockIdOri.listar;
  FrStockIdOri.Align := alClient;
  FrStockIdOri.Show;

end;

procedure TTasOrderProduction.toInvoice;
begin
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja realmentefinalizer esta produção.',
                'Confirmar a operação ?'],mpAlerta);
  FormMsg.ShowModal(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if (Sender as TMsgForm).BotaoEscolhido > 0 then
      Begin
        Self.Close;
        FormMsg := Nil;
        putStockIn;
        putStockOut;
        finishedInvoice;
      End;
    end
  );
end;

function TTasOrderProduction.ValidaInsert: boolean;
begin
  Result := True;
end;

function TTasOrderProduction.ValidateChange: boolean;
begin
  Result := True;
  if not ValidatehasNotInvoice(OrderProduction.Registro.Codigo) then
  Begin
    Result := False;
    exit;
  End;
end;

function TTasOrderProduction.ValidateDelete: boolean;
begin
  Result := True;
  if not ValidatehasNotInvoice(OrderProduction.Registro.Codigo) then
  Begin
    Result := False;
    exit;
  End;

end;

function TTasOrderProduction.validateInvoice: Boolean;
begin
  REsult := true;
  if not ValidatehasNotInvoice(OrderProduction.Registro.Codigo) then
  Begin
    Result := False;
    exit;
  End;

  if not hasOrderItems(frOrderItemsProduction.cds_items) then
  Begin
    Result := False;
    exit;
  End;
end;

function TTasOrderProduction.validatePrintOrder: Boolean;
begin
  REsult := true;
  if not hasOrderItems(frOrderItemsProduction.cds_items) then
  Begin
    Result := False;
    exit;
  End;
end;

function TTasOrderProduction.ValidateSave: boolean;
begin
  result :=true;
  if (TRIM(FrMerchandise.DBLCB_Lista.Text) = '') or (FrMerchandise.DBLCB_Lista.KeyValue = null) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                '',
                'Campo Mercadoria não informado.',
                'Preencha o campo para continuar']);

    Result:=False;
    Exit;
  end;

  if (TRIM(FrStockIdOri.DBLCB_Lista.Text) = '') or (FrStockIdOri.DBLCB_Lista.KeyValue = null) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                 '',
                 'Informe o estoque de matéria prima.',
                 'Preencha o campo para continuar']);
    pg_Items.ActivePage := tbs_other;
    Result:=False;
    Exit;
  end;

  if (TRIM(FrStockIdDes.DBLCB_Lista.Text) = '') or (FrStockIdDes.DBLCB_Lista.KeyValue = null) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                '',
                'Informe o estoque de produto acabado.',
                'Preencha o campo para continuar']);
    pg_Items.ActivePage := tbs_other;
    Result:=False;
    Exit;
  end;

  if ( TRIM(FrSituation.DBLCB_Lista.Text) = '' ) or (FrSituation.DBLCB_Lista.KeyValue = null) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                 '',
                 'Campo Situação não informado.',
                 'Preencha o campo para continuar']);
    pg_Items.ActivePage := tbs_other;
    Result:=False;
    Exit;
  end;

  if TRIM(Dtp_Registry.Text) = '30/12/1899' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                 '',
                 'Campo Data Cadastro não informado.',
                 'Preencha o campo para continuar']);
    Result:=False;
    Exit;
  end;
end;

end.
