unit DownTables;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  System.Threading,zLib,
  FMX.ListBox,tblcity,tblCountry,tblState,tblCategory,tblproduct,tblbrand,tblmerchandise,
  tblmeasure,tblstock,tblstockbalance,tblpackage,tblPriceList,tblPrice,tblStockList,
  tblpaymentTypes,TypesCollection,TypesObjectsCollection,
  base_form, ctrl_mob_address, MainModule,
  uDataCountryCC, uDataCM,ctrl_mob_line_business,
  tblOrderSale,ObjOrderSale,
  REST.Json,System.Json, ObjMerchandise,System.Generics.Collections,
  ctrl_mob_category, ctrl_mob_brand, ctrl_mob_package,
  ctrl_mob_measure, uMain, objCustomer, ctrl_mob_mailing_group,
  ctrl_mob_entity_has_mailing,
  objEntityFiscal,
  tblCrashlytics,
  ctrl_mob_institution_has_line_business,ctrl_mob_social_media,ctrl_mob_salesman,tblsalesman,
  ctrl_mob_order_consignment,prm_order_consignment,prm_kickback,
  FMX.StdCtrls,
  prm_brand,prm_measure, prm_package, prm_city, prm_state, prm_country,prm_category,
  prm_product,prm_merchandise, prm_financial,prm_order_sale, prm_stock,
  prm_price_list,prm_price, prm_stock_list, prm_stock_statement,prm_payment_types,
  prm_salesman,prm_customer,prm_stock_balance, prm_entity,
  {$IFNDEF ANDROID}
  Winapi.Windows,
 {$ENDIF ANDROID}
   System.SyncObjs, CtrlSync, FMX.Types, System.UIConsts, ctrl_mob_sync_data,
  UnFunctions, ctrl_mob_order_sale, ctrl_mob_customer, objOrderConsignment,
  ctrl_mob_financial_bills, objFinancialBills, ctrl_mob_base;
type

  TDownTables = Class(Tcomponent)
  private
    FDataCM: TDataCM;
    FProcMsg: TLabel;
    FProcLog: TListBox;
    FCtrlSync: TObjListCtrlSync;
    FSessaoCritica : TCriticalSection;
    usando :Boolean;
    FSync    : TCtrlMobSyncData;

   procedure updateMsgProcess(shortmsg,lineMsg:String;msgIndex:Integer);
    procedure MonitorMsgProcess(pJson,msg:String;Index:Integer);
    procedure setFDataCM(const Value: TDataCM);
    procedure setFFCtrlSync(const Value: TObjListCtrlSync);
    procedure setFProcLog(const Value: TListBox);
    procedure setFProcMsg(const Value: TLabel);

    //Procedure auxiliares para diminuir a complexidade
    procedure objCustomerHandler(Lista:TListCustomer;indice:Integer);
    function GetobjCustomer(ObjCustomer : TObjCustomer):Boolean;

    procedure Getcountry;
    procedure GetState;
    procedure Getcity;
    procedure Getcategory;
    procedure Getproduct;
    procedure GetBrand;
    procedure Getmerchandise;
    procedure Getpackage;
    procedure Getmeasure;
    procedure Getcolor;
    procedure GetStock;
    procedure GetpriceList;
    procedure Getprice;
    procedure GetStockList;
    procedure GetStockBalance;
    procedure GetpaymentTypes;
    procedure Getsalesman;
    procedure GetListCustomer;
    procedure GetStockSalesman;
    procedure SendObjOrderSale;
    procedure SendObjOrderConsignment;
    procedure SendSTockStatement;
    procedure GetStockStatement;
    procedure SendFinancial;
    procedure SendKickback;
    procedure GetRestoreOrderSale;
    procedure GetRestoreOrderConsignment;
    procedure GetRestoreFinancialBills;
    procedure GetRestoreKickback;
    procedure GetRestoreStockStatement;

    function setLastUpdate(DescTable, Sentido: String; Reg: Integer;LastUpdate: TDateTime): Boolean;
    function getLastUpdate(table:String;Sentido:String):String;
    procedure setFFSessaoCritica(const Value: TCriticalSection);

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Execute;
    property Servidor : TDataCM read FDataCM write setFDataCM;
    property ProcMsg : TLabel read FProcMsg write setFProcMsg;
    property ProcLog : TListBox read FProcLog write setFProcLog;
    property CtrlSync : TObjListCtrlSync read  FCtrlSync write setFFCtrlSync;
    property SessaoCritica : TCriticalSection read FSessaoCritica write setFFSessaoCritica;
  End;


implementation

{ TDownTables }

constructor TDownTables.Create(AOwner: TComponent);
begin
  inherited;// Create(True);
  usando := False;
  FSync    := TCtrlMobSyncData.Create(self);
end;

procedure TDownTables.Execute;
Var
  LcTasks: array [0..30] of ITask;
begin
  //Pais
  LcTasks[0] := TTask.Create(GetCountry);
  LcTasks[0].Start;

  //Estados
  LcTasks[1] := TTask.Create(GetState);
  LcTasks[1].Start;

  //Cidade
  LcTasks[2] := TTask.Create(GetCity);
  LcTasks[2].Start;

  //Categoarias
  LcTasks[3] := TTask.Create(GetCategory);
  LcTasks[3].Start;

  //Produtos
  LcTasks[4] := TTask.Create(GetProduct);
  LcTasks[4].Start;

  //Marcas
  LcTasks[5] := TTask.Create(GetBrand);
  LcTasks[5].Start;

  //Mercadoria
  LcTasks[6] := TTask.Create(GetMerchandise);
  LcTasks[6].Start;

  //Embalagens
  LcTasks[7] := TTask.Create(GetPackage);
  LcTasks[7].Start;

  //Medidas
  LcTasks[8] := TTask.Create(GetMeasure);
  LcTasks[8].Start;

  //Cores
  LcTasks[9] := TTask.Create(GetColor);
  LcTasks[9].Start;

  //Estoques
  LcTasks[10] := TTask.Create(GetStock);
  LcTasks[10].Start;

  //TAbela de Preços
  LcTasks[11] := TTask.Create(GetPriceList);
  LcTasks[11].Start;

  //Preços
  LcTasks[12] := TTask.Create(GetPrice);
  LcTasks[12].Start;

  //TAbela de  Estoque
  LcTasks[13] := TTask.Create(GetStockList);
  LcTasks[13].Start;

  //Stock de Geral - So vai baixar se o vendedor não tiver estoque especifico
  LcTasks[14] := TTask.Create(GetStockBalance);
  LcTasks[14].Start;

  //Forma de Pagamento
  LcTasks[15] := TTask.Create(GetPaymentTypes);
  LcTasks[15].Start;

  //Dados do Vendedor
  LcTasks[16] := TTask.Create(GetSalesman);
  LcTasks[16].Start;

  //Clientes
  LcTasks[17] := TTask.Create(GetListCustomer);
  LcTasks[17].Start;

  //Stock de Vendedor - So vai baixar se o vendedor tiver estoque
  LcTasks[18] := TTask.Create(GetStockSalesman);
  LcTasks[18].Start;

  LcTasks[19] := TTask.Create(SendObjOrderSale);
  LcTasks[19].Start;

  LcTasks[20] := TTask.Create(SendObjOrderConsignmenT);
  LcTasks[20].Start;

  LcTasks[21] := TTask.Create(SendSTockStatement);
  LcTasks[21].Start;

  LcTasks[22] := TTask.Create(GetStockStatement);
  LcTasks[22].Start;

  LcTasks[23] := TTask.Create(SendFinancial);
  LcTasks[23].Start;

  LcTasks[24] := TTask.Create(SendKickback);
  LcTasks[24].Start;

  LcTasks[25] := TTask.Create(GetRestoreOrderSale);
  LcTasks[25].Start;

  LcTasks[26] := TTask.Create(GetRestoreOrderConsignment);
  LcTasks[26].Start;

  LcTasks[27] := TTask.Create(GetRestoreFinancialBills);
  LcTasks[27].Start;

  LcTasks[28] := TTask.Create(GetRestoreKickback);
  LcTasks[28].Start;

  LcTasks[29] := TTask.Create(GetRestoreStockStatement);
  LcTasks[29].Start;




