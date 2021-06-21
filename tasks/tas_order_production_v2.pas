unit tas_order_production_v2;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, tas_order, Vcl.Menus, uniMainMenu,System.AnsiStrings,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniDateTimePicker, uniEdit, uniLabel, uniPageControl, fm_provider,fm_situation,
  ControllerOrderProduction, unmessages, MainModule, msg_form,FireDAC.Stan.Param, fm_merchandise,
  uniBasicGrid, uniDBGrid, Data.DB, Datasnap.DBClient, tblOrderItem,
  UnFunctions, uniCheckBox, uniMemo, Datasnap.Provider,
  ControllerOrderProductionPa, tblOrderProductionMp, tblOrderProductionPa,
  tas_order_production_items_mp;

type
  TTasOrderProductionV2 = class(TTasOrder)
    pg_Items: TUniPageControl;
    tbs_List_mp_Forecast: TUniTabSheet;
    UniPanel1: TUniPanel;
    E_Number: TUniEdit;
    Dtp_Registry: TUniDateTimePicker;
    L_Codigo: TUniLabel;
    L_DtRegistry: TUniLabel;
    Ctn_Situacao: TUniContainerPanel;
    UniLabel1: TUniLabel;
    Dtp_Start: TUniDateTimePicker;
    UniLabel2: TUniLabel;
    Dtp_Forecast: TUniDateTimePicker;
    tbs_other: TUniTabSheet;
    UniPanel2: TUniPanel;
    M_note: TUniMemo;
    UniLabel13: TUniLabel;
    Pnl_Items: TUniPanel;
    sb_Insert_Items_mp_f: TUniSpeedButton;
    sb_Change_Items_mp_f: TUniSpeedButton;
    sb_Delete_Items_mp_f: TUniSpeedButton;
    dbg_items_mp_forecast: TUniDBGrid;
    tbs_List_mp_real: TUniTabSheet;
    UniPanel3: TUniPanel;
    sb_Insert_Items_mp_r: TUniSpeedButton;
    sb_change_Items_mp_r: TUniSpeedButton;
    sb_Delete_Items_mp_r: TUniSpeedButton;
    tbs_List_pa: TUniTabSheet;
    UniPanel5: TUniPanel;
    sb_Insert_Items_pa: TUniSpeedButton;
    sb_Change_Items_pa: TUniSpeedButton;
    sb_Delete_Items_pa: TUniSpeedButton;
    dbg_items_pa: TUniDBGrid;
    cds_items_mp_forecast: TClientDataSet;
    ds_search_mp_forecast: TDataSource;
    ds_items_mp_real: TDataSource;
    cds_items_mp_real: TClientDataSet;
    ds_items_pa: TDataSource;
    cds_items_pa: TClientDataSet;
    DSP: TDataSetProvider;
    cds_items_mp_forecasttb_institution_id: TIntegerField;
    cds_items_mp_forecasttb_order_id: TIntegerField;
    cds_items_mp_forecastid: TIntegerField;
    cds_items_mp_forecasttb_product_id: TIntegerField;
    cds_items_mp_forecasttb_stock_list_id: TIntegerField;
    cds_items_mp_forecastkind: TStringField;
    cds_items_mp_forecastquantity: TBCDField;
    cds_items_mp_forecastunit_value: TFMTBCDField;
    cds_items_mp_forecastdescription: TStringField;
    cds_items_mp_forecastsubtotal: TFMTBCDField;
    dbg_items_mp_real: TUniDBGrid;
    cds_items_mp_realtb_institution_id: TIntegerField;
    cds_items_mp_realtb_order_id: TIntegerField;
    cds_items_mp_realid: TIntegerField;
    cds_items_mp_realtb_product_id: TIntegerField;
    cds_items_mp_realtb_stock_list_id: TIntegerField;
    cds_items_mp_realkind: TStringField;
    cds_items_mp_realquantity: TBCDField;
    cds_items_mp_realunit_value: TFMTBCDField;
    cds_items_mp_realdescription: TStringField;
    cds_items_mp_realsubtotal: TFMTBCDField;
    cds_items_patb_institution_id: TIntegerField;
    cds_items_patb_order_id: TIntegerField;
    cds_items_paid: TIntegerField;
    cds_items_patb_product_id: TIntegerField;
    cds_items_patb_stock_list_id: TIntegerField;
    cds_items_paquantity: TBCDField;
    cds_items_padescription: TStringField;

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
    procedure sb_Insert_Items_mp_fClick(Sender: TObject);
    procedure sb_Insert_Items_mp_rClick(Sender: TObject);
    procedure sb_Change_Items_mp_fClick(Sender: TObject);
    procedure sb_Delete_Items_mp_fClick(Sender: TObject);
    procedure sb_change_Items_mp_rClick(Sender: TObject);
    procedure sb_Delete_Items_mp_rClick(Sender: TObject);
    procedure sb_Insert_Items_paClick(Sender: TObject);
    procedure sb_Change_Items_paClick(Sender: TObject);
    procedure sb_Delete_Items_paClick(Sender: TObject);

  private
    { Private declarations }
    procedure ShowDatalisttItemsMpForeCast;
    procedure ShowDatalisttItemsMpReal;
    procedure ShowDatalisttItemsPa;

    //Itens da Materia Prima prevista
    function ValidateInserItemsMPF:Boolean;
    procedure insertItemsMPF;
    function ValidateChangeItemsMPF:Boolean;
    procedure ChangeItemsMPF;
    function ValidateDeleteItemsMPF:Boolean;
    procedure DeleteItemsMPF;

    //Itens da Materia Prima Realizada
    function ValidateInserItemsMPR:Boolean;
    procedure insertItemsMPR;
    function ValidateChangeItemsMPR:Boolean;
    procedure ChangeItemsMPR;
    function ValidateDeleteItemsMPR:Boolean;
    procedure DeleteItemsMPR;

    //Itens da Produto Acabado
    function ValidateInserItemsPA:Boolean;
    procedure insertItemsPA;
    function ValidateChangeItemsPA:Boolean;
    procedure ChangeItemsPA;
    function ValidateDeleteItemsPA:Boolean;
    procedure DeleteItemsPA;

  protected
    OrderProduction         : TControllerOrderProduction;
    frSituation             : TFmSituation;

    procedure ShowSituation;

    function  ValidaInsert():boolean;Override;
    procedure Insert;Override;
    function  ValidateSave: boolean;Override;
    procedure Save;Override;
    procedure SaveOrder;
    procedure SaveOrderProduction;
    procedure SaveOrderItemsMPF;
    procedure SaveOrderItemsMPR;
    procedure SaveOrderItemsPA;

    procedure DeletedItemsMPF;
    procedure DeletedItemsMPR;
    procedure DeletedItemsPA;

    function  ValidateDelete: boolean;Override;
    procedure Delete;Override;

    function ValidateChange():boolean;Override;
    procedure Change;Override;

    function validatePrintOrder:Boolean;Override;
    procedure printOrder;Override;

    function validateInvoice:Boolean;Override;
    procedure toInvoice;Override;
    procedure finishedInvoice;

  public
    { Public declarations }
  end;

