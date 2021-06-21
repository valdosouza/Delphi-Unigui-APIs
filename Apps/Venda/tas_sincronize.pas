unit tas_sincronize;
interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  base_form, FMX.Layouts,  MainModule, SyncObjs,
  {$IFNDEF ANDROID}
  Winapi.Windows,
 {$ENDIF ANDROID}
  System.Threading,
  ctrl_mob_company, ctrl_mob_country, ctrl_mob_customer, ctrl_mob_entity,
  ctrl_mob_financial, FMX.Ani, FMX.Objects, FMX.ListBox,
  FMX.Controls.Presentation, ctrl_mob_merchandise, ctrl_mob_order,
   uDataCountryCC, uDataCM,ctrl_mob_line_business,
  REST.Json,System.Json, ObjMerchandise,System.Generics.Collections,

 FMX.Edit, System.UIConsts,  DownTables,
  UpdateTables, CtrlSync, UnFunctions, ctrl_mob_sync_data, Network,
  FMX.TabControl, ctrl_mob_stock_balance, FMX.DateTimeCtrls, System.ImageList,
  FMX.ImgList, FMX.Effects, System.Actions, FMX.ActnList, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;

type

  TTasSincronize = class(TBaseForm)
    Ly_Result_top: TLayout;
    Rc_result_top: TRectangle;
    Ly_list_titlle: TLayout;
    Lb_name_tittle: TLabel;
    Sb_Sync: TSpeedButton;
    tbc_geral: TTabControl;
    tab_sincronizacao: TTabItem;
    tab_opcoes: TTabItem;
    Lst_Proc_log: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    GridPanelLayout1: TGridPanelLayout;
    E_Time_Sincronia: TTimeEdit;
    E_DataTime_Sincronia: TDateEdit;
    ShadowEffect1: TShadowEffect;
    Rc_row_1: TRectangle;
    Swch_restart_all: TSwitch;
    Label3: TLabel;
    Rc_row_2: TRectangle;
    Swch_restart_product: TSwitch;
    Label4: TLabel;
    Rc_row_3: TRectangle;
    Swch_restart_Customer: TSwitch;
    Label5: TLabel;
    Rc_row_4: TRectangle;
    Ly_row_4_1: TLayout;
    Label6: TLabel;
    Swch_setTimeTo: TSwitch;
    Label7: TLabel;
    Rc_row_6: TRectangle;
    Swch_Rec_Consignment: TSwitch;
    Label8: TLabel;
    Rc_row_8: TRectangle;
    Swch_Rec_Kickback: TSwitch;
    Label9: TLabel;
    Rc_row_7: TRectangle;
    Swch_Rec_Financial: TSwitch;
    Label10: TLabel;
    VertScrollBox1: TVertScrollBox;
    Rc_row_5: TRectangle;
    Swch_Rec_Order_Sale: TSwitch;
    Label11: TLabel;
    Rc_row_9: TRectangle;
    Swch_Rec_Stock_Statement: TSwitch;
    Label12: TLabel;
    procedure FinalizarThread(Sender: TObject);
    procedure Sb_SyncClick(Sender: TObject);
  private
    { Private declarations }
    FSessaoCritica : TCriticalSection;
    FDownTables   : TDownTables;
    FUpdateTables   : TUpdateTables;
    FCtrlSync     : TObjListCtrlSync;
    FSync         : TCtrlMobSyncData;
    procedure ForcaRecebimento;
    procedure ForcaEnvio;
    procedure ResetAllData;
    procedure ResetCustomerData;
    procedure ResetProductData;
    procedure setTimeToSincronize;
    function getLastUpdate(table:String;Sentido:String):String;
    procedure updateMsgProcess(shortmsg,lineMsg:String;msgIndex:Integer);
    procedure createListSync;
  protected
    procedure InitVariable;Override;
    function showProcess(Msg:String):Boolean;Override;
  public
    { Public declarations }
    procedure exeSync;
  end;