end;

destructor TDownTables.Destroy;
begin


end;

procedure TDownTables.GetBrand;
Var
  LcStrData : String;
  indice : Integer;
  LcMsg : String;
  LcPar : TPrmBrand;
  LcStrJSon : String;
begin
  Try
    FSessaoCritica.Enter;
    indice := 5;
    LcPar := TPrmBrand.Create;
    LcPar.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    LcPar.UltimaAtualizacao := FCtrlSync[indice].UltimaAtualizacao;
    LcStrJSon := TJson.ObjectToJsonString(LcPar);

    Try
      LcStrJson := FDataCM.SMBrandClient.getSyncronize(LcStrJSon);
      LcMsg  := 'Dados da Marca Baixados.';
    Except
      on E: Exception do
      Begin
        LcMsg := 'Erro ao baixar Marcas';
        GeralogCrashlytics(LcMsg,E.Message);
        updateMsgProcess('',concat(LcMsg,E.Message),indice);
      End;
    End;
  Finally
    MonitorMsgProcess(LcStrJson,LcMsg,indice);
    FSessaoCritica.Leave;
  End;
end;

procedure TDownTables.Getcategory;
Var
  LcStrData : String;
  LcStrJSon  : String;
  indice : Integer;
  LcMsg : String;
  LcPar : TPrmCategory;
begin
  Try
    FSessaoCritica.Enter;
    indice := 3;

    LcPar := TPrmCategory.Create;
    LcPar.Usuario := GbUser;
    LcPar.Categoria.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    LcPar.UltimaAtualizacao := FCtrlSync[indice].UltimaAtualizacao;
    LcStrJSon := TJson.ObjectToJsonString(LcPar);
    Try
      LcStrJson := FDataCM.SMCAtegoryClient.getSyncronize(LcStrJSon);
      LcMsg  := 'Dados da Categoria Baixados.';
    Except
      on E: Exception do
      Begin
        LcMsg := 'Erro ao baixar Categorias';
        GeralogCrashlytics(LcMsg,E.Message);
        updateMsgProcess('',concat(LcMsg,E.Message),indice);
      End;
    End;
  Finally

    //lcpar.DisposeOf;
    MonitorMsgProcess(LcStrJson,LcMsg,indice);
    FSessaoCritica.Leave;
  End;
end;

procedure TDownTables.Getcity;
Var
  LcPar : TPrmCity;
  LcStrJSon : String;
  indice : Integer;
  LcMsg : String;
begin
  Try
    FSessaoCritica.Enter;
    indice := 2;


    //PArametros da Consulta
    LcPar := TPrmCity.Create;
    LcPar.Usuario := GbUser;
    LcPar.Vendedor := GbSalesMan;
    LcPar.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    LcPar.UltimaAtualizacao := FCtrlSync[indice].UltimaAtualizacao;
    LcStrJSon := TJson.ObjectToJsonString(LcPar);
    try
      LcStrJson := FDataCM.SMCityClient.getSyncronize(LcStrJSon);
      LcMsg  := 'Dados da Cidade Baixados.';
    Except
      on E: Exception do
      Begin
        LcMsg := 'Erro ao baixar Cidades';
        GeralogCrashlytics(LcMsg,E.Message);
        updateMsgProcess('',concat(LcMsg,E.Message),indice);
      End;
    End;
  Finally

    //LcPar.DisposeOf;
    MonitorMsgProcess(LcStrJson,LcMsg,indice);
    FSessaoCritica.Leave;
  End;

end;

procedure TDownTables.Getcolor;
Var
  LcMsg:String;
begin
  LcMsg := 'Dados da Cor Baixados.';
  FCtrlSync[9].Baixado := 'S';
  updateMsgProcess(LcMsg,LcMsg,9);
end;

procedure TDownTables.Getcountry;
Var
  LcPar : TPrmCountry;
  LcStrJSon : String;
  indice : Integer;
  LcMsg : String;
begin
  Try
    FSessaoCritica.Enter;
    indice := 0;
    //PArametros da Consulta
    LcPar := TPrmCountry.Create;
    LcPar.Usuario := GbUser;
    LcPar.Vendedor := GbSalesMan;
    LcPar.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    LcPar.UltimaAtualizacao := FCtrlSync[indice].UltimaAtualizacao;
    LcStrJSon := TJson.ObjectToJsonString(LcPar);
    Try
      LcStrJson := FDataCM.SMCountryClient.getSyncronize(LcStrJSon);
      LcMsg  := 'Dados de Países Baixados.';
    Except
      on E: Exception do
      Begin
        LcMsg := 'Erro ao baixar paises';
        GeralogCrashlytics(LcMsg,E.Message);
        updateMsgProcess('',concat(LcMsg,E.Message),indice);
      End;
    End;
  Finally

    //LcPar.DisposeOf;
    MonitorMsgProcess(LcStrJson,LcMsg,indice);
    FSessaoCritica.Leave;
  End;
end;