var
  TasOrderProductionV2: TTasOrderProductionV2;

implementation

{$R *.dfm}

uses ControllerOrderProductionMp;

{ TTasOrderProductionV2 }

procedure TTasOrderProductionV2.ShowDatalisttItemsMpForeCast;
Var
  I : Integer;
  Registro : TOrderProductionMp;
  LcOrderItem : TControllerOrderProductionMp;
begin
  LcOrderItem := TControllerOrderProductionMp.create(Self);
  LcOrderItem.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  LcOrderItem.Registro.Ordem := OrderProduction.Registro.Codigo;
  LcOrderItem.Registro.TipoInclusao := 'F';
  LcOrderItem.getList;
  with cds_items_mp_forecast  do
  Begin
    if not Active then CreateDataSet;
    LogChanges := False;
    EmptyDataSet;
    for I := 0 to LcOrderItem.Lista.Count - 1 do
    Begin
      Registro := LcOrderItem.Lista[I];
      Append;
      FieldByName('id').AsInteger                 := Registro.Codigo;
      FieldByName('tb_institution_id').AsInteger  := Registro.Estabelecimento;
      FieldByName('tb_order_id').AsInteger        := Registro.Ordem;
      FieldByName('tb_product_id').AsString       := IntToStr( Registro.Produto );
      FieldByName('tb_stock_list_id').AsInteger   := Registro.Estoque;
      FieldByName('quantity').AsFloat             := Registro.Quantidade;
      FieldByName('unit_value').AsFloat           := Registro.ValorUnitario;
      FieldByName('subtotal').AsFloat             := ( Registro.Quantidade * Registro.ValorUnitario );
      //dados dos Produtos
      LcOrderItem.Mercadoria.Produto.Registro.Codigo := Registro.Produto;
      LcOrderItem.Mercadoria.Produto.Registro.Estabelecimento := Registro.Estabelecimento;
      LcOrderItem.Mercadoria.Produto.getByKey;
      FieldByName('description').AsString := LcOrderItem.Mercadoria.Produto.Registro.Descricao;
      Post;
    End;
  End;
  cds_items_mp_forecast.LogChanges := True;
  FreeAndNil(LcOrderItem);
