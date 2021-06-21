unit tas_order_job;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, tas_order, Vcl.Menus, uniMainMenu,System.AnsiStrings,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniDateTimePicker, uniEdit, uniLabel, uniPageControl, fm_customer,fm_situation,
  ControllerOrderJob, unmessages, MainModule, msg_form,FireDAC.Stan.Param,
  uniBasicGrid, uniDBGrid, Data.DB, Datasnap.DBClient, tblOrderItem, fm_order_items_job,
  Datasnap.Provider,REST.Json,System.Json, uReportCM, ControllerStockReserved, ControllerOrderToBuy,
  UnFunctions, ControllerMerchandiseHasSelf, tblMerchandiseHasSelf,ControllerOrderToDeliver,
  tas_order_job_scope;


type
  TTasOrderJob = class(TTasOrder)
    L_Codigo: TUniLabel;
    E_Number: TUniEdit;
    L_DtRegistry: TUniLabel;
    Dtp_Registry: TUniDateTimePicker;
    Ctn_Customer: TUniContainerPanel;
    Ctn_Situacao: TUniContainerPanel;
    UniLabel4: TUniLabel;
    E_Description: TUniEdit;
    pg_statement: TUniPageControl;
    tbs_Insumos: TUniTabSheet;
    Ctn_Order_itens_job: TUniContainerPanel;
    UniTabSheet2: TUniTabSheet;
    Pnl_Outras: TUniPanel;
    UniLabel1: TUniLabel;
    Dtp_Start: TUniDateTimePicker;
    UniLabel2: TUniLabel;
    Dtp_Forecast: TUniDateTimePicker;
    UniLabel3: TUniLabel;
    Dtp_End: TUniDateTimePicker;
    Empenho: TUniTabSheet;
    UniTabSheet1: TUniTabSheet;
    UniTabSheet4: TUniTabSheet;
    UniTabSheet5: TUniTabSheet;
    UniTabSheet6: TUniTabSheet;
    ds_search_emp: TDataSource;
    cds_search_emp: TClientDataSet;
    DSP_emp: TDataSetProvider;
    cds_search_empid: TIntegerField;
    cds_search_empdescription: TStringField;
    cds_search_empquantity: TFMTBCDField;
    dbg_cmprar: TUniDBGrid;
    cds_search_comprar: TClientDataSet;
    ds_search_comprar: TDataSource;
    cds_search_comprarid: TIntegerField;
    cds_search_comprardescription: TStringField;
    cds_search_comprarquantity: TBCDField;
    tbs_solicitado: TUniTabSheet;
    tbs_comprado: TUniTabSheet;
    cds_search_sol: TClientDataSet;
    ds_search_sol: TDataSource;
    dbg_solicitado: TUniDBGrid;
    cds_search_solid: TIntegerField;
    cds_search_soldescription: TStringField;
    cds_search_solquantity: TBCDField;
    cds_search_comprado: TClientDataSet;
    ds_search_comprado: TDataSource;
    cds_search_compradoid: TIntegerField;
    cds_search_compradodescription: TStringField;
    cds_search_compradoquantity: TBCDField;
    dbg_enviar: TUniDBGrid;
    cds_search_env: TClientDataSet;
    ds_search_env: TDataSource;
    cds_search_envid: TIntegerField;
    cds_search_envdescription: TStringField;
    cds_search_envquantity: TBCDField;
    cds_search_enviado: TClientDataSet;
    ds_search_enviado: TDataSource;
    dbg_Enviado: TUniDBGrid;
    cds_search_enviadoid: TIntegerField;
    cds_search_enviadodescription: TStringField;
    cds_search_enviadoquantity: TBCDField;
    dbg_Produzir: TUniDBGrid;
    cds_search_pro: TClientDataSet;
    ds_search_pro: TDataSource;
    DSP_comprar: TDataSetProvider;
    DSP_sol: TDataSetProvider;
    DSP_Comprado: TDataSetProvider;
    DSP_env: TDataSetProvider;
    DSP_enviado: TDataSetProvider;
    DSP_pro: TDataSetProvider;
    LiberarListas: TUniMenuItem;
    cds_search_proid: TIntegerField;
    cds_search_prodescription: TStringField;
    cds_search_proquantity: TBCDField;
    pop_items_empenho: TUniPopupMenu;
    MercEmpenho: TUniMenuItem;
    pnl_Empenho: TUniPanel;
    dbg_Empenho: TUniDBGrid;
    cds_search_emptb_order_id: TIntegerField;
    cds_search_emptb_stock_list_id: TIntegerField;
    cds_search_emptb_order_item_id: TIntegerField;
    pop_items_comprado: TUniPopupMenu;
    MercComprado: TUniMenuItem;
    pnl_Comprado: TUniPanel;
    dbg_Comprado: TUniDBGrid;
    cds_search_empstatus: TStringField;
    cds_search_compradonumber: TStringField;
    cds_search_compradodt_emission: TDateField;
    cds_search_soldt_record: TDateField;
    cds_search_solnumber: TIntegerField;
    cds_search_compradotb_order_item_id: TIntegerField;
    cds_search_compradotb_stock_list_id: TIntegerField;
    cds_search_compradotb_order_id: TIntegerField;
    cds_search_compradostatus_compra: TStringField;
    cds_search_compradostatus_entrega: TStringField;
    cds_search_soldt_forecast: TDateField;
    tbs_budget: TUniTabSheet;
    pnl_escopo: TUniPanel;
    dbg_scope: TUniDBGrid;
    cds_Scope: TClientDataSet;
    Ds_scope: TDataSource;
    sb_Insert_Items: TUniSpeedButton;
    sb_Change_Items: TUniSpeedButton;
    sb_Delete_Items: TUniSpeedButton;
    cds_Scopeid: TIntegerField;
    cds_Scopetb_institution_id: TIntegerField;
    cds_Scopetb_order_id: TIntegerField;
    cds_Scopedescription: TStringField;
    cds_Scopetb_work_front_id: TIntegerField;
    cds_Scopenote: TBlobField;
    cds_Scopedt_forecast: TDateField;
    cds_Scopevalue_forecast: TFMTBCDField;
    cds_ScopeWorkFront: TStringField;
    procedure InitVariable;Override;
    procedure setVariable; override;
    procedure FormatScreen;Override;
    procedure setImages;Override;

    procedure ShowData;Override;
    procedure ShowListEmp;
    procedure ShowListToBuy;
    procedure ShowListSol;
    procedure ShowListPurchase;
    procedure ShowListToDeliver;
    procedure ShowListDelivered;
    procedure ShowListProduction;

    procedure ShowDataOrder;
    procedure ShowNoData;Override;
    procedure ClearAllFields;Override;
    procedure EditionControl;Override;
    procedure pg_statementChange(Sender: TObject);
    procedure LiberarListasClick(Sender: TObject);
    procedure LiberarItemClick(Sender: TObject);
    procedure MercEmpenhoClick(Sender: TObject);
    procedure dbg_EmpenhoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MercCompradoClick(Sender: TObject);
    procedure dbg_CompradoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sb_Insert_ItemsClick(Sender: TObject);
    procedure sb_Change_ItemsClick(Sender: TObject);
    procedure sb_Delete_ItemsClick(Sender: TObject);
  private
    { Private declarations }
    function  ValidadeRelease:boolean;
    procedure ReleaseList;
    procedure VerifyCompleteList;
    procedure ReleaseGeneralList;
    procedure ReleaseUniqueItem;
    procedure SemComposicao;
    procedure ComComposicao;
    procedure setToDeliveryEmpenho;
    procedure setToDeliveryComprado;

    function 	ValidateInserScope:Boolean;
    procedure insertScope;
    function ValidateChangeScope:Boolean;
    procedure changeScope;
    function ValidateDeleteScope:Boolean;
    procedure deleteScope;
    procedure ShowDataScope( cds_ItensScope : TClientDataSet; order_id:Integer);
  protected
    FrCustomer      : TFmCustomer;
    FrOrderItemsJob : TFmOrderItemsJob;
    procedure ShowCustomer;
    procedure ShowlistItems;

    function  ValidaInsert():boolean;Override;
    procedure Insert;Override;
    function  ValidateSave: boolean;Override;
    procedure Save;Override;
    procedure SaveOrder;
    procedure SaveOrdertotalizer;
    procedure SaveScope(cds_items : TClientDataSet; order_id:Integer);Virtual;
    function  ValidateDelete: boolean;
    procedure Delete;Override;

    function validatePrintOrder:Boolean;Override;
    procedure printOrder;Override;

    function validateInvoice:Boolean;Override;
    procedure toInvoice;Override;

  public
    { Public declarations }
    OrderJob      : TControllerOrderJob;
  end;