procedure TDownTables.GetRestoreFinancialBills;
Var
  LcObj : TCtrlMobFinancialBills;
  LcPar : TPrmFinancial;
  LcStrJSon : String;
  LcLista : TListFinancialBills;
  ListaObjFinancialBills: TListObjFinancialBills;
  LcObjFinancialBills : TObjFinancialBills;
  I:Integer;
  LcMsg, LcDefmsg:String;
  indice : Integer;
begin
  indice := 27;
  if ( FCtrlSync[indice].Baixado = 'N') then
  Begin

    Try
      Try
        FSessaoCritica.Enter;
        //PArametros da Consulta
        LcPar := TPrmFinancial.Create;
        LcPar.Usuario := GbUser;
        LcPar.Finaceiro.Terminal  := GbTerminal;
        LcPar.Finaceiro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
        LcPar.UltimaAtualizacao := FCtrlSync[indice].UltimaAtualizacao;
        LcStrJSon := TJson.ObjectToJsonString(LcPar);
        LcStrJson := FDataCM.SMFinancialBillsClient.getList(LcStrJSon);
        LcLista := TJson.JsonToObject<TListFinancialBills>( ZDecompressString(  LcStrJson ) );
        LcPar := TPrmFinancial.Create;
        if LcLista.Count > 0 then
        Begin
          ListaObjFinancialBills := TListObjFinancialBills.Create;
          Try
            LcObj := TCtrlMobFinancialBills.Create(self);
            LcDefmsg := 'Baixando dados do Financeiro';
            LcMsg := LcDefmsg;
            for I := 0 to ( LcLista.Count - 1) do
            Begin
              if ( LcLista[I] <> nil)  then
              Begin
                Try
                  LcPar.Finaceiro.Estabelecimento := LcLista[I].Estabelecimento;
                  LcPar.Finaceiro.Ordem     := LcLista[I].Ordem;
                  LcPar.Finaceiro.Terminal  := LcLista[I].Terminal;
                  LcPar.Finaceiro.Parcela   := LcLista[I].Parcela;
                  LcStrJSon := TJson.ObjectToJsonString(LcPar);

                  LcStrJson := FDataCM.SMFinancialBillsClient.getByKey(LcStrJSon);

                  LcObjFinancialBills := TJson.JsonToObject<TObjFinancialBills>( ZCompressString( LcStrJson,ZcDefault) );

                  ListaObjFinancialBills.Add(LcObjFinancialBills);
                  LcMsg := Concat(LcDefmsg,' : ',
                            IntToStr(LcLista.Count),'/',
                            IntToStr(I + 1)
                  );
                  updateMsgProcess(LcMsg,LcMsg,Indice);
                except
                  Break;
                End;
              End;
            End;
          Finally
            LcStrJson := ZCompressString (TJson.ObjectToJsonString( ListaObjFinancialBills ),zcDefault );
            {$IFNDEF ANDROID}
            //LcObj.DisposeOf;
            for I := 0 to ( ListaObjFinancialBills.Count - 1) do
            bEGIN
              LcObjFinancialBills := ListaObjFinancialBills[I];
              LcObjFinancialBills.Destroy;
            end;
           {$ENDIF ANDROID}
          End;
        End;
        LcMsg := 'Dados do Financeiro Baixados.';
      Except
        on E: Exception do
        Begin
          LcMsg := concat('Erro ao baixar Financeiro: ',LcObjFinancialBills.Financeiro.Ordem.ToString);
          GeralogCrashlytics(LcMsg,E.Message);
          updateMsgProcess('',concat(LcMsg,E.Message),indice);
        End;
      End;
    Finally

      //LcPar.DisposeOf;
      //LcLista.DisposeOf; desativado em 14/09 as 13:46
      MonitorMsgProcess(LcStrJson,LcMsg,indice);
      FSessaoCritica.Leave;
    End;
  End;
end;

procedure TDownTables.GetRestoreKickback;
Var
  LcPar : TPrmKickback;
  LcStrJSon : String;
  indice : Integer;
  LcMsg : String;

begin
  indice := 28;
  if ( FCtrlSync[indice].Baixado = 'N') then
  Begin

    Try
      FSessaoCritica.Enter;
      //PArametros da Consulta
      LcPar := TPrmKickback.Create;
      LcPar.Comissao.Estabelecimento := UMM.GInstitution.Registro.Codigo;
      LcPar.Usuario := GbUser;
      LcPar.Comissao.Terminal := GbTerminal;//Enviar para não receber as atualizaççoes do próprio dispositivo
      LcPar.UltimaAtualizacao := FCtrlSync[indice].UltimaAtualizacao;
      LcStrJSon := TJson.ObjectToJsonString(LcPar);
      Try
        LcStrJson := FDataCM.SMKickbackClient.getSyncronize(LcStrJSon);
        LcMsg  := 'Dados Comissão Baixados.';
      Except
        on E: Exception do
        Begin
          LcMsg := 'Erro ao baixar Comissão';
          GeralogCrashlytics(LcMsg,E.Message);
          updateMsgProcess('',concat(LcMsg,E.Message),indice);
        End;
      End;
    Finally

      //LcPar.DisposeOf;
      MonitorMsgProcess(LcStrJson,LcMsg,indice);
      FSessaoCritica.Leave;
    End;
  End;
end;

function TDownTables.getLastUpdate(table, Sentido: String): String;
begin
  TRy
    FSync.Registro.Codigo := table;
    FSync.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    FSync.Registro.Direcao := Sentido;
    FSync.getLastUpdate;
    Result := formatdatetime('dd/mm/yyyy hh:nn:ss', FSync.Registro.Atualizacao);
  Except
    on E: Exception do
      GeralogCrashlytics('getLastUpdate - ',e.Message);
  End;
end;


procedure TDownTables.Getmeasure;
Var
  LcPar : TPrmMeasure;
  LcStrJSon : String;
  indice : Integer;
  LcMsg : String;
begin
  Try
    FSessaoCritica.Enter;
    indice := 8;

    LcPar := TPrmMeasure.Create;
    LcPar.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    LcPar.UltimaAtualizacao := FCtrlSync[indice].UltimaAtualizacao;
    LcStrJSon := TJson.ObjectToJsonString(LcPar);

    Try
      LcStrJson := FDataCM.SMMeasureClient.getSyncronize(LcStrJSon);
      LcMsg  := 'Dados de Medidas Baixados.';
    Except
      on E: Exception do
      Begin
        LcMsg := 'Erro ao baixar Medidas';
        GeralogCrashlytics(LcMsg,E.Message);
        updateMsgProcess('',concat(LcMsg,E.Message),indice);
      End;
    End;
  Finally

    MonitorMsgProcess(LcStrJson,LcMsg,indice);
   FSessaoCritica.Leave;
  End;
end;