end;

procedure TTasOrderProductionV2.ShowDatalisttItemsMpReal;
Var
  I : Integer;
  Registro : TOrderProductionMp;
  LcOrderItem : TControllerOrderProductionMp;
begin
  LcOrderItem := TControllerOrderProductionMp.create(Self);
  LcOrderItem.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  LcOrderItem.Registro.Ordem := OrderProduction.Registro.Codigo;
  LcOrderItem.Registro.TipoInclusao := 'R';
  LcOrderItem.getList;
  with cds_items_mp_real  do
  Begin
    if not Active then CreateDataSet;
    LogChanges := False;
    EmptyDataSet;
    for I := 0 to LcOrderItem.Lista.Count - 1 do
    Begin
      Registro := LcOrderItem.Lista[I];
      Append;
      FieldByName('id').AsInteger                 := Registro.Codigo;
      FieldByName('tb_institution_id').AsInteger  := Registro.Estabelecimento;
      FieldByName('tb_order_id').AsInteger        := Registro.Ordem;
      FieldByName('tb_product_id').AsString       := IntToStr( Registro.Produto );
      FieldByName('tb_stock_list_id').AsInteger   := Registro.Estoque;
      FieldByName('quantity').AsFloat             := Registro.Quantidade;
      FieldByName('unit_value').AsFloat           := Registro.ValorUnitario;
      FieldByName('subtotal').AsFloat             := ( Registro.Quantidade * Registro.ValorUnitario );
      //dados dos Produtos
      LcOrderItem.Mercadoria.Produto.Registro.Codigo := Registro.Produto;
      LcOrderItem.Mercadoria.Produto.Registro.Estabelecimento := Registro.Estabelecimento;
      LcOrderItem.Mercadoria.Produto.getByKey;
      FieldByName('description').AsString := LcOrderItem.Mercadoria.Produto.Registro.Descricao;
      Post;
    End;
  End;
  cds_items_mp_real.LogChanges := True;
  FreeAndNil(LcOrderItem);
end;

procedure TTasOrderProductionV2.ShowDatalisttItemsPa;
Var
  I : Integer;
  Registro : TOrderProductionPa;
  LcOrderItem : TControllerOrderProductionPa;
begin
  LcOrderItem := TControllerOrderProductionPa.create(Self);
  LcOrderItem.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  LcOrderItem.Registro.Ordem := OrderProduction.Registro.Codigo;
  LcOrderItem.getList;
  with cds_items_pa  do
  Begin
    if not Active then CreateDataSet;
    LogChanges := False;
    EmptyDataSet;
    for I := 0 to LcOrderItem.Lista.Count - 1 do
    Begin
      Registro := LcOrderItem.Lista[I];
      Append;
      FieldByName('id').AsInteger                 := Registro.Codigo;
      FieldByName('tb_institution_id').AsInteger  := Registro.Estabelecimento;
      FieldByName('tb_order_id').AsInteger        := Registro.Ordem;
      FieldByName('tb_product_id').AsString       := IntToStr( Registro.Produto );
      FieldByName('tb_stock_list_id').AsInteger   := Registro.Estoque;
      FieldByName('quantity').AsFloat             := Registro.Quantidade;
      //dados dos Produtos
      LcOrderItem.Mercadoria.Produto.Registro.Codigo := Registro.Produto;
      LcOrderItem.Mercadoria.Produto.Registro.Estabelecimento := Registro.Estabelecimento;
      LcOrderItem.Mercadoria.Produto.getByKey;
      FieldByName('description').AsString := LcOrderItem.Mercadoria.Produto.Registro.Descricao;
      Post;
    End;
  End;
  cds_items_pa.LogChanges := True;
  FreeAndNil(LcOrderItem);