var
  TasOrderJob: TTasOrderJob;
  
implementation

{$R *.dfm}


uses openForms, tas_order_items_job, openReports, prm_rep_order, Main,
     ControllerStockBalance, ControllerOrderJobScope, tblOrderJobScope,
  ControllerWorkFront;


{ TTasOrderJob }

procedure TTasOrderJob.ClearAllFields;
begin
  inherited;
  OrderJob.clear;
  ClearFields(FrCustomer);
  ClearFields(FrSituation);
end;

procedure TTasOrderJob.Delete;
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
          OrderJob.delete;
          //Provider.delete;
          //PaymentType.delete;
          OrderJob.delete;
          ClearAllFields;
        End;
      end
    );
end;


procedure TTasOrderJob.EditionControl;
begin
  inherited;
  EditionControler(FrCustomer);
  EditionControler(FrSituation);
  EditionControler(FrOrderItemsJob);
  Sb_Invoice.Enabled := ( EditionState = 'B' );
  Sb_print.Enabled := ( EditionState = 'B' );
end;

procedure TTasOrderJob.FormatScreen;
begin
  inherited;
  pg_statement.ActivePageIndex := 0;
  dbg_scope.Columns[0].Width := 494;
  dbg_scope.Columns[1].Width := 238;
  ShowCustomer;
  ShowSituation(Ctn_Situacao);
  ShowlistItems;
end;

procedure TTasOrderJob.InitVariable;
begin
  inherited;
  OrderJob          := TControllerOrderJob.Create(self);
end;

procedure TTasOrderJob.Insert;
begin
  inherited;
  ClearAllFields;
end;



procedure TTasOrderJob.LiberarItemClick(Sender: TObject);
begin
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja realmente Liberar este Item?',
                'clique em SIM para confirmar.'],mpAlerta);
  FormMsg.ShowModal(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if (Sender as TMsgForm).BotaoEscolhido > 0 then
      Begin
        try
          ShowMask('Liberando Insumoss');
          VerifyCompleteList;
          UniSession.Synchronize;
          ReleaseUniqueItem;
          UniSession.Synchronize;
        finally
        end;
      end;
    end
  );
end;

procedure TTasOrderJob.LiberarListasClick(Sender: TObject);
begin
  if ValidadeRelease then
    ReleaseList;
end;

procedure TTasOrderJob.MercCompradoClick(Sender: TObject);
begin
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja liberar a entrega deste Item?',
                'clique em SIM para confirmar.'],mpAlerta);
  FormMsg.ShowModal(
  Procedure(Sender: TComponent; AResult:Integer)
  begin
    if (Sender as TMsgForm).BotaoEscolhido > 0 then
    Begin
      with FrOrderItemsJob.cds_items do
      Begin
        setToDeliveryComprado;
        ShowListPurchase;
      End;
    End;
  end
  );

end;

procedure TTasOrderJob.MercEmpenhoClick(Sender: TObject);
begin
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja liberar a entrega deste Item?',
                'clique em SIM para confirmar.'],mpAlerta);
  FormMsg.ShowModal(
  Procedure(Sender: TComponent; AResult:Integer)
  begin
    if (Sender as TMsgForm).BotaoEscolhido > 0 then
    Begin
      with FrOrderItemsJob.cds_items do
      Begin
        setToDeliveryEmpenho;
      End;
    End;
  end
  );
end;

procedure TTasOrderJob.pg_statementChange(Sender: TObject);
begin
  inherited;
  case pg_statement.ActivePageIndex of
      2 : ShowListEmp;
      3 : ShowListToBuy;
      4 : ShowListSol;
      5 : ShowListPurchase;
      6 : ShowListProduction;
      7 : ShowListToDeliver;
      8 : ShowListDelivered;
  end;

end;