procedure TDownTables.Getmerchandise;
Var
  LcPar : TPrmMerchandise;
  LcStrJSon : String;
  indice : Integer;
  LcMsg : String;
begin
  Try
    FSessaoCritica.Enter;
    indice := 6;

    //PArametros da Consulta
    LcPar := TPrmMerchandise.Create;
    LcPar.Usuario := GbUser;
    LcPar.Mercadoria.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    LcPar.UltimaAtualizacao := FCtrlSync[indice].UltimaAtualizacao;
    LcStrJSon := TJson.ObjectToJsonString(LcPar);
    Try
      LcStrJson := FDataCM.SMMerchandiseClient.getSyncronize(LcStrJSon);
      LcMsg  := 'Dados de Mercadoria Baixados.';
    Except
      on E: Exception do
      Begin
        LcMsg := 'Erro ao baixar Mercadorias';
        GeralogCrashlytics(LcMsg,E.Message);
        updateMsgProcess('',concat(LcMsg,E.Message),indice);
      End;
    End;
  Finally
    //LcPar.DisposeOf;
    MonitorMsgProcess(LcStrJson,LcMsg,indice);
    FSessaoCritica.Leave;
  End;
end;

function TDownTables.GetobjCustomer(ObjCustomer : TObjCustomer):boolean;
Var
  LcMsg, LcDefmsg:String;
  LcPar: TPrmCustomer;
  LcStrJSon : String;
  LcCustomer: TCtrlMobCustomer;
begin
  Try
    try
      LcCustomer :=  TCtrlMobCustomer.create(nil);
      LcPar :=  TPrmCustomer.Create;
      LcPar.Cliente.Estabelecimento := ObjCustomer.Cliente.Estabelecimento;
      LcPar.Cliente.Codigo          := ObjCustomer.Cliente.Codigo;

      LcStrJSon := TJson.ObjectToJsonString(LcPar);
      LcStrJson := FDataCM.SMCustomerClient.getByKey(  LcStrJSon );
      LcStrJson := ZDecompressString( LcStrJson );
      LcCustomer.clonarObj(TJson.JsonToObject<TObjCustomer>( LcStrJson ) ,ObjCustomer);
    Except
      on E: Exception do
      Begin
        LcMsg := concat('Erro ao baixar Clientes: ',ObjCustomer.Cliente.Codigo.ToString);
        GeralogCrashlytics(LcMsg,E.Message);
      End;
    end;
  Finally
    LcPar.DisposeOf;
    LcCustomer.DisposeOf;
  End;
end;

procedure TDownTables.GetListCustomer;
Var
  LcParCustomer : TPrmCustomer;
  LcStrJSon : String;
  LcLista : TListCustomer;
  LcMsg, LcDefmsg:String;
  indice : Integer;
begin
  Try
    Try
      FSessaoCritica.Enter;
      indice := 17;
      //PArametros da Consulta
      LcParCustomer := TPrmCustomer.Create;
      LcParCustomer.Usuario := GbUser;
      {Zerando o vendedor pegamos todos os clientes e atualizados somente os clientes próprios
       Quando um vendedor perde um cliente preciso baixa-lo para saber que perdeu}
      LcParCustomer.Cliente.Vendedor := 0;//GbSalesMan;
      LcParCustomer.Cliente.Estabelecimento := UMM.GInstitution.Registro.Codigo;
      LcParCustomer.UltimaAtualizacao := FCtrlSync[indice].UltimaAtualizacao;
      LcStrJSon := TJson.ObjectToJsonString(LcParCustomer);
      LcStrJson := FDataCM.SMCustomerClient.getList(LcStrJSon);
      LcStrJson := ZDecompressString( LcStrJson );
      LcLista := TJson.JsonToObject<TListCustomer>( LcStrJson );
      objCustomerHandler(LcLista,indice);
      LcMsg := 'Dados de Cliente Baixados.';
    Except
      on E: Exception do
      Begin
        LcMsg := concat('Erro ao baixar Lista de Clientes: ');
        GeralogCrashlytics(LcMsg,E.Message);
        updateMsgProcess('',concat(LcMsg,E.Message),indice);
      End;
    End;
  Finally
    LcParCustomer.Destroy;
    FSessaoCritica.Leave;
  End;
end;

procedure TDownTables.GetRestoreOrderConsignment;
Var
  LcObj : TCtrlMobOrderConsignment;
  LcPar : TPrmOrderConsignmet;
  LcStrJSon : String;
  LcLista : TListOrdemConsignment;
  ListaObjOrderConsignment: TListObjOrderConsignment;
  LcObjOrderConsignment : TObjOrderConsignment;
  I:Integer;
  LcMsg, LcDefmsg:String;
  indice : Integer;
begin
  indice := 26;
  if ( FCtrlSync[indice].Baixado = 'N') then
  Begin

    Try
      Try
        FSessaoCritica.Enter;
        //PArametros da Consulta
        LcPar := TPrmOrderConsignmet.Create;
        LcPar.Usuario := GbUser;
        LcPar.Consignacao.Vendedor := GbSalesMan;
        LcPar.Consignacao.Terminal  := GbTerminal;
        LcPar.Consignacao.Estabelecimento := UMM.GInstitution.Registro.Codigo;
        LcPar.UltimaAtualizacao := FCtrlSync[indice].UltimaAtualizacao;
        LcStrJSon := TJson.ObjectToJsonString(LcPar);
        LcStrJson := FDataCM.SMOrderConsignmentClient.getList(LcStrJSon);
        LcLista := TJson.JsonToObject<TListOrdemConsignment>( ZCompressString( LcStrJson,zcDefault ) );
        LcPar := TPrmOrderConsignmet.Create;
        if LcLista.Count > 0 then
        Begin

          ListaObjOrderConsignment := TListObjOrderConsignment.Create;
          Try
            LcObj := TCtrlMobOrderConsignment.Create(self);
            LcDefmsg := 'Baixando dados da Consignação';
            LcMsg := LcDefmsg;
            for I := 0 to ( LcLista.Count - 1) do
            Begin
              if (LcLista[I] <> nil) then
              Begin
                Try
                  LcPar.Consignacao.Estabelecimento := LcLista[I].Estabelecimento;
                  LcPar.Consignacao.Codigo          := LcLista[I].Codigo;
                  LcPar.Consignacao.Terminal        := LcLista[I].Terminal;
                  LcPar.Consignacao.Cliente         := LcLista[I].Cliente;
                  LcStrJSon := TJson.ObjectToJsonString(LcPar);

                  LcStrJson := FDataCM.SMOrderConsignmentClient.getByKey(LcStrJSon);

                  LcObjOrderConsignment := TJson.JsonToObject<TObjOrderConsignment>( ZCompressString( LcStrJson,zcDefault ) );

                  ListaObjOrderConsignment.Add(LcObjOrderConsignment);
                  LcMsg := Concat(LcDefmsg,' : ',
                            IntToStr(LcLista.Count),'/',
                            IntToStr(I + 1)
                  );
                  updateMsgProcess(LcMsg,LcMsg,Indice);
                except
                  Break;
                End;
              End;
            End;
          Finally
            LcStrJson := ZCompressString (TJson.ObjectToJsonString( ListaObjOrderConsignment ),zcDefault );
            {$IFNDEF ANDROID}
            //LcObj.DisposeOf;
            for I := 0 to ( ListaObjOrderConsignment.Count - 1) do
            bEGIN
              LcObjOrderConsignment := ListaObjOrderConsignment[I];
              LcObjOrderConsignment.Destroy;
            end;
           {$ENDIF ANDROID}
          End;
        End;
        LcMsg := 'Dados de Consignação Baixados.';
      Except
        on E: Exception do
        Begin
          LcMsg := concat('Erro ao baixar Consignação: ',LCobjOrderConsignment.Consignacao.Codigo.ToString);
          GeralogCrashlytics(LcMsg,E.Message);
          updateMsgProcess('',concat(LcMsg,E.Message),indice);
        End;
      End;
    Finally
      //LcPar.DisposeOf;
      //LcLista.DisposeOf; desativado em 14/09 as 13:46
      MonitorMsgProcess(LcStrJson,LcMsg,indice);
      FSessaoCritica.Leave;
    End;
  End;