end;

procedure TTasOrderProductionV2.Change;
begin
  inherited;

end;


procedure TTasOrderProductionV2.ChangeItemsMPF;
Var
  Form : TTasOrderProductionItemsMp;
Begin
  if Form = nil then
    Form := TTasOrderProductionItemsMp.Create(UniApplication);
  Form.cds_Item := self.cds_items_mp_forecast;
  Form.EditionState := 'E';
  Form.TipoInclusao := 'F';
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
end;

procedure TTasOrderProductionV2.ChangeItemsMPR;
Var
  Form : TTasOrderProductionItemsMp;
Begin
  if Form = nil then
    Form := TTasOrderProductionItemsMp.Create(UniApplication);
  Form.cds_Item := self.cds_items_mp_real;
  Form.EditionState := 'E';
  Form.TipoInclusao := 'R';
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
end;

procedure TTasOrderProductionV2.ChangeItemsPA;
begin

end;

procedure TTasOrderProductionV2.ClearAllFields;
begin
  inherited;
  OrderProduction.clear;
  ClearFields(FrSituation);
end;

procedure TTasOrderProductionV2.Delete;
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


procedure TTasOrderProductionV2.DeletedItemsMPF;
Var
  LcOperacao : String;
  cds_temp : TClientDataSet;
  LcOrderItems : TControllerOrderProductionMp;
begin
  if cds_items_mp_forecast.ChangeCount > 0 then
  Begin
    LcOrderItems := TControllerOrderProductionMp.create(Self);
    cds_temp := TClientDataSet.Create(Self);
    cds_temp.Data := cds_items_mp_forecast.Delta;
    cds_temp.First;
    cds_items_mp_forecast.First;
    //Trata somente os dados deletados
    while not cds_temp.eof do
    Begin
      with LcOrderItems do
      Begin
        if cds_temp.UpdateStatus = usDeleted then
        Begin
          //Items
          Registro.Codigo              := cds_Temp.FieldByName('id').AsInteger;
          Registro.Estabelecimento     := UMM.GInstitution.registro.Codigo;
          Registro.Ordem               := OrderProduction.Registro.Codigo;
          LcOrderItems.delete;
        End;
      End;
      cds_temp.Next;
    end;
    cds_temp.Close;
    FreeAndNil(cds_temp);
  End;
end;

procedure TTasOrderProductionV2.DeletedItemsMPR;
Var
  LcOperacao : String;
  cds_temp : TClientDataSet;
  LcOrderItems : TControllerOrderProductionMp;
begin
  if cds_items_mp_real.ChangeCount > 0 then
  Begin
    LcOrderItems := TControllerOrderProductionMp.create(Self);
    cds_temp := TClientDataSet.Create(Self);
    cds_temp.Data := cds_items_mp_real.Delta;
    cds_temp.First;
    cds_items_mp_real.First;
    //Trata somente os dados deletados
    while not cds_temp.eof do
    Begin
      with LcOrderItems do
      Begin
        if cds_temp.UpdateStatus = usDeleted then
        Begin
          //Items
          Registro.Codigo              := cds_Temp.FieldByName('id').AsInteger;
          Registro.Estabelecimento     := UMM.GInstitution.registro.Codigo;
          Registro.Ordem               := OrderProduction.Registro.Codigo;
          LcOrderItems.delete;
        End;
      End;
      cds_temp.Next;
    end;
    cds_temp.Close;
    FreeAndNil(cds_temp);
  End;
end;

procedure TTasOrderProductionV2.DeletedItemsPA;
Var
  LcOperacao : String;
  cds_temp : TClientDataSet;
  LcOrderItems : TControllerOrderProductionPa;
begin
  if cds_items_pa.ChangeCount > 0 then
  Begin
    LcOrderItems := TControllerOrderProductionPa.create(Self);
    cds_temp := TClientDataSet.Create(Self);
    cds_temp.Data := cds_items_pa.Delta;
    cds_temp.First;
    cds_items_pa.First;
    //Trata somente os dados deletados
    while not cds_temp.eof do
    Begin
      with LcOrderItems do
      Begin
        if cds_temp.UpdateStatus = usDeleted then
        Begin
          //Items
          Registro.Codigo              := cds_Temp.FieldByName('id').AsInteger;
          Registro.Estabelecimento     := UMM.GInstitution.registro.Codigo;
          Registro.Ordem               := OrderProduction.Registro.Codigo;
          LcOrderItems.delete;
        End;
      End;
      cds_temp.Next;
    end;
    cds_temp.Close;
    FreeAndNil(cds_temp);
  End;