var
  TasSincronize: TTasSincronize;
  MsgCrash : String;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$ZEROBASEDSTRINGS OFF}

uses ctrl_mob_salesman_has_stock;


{ TTasSincronize }
procedure TTasSincronize.createListSync;
Var
  LcObj :TCtrlSync;
  lcSHS : TCtrlMobSalesmanHasStock;
begin
  try

    FSessaoCritica.Enter;
    lcSHS  := TCtrlMobSalesmanHasStock.Create(Self);
    lcSHS.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    lcSHS.Registro.Vendedor := GbSalesMan;
    lcSHS.getbySalesman;

    //LcObj := TCtrlSync.Create;


    FCtrlSync.Clear;
    // 1 - Pais - indice - 0
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_country';
    LcObj.UltimaAtualizacao := getLastUpdate(LcObj.Name,'E');
    LcObj.Json := '';
    LcObj.Baixado     := 'N';
    LcObj.Atualizado  := 'N';
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Baixando dados de Paises','Baixando dados de Paises',0);

    // 2 - Estados - indice - 1
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_state';
    LcObj.UltimaAtualizacao := getLastUpdate(LcObj.Name,'E');
    LcObj.Json := '';
    LcObj.Baixado     := 'N';
    LcObj.Atualizado  := 'N';
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Baixando dados de Estados','Baixando dados de Estados',1);

    // 3 - Cidade - indice - 2
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_city';
    LcObj.UltimaAtualizacao := getLastUpdate(LcObj.Name,'E');
    LcObj.Json := '';
    LcObj.Baixado     := 'N';
    LcObj.Atualizado  := 'N';
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Baixando dados de Cidades','Baixando dados de Cidades',2);

    // 4 - Categoarias - indice - 3
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_category';
    LcObj.UltimaAtualizacao := getLastUpdate(LcObj.Name,'E');
    LcObj.Json := '';
    LcObj.Baixado     := 'N';
    LcObj.Atualizado  := 'N';
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Baixando dados de Categorias','Baixando dados de Categorias',3);

    // 5 - Produtos - indice - 4
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_product';
    LcObj.UltimaAtualizacao := getLastUpdate(LcObj.Name,'E');
    LcObj.Json := '';
    LcObj.Baixado     := 'N';
    LcObj.Atualizado  := 'N';
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Baixando dados de Produto','Baixando dados de Produto',4);

    // 6 - Marcas - indice - 5
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_brand';
    LcObj.UltimaAtualizacao := getLastUpdate(LcObj.Name,'E');
    LcObj.Json :='';
    LcObj.Baixado     := 'N';
    LcObj.Atualizado  := 'N';
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Baixando dados de Marcas','Baixando dados de Marcas',5);

    // 7 - Mercadoria - indice - 6
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_merchandise';
    LcObj.UltimaAtualizacao := getLastUpdate(LcObj.Name,'E');
    LcObj.Json := '';
    LcObj.Baixado     := 'N';
    LcObj.Atualizado  := 'N';
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Baixando dados de Mercadoria','Baixando dados de Mercadoria',6);

    // 8 - Embalagens - indice - 7
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_package';
    LcObj.UltimaAtualizacao := getLastUpdate(LcObj.Name,'E');
    LcObj.Json :='';
    LcObj.Baixado     := 'N';
    LcObj.Atualizado  := 'N';
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Baixando dados de Embalagens','Baixando dados de Embalagens',7);

    // 9 - Medidas - indice - 8
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_measure';
    LcObj.UltimaAtualizacao := getLastUpdate(LcObj.Name,'E');
    LcObj.Json := '';
    LcObj.Baixado    := 'N';
    LcObj.Atualizado := 'N';
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Baixando dados de Medidas','Baixando dados de Medidas',8);

    // 10 - Cores - indice - 9
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_color';
    LcObj.UltimaAtualizacao := getLastUpdate(LcObj.Name,'E');
    LcObj.Json := '';
    LcObj.Baixado    := 'N';
    LcObj.Atualizado := 'N';
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Baixando dados de Cores','Baixando dados de Cores',9);

    // 11 - Estoques - indice - 10
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_stock';
    LcObj.UltimaAtualizacao := getLastUpdate(LcObj.Name,'E');
    LcObj.Json := '';
    LcObj.Baixado    := 'N';
    LcObj.Atualizado := 'N';
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Baixando dados de Estoque','Baixando dados de Estoque',10);

    // 12 - TAbela de Preços - indice - 11
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_price_list';
    LcObj.UltimaAtualizacao := getLastUpdate(LcObj.Name,'E');
    LcObj.Json := '';
    LcObj.Baixado := 'N';
    LcObj.Atualizado := 'N';
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Baixando dados de Tabela de Preço','Baixando dados de Tabela de Preço',11);

    // 13 - Preços - indice - 12
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_price';
    LcObj.UltimaAtualizacao := getLastUpdate(LcObj.Name,'E');
    LcObj.Json := '';
    LcObj.Baixado := 'N';
    LcObj.Atualizado := 'N';
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Baixando dados de Preços','Baixando dados de Preços',12);

    // 14 - Tabela de Estoque - indice - 13
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_stock_list';
    LcObj.UltimaAtualizacao := getLastUpdate(LcObj.Name,'E');
    LcObj.Json := '';
    LcObj.Baixado := 'N';
    LcObj.Atualizado := 'N';
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Baixando dados de Tabela de Estoque','Baixando dados de Tabela de Estoque',13);

    // 15 - Saldo de Estoque - indice - 14     - Baixar somente o registro do saldo stock_balance
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_stock_balance';
    LcObj.UltimaAtualizacao := getLastUpdate(LcObj.Name,'E');
    LcObj.Json := '';
    if not lcSHS.exist then
    Begin
      LcObj.Baixado := 'N';
      LcObj.Atualizado := 'N';
    End
    else
    Begin
      LcObj.Baixado := 'S';
      LcObj.Atualizado := 'S';
    End;
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Baixando dados de Saldo de Estoque','Baixando dados de Saldo de Estoque',14);

    // 16 - Forma de Pagamento - indice - 15
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_paymentType';
    LcObj.UltimaAtualizacao := getLastUpdate(LcObj.Name,'E');
    LcObj.Json := '';
    LcObj.Baixado := 'N';
    LcObj.Atualizado := 'N';
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Baixando dados de Formas de Pagamento','Baixando dados de Formas de Pagamento',15);

    // 17 - Dados do Vendedor - indice - 16
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_salesman';
    LcObj.UltimaAtualizacao := getLastUpdate(LcObj.Name,'E');
    LcObj.Json := '';
    LcObj.Baixado := 'N';
    LcObj.Atualizado := 'N';
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Baixando dados de dados do Vendedor(a)','Baixando dados de dados do Vendedor(a)',16);

    // 18 - Clientes - indice - 17
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_customer';
    LcObj.UltimaAtualizacao := getLastUpdate(LcObj.Name,'E');
    LcObj.Json := '';
    LcObj.Baixado := 'N';
    LcObj.Atualizado := 'N';
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Baixando dados de Clientes','Baixando dados de Clientes',17);

    // 19 - Vendedor com Estoque Especifico - indice - 18
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_salesman_has_stock';
    LcObj.UltimaAtualizacao := getLastUpdate(LcObj.Name,'E');
    LcObj.Json := '';
    if lcSHS.exist then
    Begin
      LcObj.Baixado     := 'N'; //ORIGINAL É N
      LcObj.Atualizado  := 'N'; //ORIGINAL É N
    End
    else
    Begin
      LcObj.Baixado     := 'S';
      LcObj.Atualizado  := 'S';
    End;
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Baixando Estoque do Vendedor','Baixando Estoque do vendedor.',18);


    // 20 - Pedido - indice - 19
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_order_sale';
    LcObj.UltimaAtualizacao := getLastUpdate(LcObj.Name,'S');
    LcObj.Json := '';
    LcObj.Baixado := 'S';    //ORIGINAL É S
    LcObj.Atualizado := 'N'; //ORIGINAL É N
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Enviando dados de Pedidos.','Enviando dados de Pedidos.',19);

    // 21 - Consignação - indice - 20
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_order_consignment';
    LcObj.UltimaAtualizacao := getLastUpdate(LcObj.Name,'S');
    LcObj.Json := '';
    LcObj.Baixado := 'S';       //ORIGINAL É S
    LcObj.Atualizado := 'S';    //ORIGINAL É N
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Enviando dados de Consignação.','Enviando dados de Consignação.',20);

    // 22 - Envia Movimento Estoque - indice - 21
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_stock_statement';
    LcObj.UltimaAtualizacao := getLastUpdate(LcObj.Name,'S');
    LcObj.Json :='';
    LcObj.Baixado := 'S';      //ORIGINAL É S
    LcObj.Atualizado := 'S';   //ORIGINAL É N
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Enviando movimento de Estoque.','Enviando movimento de Estoque.',21);

    // 23 - SAldo de Estoque - indice - 22   - FAzendo calculado pelo Stock_statement
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_stock_balance';
    LcObj.UltimaAtualizacao := getLastUpdate(LcObj.Name,'E');
    LcObj.Json :='';
    if lcSHS.exist then
    Begin
      LcObj.Baixado     := 'S';   //ORIGINAL É N
      LcObj.Atualizado  := 'S';   //ORIGINAL É N
    End
    else
    Begin
      LcObj.Baixado     := 'S';
      LcObj.Atualizado  := 'S';
    End;
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Baixando dados de Saldo de Estoque','Baixando dados de Saldo de Estoque',22);

    // 24 - Financeiro Controle - indice - 23
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_financial_bills';
    LcObj.UltimaAtualizacao := getLastUpdate(LcObj.Name,'S');
    LcObj.Json := '';
    LcObj.Baixado     := 'S';     //ORIGINAL É S
    LcObj.Atualizado  := 'S';     //ORIGINAL É N
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Envidando dados do Controle Financeiro.','Envidando dados do Controle Financeiro.',23);

    // 25 - Comissões - indice - 24
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_kickback';
    LcObj.UltimaAtualizacao := getLastUpdate(LcObj.Name,'S');
    LcObj.Json := '';
    LcObj.Baixado     := 'S';    //ORIGINAL É S
    LcObj.Atualizado  := 'S';    //ORIGINAL É N
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Envidando dados de Comissões.','Envidando dados de Comissões.',24);

    // 26 - Restaurar Dados da Venda - indice - 25
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_order_sale';
    LcObj.UltimaAtualizacao := formatdatetime('dd/mm/yyyy hh:nn:ss', 0);
    LcObj.Json := '';
    if Swch_Rec_Order_Sale.IsChecked then
    Begin
      LcObj.Baixado := 'N';          //ORIGINAL É N
      LcObj.Atualizado := 'N';       //ORIGINAL É N
    End
    else
    Begin
      LcObj.Baixado := 'S';
      LcObj.Atualizado := 'S';
    End;
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Restaurando dados de Vendas','Restaurando dados de Vendas',25);

    // 27 - Restaurar Dados da Consignação - indice - 26
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_order_consignment';
    LcObj.UltimaAtualizacao := formatdatetime('dd/mm/yyyy hh:nn:ss', 0);
    LcObj.Json := '';
    if Swch_Rec_Consignment.IsChecked then
    Begin
      LcObj.Baixado := 'N';       //ORIGINAL É N
      LcObj.Atualizado := 'N';    //ORIGINAL É N
    End
    else
    Begin
      LcObj.Baixado := 'S';
      LcObj.Atualizado := 'S';
    End;
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Restaurando dados da Consignação','Restaurando dados da Consignação',26);

    // 28 - Dados do Financeiro - indice - 27
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_financial_bills';
    LcObj.UltimaAtualizacao := formatdatetime('dd/mm/yyyy hh:nn:ss', 0);
    LcObj.Json := '';
    if Swch_Rec_Financial.IsChecked then
    Begin
      LcObj.Baixado := 'N';             //ORIGINAL É N
      LcObj.Atualizado := 'N';          //ORIGINAL É N
    End
    else
    Begin
      LcObj.Baixado := 'S';
      LcObj.Atualizado := 'S';
    End;
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Restaurando dados do Financeiro','Restaurando dados do Financeiro',27);

    // 29 - Restaurar Dados da Comissão - indice - 28
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_kickback';
    LcObj.UltimaAtualizacao := formatdatetime('dd/mm/yyyy hh:nn:ss', 0);
    LcObj.Json := '';
    if Swch_Rec_Kickback.IsChecked then
    Begin
      LcObj.Baixado := 'N';            //ORIGINAL É N
      LcObj.Atualizado := 'N';         //ORIGINAL É N
    End
    else
    Begin
      LcObj.Baixado := 'S';
      LcObj.Atualizado := 'S';
    End;
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Restaurando dados da Comissão','Restaurando dados da Comissão',28);

    // 30 - Restaurar Dados de Movimento de Estoque - indice - 29
    LcObj := TCtrlSync.Create;
    LcObj.Name := 'tb_stock_statement';
    LcObj.UltimaAtualizacao := formatdatetime('dd/mm/yyyy hh:nn:ss', 0);
    LcObj.Json := '';
    if Swch_Rec_Stock_Statement.IsChecked then
    Begin
      LcObj.Baixado := 'N';             //ORIGINAL É N
      LcObj.Atualizado := 'N';          //ORIGINAL É N
    End
    else
    Begin
      LcObj.Baixado := 'S';
      LcObj.Atualizado := 'S';
    End;
    FCtrlSync.Add(LcObj);
    updateMsgProcess('Restaurando dados do movimento Estoque','Restaurando dados do movimento Estoque',29);

  finally
    lcSHS.disposeOf;
    FSessaoCritica.Leave;
  end;