procedure TTasOrderJob.printOrder;
Var
  LcPar: TPrmRepOrder;
  LcJSon : String;
  LcCM : TReportCM;
begin
  try
    ShowMask('Aguarde Processamento...');
    LcPar := TPrmRepOrder.Create;
    LcPar.Estabelecimento := UMM.GInstitution.registro.Codigo;
    LcPar.Usuario := UMM.GInstitution.User.Registro.codigo;
    LcPar.Resultado := false;
    LcPar.Codigo := OrderJob.Registro.Codigo;
    LcPar.URL := '';//'http://www.gestaowebsetes.com.br/institution/07742094000113/2/pedidocompra.pdf';

    LcJSon := TJson.ObjectToJsonString(LcPar);
    LcCM := TReportCM.Create(Self);
    LcJSon := LcCM.SMGeneralClient.GetOrderJob(LcJSon);
    LcPar := TJson.JsonToObject<TPrmRepOrder>(LcJson);
    UniSession.Synchronize;
    if LcPar.Resultado then
    begin
      openReportViewer('Pedido Engenharia',LcPar.url);
      UniSession.Synchronize;
    end
    else
    Begin
      MensageAlert(['A T E N Ç Ã O!.',
                   '',
                      'Campo Nome não informado.',
                      'Preencha o campo para continuar']);
    End;
  finally
    HideMask;
    FreeAndNil(lcPar);
    FreeAndNil(LcCM);
  end;
end;


procedure TTasOrderJob.ComComposicao;
Var
  LcSaldoPedido : real;
  LcStockBalance : TControllerStockBalance;
  LcMercHasSelf : TControllerMerchandiseHasSelf;
  LcRegMerc : TMerchandiseHasSelf;
  I : Integer;
  LcQtdeMaster : Real;
begin
  with FrOrderItemsJob.cds_items do
  Begin
    //REgistra os itens a produzir
    OrderJob.OrderToProduction.clear;
    with OrderJob.OrderToProduction do
    Begin
      Registro.Estabelecimento   := UMM.GInstitution.registro.Codigo;
      Registro.Codigo            := 0;
      Registro.Ordem             := FieldByName('tb_order_id').AsInteger;
      Registro.OrdemItem         := FieldByName('id').AsInteger;
      Registro.Mercadoria        := FieldByName('tb_product_id').AsInteger;
      Registro.DataRegistro      := Date;
      Registro.Quantidade        := FieldByName('quantity').AsFloat;
      Registro.Status            := 'P';
      insert;
      //regisra a ordem que tem produção
      OrderHasProduction.clear;
      with OrderHasProduction do
      Begin
        Registro.Estabelecimento  := UMM.GInstitution.registro.Codigo;
        Registro.Ordem            := FieldByName('tb_order_id').AsInteger;
        Registro.OrdemItem        := FieldByName('id').AsInteger;
        Registro.OrdemProducao    := OrderJob.OrderToProduction.Registro.codigo;
        save;
      End;
    End;
    //Reserva no estoque e/ou solicita compra da composiçao
    LcStockBalance := TControllerStockBalance.Create(Self);
    //PEga a lista de itens que compoem este item
    LcMercHasSelf := TControllerMerchandiseHasSelf.Create(Self);
    LcMercHasSelf.Registro.Estabelecimento  := UMM.GInstitution.registro.Codigo;
    LcMercHasSelf.Registro.Mestre := FieldByName('tb_product_id').AsInteger;
    LcMercHasSelf.getList;

    for I := 0 to LcMercHasSelf.Lista.Count - 1 do
    Begin
      with FrOrderItemsJob.cds_items do
      Begin
        LcRegMerc := LcMercHasSelf.Lista[I];
        //PEga a quantidade da lista da engenharia
        LcSaldoPedido := FieldByName('quantity').AsFloat;
        //Multiplica a quantidade pela quantidade que está na composição
        LcSaldoPedido := LcSaldoPedido * LcRegMerc.Quantidade;

        LcStockBalance.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
        LcStockBalance.Registro.Tabela          := FieldByName('tb_stock_list_id').AsInteger;
        LcStockBalance.Registro.Mercadoria      := LcRegMerc.Detalhe;
        LcStockBalance.getByKey;

        if  LcStockBalance.Registro.Quantidade > 0  then
        Begin
          OrderJob.StockReserved.clear;
          OrderJob.StockReserved.Registro.Estabelecimento   := UMM.GInstitution.registro.Codigo;
          OrderJob.StockReserved.Registro.ListaEstoque      := LcStockBalance.Registro.Tabela;
          OrderJob.StockReserved.Registro.Mercadoria        := LcStockBalance.Registro.Mercadoria;
          OrderJob.StockReserved.Registro.DataRegistro      := Date;
          OrderJob.StockReserved.Registro.Status            := 'P';
          if  ( LcStockBalance.Registro.Quantidade >= LcSaldoPedido )  then
          Begin
            OrderJob.StockReserved.Registro.Quantidade        := LcSaldoPedido;
            LcSaldoPedido := 0;
          End
          else
          Begin
            OrderJob.StockReserved.Registro.Quantidade  := LcStockBalance.Registro.Quantidade;
            LcSaldoPedido := LcSaldoPedido - LcStockBalance.Registro.Quantidade;
          End;
          OrderJob.StockReserved.save;

          OrderJob.StockReserved.OrderHasReserved.clear;
          OrderJob.StockReserved.OrderHasReserved.Registro.Estabelecimento := OrderJob.StockReserved.Registro.Estabelecimento;
          OrderJob.StockReserved.OrderHasReserved.Registro.ReservaEstoque  := OrderJob.StockReserved.Registro.codigo;
          OrderJob.StockReserved.OrderHasReserved.Registro.Ordem           := FieldByName('tb_order_id').AsInteger;
          OrderJob.StockReserved.OrderHasReserved.Registro.OrdemItem       := FieldByName('id').AsInteger;
          OrderJob.StockReserved.OrderHasReserved.save;

        End;
        //Se tiver saldo na variavel solicitar a compra
        if LcSaldoPedido > 0  then
        Begin
          OrderJob.OrderJobToBuy.clear;
          OrderJob.OrderJobToBuy.Registro.Estabelecimento      := UMM.GInstitution.registro.Codigo;
          OrderJob.OrderJobToBuy.Registro.Ordem                := FieldByName('tb_order_id').AsInteger;
          OrderJob.OrderJobToBuy.Registro.OrdemItem            := FieldByName('id').AsInteger;
          OrderJob.OrderJobToBuy.Registro.Mercadoria           := LcRegMerc.Detalhe;
          OrderJob.OrderJobToBuy.Registro.Quantidade           := LcSaldoPedido;
          OrderJob.OrderJobToBuy.Registro.DataRegistro         := Date;
          OrderJob.OrderJobToBuy.Registro.Status               := 'P';
          OrderJob.OrderJobToBuy.Insert;
        End;
      End;
    End;
  End;