end;

procedure TTasOrderProductionV2.DeleteItemsMPF;
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
        self.cds_items_mp_forecast.Delete;
      End;
    end
  );
end;

procedure TTasOrderProductionV2.DeleteItemsMPR;
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
        self.cds_items_mp_real.Delete;
      End;
    end
  );
end;

procedure TTasOrderProductionV2.DeleteItemsPA;
begin

end;

procedure TTasOrderProductionV2.EditionControl;
begin
  inherited;
  EditionControler(FrSituation);
  Sb_Invoice.Enabled := ( EditionState = 'B' );
  Sb_print.Enabled := ( EditionState = 'B' );
end;

procedure TTasOrderProductionV2.finishedInvoice;
begin

end;

procedure TTasOrderProductionV2.FormatScreen;
begin
  inherited;
  ShowSituation;
end;

procedure TTasOrderProductionV2.InitVariable;
begin
  inherited;
  OrderProduction := TControllerOrderProduction.Create(self);
end;

procedure TTasOrderProductionV2.Insert;
begin
  inherited;
  ClearAllFields;
end;

procedure TTasOrderProductionV2.insertItemsMPF;
Var
  Form : TTasOrderProductionItemsMp;
Begin
  if Form = nil then
    Form := TTasOrderProductionItemsMp.Create(UniApplication);
  Form.cds_Item := self.cds_items_mp_forecast;
  Form.EditionState := 'I';
  Form.TipoInclusao := 'F';
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
end;

procedure TTasOrderProductionV2.insertItemsMPR;
Var
  Form : TTasOrderProductionItemsMp;
Begin
  if Form = nil then
    Form := TTasOrderProductionItemsMp.Create(UniApplication);
  Form.cds_Item := self.cds_items_mp_real;
  Form.EditionState := 'I';
  Form.TipoInclusao := 'R';
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
end;

procedure TTasOrderProductionV2.insertItemsPA;
begin

end;

procedure TTasOrderProductionV2.printOrder;
begin
  inherited;

end;

procedure TTasOrderProductionV2.Save;
begin
  SaveOrder;
  SaveOrderProduction;
  SaveOrderItemsMPF;
  SaveOrderItemsMPR;
  SaveOrderItemsPA;
  //SaveOrderItems(frOrderItemsProduction.cds_items,OrderProduction.Registro.Codigo);
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := OrderProduction.Registro.Codigo;
end;

procedure TTasOrderProductionV2.SaveOrder;
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

procedure TTasOrderProductionV2.SaveOrderItemsMPF;
Var
  LcOperacao : String;
  LcOrderItems : TControllerOrderProductionMp;
begin
  DeletedItemsMPF;
  if cds_items_mp_forecast.ChangeCount > 0 then
  Begin
    LcOrderItems := TControllerOrderProductionMp.create(Self);
    cds_items_mp_forecast.First;
    //Trata somente os dados Inseridos ou Alterados
    while not cds_items_mp_forecast.eof do
    Begin
      with LcOrderItems do
      Begin
        Registro.Codigo               := cds_items_mp_forecast.FieldByName('id').AsInteger;
        Registro.Estabelecimento      := UMM.GInstitution.registro.Codigo;
        Registro.Ordem                := OrderProduction.Registro.Codigo;
        Registro.Produto              := cds_items_mp_forecast.FieldByName('tb_product_id').AsInteger;
        Registro.Estoque              := cds_items_mp_forecast.FieldByName('tb_stock_list_id').AsInteger;
        Registro.Quantidade           := cds_items_mp_forecast.FieldByName('quantity').AsFloat;
        Registro.ValorUnitario        := cds_items_mp_forecast.FieldByName('unit_value').AsFloat;
        Registro.TipoInclusao         := cds_items_mp_forecast.FieldByName('kind').AsString;
        case cds_items_mp_forecast.UpdateStatus of
          usModified: LcOrderItems.update;
          usInserted: LcOrderItems.insert;
        end;
      End;
      cds_items_mp_forecast.next;
    End;
    cds_items_mp_forecast.MergeChangeLog;
  End;