end;

procedure TTasSincronize.ResetCustomerData;
begin
  Try
    FSync.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    FSync.resetCustomerData(UMM.GInstitution.Registro.Codigo);
  except
    on E:Exception do
    GeralogCrashlytics('TasSicronize - DeleteTbEstoque - ',E.Message);
  End;
end;

procedure TTasSincronize.ResetProductData;
begin
  Try
    FSync.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    FSync.resetProductData(UMM.GInstitution.Registro.Codigo);
  except
    on E:Exception do
    GeralogCrashlytics('TasSicronize - ResetProductData - ',E.Message);
  End;

end;

procedure TTasSincronize.ResetAllData;
begin
  Try
    FSync.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    FSync.resetAllData(UMM.GInstitution.Registro.Codigo);
  except
    on E:Exception do
    GeralogCrashlytics('TasSicronize - ResetAllData - ',E.Message);
  End;
end;

procedure TTasSincronize.exeSync;
begin
  TRy
    showProcess('Iniciando Sincronia');
    //Cria a lista que controla o download e a atualização
    createListSync;
    //processo paralelo que faz o Download dos dados
    FDownTables           := TDownTables.Create(self);
    FDownTables.Servidor  := DataCM;
    FDownTables.ProcMsg   := Lb_process_msg;
    FDownTables.ProcLog   := Lst_Proc_log;
    FDownTables.CtrlSync  := FCtrlSync;
    FDownTables.SessaoCritica := FSessaoCritica;
    FDownTables.Execute;
    //Thread que faz a atualizaçao no banco de dados
    FUpdateTables  := TUpdateTables.Create(FCtrlSync,DataCM,Lb_process_msg,Lst_Proc_log);
    FUpdateTables.FreeOnTerminate := false;
    FUpdateTables.OnTerminate := FinalizarThread;
    FUpdateTables.Start;
  except
    on E: Exception do
    Begin
      MsgCrash := concat('execSync: ',E.Message);
      updateMsgProcess(MsgCrash,MsgCrash,0);
    End;
  end;