end;

procedure TDownTables.GetRestoreOrderSale;
Var
  LcObj : TCtrlMobOrderSale;
  LcPar : TPrmOrderSale;
  LcStrJSon : String;

  LcLista : TListOrdemConsignment;
  ListaObjOrderSale: TListObjOrderSale;
  LcObjOrderSale : TObjOrderSale;
  I:Integer;
  LcMsg, LcDefmsg:String;
  indice : Integer;

begin
  indice := 25;
  if ( FCtrlSync[indice].Baixado = 'N') then
  Begin
    Try
      Try
        FSessaoCritica.Enter;
        //PArametros da Consulta
        LcPar := TPrmOrderSale.Create;
        LcPar.Usuario := GbUser;
        LcPar.OrdemVenda.Vendedor := GbSalesMan;
        LcPar.OrdemVenda.Terminal  := GbTerminal;
        LcPar.OrdemVenda.Estabelecimento := UMM.GInstitution.Registro.Codigo;
        LcPar.UltimaAtualizacao := FCtrlSync[indice].UltimaAtualizacao;
        LcStrJSon := TJson.ObjectToJsonString(LcPar);
        LcStrJson := FDataCM.SMOrderSaleClient.getList(LcStrJSon);

        LcLista := TJson.JsonToObject<TListOrdemConsignment>( ZCompressString( LcStrJson,zcDefault ) );
        if LcLista.Count > 0 then
        Begin
          ListaObjOrderSale := TListObjOrderSale.Create;
          Try
            LcObj := TCtrlMobOrderSale.Create(self);
            LcDefmsg := 'Baixando dados de Venda';
            LcMsg := LcDefmsg;
            for I := 0 to ( LcLista.Count - 1) do
            Begin
              if ( LcLista[I] <> nil) then
              Begin
                Try
                  LcPar.OrdemVenda.Estabelecimento := LcLista[I].Estabelecimento;
                  LcPar.OrdemVenda.Codigo          := LcLista[I].Codigo;
                  LcPar.OrdemVenda.Terminal        := LcLista[I].Terminal;
                  LcPar.OrdemVenda.Vendedor        := LcLista[I].Vendedor;

                  LcStrJSon             := TJson.ObjectToJsonString(LcPar);
                  LcStrJson := FDataCM.SMOrderSaleClient.getByKey(LcStrJSon);

                  LcObjOrderSale := TJson.JsonToObject<TObjOrderSale>( ZCompressString( LcStrJson, zcDefault ) );

                  ListaObjOrderSale.Add(LcObjOrderSale);
                  LcMsg := Concat(LcDefmsg,' : ',
                            IntToStr(LcLista.Count),'/',
                            IntToStr(I + 1)
                  );
                  updateMsgProcess(LcMsg,LcMsg,Indice);
                except
                  Break;
                End;
              End;
            End;
          Finally
            LcStrJson := ZCompressString (TJson.ObjectToJsonString( ListaObjOrderSale ),zcDefault );
            {$IFNDEF ANDROID}
            //LcObj.DisposeOf;
            for I := 0 to ( ListaObjOrderSale.Count - 1) do
            bEGIN
              LcObjOrderSale := ListaObjOrderSale[I];
              LcObjOrderSale.Destroy;
            end;
           {$ENDIF ANDROID}
          End;
        End;
        LcMsg := 'Dados de Consignação Baixados.';
      Except
        on E: Exception do
        Begin
          LcMsg := concat('Erro ao baixar Consignação: ',LCobjOrderSale.OrderSale.Codigo.ToString);
          GeralogCrashlytics(LcMsg,E.Message);
          updateMsgProcess('',concat(LcMsg,E.Message),indice);
        End;
      End;
    Finally

      //LcPar.DisposeOf;
      //LcLista.DisposeOf; desativado em 14/09 as 13:46
      MonitorMsgProcess(LcStrJson,LcMsg,indice);
      FSessaoCritica.Leave;
    End;
  End;
end;

procedure TDownTables.GetRestoreStockStatement;
Var
  LcPar : TPrmStockStatement;
  LcStrJSon : String;
  indice : Integer;
  LcMsg : String;
begin
  indice := 29;
  if FCtrlSync[indice].Baixado = 'N' then
  Begin

    Try
      FSessaoCritica.Enter;
      //PArametros da Consulta
      LcPar := TPrmStockStatement.Create;
      LcPar.Movimento.Estabelecimento := UMM.GInstitution.Registro.Codigo;
      LcPar.Usuario := GbUser;
      LcPar.Vendedor := GbSalesMan; //Enviar para verificar qual estoque devera retornar
      LcPar.Movimento.Terminal := 0;          //Enviar para não receber as atualizaççoes do próprio dispositivo | 0 para o caso do restore
      LcPar.UltimaAtualizacao := FCtrlSync[indice].UltimaAtualizacao;
      LcStrJSon := TJson.ObjectToJsonString(LcPar);
      Try
        LcStrJson := FDataCM.SMStockStatementClient.getSyncronize(LcStrJSon);
        LcMsg  := 'Dados de Saldo de Estoque Baixados.';
      Except
        on E: Exception do
        Begin
          LcMsg := 'Erro ao baixar Saldos de Estoque';
          GeralogCrashlytics(LcMsg,E.Message);
          updateMsgProcess('',concat(LcMsg,E.Message),indice);
        End;
      End;
    Finally
      //LcPar.DisposeOf;
      MonitorMsgProcess(LcStrJson,LcMsg,indice);
      FSessaoCritica.Leave;
    End;
  End;