end;

procedure TTasOrderProductionV2.SaveOrderItemsMPR;
Var
  LcOperacao : String;
  LcOrderItems : TControllerOrderProductionMp;
begin
  DeletedItemsMPR;
  if cds_items_mp_real.ChangeCount > 0 then
  Begin
    LcOrderItems := TControllerOrderProductionMp.create(Self);
    cds_items_mp_real.First;
    //Trata somente os dados Inseridos ou Alterados
    while not cds_items_mp_real.eof do
    Begin
      with LcOrderItems do
      Begin
        Registro.Codigo               := cds_items_mp_real.FieldByName('id').AsInteger;
        Registro.Estabelecimento      := UMM.GInstitution.registro.Codigo;
        Registro.Ordem                := OrderProduction.Registro.Codigo;
        Registro.Produto              := cds_items_mp_real.FieldByName('tb_product_id').AsInteger;
        Registro.Estoque              := cds_items_mp_real.FieldByName('tb_stock_list_id').AsInteger;
        Registro.Quantidade           := cds_items_mp_real.FieldByName('quantity').AsFloat;
        Registro.ValorUnitario        := cds_items_mp_real.FieldByName('unit_value').AsFloat;
        Registro.TipoInclusao         := cds_items_mp_real.FieldByName('kind').AsString;
        case cds_items_mp_real.UpdateStatus of
          usModified: LcOrderItems.update;
          usInserted: LcOrderItems.insert;
        end;
      End;
      cds_items_mp_real.next;
    End;
    cds_items_mp_real.MergeChangeLog;
  End;
end;

procedure TTasOrderProductionV2.SaveOrderItemsPA;
begin

end;

procedure TTasOrderProductionV2.SaveOrderProduction;
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
    Mercadoria        := 0;
    PrevisaoQtde      := 0;
    EstoqueOrigem     := 0;
    EstoqueDestino    := 0;
    Situacao          := FrSituation.DBLCB_Lista.KeyValue;
  End;
  OrderProduction.save;
end;


procedure TTasOrderProductionV2.sb_Change_Items_mp_fClick(Sender: TObject);
begin
  if ValidateChangeItemsMPF then
    ChangeItemsMPF;
end;

procedure TTasOrderProductionV2.sb_change_Items_mp_rClick(Sender: TObject);
begin
  if ValidateChangeItemsMPR then
    ChangeItemsMPR;
end;

procedure TTasOrderProductionV2.sb_Change_Items_paClick(Sender: TObject);
begin
  if ValidateChangeItemsPA then
    ChangeItemsPA;
end;

procedure TTasOrderProductionV2.sb_Delete_Items_mp_fClick(Sender: TObject);
begin
  if ValidateDeleteItemsMPF then
    DeleteItemsMPF;
end;

procedure TTasOrderProductionV2.sb_Delete_Items_mp_rClick(Sender: TObject);
begin
  if ValidateDeleteItemsMPR then
    DeleteItemsMPR;
end;

procedure TTasOrderProductionV2.sb_Delete_Items_paClick(Sender: TObject);
begin
  if ValidateDeleteItemsPA then
    DeleteItemsPA;
end;

procedure TTasOrderProductionV2.sb_Insert_Items_mp_fClick(Sender: TObject);
begin
  if ValidateInserItemsMPF then
    insertItemsMPF;
end;

procedure TTasOrderProductionV2.sb_Insert_Items_mp_rClick(Sender: TObject);
begin
  if ValidateInserItemsMPR then
    insertItemsMPR;
end;

procedure TTasOrderProductionV2.sb_Insert_Items_paClick(Sender: TObject);
begin
  if ValidateInserItemsPA then
    insertItemsPA;
end;

procedure TTasOrderProductionV2.setVariable;
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

procedure TTasOrderProductionV2.ShowData;
begin
  inherited;
  ShowDataOrder;
  ShowDataOrderProduction;
  ShowDatalisttItemsMpForeCast;
  ShowDatalisttItemsMpReal;
  ShowDatalisttItemsPa;

end;

procedure TTasOrderProductionV2.ShowDataOrder;
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