end;

procedure TTasOrderJob.ReleaseGeneralList;
begin
  with FrOrderItemsJob.cds_items do
  Begin
    first;
    while not eof do
    Begin
      ReleaseUniqueItem;
      next;
    End;
  End;
end;

procedure TTasOrderJob.ReleaseList;
begin
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja realmente Liberar as Listas?',
                'clique em SIM para confirmar.'],mpAlerta);
  FormMsg.ShowModal(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if (Sender as TMsgForm).BotaoEscolhido > 0 then
      Begin
        try
          ShowMask('Liberando a lista de Insumos.');
          VerifyCompleteList;
          UniSession.Synchronize;
          ReleaseGeneralList;
          UniSession.Synchronize;
        finally
          HideMask;
        end;
      end;
    end
  );
end;

procedure TTasOrderJob.ReleaseUniqueItem;
begin
  with FrOrderItemsJob.cds_items do
  Begin
    if ( FieldByName('status').AsString <> 'L' ) then
    Begin
      if (  FieldByName('composition').AsString =  '0' ) then
        SemComposicao
      else
        ComComposicao;
      UpdateStatusItemDetail(FieldByName('tb_order_id').AsInteger,
                             FieldByName('id').AsInteger,'L');
      //Registra a Liberação do Item no Cds
      edit;
      FieldByName('status').AsString := 'L';
      Post;
    End;
  End;
end;

procedure TTasOrderJob.SaveScope(cds_items: TClientDataSet; order_id: Integer);
Var
  LcOperacao : String;
  LcOrderScope : TControllerOrderJobScope;
begin
  DeletedItems(cds_items, order_id);
  if cds_items.ChangeCount > 0 then
  Begin
    LcOrderScope := TControllerOrderJobScope.create(Self);
     cds_items.First;
    //Trata somente os dados Inseridos ou Alterados
    while not cds_items.eof do
    Begin
      with LcOrderScope do
      Begin
        Registro.Codigo           := cds_items.FieldByName('id').AsInteger;
        Registro.Estabelecimento  := UMM.GInstitution.registro.Codigo;
        Registro.Ordem            := order_id;
        Registro.Descricao        := cds_items.FieldByName('description').asString;
        Registro.FrenteTrabalho   := cds_items.FieldByName('tb_work_front_id').AsInteger;
        Registro.Detalhes         := cds_items.FieldByName('note').asString;
        Registro.ValorPRevisto    := cds_items.FieldByName('value_forecast').asFloat;
        Registro.DataPrevista     := cds_items.FieldByName('dt_forecast').AsDateTime;
        case cds_items.UpdateStatus of
          usModified: LcOrderScope.update;
          usInserted: LcOrderScope.insert;
        end;
      End;
      cds_items.next;
    End;
    cds_items.MergeChangeLog;
  End;
end;

procedure TTasOrderJob.Save;
begin
  SaveOrder;
  SaveOrdertotalizer;
  SaveOrderItems(FrOrderItemsJob.cds_items,OrderJob.Registro.Codigo);
  SaveScope(cds_Scope,OrderJob.Registro.Codigo);
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := OrderJob.Registro.Codigo;
end;

procedure TTasOrderJob.SaveOrder;
begin
  with OrderJob.Order.Registro do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Data            := Dtp_Registry.DateTime;
    Observacao      := '';
    Usuario         := UMM.GInstitution.User.Registro.codigo;
    Status          := 'N';
  End;
  Orderjob.Order.save;

  with OrderJob.Registro do
  Begin
    Codigo            := OrderJob.Order.Registro.Codigo;
    Estabelecimento   := OrderJob.Order.Registro.Estabelecimento;
    RegistroCriado    := OrderJob.Order.Registro.Data;
    Numero            := StrToIntDef(E_Number.Text,0);
    DataInicio        := Dtp_Start.DateTime;
    DataPrevista      := Dtp_Forecast.DateTime;
    if Dtp_End.Text = '30/12/1899' then
      DataFinal         := 0.0
    else
      DataFinal         := Dtp_End.DateTime;

    Cliente           := FrCustomer.DBLCB_Lista.KeyValue;
    Descricao         := E_Description.Text;
    Situacao          := FrSituation.DBLCB_Lista.KeyValue;
  End;
  OrderJob.save;
  E_Number.Text := IntToStr(OrderJob.Registro.Numero);
end;

procedure TTasOrderJob.SaveOrdertotalizer;
begin
  with  OrderJob.OrderTotalizer.Registro do
  begin
    Codigo            := OrderJob.Order.Registro.Codigo;
    Estabelecimento   := OrderJob.Order.Registro.Estabelecimento;
    ItemsQuantidade   := FrOrderItemsJob.E_Nr_Items.Value;
    ProdutoQuantidade := FrOrderItemsJob.E_total_qtty.Value;
    ValorProduto      := FrOrderItemsJob.E_total_Product.Value;
    IPIValor          := 0;
    AlíquotaDesconto  := FrOrderItemsJob.E_Tx_Discount.Value;
    ValorDesconto     := FrOrderItemsJob.E_VL_Discount.Value;
    ValorDespesas     := FrOrderItemsJob.E_VL_Expensive.Value;
    ValorTotal        := FrOrderItemsJob.E_VL_Order.Value;
  end;
  OrderJob.OrderTotalizer.save;
end;

function TTasOrderJob.ValidateInserScope:Boolean;
Begin
  Result := true;
End;

procedure TTasOrderJob.insertScope;
Var
  Form : TTasOrderJobScope;