end;

procedure TDownTables.Getpackage;
Var
  LcPar : TPrmPackage;
  LcStrJSon : String;
  indice : Integer;
  LcMsg : String;
begin
  Try
    FSessaoCritica.Enter;
    indice := 7;

    LcPar := TPrmPackage.Create;
    LcPar.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    LcPar.UltimaAtualizacao := FCtrlSync[indice].UltimaAtualizacao;
    LcStrJSon := TJson.ObjectToJsonString(LcPar);
    Try
      LcStrJson := FDataCM.SMPackageClient.getSyncronize(LcStrJSon);
      LcMsg  := 'Dados de Embalagem Baixados.';
    Except
      on E: Exception do
      Begin
        LcMsg := 'Erro ao baixar Embalagens';
        GeralogCrashlytics(LcMsg,E.Message);
        updateMsgProcess('',concat(LcMsg,E.Message),indice);
      End;
    End;
  Finally
    MonitorMsgProcess(LcStrJson,LcMsg,indice);
    FSessaoCritica.Leave;
  End;
end;


procedure TDownTables.GetpaymentTypes;
Var
  LcPar : TPrmPaymentTypes;
  LcStrJSon : String;
  indice : Integer;
  LcMsg : String;
begin
  Try
    FSessaoCritica.Enter;
    indice := 15;

    LcPar := TPrmPaymentTypes.Create;
    LcPar.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    LcPar.UltimaAtualizacao := FCtrlSync[indice].UltimaAtualizacao;
    LcStrJSon := TJson.ObjectToJsonString(LcPar);

    Try
      LcStrJson := FDataCM.SMPaymentTypesClient.getSyncronize(LcStrJSon);
      LcMsg  := 'Dados de Forma de Pagamento Baixados.';
    Except
      on E: Exception do
      Begin
        LcMsg := 'Erro ao baixar Formas de Pagamento';
        GeralogCrashlytics(LcMsg,E.Message);
        updateMsgProcess('',concat(LcMsg,E.Message),indice);
      End;
    End;
  Finally
    //LcPar.DisposeOf;
    MonitorMsgProcess(LcStrJson,LcMsg,indice);
    FSessaoCritica.Leave;
  End;
end;

procedure TDownTables.Getprice;
Var
  LcPar : TPrmPrice;
  LcStrJSon : String;
  indice : Integer;
  LcMsg : String;
begin
  Try
    FSessaoCritica.Enter;
    indice := 12;

    //PArametros da Consulta
    LcPar := TPrmPrice.Create;
    LcPar.Preco.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    LcPar.UltimaAtualizacao := FCtrlSync[indice].UltimaAtualizacao;
    LcStrJSon := TJson.ObjectToJsonString(LcPar);
    Try
      LcStrJson := FDataCM.SMPriceClient.getSyncronize(LcStrJSon);
      LcMsg  := 'Dados de Preço Baixados.';
    Except
      on E: Exception do
      Begin
        LcMsg := 'Erro ao baixar Preços';
        GeralogCrashlytics(LcMsg,E.Message);
        updateMsgProcess('',concat(LcMsg,E.Message),indice);
      End;
    End;
  Finally
    //LcPar.DisposeOf;
    MonitorMsgProcess(LcStrJson,LcMsg,indice);
    FSessaoCritica.Leave;
  End;

end;

procedure TDownTables.GetpriceList;
Var
  LcPar : TPrmPriceList;
  LcStrJSon : String;
  indice : Integer;
  LcMsg : String;
begin
  Try
    FSessaoCritica.Enter;
    indice := 11;

    LcPar := TPrmPriceList.Create;
    LcPar.Tabela.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    LcPar.UltimaAtualizacao := FCtrlSync[indice].UltimaAtualizacao;
    LcStrJSon := TJson.ObjectToJsonString(LcPar);

    Try
      LcStrJson := FDataCM.SMPriceListClient.getSyncronize(LcStrJSon);
      LcMsg  := 'Dados de Tabela de Preço Baixados.';
    Except
      on E: Exception do
      Begin
        LcMsg := 'Erro ao baixar Tabelas de Preços';
        GeralogCrashlytics(LcMsg,E.Message);
        updateMsgProcess('',concat(LcMsg,E.Message),indice);
      End;
    End;
  Finally
    //LcPar.DisposeOf;
    MonitorMsgProcess(LcStrJson,LcMsg,indice);
    FSessaoCritica.Leave;
  End;
end;

procedure TDownTables.Getproduct;
Var
  LcPar : TPrmProduct;
  LcStrJSon : String;
  indice : Integer;
  LcMsg : String;
begin
  Try
    FSessaoCritica.Enter;
    indice := 4;

    //PArametros da Consulta
    LcPar := TPrmProduct.Create;
    LcPar.Usuario := GbUser;
    LcPar.Produto.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    LcPar.UltimaAtualizacao := FCtrlSync[indice].UltimaAtualizacao;
    LcStrJSon := TJson.ObjectToJsonString(LcPar);
    try
      LcStrJson := FDataCM.SMProductClient.getSyncronize(LcStrJSon);
      LcMsg  := 'Dados de Produto Baixados.';
    Except
      on E: Exception do
      Begin
        LcMsg := 'Erro ao baixar Produtos';
        GeralogCrashlytics(LcMsg,E.Message);
        updateMsgProcess('',concat(LcMsg,E.Message),indice);
      End;
    End;
  Finally
    //LcPar.DisposeOf;
    MonitorMsgProcess(LcStrJson,LcMsg,indice);
    FSessaoCritica.Leave;
  End;
end;

procedure TDownTables.Getsalesman;
Var
  LcPar : TPrmSalesMan;
  LcStrJSon : String;
  indice : Integer;
  LcMsg : String;