end;


procedure TTasSincronize.FinalizarThread(Sender: TObject);
Var
  LcCodigo : Integer;
begin
  LcCodigo := 0;
  updateMsgProcess('Processo Fnalizado','Processo Finalizado com Sucesso.',20);
 //Registra que a Sicnronia foi efetuada
  SetConfigINI('MOBILE','SYNCRONIA','S');
  {
  FCtrlSync.Clear;
  FCtrlSync.DisposeOf;
  FDownTables.DisposeOf;
  FUpdateTables.DisposeOf;
  FSessaoCritica.DisposeOf;
  }
  Sb_Sync.enabled := True;
  hideProcess;
end;

procedure TTasSincronize.ForcaEnvio;
begin
  Try
    FSync.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    FSync.deleteEnvios;
  except
    on E:Exception do
    GeralogCrashlytics('TasSicronize - Força Envio - ',E.Message);
  End;
end;

procedure TTasSincronize.ForcaRecebimento;
begin
  Try
    FSync.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    FSync.deleteRecebimentos;
  except
    on E:Exception do
    GeralogCrashlytics('TasSicronize - Força Recebimento - ',E.Message);
  End;
end;

function TTasSincronize.getLastUpdate(table, Sentido: String): String;
begin
  TRy
    FSync.Registro.Atualizacao := 0;
    FSync.Registro.Codigo := table;
    FSync.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    FSync.Registro.Direcao := Sentido;
    FSync.getLastUpdate;
    if FSync.exist then
      Result := formatdatetime('yyyy-mm-dd hh:nn:ss', FSync.Registro.Atualizacao)
    else
      Result := '1900-01-01 01:00:00';
  Except
    on E: Exception do
      GeralogCrashlytics('getLastUpdate - ',e.Message);
  End;