Begin
  if Form = nil then
  Form := TTasOrderJobScope.Create(UniApplication);
  Form.EditionState := 'I';
  Form.cds_Item := self.cds_Scope;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
End;

function TTasOrderJob.ValidateChangeScope:Boolean;
Begin
  Result := True;
  if cds_Scope.RecordCount = 0 then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há registros para alterar.',
                  'Verifiqe e tente novamente.']);
    Result := False;
  End;
End;

procedure TTasOrderJob.changeScope;
Var
  Form : TTasOrderJobScope;
Begin
  if Form = nil then
    Form := TTasOrderJobScope.Create(UniApplication);
  Form.cds_Item := self.cds_Scope;
  Form.EditionState := 'E';
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
End;

function TTasOrderJob.ValidateDeleteScope:Boolean;
Begin
  Result := True;
  if cds_Scope.RecordCount = 0 then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há registros para excluir.',
                  'Verifiqe e tente novamente.']);
    Result := False;
  End;
End;

procedure TTasOrderJob.deleteScope;
Begin
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja realmente excluir este registro?',
                'clique em SIM para confirmar.'],mpAlerta);
  FormMsg.ShowModal(
  Procedure(Sender: TComponent; AResult:Integer)
  begin
    if (Sender as TMsgForm).BotaoEscolhido > 0 then
    Begin
      self.cds_Scope.Delete;
    End;
  end
  );
End;

procedure TTasOrderJob.sb_Change_ItemsClick(Sender: TObject);
begin
  if ValidateChangeScope then
    changeScope;
end;

procedure TTasOrderJob.sb_Delete_ItemsClick(Sender: TObject);
begin
  if ValidateDeleteScope then
    deleteScope;
end;

procedure TTasOrderJob.sb_Insert_ItemsClick(Sender: TObject);
begin
  if ValidateInserScope then
    insertScope;
end;

procedure TTasOrderJob.SemComposicao;
Var
  LcSaldoPedido : real;
  LcStockBalance : TControllerStockBalance;
begin
  LcStockBalance := TControllerStockBalance.Create(Self);
  with FrOrderItemsJob.cds_items do
  Begin
    LcSaldoPedido                           := FieldByName('quantity').AsFloat;

    LcStockBalance.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    LcStockBalance.Registro.Tabela          := FieldByName('tb_stock_list_id').AsInteger;
    LcStockBalance.Registro.Mercadoria      := FieldByName('tb_product_id').AsInteger;
    LcStockBalance.getByKey;

    if LcStockBalance.Registro.Quantidade > 0 then
    BEgin
      OrderJob.StockReserved.clear;
      OrderJob.StockReserved.Registro.Estabelecimento   := UMM.GInstitution.registro.Codigo;
      OrderJob.StockReserved.Registro.ListaEstoque      := LcStockBalance.Registro.Tabela;
      OrderJob.StockReserved.Registro.Mercadoria        := LcStockBalance.Registro.Mercadoria;
      OrderJob.StockReserved.Registro.DataRegistro      := Date;
      OrderJob.StockReserved.Registro.Status            := 'P';
      if  LcStockBalance.Registro.Quantidade >= FieldByName('quantity').AsFloat  then
      Begin
        OrderJob.StockReserved.Registro.Quantidade        := FieldByName('quantity').AsFloat;
        LcSaldoPedido := 0;
      End
      else
      Begin
        OrderJob.StockReserved.Registro.Quantidade  := LcStockBalance.Registro.Quantidade;
        LcSaldoPedido := LcSaldoPedido - LcStockBalance.Registro.Quantidade;
      End;
      OrderJob.StockReserved.save;

      OrderJob.StockReserved.OrderHasReserved.Clear;
      OrderJob.StockReserved.OrderHasReserved.Registro.Estabelecimento := OrderJob.StockReserved.Registro.Estabelecimento;
      OrderJob.StockReserved.OrderHasReserved.Registro.ReservaEstoque  := OrderJob.StockReserved.Registro.codigo;
      OrderJob.StockReserved.OrderHasReserved.Registro.Ordem           := FieldByName('tb_order_id').AsInteger;
      OrderJob.StockReserved.OrderHasReserved.Registro.OrdemItem       := FieldByName('id').AsInteger;
      OrderJob.StockReserved.OrderHasReserved.save;

    end;

    if LcSaldoPedido > 0  then
    Begin
      OrderJob.OrderJobToBuy.Clear;
      OrderJob.OrderJobToBuy.Registro.Estabelecimento      := UMM.GInstitution.registro.Codigo;
      OrderJob.OrderJobToBuy.Registro.Ordem                := CodigoRegistro;
      OrderJob.OrderJobToBuy.Registro.OrdemItem            := FieldByName('id').AsInteger;
      OrderJob.OrderJobToBuy.Registro.Mercadoria           := FieldByName('tb_product_id').AsInteger;
      OrderJob.OrderJobToBuy.Registro.Quantidade           := LcSaldoPedido;
      OrderJob.OrderJobToBuy.Registro.DataRegistro         := Date;
      OrderJob.OrderJobToBuy.Insert;
    End;
  End;
end;

procedure TTasOrderJob.setImages;
begin
  inherited;
  buttonIcon(SB_Insert_Items,'mini_insert.bmp');
  buttonIcon(SB_Change_Items,'mini_change.bmp');
  buttonIcon(Sb_Delete_Items,'mini_delete.bmp');
end;

procedure TTasOrderJob.setToDeliveryComprado;
Var
  LcToDelivery : TControllerOrderToDeliver;
begin
  LcToDelivery := TControllerOrderToDeliver.Create(self);
  with LcToDelivery, cds_search_comprado do
  Begin
    with Registro do
    Begin
      Estabelecimento     := OrderJob.Registro.Estabelecimento;;
      Ordem               := OrderJob.Registro.Codigo;
      OrdemItem           := FieldByName('tb_order_item_id').AsInteger;
      Mercadoria          := FieldByName('id').AsInteger;
      Estoque             := FieldByName('tb_stock_list_id').AsInteger;
      DataRegistro        := Date;
      DocumentoReferencia := FieldByName('number').AsString;
      Quantidade          := FieldByName('quantity').AsFloat;
      Status              := 'P';
    End;
    LcToDelivery.Insert;
  End;
end;