begin
  TRy
    FSessaoCritica.Enter;
    indice := 16;

    LcPar := TPrmSalesMan.Create;
    LcPar.Vendedor.Estabelecimento   := UMM.GInstitution.Registro.Codigo;
    LcPar.Vendedor.Codigo            := GbSalesMan;
    LcPar.Usuario                    := GbUser;
    LcPar.UltimaAtualizacao := FCtrlSync[indice].UltimaAtualizacao;
    LcStrJSon := TJson.ObjectToJsonString(LcPar);
    Try
      LcStrJson := FDataCM.SMSalesManClient.getSalesman(LcStrJSon);
      LcMsg  := 'Dados do Vendedor Baixados.';
    Except
      on E: Exception do
      Begin
        LcMsg := 'Erro ao baixar Vendedores';
        GeralogCrashlytics(LcMsg,E.Message);
        updateMsgProcess('',concat(LcMsg,E.Message),indice);
      End;
    End;
  Finally
    //LcPar.DisposeOf;
    MonitorMsgProcess(LcStrJson,LcMsg,indice);
    FSessaoCritica.Leave;
  End;
end;

procedure TDownTables.GetState;
Var
  LcPar : TPrmState;
  LcStrJSon : String;
  indice : Integer;
  LcMsg : String;
begin
  Try
    FSessaoCritica.Enter;
    indice := 1;
    //PArametros da Consulta
    LcPar := TPrmState.Create;
    LcPar.Usuario := GbUser;
    LcPar.Vendedor := GbSalesMan;
    LcPar.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    LcPar.UltimaAtualizacao := FCtrlSync[indice].UltimaAtualizacao;
    LcStrJSon := TJson.ObjectToJsonString(LcPar);
    Try
      LcStrJson := FDataCM.SMStateClient.getSyncronize(LcStrJSon);
      LcMsg  := 'Dados de Estado Baixados.';
    Except
      on E: Exception do
      Begin
        LcMsg := 'Erro ao baixar Estados';
        GeralogCrashlytics(LcMsg,E.Message);
        updateMsgProcess('',concat(LcMsg,E.Message),indice);
      End;
    End;
  Finally
    //LcPar.DisposeOf;
    MonitorMsgProcess(LcStrJson,LcMsg,indice);
    FSessaoCritica.Leave;
  End;
end;

procedure TDownTables.GetStock;
Var
  LcPar : TPrmStock;
  LcStrJSon : String;
  indice : Integer;
  LcMsg : String;
begin
  try
    FSessaoCritica.Enter;
    indice := 10;

    //PArametros da Consulta
    LcPar := TPrmStock.Create;
    LcPar.Usuario := GbUser;
    LcPar.Estoque.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    LcPar.UltimaAtualizacao := FCtrlSync[indice].UltimaAtualizacao;
    LcStrJSon := TJson.ObjectToJsonString(LcPar);
    Try
      LcStrJson := FDataCM.SMStockClient.getSyncronize(LcStrJSon);
      LcMsg  := 'Dados do Estoque Baixados.';
    Except
      on E: Exception do
      Begin
        LcMsg := 'Erro ao baixar Estoques';
        GeralogCrashlytics(LcMsg,E.Message);
        updateMsgProcess('',concat(LcMsg,E.Message),indice);
      End;
    End;
  finally
    //LcPar.DisposeOf;
    MonitorMsgProcess(LcStrJson,LcMsg,indice);
    FSessaoCritica.Leave;
  end;
end;

procedure TDownTables.GetStockBalance;
Var
  LcPar : TPrmStockBalance;
  LcStrJSon : String;
  indice : Integer;
  LcMsg : String;

begin
  indice := 14;
  if FCtrlSync[indice].Baixado = 'N' then
  Begin

    Try
      FSessaoCritica.Enter;
      //PArametros da Consulta
      LcPar := TPrmStockBalance.Create;
      LcPar.Estabelecimento := UMM.GInstitution.Registro.Codigo;
      LcPar.Usuario := GbUser;
      LcPar.Vendedor := GbSalesMan; //Enviar para verificar qual estoque devera retornar
      LcPar.UltimaAtualizacao := FCtrlSync[indice].UltimaAtualizacao;
      LcStrJSon := TJson.ObjectToJsonString(LcPar);
      Try
        LcStrJson := FDataCM.SMStockBalanceClient.getSyncronize(LcStrJSon);
        LcMsg  := 'Dados de Saldo de Estoque Baixados.';
      Except
        on E: Exception do
        Begin
          LcMsg := 'Erro ao baixar Saldos de Estoque';
          GeralogCrashlytics(LcMsg,E.Message);
          updateMsgProcess('',concat(LcMsg,E.Message),indice);
        End;
      End;
    Finally
      //LcPar.DisposeOf;
      MonitorMsgProcess(LcStrJson,LcMsg,indice);
      FSessaoCritica.Leave;
    End;
  End;
end;

procedure TDownTables.GetStockStatement;
Var
  LcPar : TPrmStockStatement;
  LcStrJSon : String;
  indice : Integer;
  LcMsg : String;

begin
  indice := 22;
  if FCtrlSync[indice].Baixado = 'N' then
  Begin
    Try
      FSessaoCritica.Enter;
      //PArametros da Consulta
      LcPar := TPrmStockStatement.Create;
      LcPar.Movimento.Estabelecimento := UMM.GInstitution.Registro.Codigo;
      LcPar.Movimento.Terminal := GbTerminal;//Enviar para não receber as atualizaççoes do próprio dispositivo
      LcPar.Usuario := GbUser;
      LcPar.Vendedor := GbSalesMan; //Enviar para verificar qual estoque devera retornar
      LcPar.UltimaAtualizacao := FCtrlSync[indice].UltimaAtualizacao;
      LcStrJSon := TJson.ObjectToJsonString(LcPar);
      Try
        LcStrJson := FDataCM.SMStockStatementClient.getSyncronize(LcStrJSon);
        LcMsg  := 'Dados de Saldo de Estoque Baixados.';
      Except
        on E: Exception do
        Begin
          LcMsg := 'Erro ao baixar Saldos de Estoque';
          GeralogCrashlytics(LcMsg,E.Message);
          updateMsgProcess('',concat(LcMsg,E.Message),indice);
        End;
      End;
    Finally
      //LcPar.DisposeOf;
      MonitorMsgProcess(LcStrJson,LcMsg,indice);
      FSessaoCritica.Leave;
    End;
  End;
end;

procedure TDownTables.GetStockList;
Var
  LcPar : TPrmStockList;
  LcStrJSon : String;

  indice : Integer;
  LcMsg : String;
begin
  try
    FSessaoCritica.Enter;
    indice := 13;

    LcPar := TPrmStockList.Create;
    LcPar.Tabela.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    LcPar.UltimaAtualizacao := FCtrlSync[indice].UltimaAtualizacao;
    LcStrJSon := TJson.ObjectToJsonString(LcPar);

    Try
      LcStrJson := FDataCM.SMStockListClient.getSyncronize(LcStrJSon);
      LcMsg  := 'Dados da Tabela de Estoque Baixados.';
    Except
      on E: Exception do
      Begin
        LcMsg := 'Erro ao baixar Dados de Estoque';
        GeralogCrashlytics(LcMsg,E.Message);
        updateMsgProcess('',concat(LcMsg,E.Message),indice);
      End;
    End;
  finally
    //LcPar.DisposeOf;
    MonitorMsgProcess(LcStrJson,LcMsg,indice);
    FSessaoCritica.Leave;
  end;