end;

procedure TTasSincronize.InitVariable;
begin
  FSync := TCtrlMobSyncData.Create(self);
  FSync.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  FSync.updateTbInstituition;
  FCtrlSync := TObjListCtrlSync.Create;
  FSessaoCritica := TCriticalSection.Create;
end;


procedure TTasSincronize.Sb_SyncClick(Sender: TObject);
begin
  tbc_geral.ActiveTab := tab_sincronizacao;
  if verificaConexaoServidor then
  Begin
    Sb_Sync.enabled := False;
    InitVariable;
    if Swch_restart_all.IsChecked then
      ResetAllData;

    if Swch_restart_product.IsChecked then
      ResetProductData;

    if Swch_restart_Customer.IsChecked then
      ResetCustomerData;

    if Swch_setTimeTo.IsChecked then
      setTimeToSincronize;
    exeSync;
  end;
end;



procedure TTasSincronize.setTimeToSincronize;
begin
  try
    //Recebimentos
    FSync.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    FSync.Registro.Atualizacao := E_DataTime_Sincronia.Date + E_Time_Sincronia.Time;
    FSync.setTimeTo;
  except
    on E:Exception do
    GeralogCrashlytics('TasSicronize - setTimeToSincronize - ',E.Message);
  end;
end;

function TTasSincronize.showProcess(Msg: String):boolean;
begin
  Lst_Proc_log.Items.Clear;
  inherited;
end;

procedure TTasSincronize.updateMsgProcess(shortmsg,lineMsg:String;msgIndex:Integer);
var
  Item: TListBoxItem;
Begin
  if Length(Trim(lineMsg)) > 0  then
  Begin
    Item := TListBoxItem.Create( Lst_Proc_log );
    Item.Parent := Lst_Proc_log;
    Item.Height := 22;
    Item.StyledSettings := [TStyledSetting.ssFontColor];
    Item.Text           := lineMsg;
    Item.FontColor      := TAlphaColorRec.Red;
    Item.font.Size :=   12;
  End;
  Lb_process_msg.Text := shortmsg;
end;



end.