procedure TTasOrderJob.setToDeliveryEmpenho;
Var
  LcToDelivery : TControllerOrderToDeliver;
  LcStockReser : TControllerStockReserved;
begin
  with cds_search_emp do
  Begin
    if (FieldByName('status').AsString = 'P') then
    Begin
      LcToDelivery := TControllerOrderToDeliver.Create(self);
      with LcToDelivery do
      Begin
        with Registro do
        Begin
          Estabelecimento     := OrderJob.Registro.Estabelecimento;;
          Ordem               := OrderJob.Registro.Codigo;
          OrdemItem           := FieldByName('tb_order_item_id').AsInteger;
          Mercadoria          := FieldByName('id').AsInteger;
          Estoque             := FieldByName('tb_stock_list_id').AsInteger;
          DataRegistro        := Date;
          DocumentoReferencia := '';
          Quantidade          := FieldByName('quantity').AsFloat;
          Status              := 'P';
        End;
        LcToDelivery.Insert;
      End;
      //Atualiza o Status
      LcStockReser := TControllerStockReserved.Create(Self);
      with LcStockReser do
      Begin

      End;
      FreeAndNil(LcToDelivery);
    End;
  End;
end;

procedure TTasOrderJob.setVariable;
begin
 with OrderJob do
  Begin
    Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Registro.Codigo := CodigoRegistro;
    getByKey;

    Order.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Order.Registro.Codigo := CodigoRegistro;
    Order.getByKey;

    OrderTotalizer.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    OrderTotalizer.getByKey;
    OrderTotalizer.Registro.Codigo := CodigoRegistro;

    //Items
    items.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    items.Registro.Ordem := CodigoRegistro;
    items.getList;
  End;
  inherited;
end;

procedure TTasOrderJob.ShowCustomer;
begin
  FrCustomer := TFmCustomer.Create(Self);
  FrCustomer.Parent := Ctn_Customer;
  FrCustomer.Listar;
  FrCustomer.Align := alClient;
  FrCustomer.Show;
end;

procedure TTasOrderJob.ShowData;
begin
  ShowDataOrder;
  ShowDatalisttItems(FrOrderItemsJob.cds_items,OrderJob.Registro.Codigo);
  ShowDataScope( cds_Scope,OrderJob.Registro.Codigo);
end;


procedure TTasOrderJob.ShowDataOrder;
begin
  With OrderJob do
  begin
    E_Number.Text                 := IntToStr(Registro.Numero);
    Dtp_Start.DateTime            := Registro.DataInicio;
    Dtp_Forecast.DateTime         := Registro.DataPrevista;
    if DateToStr(registro.DataFinal) <> '30/12/1899' then
      Dtp_End.DateTime := registro.DataFinal
    else
      Dtp_End.DateTime := 0.0;
    Dtp_End.DateTime              := Registro.DataFinal;
    Dtp_Registry.DateTime         := Registro.RegistroCriado;
    E_Description.Text            := Registro.Descricao;

    FrCustomer.DBLCB_Lista.KeyValue  := Registro.Cliente;
    FrSituation.DBLCB_Lista.KeyValue := Registro.Situacao;

    with OrderTotalizer,FrOrderItemsJob do
    begin
       E_total_qtty.Value := Registro.ProdutoQuantidade;
       E_total_Product.Value := Registro.ValorProduto;
       E_VL_Expensive.Value := Registro.ValorDespesas;
       E_Tx_Discount.Value := Registro.AlíquotaDesconto;
       E_vl_Discount.Value := Registro.ValorDesconto;
       E_VL_Order.Value := Registro.ValorTotal;
    end;


  end;
end;

procedure TTasOrderJob.ShowDataScope(cds_ItensScope: TClientDataSet;
  order_id: Integer);
Var
  I : Integer;
  Registro : TOrderJobScope;
  LcOrderJobScope : TControllerOrderJobScope;
  LcWorkFront : TControllerWorkFront;
begin
  LcWorkFront := TControllerWorkFront.create(Self);

  LcOrderJobScope := TControllerOrderJobScope.create(Self);
  LcOrderJobScope.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  LcOrderJobScope.Registro.Ordem := order_id;
  LcOrderJobScope.getList;

  with cds_itensScope  do
  Begin
    if not Active then CreateDataSet;
    cds_scope.LogChanges := False;
    cds_scope.EmptyDataSet;
    for I := 0 to LcOrderJobScope.Lista.Count - 1 do
    Begin
      Registro := LcOrderJobScope.Lista[I];
      Append;
      FieldByName('id').AsInteger                 := Registro.Codigo;
      FieldByName('tb_institution_id').AsInteger  := Registro.Estabelecimento;
      FieldByName('tb_order_id').AsInteger        := Registro.Ordem;
      FieldByName('description').AsString         := Registro.Descricao;
      FieldByName('tb_work_front_id').AsInteger   := Registro.FrenteTrabalho ;
      FieldByName('note').asString                := Registro.Detalhes;
      FieldByName('dt_forecast').AsDateTime       := Registro.DataPrevista;
      FieldByName('value_forecast').asFloat       := Registro.ValorPRevisto;

      LcWorkFront.registro.codigo                 := Registro.FrenteTrabalho;
      LcWorkFront.registro.Estabelecimento        := UMM.GInstitution.registro.Codigo;
      LcWorkFront.getByKey;
      FieldByName('workfront').AsString         := LcWorkFront.registro.Descricao;
      Post;
    End;
  End;
  cds_ItensScope.LogChanges := True;
end;