end;

procedure TDownTables.GetStockSalesman;
Var
  LcPar : TPrmStockList;
  LcStrJSon : String;
  indice : Integer;
  LcMsg : String;
begin
  indice := 18;
  if FCtrlSync[indice].Baixado = 'N' then
  Begin
    Try
      FSessaoCritica.Enter;
      //PArametros da Consulta
      LcPar := TPrmStockList.Create;
      LcPar.Usuario := GbUser;
      LcPar.Vendedor := GbSalesMan;
      LcPar.Tabela.Estabelecimento := UMM.GInstitution.Registro.Codigo;
      LcPar.UltimaAtualizacao := FCtrlSync[indice].UltimaAtualizacao;
      LcStrJSon := TJson.ObjectToJsonString(LcPar);
      Try
        LcStrJson := FDataCM.SMStockListClient.getSalesmanStock(LcStrJSon);
        LcMsg  := 'Dados do Estoque Vendedor Baixados.';
      Except
        on E: Exception do
        Begin
          LcMsg := 'Erro ao baixar Estoque Vendedor';
          GeralogCrashlytics(LcMsg,E.Message);
          updateMsgProcess('',concat(LcMsg,E.Message),indice);
        End;
      End;
    Finally
      //LcPar.DisposeOf;
      MonitorMsgProcess(LcStrJson,LcMsg,indice);
      FSessaoCritica.Leave;
    End;
  End;
end;

procedure TDownTables.MonitorMsgProcess(pJson,msg: String; Index: Integer);
var
  LcMsg : String;
begin
  try
    if (pjson <> '') then
    Begin
      FCtrlSync[Index].JSon := pJson;
      FCtrlSync[Index].Baixado := 'S';
    End
    else
    Begin
      FCtrlSync[Index].Baixado := 'S';
      FCtrlSync[Index].Atualizado := 'S';
      msg := 'Erro ao trazer o json';
    End;
    updateMsgProcess(msg,msg,Index);
  Except
    on E: Exception do
    Begin
      LcMsg := concat('Erro no indice: ', Index.ToString);
      Geraloglocal(LcMsg,E.Message);
    End;
  end;
end;

procedure TDownTables.objCustomerHandler(Lista: TListCustomer; indice: Integer);
Var
  ListaObjCustomer : TListObjCustomer;
  I:Integer;
  LcMsg, LcDefmsg:String;
  LcObj : TCtrlMobCustomer;
  ObjCustomer:TObjCustomer;
  LcObjFiscal: TObjEntityFiscal;
  LcParEntity : TPrmEntity;
  LcStrJSon : String;
begin
  Try
    ListaObjCustomer := TListObjCustomer.Create;
    ListaObjCustomer.Clear;
    LcObj := TCtrlMobCustomer.Create(self);
    LcDefmsg := 'Baixando dados de Cliente';
    LcMsg := LcDefmsg;
    if Lista.Count > 0 then
    Begin
      for I := 0 to ( Lista.Count - 1) do
      Begin
        if (Lista[I] <> nil) then
        Begin
          ObjCustomer := TObjCustomer.Create;
          LcObj.assign(Lista[I], ObjCustomer.Cliente);
          if ( ObjCustomer.Cliente.Vendedor = GbSalesMan ) then
          Begin
            GetobjCustomer(ObjCustomer);
            ObjCustomer.Estabelecimento := UMM.GInstitution.Registro.Codigo;
            ListaObjCustomer.Add(ObjCustomer);
          End;
          LcMsg := Concat(LcDefmsg,' : ',
                    IntToStr(Lista.Count),'/',
                    IntToStr(I + 1)
          );
        End;
        updateMsgProcess(LcMsg,LcMsg,Indice);
      End;
      LcStrJson := TJson.ObjectToJsonString( ListaObjCustomer ) ;
    End
    else
    Begin
      LcStrJson := '';
    End;
  Finally
    MonitorMsgProcess(LcStrJson,LcMsg,indice);
  End;
end;

procedure TDownTables.SendFinancial;
begin
  //indice := 23;
end;

procedure TDownTables.SendKickback;
begin
  //indice := 24;
end;

procedure TDownTables.SendObjOrderConsignment;
begin
  //indice := 20;
end;

procedure TDownTables.SendObjOrderSale;
begin
  //indice := 19;
end;

procedure TDownTables.SendSTockStatement;
begin
  //indice := 21;
end;

procedure TDownTables.setFDataCM(const Value: TDataCM);
begin
  FDataCM := Value;
end;

procedure TDownTables.setFFCtrlSync(const Value: TObjListCtrlSync);
begin
  FCtrlSync := Value;
end;

procedure TDownTables.setFFSessaoCritica(const Value: TCriticalSection);
begin
  FSessaoCritica := Value;
end;

procedure TDownTables.setFProcLog(const Value: TListBox);
begin
  FProcLog := Value;
end;

procedure TDownTables.setFProcMsg(const Value: TLabel);
begin
  FProcMsg := Value;
end;

function TDownTables.setLastUpdate(DescTable, Sentido: String; Reg: Integer;
  LastUpdate: TDateTime): Boolean;
begin
  TRy
    REsult := True;
    if Reg > 0 then
    Begin
      FSync.Registro.Codigo      :=  DescTable;
      FSync.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
      FSync.Registro.Direcao     := Sentido;
      FSync.Registro.Atualizacao := LastUpdate +  StrToTime('00:00:01');
      FSync.save;
    End;
  Except
    on E: Exception do
      GeralogCrashlytics('setLastUpdate - ',e.Message);
  End;
end;

procedure TDownTables.updateMsgProcess(shortmsg, lineMsg: String;
  msgIndex: Integer);
Begin
  TThread.Queue(nil,
    procedure
    var
      Item: TListBoxItem;
    Begin
      try
        Item := FProcLog.ItemByIndex(msgIndex);
        Item.StyledSettings := [TStyledSetting.FontColor];
        Item.TextSettings.FontColor := claRed;
        Item.Text := lineMsg;
        FProcMsg.Text := shortmsg;
      except
        on E: Exception do
        BEgin
          ShowMessage( concat('Indice: ',msgIndex.ToString,' - ',e.Message) );
        End;
      end;
    end
  );
end;


end.