procedure TTasOrderProductionV2.ShowDataOrderProduction;
begin
  With OrderProduction.Registro do
  Begin
    E_Number.Text   := IntToStr(Numero);
    frSituation.DBLCB_Lista.KeyValue := Situacao;
    if DateToStr(DataFinal) <> '30/12/1899' then
      Dtp_Forecast.DateTime := DataFinal
    else
      Dtp_Forecast.DateTime := 0.0;
  end;
end;

procedure TTasOrderProductionV2.ShowDataTotalizer;
begin
  {
  with OrderProduction.OrderTotalizer.Registro do
  begin
    E_total_qtty.Value     := ProdutoQuantidade;
    E_total_Product.Value  := ValorProduto;
    E_VL_Expensive.Value   := ValorDespesas;
    E_Tx_Discount.Value    := AlíquotaDesconto;
    E_vl_Discount.Value    := ValorDesconto;
    E_VL_Order.Value       := ValorTotal;
  end;
  }
end;


procedure TTasOrderProductionV2.ShowNoData;
begin
  ClearAllFields;
  inherited;

end;

procedure TTasOrderProductionV2.ShowSituation;
begin
  FrSituation := TFmSituation.Create(Self);
  FrSituation.Parent := Ctn_Situacao;
  FrSituation.listar;
  FrSituation.Align := alClient;
  FrSituation.Show;
end;

procedure TTasOrderProductionV2.toInvoice;
begin
  inherited;

end;

function TTasOrderProductionV2.ValidaInsert: boolean;
begin
  Result := True;
end;

function TTasOrderProductionV2.ValidateChange: boolean;
begin
  Result := True;
  if not ValidatehasNotInvoice(OrderProduction.Registro.Codigo) then
  Begin
    Result := False;
    exit;
  End;
end;

function TTasOrderProductionV2.ValidateChangeItemsMPF: Boolean;
begin
  Result := True;
  if cds_items_mp_forecast.RecordCount = 0 then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há registros para alterar.',
                  'Verifiqe e tente novamente.']);
    Result := False;
  End;

end;

function TTasOrderProductionV2.ValidateChangeItemsMPR: Boolean;
begin
  Result := True;
  if cds_items_mp_real.RecordCount = 0 then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há registros para alterar.',
                  'Verifiqe e tente novamente.']);
    Result := False;
  End;

end;

function TTasOrderProductionV2.ValidateChangeItemsPA: Boolean;
begin
  Result := True;
  if cds_items_mp_real.RecordCount = 0 then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há registros para alterar.',
                  'Verifiqe e tente novamente.']);
    Result := False;
  End;
end;

function TTasOrderProductionV2.ValidateDelete: boolean;
begin
  Result := True;
  if not ValidatehasNotInvoice(OrderProduction.Registro.Codigo) then
  Begin
    Result := False;
    exit;
  End;
end;


function TTasOrderProductionV2.ValidateDeleteItemsMPF: Boolean;
begin
  Result := True;
  if cds_items_mp_forecast.RecordCount = 0 then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há registros para excluir.',
                  'Verifiqe e tente novamente.']);
    Result := False;
  End;

end;

function TTasOrderProductionV2.ValidateDeleteItemsMPR: Boolean;
begin
  Result := True;
  if cds_items_mp_real.RecordCount = 0 then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há registros para excluir.',
                  'Verifiqe e tente novamente.']);
    Result := False;
  End;
end;

function TTasOrderProductionV2.ValidateDeleteItemsPA: Boolean;
begin
  Result := True;
  if cds_items_mp_real.RecordCount = 0 then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há registros para excluir.',
                  'Verifiqe e tente novamente.']);
    Result := False;
  End;
end;

function TTasOrderProductionV2.ValidateInserItemsMPF: Boolean;
begin
  Result := True;
end;

function TTasOrderProductionV2.ValidateInserItemsMPR: Boolean;
begin
  Result := True;
end;

function TTasOrderProductionV2.ValidateInserItemsPA: Boolean;
begin
  Result := True;
end;

function TTasOrderProductionV2.validateInvoice: Boolean;
begin

end;

function TTasOrderProductionV2.validatePrintOrder: Boolean;
begin
  REsult := true;
end;

function TTasOrderProductionV2.ValidateSave: boolean;
begin
  result :=true;
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