procedure TTasOrderJob.ShowListToBuy;
begin
  cds_search_comprar.Active := False;
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
               'SELECT DISTINCT pro.id, pro.description, otb.quantity, ',
               ' ohp.tb_order_id, otb.tb_order_id ',
               'FROM tb_order_to_buy otb ',

               'LEFT OUTER JOIN tb_order_has_purchase ohp ',
               'on  ( ohp.tb_institution_id = otb.tb_institution_id ) ',
               'and ( ohp.tb_order_to_buy_id       = otb.id) ',

               'INNER JOIN tb_product pro ',
               'on  ( pro.id = otb.tb_product_id) ',
               'and ( pro.tb_institution_id = otb.tb_institution_id ) ',

               ' WHERE otb.tb_institution_id =:institution_id ',
               ' and ohp.tb_order_id is null ',
               ' and otb.tb_order_id =:order_id'
            ));
    ParamByName('institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    ParamByName('order_id').AsInteger := CodigoRegistro;
    Active := True;
    FetchAll;
  End;
  cds_search_comprar.Active := True;
end;

procedure TTasOrderJob.ShowListPurchase;
begin
  cds_search_comprado.Active := False;
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              'SELECT DISTINCT pro.id, pro.description, oip.quantity, ',
              'inv.number, inv.dt_emission , ord.status status_compra, ',
              'otb.tb_order_id,otb.tb_order_item_id, oip.tb_stock_list_id, ',
              'otd.status status_entrega ',

              'FROM tb_order ord ',

              'inner join tb_order_item oip ',
              'on (oip.tb_order_id = ord.id) ',
              '    and ( oip.tb_institution_id = ord.tb_institution_id ) ',

              'inner join tb_invoice inv ',
              'on (inv.id = ord.id) ',
              '    and ( inv.tb_institution_id = ord.tb_institution_id ) ',

              'INNER JOIN tb_order_has_purchase ohp ',
              'on  ( ohp.tb_institution_id = oip.tb_institution_id ) ',
              '    and ( ohp.tb_order_id       = oip.tb_order_id) ',
              '    AND ( ohp.tb_order_item_id  = oip.id) ',

              'INNER JOIN tb_order_to_buy otb ',
              'on (  otb.id = ohP.tb_order_to_buy_id) ',
              '    and ( otb.tb_institution_id = ohp.tb_institution_id) ',

              'left outer join tb_order_to_deliver otd ',
              'on (otb.tb_order_id = otd.tb_order_id) ',
              '   and (otb.tb_institution_id = otd.tb_institution_id) ',
              '   and (otb.tb_order_item_id = otd.tb_order_item_id) ',

              'INNER JOIN tb_product pro ',
              'on  ( pro.id = otb.tb_product_id) ',
              '    and ( pro.tb_institution_id = oip.tb_institution_id ) ',

              'WHERE ord.tb_institution_id =:institution_id ',
              'and otb.tb_order_id=:order_id ',
              ' and (ord.status =:status)',
              'and otd.status is null '
            ));
    ParamByName('institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    ParamByName('order_id').AsInteger := CodigoRegistro;
    ParamByName('status').AsString := 'F';
    Active := True;
    FetchAll;
  End;
  cds_search_comprado.Active := True;
  TIntegerField(cds_search_emp.FieldByName('id')).DisplayFormat := '000';
end;

procedure TTasOrderJob.ShowListEmp;
begin
  cds_search_emp.Active := False;
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
               'SELECT DISTINCT pro.id, pro.description, str.quantity, ',
               ' ohr.tb_order_id,tb_stock_list_id,ohr.tb_order_item_id, ',
               ' str.status ',
               'FROM tb_stock_reserved str ',

               'LEFT OUTER JOIN tb_order_has_reserved ohr ',
               'on  ( ohr.tb_institution_id = str.tb_institution_id ) ',
               'and ( ohr.tb_stock_reserved_id  = str.id) ',

               'INNER JOIN tb_product pro ',
               'on  ( pro.id = str.tb_merchandise_id) ',
               'and ( pro.tb_institution_id = str.tb_institution_id ) ',

               ' WHERE str.tb_institution_id =:institution_id ',
               ' and ohr.tb_order_id =:order_id '
            ));

    ParamByName('institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    ParamByName('order_id').AsInteger := CodigoRegistro;
    Active := True;
    FetchAll;
  End;
  cds_search_emp.Active := True;
end;

procedure TTasOrderJob.ShowListToDeliver;
begin
  cds_search_env.Active := False;
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
               'SELECT DISTINCT pro.id, pro.description, otd.quantity, ',
               ' ohd.tb_order_id, otd.tb_order_id ',
               'FROM tb_order_to_deliver otd ',

               'LEFT OUTER JOIN tb_order_has_delivery ohd ',
               'on  ( ohd.tb_institution_id = otd.tb_institution_id ) ',
               'and ( ohd.tb_order_to_deliver_id = otd.id) ',

               'INNER JOIN tb_product pro ',
               'on  ( pro.id = otd.tb_product_id) ',
               'and ( pro.tb_institution_id = otd.tb_institution_id ) ',

               ' WHERE otd.tb_institution_id =:institution_id ',
               ' and ohd.tb_order_id is null ',
               ' and otd.tb_order_id =:order_id'
            ));
    ParamByName('institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    ParamByName('order_id').AsInteger := CodigoRegistro;
    Active := True;
    FetchAll;
  End;
  cds_search_env.Active := True;
  TIntegerField(cds_search_emp.FieldByName('id')).DisplayFormat := '000';
end;

procedure TTasOrderJob.ShowListDelivered;
begin
  cds_search_enviado.Active := FAlse;
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
               'SELECT DISTINCT pro.id, pro.description, otd.quantity, ',
               ' ohd.tb_order_id, otd.tb_order_id ',
               'FROM tb_order_to_deliver otd ',

               'INNER JOIN tb_order_has_delivery ohd ',
               'on  ( ohd.tb_institution_id = otd.tb_institution_id ) ',
               'and ( ohd.tb_order_to_deliver_id = otd.id) ',

               '  INNER JOIN tb_order ord ',
               '  on  ( ord.tb_institution_id = ohd.tb_institution_id ) ',
               '   and ( ord.id = ohd.tb_order_id ) ',


               'INNER JOIN tb_product pro ',
               'on  ( pro.id = otd.tb_product_id) ',
               'and ( pro.tb_institution_id = otd.tb_institution_id ) ',

               ' WHERE otd.tb_institution_id =:institution_id ',
               ' and ord.status = ''F'' ',
               ' and otd.tb_order_id =:order_id'
            ));
    ParamByName('institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    ParamByName('order_id').AsInteger := CodigoRegistro;
    Active := True;
    FetchAll;
  End;
  cds_search_enviado.Active := True;
  TIntegerField(cds_search_emp.FieldByName('id')).DisplayFormat := '000';
end;

procedure TTasOrderJob.ShowlistItems;
begin
  FrOrderItemsJob := TFmOrderItemsJob.Create(Self);
  FrOrderItemsJob.Parent := Ctn_Order_itens_job;
  FrOrderItemsJob.Align := alClient;
  FrOrderItemsJob.LiberarItem1.OnClick := LiberarItemClick;
  FrOrderItemsJob.Show;
end;

procedure TTasOrderJob.ShowListProduction;
begin
  cds_search_pro.Active := False;
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
                'SELECT DISTINCT pro.id, pro.description, otp.quantity, ',
                ' ohp.tb_order_id, otp.tb_order_id ',
                ' FROM tb_order_to_production otp ',

                ' LEFT OUTER JOIN tb_order_has_production ohp ',
                ' on  ( ohp.tb_institution_id = otp.tb_institution_id ) ',
                ' and ( ohp.tb_order_production_id = otp.id) ',

                'INNER JOIN tb_product pro ',
                'on  ( pro.id = otp.tb_product_id) ',
                'and ( pro.tb_institution_id = otp.tb_institution_id ) ',

               ' WHERE otp.tb_institution_id =:institution_id ',
               ' and ohp.tb_order_id is null ',
               ' and otp.tb_order_id =:order_id'
            ));
    ParamByName('institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    ParamByName('order_id').AsInteger := CodigoRegistro;
    Active := True;
    FetchAll;
  End;
  cds_search_pro.Active := True;
  TIntegerField(cds_search_emp.FieldByName('id')).DisplayFormat := '000';
end;

procedure TTasOrderJob.ShowListSol;
begin
    cds_search_sol.Active := False;
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
               'SELECT DISTINCT pro.id, pro.description, oip.quantity,ord.status ',
               ',ord.dt_record ,op.number, oid.dt_forecast ',
               'FROM tb_order ord ',

               'inner join tb_order_purchase op ',
               'on (op.id = ord.id) ',
               '    and ( op.tb_institution_id = ord.tb_institution_id ) ',

               'inner join tb_order_item oip ',
               'on (oip.tb_order_id = ord.id) ',
               '    and ( oip.tb_institution_id = ord.tb_institution_id ) ',

               'inner join tb_order_item_detail oid ',
               'on    ( oid.tb_order_id = oip.tb_order_id ) ',
               '  and ( oid.tb_institution_id = oip.tb_institution_id ) ',
               '  and ( oid.id = oip.id ) ',

               'INNER JOIN tb_order_has_purchase ohp ',
               'on  ( ohp.tb_institution_id = oip.tb_institution_id ) ',
               'and ( ohp.tb_order_id       = oip.tb_order_id) ',
               'AND ( ohp.tb_order_item_id  = oip.id) ',

               'INNER JOIN tb_order_to_buy otb ',
               'on (  otb.id = ohP.tb_order_to_buy_id) ',
               'and ( otb.tb_institution_id = ohp.tb_institution_id) ',

               'INNER JOIN tb_product pro ',
               'on  ( pro.id = otb.tb_product_id) ',
               'and ( pro.tb_institution_id = oip.tb_institution_id ) ',

               'WHERE ord.tb_institution_id =:institution_id ',
               'and otb.tb_order_id=:order_id ',
               'and ord.status =:status '
            ));
    ParamByName('institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    ParamByName('order_id').AsInteger := CodigoRegistro;
    ParamByName('status').AsString := 'P';
    Active := True;
    FetchAll;
  End;
  cds_search_sol.Active := True;
  TIntegerField(cds_search_emp.FieldByName('id')).DisplayFormat := '000';
end;

procedure TTasOrderJob.ShowNoData;
begin
  ClearAllFields;
  inherited;
end;




procedure TTasOrderJob.toInvoice;
begin
  inherited;

end;

procedure TTasOrderJob.dbg_CompradoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then
  begin
    pop_items_comprado.Popup(X, Y, pnl_Comprado);
  end;
end;

procedure TTasOrderJob.dbg_EmpenhoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then
  begin
    pop_items_empenho.Popup(X, Y, pnl_Empenho);
  end;
end;

function TTasOrderJob.ValidadeRelease: boolean;
begin
  Result := true;
  if not hasOrderItems(FrOrderItemsJob.cds_items) then
  Begin
    Result := False;
    exit;
  End;

end;

function TTasOrderJob.ValidaInsert: boolean;
begin
//
end;


function TTasOrderJob.ValidateDelete: boolean;
begin
//
end;

function TTasOrderJob.validateInvoice: Boolean;
begin
  REsult := true;
  if not hasOrderItems(FrOrderItemsJob.cds_items) then
  Begin
    Result := False;
    exit;
  End;
end;

function TTasOrderJob.validatePrintOrder: Boolean;
begin
  REsult := true;
  if not hasOrderItems(FrOrderItemsJob.cds_items) then
  Begin
    Result := False;
    exit;
  End;
end;

function TTasOrderJob.ValidateSave: boolean;
begin
  result :=true;
  FrOrderItemsJob.totalizerItems;
  if TRIM(FrCustomer.DBLCB_Lista.Text) = '' then
    begin
        MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Cliente não informado.',
                  'Preencha o campo para continuar']);
      IF FrCustomer.Focused then FrCustomer.SetFocus;
      Result:=False;
      Exit;
    end;

  if TRIM(FrSituation.DBLCB_Lista.Text) = '' then
  begin
      MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Situação não informado.',
                  'Preencha o campo para continuar']);
      IF FrSituation.Focused then FrSituation.SetFocus;
      Result:=False;
      Exit;
  end;

  if TRIM(E_Description.Text) = '' then
  begin
      MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo descrição da Obra na.',
                  'Preencha o campo para continuar']);
      IF E_Description.Focused then E_Description.SetFocus;
      Result:=False;
      Exit;
  end;
end;


procedure TTasOrderJob.VerifyCompleteList;
Var
  LcAtiva : Boolean;
begin
  with FrOrderItemsJob.cds_items do
  Begin
    LcAtiva := False;
    first;
    while not eof do
    Begin
      if (StrToIntDef(FieldByName('tb_order_id').AsString,0) = 0) and ( not LcAtiva ) then
      Begin
        LcAtiva := True;
      End;
      next;
    End;
  End;
  if LcAtiva then
    ShowDatalisttItems(FrOrderItemsJob.cds_items,OrderJob.Registro.Codigo);
end;

end.

