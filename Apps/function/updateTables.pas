unit UpdateTables;

interface

uses   System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
      System.Threading,
      synacode,
     CtrlSync, uDataCM, FMX.StdCtrls, FMX.ListBox, ctrl_mob_sync_data,
    System.SyncObjs,zLib,
    REST.Json,System.Json, TypesObjectsCollection,
  ctrl_mob_company, ctrl_mob_country, ctrl_mob_customer, ctrl_mob_entity,
  ctrl_mob_financial_bills, ctrl_mob_mailing, ctrl_mob_merchandise, ctrl_mob_order,
  ctrl_mob_order_item, ctrl_mob_order_sale, ctrl_mob_payment_type,
  ctrl_mob_person, ctrl_mob_phone, ctrl_mob_price, ctrl_mob_price_list,
  ctrl_mob_product, ctrl_mob_state, ctrl_mob_stock, ctrl_mob_stock_balance,
  ctrl_mob_stock_list, UnFunctions,TypesCollection, ctrl_mob_brand, tblBrand,
  ctrl_mob_category, ctrl_mob_city, ctrl_mob_measure,ctrl_mob_order_consignment,
  ctrl_mob_stock_statement,ctrl_mob_financial_statement,

  objCustomer, ctrl_mob_package, ctrl_mob_salesman, ctrl_mob_salesman_has_stock,
  objSalesMan,objOrderConsignment,

  tblCity, tblCountry, tblState, tblsalesman,tblCustomer,tblFinancialBills,
  tblCategory,tblproduct,tblmerchandise,tblOrderSale,tblOrderConsignment,
  tblmeasure,tblstock,tblstockbalance,tblpackage,tblPriceList,tblPrice,tblStockList,
  tblSalesmanHasStock,tblStockStatement,
  tblpaymentTypes, FMX.Types, System.UIConsts, MainModule, ctrl_mob_kickback;
type

  TUpdateTables = Class(TThread)
  private
    FCtrlSync : TObjListCtrlSync;
    FDataCM   : TDataCM;
    FProcMsg  : TLabel;
    FProcLog  : TListBox;
    FSync     : TCtrlMobSyncData;
    FSessaoCritica : TCriticalSection;
    procedure UpdateCountry;
    procedure UpdateState;
    procedure UpdateCity;
    procedure UpdateCategory;
    procedure UpdateProduct;
    procedure UpdateBrand;
    procedure UpdateMerchandise;
    procedure UpdatePackage;
    procedure UpdateMeasure;
    procedure UpdateColor;
    procedure UpdateStock;
    procedure UpdatePriceList;
    procedure UpdatePrice;
    procedure UpdateStockList;
    procedure UpdateStockBalance;
    procedure UpdatePaymentTypes;
    procedure UpdateSalesman;
    procedure UpdateObjCustomer;
    procedure UpdateStockSalesman;
    procedure SendObjOrderSale;
    procedure SendObjOrderConsignment;
    procedure SendStockStatement;
    procedure UpdateStockStatement;
    procedure SendFinancialBills;
    procedure SendKickback;
    procedure UpdateRestoreOrderSale;
    procedure UpdateRestoreOrderConsignament;
    procedure UpdateRestoreFinancialBills;
    procedure UpdateRestoreKickback;
    procedure UpdateRestoreStockStatement;

    function setLastUpdate(DescTable, Sentido: String; Reg: Integer;LastUpdate: TDateTime): Boolean;
    procedure updateMsgProcess(shortmsg,lineMsg:String;msgIndex:Integer);
    procedure UpdateTable(Indice:Integer);
  public
    constructor Create(ACtrlSync:TObjListCtrlSync;
                      ADataCM:TDataCM;
                       AProcMsg:TLabel;
                       AProcLog:TListBox);
    destructor Destroy; override;
    procedure Execute; override;
  End;

implementation

{ TUpdateTables }


constructor TUpdateTables.Create(ACtrlSync:TObjListCtrlSync;
                                  ADataCM:TDataCM;
                                 AProcMsg:TLabel;
                                 AProcLog:TListBox);
begin
  FreeOnTerminate := false;
  FSessaoCritica :=  TCriticalSection.create;
  FCtrlSync := ACtrlSync;
  FDataCM   := ADataCM;
  FProcMsg  := AProcMsg;
  FProcLog  := AProcLog;
  FSync     := TCtrlMobSyncData.Create(nil);
  inherited Create(True);
end;

destructor TUpdateTables.Destroy;
begin
  //FSync.DisposeOf;
  //FSessaoCritica.DisposeOf;
  //nherited; //comentado pois na finalização está trvando
end;

procedure TUpdateTables.Execute;
Var
  I : Integer;
  Contador : Integer;
  LcExecucao : Boolean;
  LcExecutar : Integer;
begin
  while not Terminated do
  begin
    //Verifica se tem alguma em execução
    LcExecucao := False;
    for I := 0 to FCtrlSync.Count -1 do
    Begin
      if FCtrlSync[I].Execucao then
      Begin
        LcExecucao := TRue;
        break;
      End;
    End;

    if not LcExecucao then
    Begin
      //Verifica se alguam thread terminou de baixar para atualizar;
      LcExecutar := -1;
      for I := 0 to FCtrlSync.Count -1 do
      Begin
        if (FCtrlSync[I].Baixado = 'S') and (FCtrlSync[I].Atualizado = 'N') then
        BEgin
          LcExecutar := I;
          break;
        End;
      end;
      if LcExecutar >= 0 then
      Begin
        Try
          FSessaoCritica.Enter;
          FCtrlSync[LcExecutar].Execucao := True;
          updateTable(LcExecutar);
          FCtrlSync[LcExecutar].Execucao := False;
          FSessaoCritica.Leave;
        except
          on E: Exception do
            updateMsgProcess('Erro',E.message,0);
        End;
      End;
    end;
    //Verifica se todas as threads foram atualizadas
    Contador:=0;
    for I := 0 to FCtrlSync.Count -1 do
    Begin
      if (FCtrlSync[I].Atualizado = 'S') then
        inc(Contador);
    End;
    //Só marca como finalizada quando todas as Threas estiverem atualizadas
    if (contador = FCtrlSync.Count) then
      Terminate;
    //Sleep(3000);
  end;
end;


procedure TUpdateTables.UpdateTable(Indice: Integer);
begin
  case Indice of
    0:UpdateCountry;
    1:UpdateState;
    2:UpdateCity;
    3:UpdateCategory;
    4:UpdateProduct;
    5:UpdateBrand;
    6:UpdateMerchandise;
    7:UpdatePackage;
    8:UpdateMeasure;
    9:UpdateColor;
    10:UpdateStock;
    11:UpdatePriceList;
    12:UpdatePrice;
    13:UpdateStockList;
    14:UpdateStockBalance;
    15:UpdatePaymentTypes;
    16:UpdateSalesman;
    17:UpdateObjCustomer;
    18:UpdateStockSalesman;
    19:SendObjOrderSale;
    20:SendObjOrderConsignment;
    21:SendSTockStatement;
    22:UpdateStockStatement;
    23:SendFinancialBills;
    24:SendKickback;
    25:UpdateRestoreOrderSale;
    26:UpdateRestoreOrderConsignament;
    27:UpdateRestoreFinancialBills;
    28:UpdateRestoreKickback;
    29:UpdateRestoreStockStatement;
  end;
end;


function TUpdateTables.setLastUpdate(DescTable, Sentido: String; Reg: Integer;
  LastUpdate: TDateTime): Boolean;
begin
  TRy
    REsult := True;
    if Reg > 0 then
    Begin
      FSync.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
      FSync.Registro.Codigo      :=  DescTable;
      FSync.Registro.Direcao     := Sentido;
      FSync.Registro.Atualizacao := LastUpdate +  StrToTime('00:00:01');
      FSync.save;
    End;
  Except
    on E: Exception do
      GeralogCrashlytics('setLastUpdate - ',e.Message);
  End;
end;

procedure TUpdateTables.SendObjOrderConsignment;
var
  LcObj : TCtrlMobOrderConsignment;
  LcStrJSon : String;
  I : Integer;
  LcMsg : String;
  LcDefmsg : String;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  LcLastCodigo : Integer;
  LcIndice : Integer;
begin
  TRy
    LcIndice := 20;
    LcMsg := 'Montando lista para enviar consignação';
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    LcObj := TCtrlMobOrderConsignment.Create(nil);
    LcStrDateTime := FCtrlSync[LcIndice].UltimaAtualizacao;
    LcObj.Parametro.UltimaAtualizacao := LcStrDateTime;
    LcObj.orderby := 'updated_at';
    LcObj.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    LcObj.getList;
    I := 0;
    LcLasUpdate := 0;
    LcMsg := 'Enviando Consignações';
    LcDefmsg := LcMsg;
    for I := 0 to LcObj.Lista.Count - 1 do
    Begin
      Try
        //Objeto Novo
        LcObj.FillDataObjeto( LcObj.Lista[I]);
        LcObj.Obj.Estabelecimento := UMM.GInstitution.Registro.Codigo;
        try
          LcStrJSon := ZCompressString ( TJson.ObjectToJsonString(LcObj.Obj),zcDefault );
          LcStrJSon := FDataCM.SMOrderConsignmentClient.save(LcStrJSon);
        Except
          on E: Exception do
          Begin
            GeralogCrashlytics('SendObjOrderConsignment',e.Message);
            Break;
          End;
        end;
        LcLasUpdate := LcObj.Lista[I].RegistroAlterado;
        LcLastCodigo := LcObj.Lista[I].Codigo;
        LcMsg := Concat(LcDefmsg,' : ',
                  IntToStr(LcObj.Lista.Count),'/',
                  IntToStr(I + 1)
        );
        updateMsgProcess(LcMsg,LcMsg,LcIndice);
      Except
        on E: Exception do
        Begin
          LcMsg := concat('Erro ao enviar o Consignment : ',LcObj.Lista[I].Codigo.ToString);
          GeralogCrashlytics(LcMsg,e.Message);
        End;
      End;
    End;
    LcMsg := concat(LcDefmsg,' - Concluído');
  finally
    if LcLasUpdate > 0 then
    Begin
      setLastUpdate(FCtrlSync[LcIndice].Name,'S', LcLastCodigo,LcLasUpdate);
      setLastUpdate(FCtrlSync[LcIndice].Name,'E', LcLastCodigo,LcLasUpdate);
    End;
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    FCtrlSync[LcIndice].Baixado := 'S';
    FCtrlSync[LcIndice].Atualizado := 'S';
  end;

end;

procedure TUpdateTables.SendObjOrderSale;
var
  LcObj : TCtrlMobOrderSale;
  LcStrJSon : String;
  I : Integer;
  LcMsg : String;
  LcDefmsg : String;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  LcIndice : Integer;
  LcLastCodigo : Integer;
begin
  TRy
    LcIndice := 19;
    LcMsg := 'Montando lista para enviar pedidos';
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    LcObj := TCtrlMobOrderSale.Create(nil);
    LcStrDateTime := FCtrlSync[LcIndice].UltimaAtualizacao;
    LcObj.Parametro.UltimaAtualizacao := LcStrDateTime;
    LcObj.orderby := 'updated_at';
    LcObj.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    LcObj.getList;
    I := 0;
    LcLasUpdate := 0;
    LcMsg := 'Enviando Pedidos';
    LcDefmsg := LcMsg;
    for I := 0 to LcObj.Lista.Count - 1 do
    Begin
      Try
        //Objeto Novo
        LcObj.FillDataObjeto( LcObj.Lista[I],LcObj.Obj);
        LcObj.Obj.Estabelecimento := UMM.GInstitution.Registro.Codigo;
        try
          LcStrJSon := TJson.ObjectToJsonString(LcObj.Obj);
          LcStrJSon := EncodeBase64(LcStrJSon);
          LcStrJSon := FDataCM.SMOrderSaleClient.save(LcStrJSon);
        Except
          on E: Exception do
          Begin
            GeralogCrashlytics('SendObjOrderSale - ',e.Message);
            Break;
          End;
        end;
        LcLasUpdate := LcObj.Lista[I].RegistroAlterado;
        LcLastCodigo := LcObj.Lista[I].Codigo;
        LcMsg := Concat(LcDefmsg,' : ',
                  IntToStr(LcObj.Lista.Count),'/',
                  IntToStr(I + 1)
        );
        updateMsgProcess(LcMsg,LcMsg,LcIndice);
      Except
        on E: Exception do
        Begin
          LcMsg := concat('Erro ao enviar o Pedido : ', LcObj.Lista[I].Numero.ToString);
          GeralogCrashlytics(LcMsg,e.Message);
        End;
      End;
    End;
    LcMsg := concat(LcDefmsg,' - Concluído');
  finally
    if LcLasUpdate > 0 then
      setLastUpdate(FCtrlSync[LcIndice].Name,'S', LcLastCodigo,LcLasUpdate);
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    FCtrlSync[LcIndice].Baixado := 'S';
    FCtrlSync[LcIndice].Atualizado := 'S';
  end;
end;

procedure TUpdateTables.SendStockStatement;
var
  LcObj : TCtrlMobStockStatement;
  LcStrJSon : String;
  I : Integer;
  LcMsg : String;
  LcDefmsg : String;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  LcLastCodigo : Integer;
  LcIndice : Integer;

begin
  TRy
    LcIndice := 21;
    LcMsg := 'Montando lista para enviar Movimento do Estoque';
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    LcObj := TCtrlMobStockStatement.Create(nil);
    LcStrDateTime := FCtrlSync[LcIndice].UltimaAtualizacao;
    LcObj.Parametro.UltimaAtualizacao := LcStrDateTime;
    LcObj.orderby := 'updated_at';
    LcObj.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    LcObj.getList;
    LcLasUpdate := 0;
    LcMsg := 'Enviando Movimento de Estoque.';
    LcDefmsg := LcMsg;
    for I := 0 to LcObj.Lista.Count - 1 do
    Begin
      Try
        try
          LcStrJSon := ZCompressString (TJson.ObjectToJsonString( LcObj.Lista[I]),zcDefault );
          LcStrJSon := FDataCM.SMStockStatementClient.save(LcStrJSon);
        Except
          on E: Exception do
          Begin
            GeralogCrashlytics('TUpdateTables.SendStockStatement - ',e.Message);
            Break;
          End;
        end;
        LcLasUpdate   := LcObj.Lista[I].RegistroAlterado;
        LcLastCodigo := LcObj.Lista[I].Codigo;
        LcMsg := Concat(LcDefmsg,' : ',
                  IntToStr(LcObj.Lista.Count),'/',
                  IntToStr(I + 1)
        );
        updateMsgProcess(LcMsg,LcMsg,LcIndice);
      Except
        on E: Exception do
        Begin
          LcMsg := concat('Erro ao enviar Movimento Estoque : ',LcObj.Lista[I].OrdemItem.ToString);
          GeralogCrashlytics(LcMsg,e.Message);
        End;
      End;
    End;
    LcMsg := concat(LcDefmsg,' - Concluído');
  finally
    if LcLasUpdate > 0 then
    Begin
      setLastUpdate(FCtrlSync[LcIndice].Name,'S', LcLastCodigo,LcLasUpdate);
    End;
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    FCtrlSync[LcIndice].Atualizado  := 'S';
    FCtrlSync[LcIndice].Baixado     := 'S';
  end;
end;

procedure TUpdateTables.UpdateBrand;
var
  LcObj : TCtrlMobBrand;
  LcLista : TListBrand;
  I : Integer;
  LcMsg : String;
  LcDefmsg : String;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  LcIndice : Integer;
begin
  try
    LcIndice := 5;
    LcObj := TCtrlMobBrand.Create(nil);
    LcMsg := 'Preparando Atualização Marcas';
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    LcLista := TJson.JsonToObject<TListBrand>( ZDecompressString ( FCtrlSync[LcIndice].JSon ) );
    LcDefmsg := 'Atualização Marcas';
    LcMsg := LcDefmsg;
    LcLasUpdate := 0;
    if LcLista.Count > 0 then
    Begin
      Try;
        for I := 0 to ( LcLista.Count - 1) do
        Begin
          if (LcLista[I] <> nil) then
          Begin
            Try
              LcObj.Assign(LcLista[I]);
              LcStrDateTime := formatdatetime('yyyy-mm-dd hh:nn:ss', LcObj.Registro.RegistroAlterado);
              LcLasUpdate := StrToDateTimeDef( LcStrDateTime , Now );
              LcObj.save;
              LcMsg := Concat(LcDefmsg,' : ',
                        IntToStr( LcLista.Count),'/',
                        IntToStr(I + 1)
              );
              updateMsgProcess(LcMsg,LcMsg,LcIndice);
            Except
              on E: Exception do
              Begin
                LcMsg := Concat(LcDefmsg,' - ',e.Message);
                GeralogCrashlytics(Concat(LcDefmsg,' - '),e.Message);
              End;
            End;
          End;
        End;
      Except
        on E: Exception do
          GeralogCrashlytics('TUpdateTables.UpdateBrand - ',e.Message);
      End;
    end;
    LcMsg := concat(LcDefmsg,' - Concluído');
  finally
    if LcLasUpdate > 0 then
      setLastUpdate(FCtrlSync[LcIndice].Name,'E',I,LcLasUpdate);
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    FCtrlSync[LcIndice].Atualizado := 'S';
    //LcObj.DisposeOf;
    //LcLista.DisposeOf;
  end;
end;


procedure TUpdateTables.SendFinancialBills;
var
  LcObj : TCtrlMobFinancialBills;
  LcStrJSon : String;
  I : Integer;
  LcMsg : String;
  LcDefmsg : String;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  LcLasCodigo : Integer;
  LcIndice : Integer;
begin
  TRy
    LcIndice := 23;
    LcMsg := 'Montando lista para enviar o financeiro';
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    LcObj := TCtrlMobFinancialBills.Create(nil);
    LcStrDateTime := FCtrlSync[LcIndice].UltimaAtualizacao;
    LcObj.Parametro.UltimaAtualizacao := LcStrDateTime;
    LcObj.orderby := 'updated_at';
    LcObj.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    LcObj.getList;
    LcLasUpdate := 0;
    LcMsg := 'Enviando Financeiro.';
    LcDefmsg := LcMsg;
    for I := 0 to LcObj.Lista.Count - 1 do
    Begin
      Try
        try
          LcObj.FillDataObjeto(LcObj.Lista[I]);
          LcStrJSon := ZCompressString (TJson.ObjectToJsonString( LcObj.Obj ),zcDefault );
          LcStrJSon := FDataCM.SMFinancialBillsClient.save(LcStrJSon);
        Except
          on E: Exception do
          Begin
            GeralogCrashlytics('TUpdateTables.SendFinancialBills - ',e.Message);
            Break;
          End;
        end;
        LcLasUpdate := LcObj.Lista[I].RegistroAlterado;
        LcLasCodigo := LcObj.Lista[I].Ordem;
        LcMsg := Concat(LcDefmsg,' : ',
                  IntToStr(LcObj.Lista.Count),'/',
                  IntToStr(I + 1)
        );
        updateMsgProcess(LcMsg,LcMsg,LcIndice);
      Except
        on E: Exception do
        Begin
          LcMsg := concat('Erro ao enviar Financeiro : ',LcObj.Lista[I].Ordem.ToString);
          GeralogCrashlytics(LcMsg,e.Message);
        End;
      End;
    End;
    LcMsg := concat(LcDefmsg,' - Concluído');
  finally
    if LcLasUpdate > 0 then
    Begin
      setLastUpdate(FCtrlSync[LcIndice].Name,'S', LcLasCodigo,LcLasUpdate);
      setLastUpdate(FCtrlSync[LcIndice].Name,'E', LcLasCodigo,LcLasUpdate);
    End;
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    FCtrlSync[LcIndice].Atualizado := 'S';
    FCtrlSync[LcIndice].Baixado    := 'S';
  end;

end;

procedure TUpdateTables.SendKickback;
var
  LcObj : TCtrlMobKickback;
  LcStrJSon : String;
  I : Integer;
  LcMsg : String;
  LcDefmsg : String;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  LcLasCodigo : Integer;
  LcIndice : Integer;
begin
  TRy
    LcIndice := 24;
    LcMsg := 'Montando lista para enviar a Comissão.';
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    LcObj := TCtrlMobKickBack.Create(nil);
    LcStrDateTime := FCtrlSync[LcIndice].UltimaAtualizacao;
    LcObj.Parametro.UltimaAtualizacao := LcStrDateTime;
    LcObj.orderby := 'updated_at';
    LcObj.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    LcObj.getList;

    LcLasUpdate := 0;
    LcMsg := 'Enviando Comissões.';
    LcDefmsg := LcMsg;
    for I := 0 to LcObj.Lista.Count - 1 do
    Begin
      Try
        try
          LcObj.FillDataObjeto(LcObj.Lista[I]);
          LcStrJSon := ZCompressString (TJson.ObjectToJsonString( LcObj.Obj ),zcDefault );
          LcStrJSon := FDataCM.SMKickbackClient.save(LcStrJSon);
        Except
          on E: Exception do
          Begin
            GeralogCrashlytics('TUpdateTables.SendKickback - ',e.Message);
            Break;
          End;
        end;
        LcLasUpdate := LcObj.Lista[I].RegistroAlterado;
        LcLasCodigo :=  LcObj.Lista[I].Ordem;
        LcMsg := Concat(LcDefmsg,' : ',
                  IntToStr(LcObj.Lista.Count),'/',
                  IntToStr(I + 1)
        );
        updateMsgProcess(LcMsg,LcMsg,LcIndice);
      Except
        on E: Exception do
        Begin
          LcMsg := concat('Erro ao enviar Comissão : ',LcObj.Lista[I].Ordem.ToString);
          GeralogCrashlytics(LcMsg,e.Message);
        End;
      End;
    End;
    LcMsg := concat(LcDefmsg,' - Concluído');
  finally
    if LcLasUpdate > 0 then
      setLastUpdate(FCtrlSync[LcIndice].Name,'S', LcLasCodigo,LcLasUpdate);
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    FCtrlSync[LcIndice].Baixado := 'S';
    FCtrlSync[LcIndice].Atualizado := 'S';
  end;
end;

procedure TUpdateTables.UpdateCategory;
var
  LcObj : TCtrlMobCategory;
  LcLista: TListCategory;
  I : Integer;
  LcMsg : String;
  LcDefmsg : String;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  LcIndice : Integer;
begin
  try
    LcIndice := 3;
    LcObj := TCtrlMobCategory.Create(nil);
    LcMsg := 'Preparando Atualização Categorias';
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    LcLista := TJson.JsonToObject<TListCategory>( ZDecompressString ( FCtrlSync[LcIndice].JSon ) );
    LcDefmsg := 'Atualização Categorias';
    LcMsg := LcDefmsg;
    LcLasUpdate := 0;
    if LcLista.Count > 0 then
    Begin
      Try
        for I := 0 to ( LcLista.Count - 1) do
        Begin
          if (LcLista[I] <> nil) then
          Begin
            Try
              LcObj.assign(LcLista[I]);
              LcStrDateTime := formatdatetime('yyyy-mm-dd hh:nn:ss', LcObj.Registro.RegistroAlterado);
              LcLasUpdate := StrToDateTimeDef( LcStrDateTime , Now );
              LcObj.save;
              LcMsg := Concat(LcDefmsg,' : ',
                        IntToStr(LcLista.Count),'/',
                        IntToStr(I + 1)
              );
              updateMsgProcess(LcMsg,LcMsg,LcIndice);
            Except
              on E: Exception do
              Begin
                LcMsg := Concat(LcDefmsg,' - ',e.Message);
                GeralogCrashlytics(Concat(LcDefmsg,' - '),e.Message);
              End;
            End;
          End;
        End;
      Except
        on E: Exception do
          GeralogCrashlytics('TUpdateTables.UpdateCategory - ',e.Message);
      End;
    End;
    LcMsg := concat(LcDefmsg,' - Concluído');
  finally
    if LcLasUpdate > 0 then
      setLastUpdate(FCtrlSync[LcIndice].Name,'E',I,LcLasUpdate);
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    FCtrlSync[LcIndice].Atualizado := 'S';
    //LcObj.DisposeOf;
    //LcLista.DisposeOf;
  end;
end;

procedure TUpdateTables.UpdateCity;
var
  LcObj : TCtrlMobCity;
  LcLista : TListCity;
  I : Integer;
  LcMsg : String;
  LcDefmsg : String;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  LcIndice : Integer;
begin
  try
    LcIndice := 2;
    LcObj := TCtrlMobCity.Create(nil);
    LcMsg := 'Preparando Atualização Cidades';
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    LcLista := TJson.JsonToObject<TListCity>( ZDecompressString ( FCtrlSync[LcIndice].JSon ) );
    LcDefmsg := 'Atualização Cidades';
    LcMsg := LcDefmsg;
    LcLasUpdate := 0;
    if LcLista.Count > 0 then
    Begin
      Try
        for I := 0 to ( LcLista.Count - 1) do
        Begin
          if (LcLista[I] <> nil) then
          Begin
            Try
              LcObj.assign( LcLista[I]);
              LcObj.save;
              LcLasUpdate := LcObj.Registro.RegistroAlterado;
              LcMsg := Concat(LcDefmsg,' : ',
                        IntToStr(LcLista.Count),'/',
                        IntToStr(I + 1)
              );
              updateMsgProcess(LcMsg,LcMsg,LcIndice);
            Except
              on E: Exception do
              Begin
                LcMsg := Concat(LcDefmsg,' - ',e.Message);
                GeralogCrashlytics(Concat(LcDefmsg,' - '),e.Message);
              End;
            End;
          End;
        End;
      Except
        on E: Exception do
          GeralogCrashlytics('TUpdateTables.UpdateCity - ',e.Message);
      End;
    End;
    LcMsg := concat(LcDefmsg,' - Concluído');
  finally
      if LcLasUpdate > 0 then
        setLastUpdate(FCtrlSync[LcIndice].Name,'E',I,LcLasUpdate);
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    FCtrlSync[LcIndice].Atualizado := 'S';
    //LcObj.DisposeOf;
    //LcLista.DisposeOf;
  end;

end;

procedure TUpdateTables.UpdateColor;
Var
  LcMsg:String;
begin
  LcMsg := 'Atualização Cores - Concluído.';
  FCtrlSync[9].Atualizado := 'S';
  updateMsgProcess(LcMsg,LcMsg,9);
end;

procedure TUpdateTables.UpdateCountry;
var
  LcObj : TCtrlMobCountry;
  LcLista : TListCountry;
  I : Integer;
  LcMsg : String;
  LcDefmsg : String;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  LcIndice : Integer;
begin
  try
    LcIndice := 0;
    LcObj := TCtrlMobCountry.Create(nil);
    LcMsg := 'Preparando Atualização Países';
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    LcLista := TJson.JsonToObject<TListCountry>( ZDecompressString ( FCtrlSync[LcIndice].JSon ) );
    LcDefmsg := 'Atualização Países';
    LcMsg := LcDefmsg;
    LcLasUpdate := 0;
    if LcLista.Count > 0 then
    Begin
      Try
        for I := 0 to ( LcLista.Count - 1) do
        Begin
          if (LcLista[I] <> nil) then
          Begin
            TRy
              LcObj.assign( LcLista[I]);
              LcStrDateTime := formatdatetime('yyyy-mm-dd hh:nn:ss', LcObj.Registro.RegistroAlterado);
              LcLasUpdate := StrToDateTimeDef( LcStrDateTime , Now );
              LcObj.save;
              LcMsg := Concat(LcDefmsg,' : ',
                        IntToStr(LcLista.Count),'/',
                        IntToStr(I + 1)
              );
              updateMsgProcess(LcMsg,LcMsg,LcIndice);
            Except
              on E: Exception do
              Begin
                LcMsg := Concat(LcDefmsg,' - ',e.Message);
                GeralogCrashlytics(Concat(LcDefmsg,' - '),e.Message);
              End;
            End;
          End;
        End;
      Except
        on E: Exception do
          GeralogCrashlytics('TUpdateTables.UpdateCountry - ',e.Message);
      End;

    End;
    LcMsg := concat(LcDefmsg,' - Concluído');
  finally
    if LcLasUpdate > 0 then
      setLastUpdate(FCtrlSync[LcIndice].Name,'E',I,LcLasUpdate);
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    FCtrlSync[LcIndice].Atualizado := 'S';
    //LcObj.DisposeOf;
    //LcLista.DisposeOf;
  end;

end;

procedure TUpdateTables.UpdateRestoreFinancialBills;
var
  LcObj : TCtrlMobFinancialBills;
  LcLista : TListObjFinancialBills;
  I : Integer;
  LcMsg : String;
  LcDefmsg : String;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  LcLastCodigo : Integer;
  LcIndice : Integer;
begin
  LcIndice := 27;
  if FCtrlSync[LcIndice].Atualizado = 'N' then
  Begin
    try
      LcMsg := 'Preparando Atualização do Financeiro';
      LcLasUpdate := 0;
      updateMsgProcess(LcMsg,LcMsg,LcIndice);
      LcDefmsg := 'Atualização Financeiro';
      LcLista := TListObjFinancialBills.Create;
      LcObj := TCtrlMobFinancialBills.Create(nil);
      if ( FCtrlSync[LcIndice].JSon <> '' )  then
      Begin
        LcLista := TJson.JsonToObject<TListObjFinancialBills>( ZDecompressString ( FCtrlSync[LcIndice].JSon ) );
        LcMsg := LcDefmsg;
        if LcLista.Count > 0 then
        Begin
          try
            for I := 0 to ( LcLista.Count - 1) do
            Begin
              if (LcLista[I] <> nil) then
              Begin
                Try
                  LcObj.saveDataObjeto( LcLista[I] );
                  LcStrDateTime := formatdatetime('yyyy-mm-dd hh:nn:ss', LcObj.Registro.RegistroAlterado);
                  LcLasUpdate := StrToDateTimeDef( LcStrDateTime , Now );
                  LcMsg := Concat(LcDefmsg,' : ',
                            IntToStr(LcLista.Count),'/',
                            IntToStr(I + 1)
                  );
                  LcLastCodigo := LcObj.Registro.Ordem;
                  updateMsgProcess(LcMsg,LcMsg,LcIndice);
                Except
                  on E: Exception do
                  Begin
                    LcMsg := Concat(LcDefmsg,' - ',e.Message);
                    GeralogCrashlytics(Concat(LcDefmsg,' - '),e.Message);
                  End;
                End;
              End;
            End;
          Except
            on E: Exception do
              GeralogCrashlytics('UpdateRestoreFinancialBills - ',e.Message);
          End;
        End;
      End;
    finally
      //Registrar como saida para que na proximo sincronia não entre na fila
      if LcLasUpdate > 0 then
        setLastUpdate(FCtrlSync[LcIndice].Name,'S', LcLastCodigo,Now);
      LcMsg := concat(LcDefmsg,' - Concluído');
      updateMsgProcess(LcMsg,LcMsg,LcIndice);
      FCtrlSync[LcIndice].Atualizado := 'S';
    end;
  End;
end;

procedure TUpdateTables.UpdateRestoreKickback;
var
  LcObj : TCtrlMobKickBack;
  LcLista : TListKickback;
  I : Integer;
  LcMsg : String;
  LcDefmsg : String;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  LcLastCodigo : Integer;
  LcIndice : Integer;
begin
  LcIndice := 28;
  if FCtrlSync[LcIndice].Atualizado = 'N' then
  Begin
    try
      LcObj := TCtrlMobKickBack.Create(nil);
      LcMsg := 'Preparando Atualização da Comissão';
      updateMsgProcess(LcMsg,LcMsg,LcIndice);
      LcLista := TJson.JsonToObject<TListKickback>( ZDecompressString ( FCtrlSync[LcIndice].JSon ) );
      LcDefmsg := 'Atualização da Comissão';
      LcMsg := LcDefmsg;
      if LcLista.Count > 0 then
      Begin
        try
          for I := 0 to ( LcLista.Count - 1) do
          Begin
            if (LcLista[I] <> nil) then
            Begin
              Try
                //Verifica se o registro do Stock Balance existe e somente se não existir insere com zero quantity
                LcObj.ClonarObj( LcLista[I], LcObj.Registro );
                LcObj.save;

                LcStrDateTime := formatdatetime('yyyy-mm-dd hh:nn:ss', LcObj.Registro.RegistroAlterado);
                LcMsg := Concat(LcDefmsg,' : ',
                          IntToStr( LcLista.Count),'/',
                          IntToStr(I + 1)
                );
                LcLastCodigo := LcObj.Registro.Ordem;
                updateMsgProcess(LcMsg,LcMsg,LcIndice);
              Except
                on E: Exception do
                Begin
                  LcMsg := Concat(LcDefmsg,' - ',e.Message);
                  GeralogCrashlytics(Concat(LcDefmsg,' - '),e.Message);
                End;
              END;
            End;
          End;
        Except
          on E: Exception do
            GeralogCrashlytics('TUpdateTables.UpdateRestoreKickback - ',e.Message);
        End;
      End;
      LcMsg := concat(LcDefmsg,' - Concluído');
    finally
      //Registrar como saida para que na proximo sincronia não entre na fila
      if LcLasUpdate > 0 then
        setLastUpdate(FCtrlSync[LcIndice].Name,'S', LcLastCodigo,Now);
      updateMsgProcess(LcMsg,LcMsg,LcIndice);
      FCtrlSync[LcIndice].Atualizado := 'S';
    end;
  End;
end;

procedure TUpdateTables.UpdateMeasure;
var
  LcObj : TCtrlMobMeasure;
  LcLista:TListMeasure;
  I : Integer;
  LcMsg : String;
  LcDefmsg : String;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  LcIndice : Integer;
begin
  try
    LcIndice := 8;
    LcObj := TCtrlMobMeasure.Create(nil);
    LcMsg := 'Preparando Atualização Medidas';
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    LcLista := TJson.JsonToObject<TListMeasure>( ZDecompressString ( FCtrlSync[LcIndice].JSon ) );
    LcDefmsg := 'Atualização Medidas';
    LcMsg := LcDefmsg;
    LcLasUpdate := 0;
    if LcLista.Count > 0 then
    Begin
      Try
        for I := 0 to ( LcLista.Count - 1) do
        Begin
          if (LcLista[I] <> nil) then
          Begin
            Try
              LcObj.assign( LcLista[I]);
              LcStrDateTime := formatdatetime('yyyy-mm-dd hh:nn:ss', LcObj.Registro.RegistroAlterado);
              LcLasUpdate := StrToDateTimeDef( LcStrDateTime , Now );
              LcObj.save;
              LcMsg := Concat(LcDefmsg,' : ',
                        IntToStr( LcLista.Count),'/',
                        IntToStr(I + 1)
              );
              updateMsgProcess(LcMsg,LcMsg,LcIndice);
            Except
              on E: Exception do
              Begin
                LcMsg := Concat(LcDefmsg,' - ',e.Message);
                GeralogCrashlytics(Concat(LcDefmsg,' - '),e.Message);
              End;
            End;
          End;
        End;
      Except
        on E: Exception do
          GeralogCrashlytics('TUpdateTables.UpdateMeasure - ',e.Message);
      End;
    End;
    LcMsg := concat(LcDefmsg,' - Concluído');
  finally
    if LcLasUpdate > 0 then
      setLastUpdate(FCtrlSync[LcIndice].Name,'E',I,LcLasUpdate);
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    FCtrlSync[LcIndice].Atualizado := 'S';
    //LcObj.DisposeOf;
    //LcLista.DisposeOf;
  end;

end;

procedure TUpdateTables.UpdateMerchandise;
var
  LcObj : TCtrlMobMerchandise;
  LcLista : TListMerchandise;
  I : Integer;
  LcMsg : String;
  LcDefmsg : String;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  LcIndice : Integer;
begin
  try
    LcIndice := 6;
    LcMsg := 'Preparando Atualização Mercadorias';
    LcObj := TCtrlMobMerchandise.Create(nil);
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    LcLista := TJson.JsonToObject<TListMerchandise>( ZDecompressString ( FCtrlSync[LcIndice].JSon ) );
    LcDefmsg := 'Atualização Mercadorias';
    LcMsg := LcDefmsg;
    LcLasUpdate := 0;
    if LcLista.Count > 0 then
    Begin
      Try
        for I := 0 to ( LcLista.Count - 1) do
        Begin
          if (LcLista[I] <> nil) then
          Begin
            Try
              LcObj.assign( LcLista[I]);
              LcStrDateTime := formatdatetime('yyyy-mm-dd hh:nn:ss', LcObj.Registro.RegistroAlterado);
              LcLasUpdate := StrToDateTimeDef( LcStrDateTime , Now );
              LcObj.save;
              LcMsg := Concat(LcDefmsg,' : ',
                        IntToStr( LcLista.Count),'/',
                        IntToStr(I + 1)
              );
              updateMsgProcess(LcMsg,LcMsg,LcIndice);
            Except
              on E: Exception do
              Begin
                LcMsg := Concat(LcDefmsg,' - ',e.Message);
                GeralogCrashlytics(Concat(LcDefmsg,' - '),e.Message);
              End;
            End;
          End;
        End;
      Except
        on E: Exception do
          GeralogCrashlytics('TUpdateTables.UpdateMerchandise - ',e.Message);
      End;
    end;
    LcMsg := concat(LcDefmsg,' - Concluído');
  finally
    if LcLasUpdate > 0 then
      setLastUpdate(FCtrlSync[LcIndice].Name,'E',I,LcLasUpdate);
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    FCtrlSync[LcIndice].Atualizado := 'S';
    //LcObj.DisposeOf;
    //LcLista.DisposeOf;
  end;
end;

procedure TUpdateTables.updateMsgProcess(shortmsg, lineMsg: String;
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
        Item.TextSettings.FontColor := claGreen;
        Item.Text := lineMsg;
        FProcMsg.Text := shortmsg;
        Item.Repaint;
      except
        on E: Exception do
        BEgin
          ShowMessage(concat('Indice: ',msgIndex.ToString,' - ',e.Message));
        End;
      end;
    end
  );
end;

procedure TUpdateTables.UpdateObjCustomer;
var
  LcObj : TCtrlMobCustomer;
  LcLista : TListObjCustomer;
  LcObjCustomer : TObjCustomer;
  I : Integer;
  Lc_vendedor : Integer;
  LcMsg : String;
  LcDefmsg : String;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  LcIndice : Integer;
begin
  try
    LcIndice := 17;
    LcMsg := 'Preparando Atualização Clientes';
    LcLasUpdate := 0;
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    LcDefmsg := 'Atualização Cliente';
    LcLista := TListObjCustomer.Create;
    LcObj := TCtrlMobCustomer.Create(nil);
    if ( FCtrlSync[LcIndice].JSon <> '' )  then
    Begin
      LcLista := TJson.JsonToObject<TListObjCustomer>( FCtrlSync[LcIndice].JSon  );
      LcMsg := LcDefmsg;
      if LcLista.Count > 0 then
      Begin
        try
          for I := 0 to ( LcLista.Count - 1) do
          Begin
            if (LcLista[I] <> nil) then
            Begin
              Try
                LcObjCustomer := TObjCustomer.Create;
                LcObj.clonarObj(LcLista[I],LcObjCustomer);
                Lc_vendedor := LcObjCustomer.Cliente.Vendedor;
                if  Lc_vendedor = GbSalesMan then
                Begin
                  LcObj.MFiscal.saveDataObjeto( LcObjCustomer.Fiscal );
                  LcObjCustomer.Cliente.Codigo := LcObjCustomer.Fiscal.Entidade.Entidade.Codigo;
                  LcObj.assign(LcObjCustomer.Cliente,LcObj.Registro);
                  LcObj.save;

                  LcStrDateTime := formatdatetime('yyyy-mm-dd hh:nn:ss', LcObj.Registro.RegistroAlterado);
                  LcLasUpdate := StrToDateTimeDef( LcStrDateTime , Now );
                  LcMsg := Concat(LcDefmsg,' : ',
                            IntToStr(LcLista.Count),'/',
                            IntToStr(I + 1)
                  );
                End
                else
                BEgin
                  LcObj.Clear;
                  LcObj.Registro.Estabelecimento := LcObjCustomer.Cliente.Estabelecimento;
                  LcObj.Registro.Codigo          := LcObjCustomer.Cliente.Codigo;
                  LcObj.delete;
                End;
                updateMsgProcess(LcMsg,LcMsg,LcIndice);
              Except
                on E: Exception do
                Begin
                  LcMsg := Concat(LcDefmsg,' - ',e.Message);
                  GeralogCrashlytics(Concat(LcDefmsg,' - '),e.Message);
                End;
              End;
            End;
          End;
        Except
          on E: Exception do
            GeralogCrashlytics('TUpdateTables.UpdateObjCustomer - ',e.Message);
        End;
      End;
    End;
  finally
    if LcLasUpdate > 0 then
      setLastUpdate(FCtrlSync[LcIndice].Name,'E',I,LcLasUpdate);
    LcMsg := concat(LcDefmsg,' - Concluído');
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    FCtrlSync[LcIndice].Atualizado := 'S';
    //LcObj.DisposeOf;
    //LcLista.DisposeOf; - AV
  end;
end;

procedure TUpdateTables.UpdateRestoreOrderConsignament;
var
  LcObj : TCtrlMobOrderConsignment;
  LcLista : TListObjOrderConsignment;
  I : Integer;
  LcMsg : String;
  LcDefmsg : String;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  LcLastCodigo : Integer;
  LcIndice : Integer;
begin
  LcIndice := 26;
  if FCtrlSync[LcIndice].Atualizado = 'N' then
  Begin
    try
      LcMsg := 'Preparando Atualização Consignação';
      LcLasUpdate := 0;
      updateMsgProcess(LcMsg,LcMsg,LcIndice);
      LcDefmsg := 'Atualização Consignação';
      LcLista := TListObjOrderConsignment.Create;
      LcObj := TCtrlMobOrderConsignment.Create(nil);
      if ( FCtrlSync[LcIndice].JSon <> '' )  then
      Begin
        LcLista := TJson.JsonToObject<TListObjOrderConsignment>( ZDecompressString ( FCtrlSync[LcIndice].JSon ) );
        LcMsg := LcDefmsg;
        if LcLista.Count > 0 then
        Begin
          try
            for I := 0 to ( LcLista.Count - 1) do
            Begin
              if (LcLista[I] <> nil) then
              Begin
                Try
                  LcObj.saveDataObjeto( LcLista[I] );
                  LcStrDateTime := formatdatetime('yyyy-mm-dd hh:nn:ss', LcObj.Registro.RegistroAlterado);
                  LcLasUpdate := StrToDateTimeDef( LcStrDateTime , Now );
                  LcMsg := Concat(LcDefmsg,' : ',
                            IntToStr(LcLista.Count),'/',
                            IntToStr(I + 1)
                  );
                  LcLastCodigo := LcObj.Registro.Codigo;
                  updateMsgProcess(LcMsg,LcMsg,LcIndice);
                Except
                  on E: Exception do
                  Begin
                    LcMsg := Concat(LcDefmsg,' - ',e.Message);
                    GeralogCrashlytics(Concat(LcDefmsg,' - '),e.Message);
                  End;
                End;
              End;
            End;
          Except
            on E: Exception do
              GeralogCrashlytics('UpdateOrderRestoreConsignament - ',e.Message);
          End;
        End;
      End;
    finally
      //Registrar como saida para que na proximo sincronia não entre na fila
      if LcLasUpdate > 0 then
        setLastUpdate(FCtrlSync[LcIndice].Name,'S', LcLastCodigo,Now);
      LcMsg := concat(LcDefmsg,' - Concluído');
      updateMsgProcess(LcMsg,LcMsg,LcIndice);
      FCtrlSync[LcIndice].Atualizado := 'S';
    end;
  End;
end;

procedure TUpdateTables.UpdateRestoreOrderSale;
var
  LcObj : TCtrlMobOrderSale;
  LcLista : TListObjOrderSale;
  I : Integer;
  LcMsg : String;
  LcDefmsg : String;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  LcLastCodigo : Integer;
  LcIndice : Integer;
begin
  LcIndice := 25;
  if FCtrlSync[LcIndice].Atualizado = 'N' then
  Begin
    try
      LcMsg := 'Preparando Atualização Venda';
      LcLasUpdate := 0;
      updateMsgProcess(LcMsg,LcMsg,LcIndice);
      LcDefmsg := 'Atualização Venda';
      LcLista := TListObjOrderSale.Create;
      LcObj := TCtrlMobOrderSale.Create(nil);
      if ( FCtrlSync[LcIndice].JSon <> '' )  then
      Begin
        LcLista := TJson.JsonToObject<TListObjOrderSale>( ZDecompressString ( FCtrlSync[LcIndice].JSon ) );
        LcMsg := LcDefmsg;
        if LcLista.Count > 0 then
        Begin
          try
            for I := 0 to ( LcLista.Count - 1) do
            Begin
              if (LcLista[I] <> nil) then
              Begin
                Try
                  LcObj.saveDataObjeto( LcLista[I] );
                  LcStrDateTime := formatdatetime('yyyy-mm-dd hh:nn:ss',  LcObj.Registro.RegistroAlterado);
                  LcLasUpdate := StrToDateTimeDef( LcStrDateTime , Now );
                  LcMsg := Concat(LcDefmsg,' : ',
                            IntToStr(LcLista.Count),'/',
                            IntToStr(I + 1)
                  );
                  LcLastCodigo := LcObj.Registro.Codigo;
                  updateMsgProcess(LcMsg,LcMsg,LcIndice);
                Except
                  on E: Exception do
                  Begin
                    LcMsg := Concat(LcDefmsg,' - ',e.Message);
                    GeralogCrashlytics(Concat(LcDefmsg,' - '),e.Message);
                  End;
                End;
              End;
            End;
          Except
            on E: Exception do
              GeralogCrashlytics('UpdateRestoreOrderSale - ',e.Message);
          End;
        End;
      End;
    finally
      //Registrar como saida para que na proximo sincronia não entre na fila
      if LcLasUpdate > 0 then
        setLastUpdate(FCtrlSync[LcIndice].Name,'S', LcLastCodigo,Now);
      LcMsg := concat(LcDefmsg,' - Concluído');
      updateMsgProcess(LcMsg,LcMsg,LcIndice);
      FCtrlSync[LcIndice].Atualizado := 'S';
    end;
  End;

end;

procedure TUpdateTables.UpdateRestoreStockStatement;
var
  LcObj : TCtrlMobStockBalance;
  LcLista : TListStockStatement;
  I : Integer;
  LcMsg : String;
  LcDefmsg : String;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  LcLastCodigo : Integer;
  LcIndice : Integer;
begin
  LcIndice := 29;
  if FCtrlSync[LcIndice].Atualizado = 'N' then
  Begin
    try
      LcObj := TCtrlMobStockBalance.Create(nil);
      LcMsg := 'Preparando Atualização Saldo de Estoque';
      updateMsgProcess(LcMsg,LcMsg,LcIndice);
      LcLista := TJson.JsonToObject<TListStockStatement>( ZDecompressString ( FCtrlSync[LcIndice].JSon ) );
      LcDefmsg := 'Atualização Saldo de Estoque';
      LcMsg := LcDefmsg;
      LcLasUpdate := 0;
      if LcLista.Count > 0 then
      Begin
        try
          for I := 0 to ( LcLista.Count - 1) do
          Begin
            if (LcLista[I] <> nil) then
            Begin
              Try
                //Verifica se o registro do Stock Balance existe e somente se não existir insere com zero quantity
                LcObj.Registro.Estabelecimento  := LcLista[I].Estabelecimento;
                LcObj.Registro.Tabela           := LcLista[I].Estoque;
                LcObj.Registro.Mercadoria       := LcLista[I].Mercadoria;
                LcObj.saveIfnotExist;


                LcObj.Movimento.assign( LcLista[I] );
                LcStrDateTime := formatdatetime('yyyy-mm-dd hh:nn:ss', LcObj.Movimento.Registro.RegistroAlterado);
                LcLasUpdate := StrToDateTimeDef( LcStrDateTime , Now );
                LcObj.Movimento.save;
                LcMsg := Concat(LcDefmsg,' : ',
                          IntToStr( LcLista.Count),'/',
                          IntToStr(I + 1)
                );
                LcLastCodigo := LcObj.Registro.Mercadoria;
                updateMsgProcess(LcMsg,LcMsg,LcIndice);
              Except
                on E: Exception do
                Begin
                  LcMsg := Concat(LcDefmsg,' - ',e.Message);
                  GeralogCrashlytics(Concat(LcDefmsg,' - '),e.Message);
                End;
              END;
            End;
          End;
        Except
          on E: Exception do
            GeralogCrashlytics('TUpdateTables.UpdateRestoreStockStatement - ',e.Message);
        End;
      End;
      LcMsg := concat(LcDefmsg,' - Concluído');
    finally
      //Registrar como saida para que na proximo sincronia não entre na fila
      if LcLasUpdate > 0 then
        setLastUpdate(FCtrlSync[LcIndice].Name,'S', LcLastCodigo,Now);
      LcObj.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
      LcObj.Registro.Tabela           := GbStock;
      LcObj.Recontar;
      updateMsgProcess(LcMsg,LcMsg,LcIndice);
      FCtrlSync[LcIndice].Atualizado := 'S';
    end;
  End;
end;

procedure TUpdateTables.UpdatePackage;
var
  LcObj : TCtrlMobPackage;
  LcLista :TListPackage;
  I : Integer;
  LcMsg : String;
  LcDefmsg : String;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  LcIndice : Integer;
begin
  try
    LcIndice := 7;
    LcObj := TCtrlMobPackage.Create(nil);
    LcMsg := 'Preparando Atualização Embalagens';
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    LcLista := TJson.JsonToObject<TListPackage>( ZDecompressString ( FCtrlSync[LcIndice].JSon ) );
    LcDefmsg := 'Atualização Embalagens';
    LcMsg := LcDefmsg;
    LcLasUpdate := 0;
    if LcLista.Count > 0 then
    Begin
      Try
        for I := 0 to ( LcLista.Count - 1) do
        Begin
          if (LcLista[I] <> nil) then
          Begin
            Try
              LcObj.assign( LcLista[I]);
              LcStrDateTime := formatdatetime('yyyy-mm-dd hh:nn:ss', LcObj.Registro.RegistroAlterado);
              LcLasUpdate := StrToDateTimeDef( LcStrDateTime , Now );
              LcObj.save;
              LcMsg := Concat(LcDefmsg,' : ',
                        IntToStr(LcLista.Count),'/',
                        IntToStr(I + 1)
              );
              updateMsgProcess(LcMsg,LcMsg,LcIndice);
            Except
              on E: Exception do
              Begin
                LcMsg := Concat(LcDefmsg,' - ',e.Message);
                GeralogCrashlytics(Concat(LcDefmsg,' - '),e.Message);
              End;
            End;
          End;
        End;
      Except
        on E: Exception do
          GeralogCrashlytics('TUpdateTables.UpdatePackage - ',e.Message);
      End;
    End;
    LcMsg := concat(LcDefmsg,' - Concluído');
  finally
    if LcLasUpdate > 0 then
      setLastUpdate(FCtrlSync[LcIndice].Name,'E',I,LcLasUpdate);
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    FCtrlSync[LcIndice].Atualizado := 'S';
    //LcObj.DisposeOf;
    //LcLista.DisposeOf;
  end;
end;

procedure TUpdateTables.UpdatePaymentTypes;
var
  LcObj : TCtrlMobPaymentType;
  LcLista : TListPaymentTypes;
  I : Integer;
  LcMsg : String;
  LcDefmsg : String;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  LcIndice : Integer;
begin
  try
    LcIndice := 15;
    LcObj := TCtrlMobPaymentType.Create(nil);
    LcMsg := 'Preparando Atualização Forma de Pagamento';
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    LcLista := TJson.JsonToObject<TListPaymentTypes>( ZDecompressString ( FCtrlSync[LcIndice].JSon ) );
    LcDefmsg := 'Atualização Formas de Pagamento';
    LcMsg := LcDefmsg;
    LcLasUpdate := 0;
    if LcLista.Count > 0 then
    Begin
      try
        for I := 0 to ( LcLista.Count - 1) do
        Begin
          if (LcLista[I] <> nil) then
          Begin
            Try
              LcObj.assign( LcLista[I] );
              LcStrDateTime := formatdatetime('yyyy-mm-dd hh:nn:ss', LcObj.Registro.RegistroAlterado);
              LcLasUpdate := StrToDateTimeDef( LcStrDateTime , Now );
              LcObj.save;
              LcMsg := Concat(LcDefmsg,' : ',
                        IntToStr(LcLista.Count),'/',
                        IntToStr(I + 1)
              );
              updateMsgProcess(LcMsg,LcMsg,LcIndice);
            Except
              on E: Exception do
              Begin
                LcMsg := Concat(LcDefmsg,' - ',e.Message);
                GeralogCrashlytics(Concat(LcDefmsg,' - '),e.Message);
              End;
            End;
          End;
        End;
      Except
        on E: Exception do
          GeralogCrashlytics('TUpdateTables.UpdatePaymentTypes - ',e.Message);
      End;
    End;
    LcMsg := concat(LcDefmsg,' - Concluído');
  finally
    if LcLasUpdate > 0 then
      setLastUpdate(FCtrlSync[LcIndice].Name,'E',I,LcLasUpdate);
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    FCtrlSync[LcIndice].Atualizado := 'S';
    //LcObj.DisposeOf;
    //LcLista.DisposeOf;
  end;
end;

procedure TUpdateTables.UpdatePrice;
var
  LcObj : TCtrlMobPrice;
  LcLista:TListPrice;
  I : Integer;
  LcMsg : String;
  LcDefmsg : String;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  LcIndice : Integer;
begin
  try
    LcIndice := 12;
    LcObj := TCtrlMobPrice.Create(nil);
    LcMsg := 'Preparando Atualização Preço';
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    LcLista := TJson.JsonToObject<TListPrice>( ZDecompressString ( FCtrlSync[LcIndice].JSon ) );
    LcDefmsg := 'Atualização Preço';
    LcMsg := LcDefmsg;
    LcLasUpdate := 0;
    if LcLista.Count > 0 then
    Begin
      Try
        for I := 0 to ( LcLista.Count - 1) do
        Begin
          if (LcLista[I] <> nil) then
          Begin
            TRy
              LcObj.assign( LcLista[I] );
              LcStrDateTime := formatdatetime('yyyy-mm-dd hh:nn:ss', LcObj.Registro.RegistroAlterado);
              LcLasUpdate := StrToDateTimeDef( LcStrDateTime , Now );
              LcObj.save;
              LcMsg := Concat(LcDefmsg,' : ',
                        IntToStr( LcLista.Count),'/',
                        IntToStr(I + 1)
              );
              updateMsgProcess(LcMsg,LcMsg,LcIndice);
            Except
              on E: Exception do
              Begin
                LcMsg := Concat(LcDefmsg,' - ',e.Message);
                GeralogCrashlytics(Concat(LcDefmsg,' - '),e.Message);
              End;
            END;
          End;
        End;
      Except
        on E: Exception do
          GeralogCrashlytics('TUpdateTables.UpdatePrice - ',e.Message);
      End;
    End;
   // UMM.ExecComando(LcSQL);
    LcMsg := concat(LcDefmsg,' - Concluído');
  Finally
    if LcLasUpdate > 0 then
      setLastUpdate(FCtrlSync[LcIndice].Name,'E',I,LcLasUpdate);
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    FCtrlSync[LcIndice].Atualizado := 'S';
    //LcObj.DisposeOf;
    //LcLista.DisposeOf;
  end;


end;

procedure TUpdateTables.UpdatePriceList;
var
  LcObj : TCtrlMobPriceList;
  LcLista:TListPriceList;
  I : Integer;
  LcMsg : String;
  LcDefmsg : String;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  LcIndice : Integer;
begin
  try
    LcIndice := 11;
    LcObj := TCtrlMobPriceList.Create(nil);
    LcMsg := 'Preparando Atualização Tabela de Preço';
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    LcLista := TJson.JsonToObject<TListPriceList>( ZDecompressString ( FCtrlSync[LcIndice].JSon ) );
    LcDefmsg := 'Atualização Tabela de Preço';
    LcMsg := LcDefmsg;
    LcLasUpdate := 0;
    if LcLista.Count > 0 then
    Begin
      try
        for I := 0 to ( LcLista.Count - 1) do
        Begin
          if (LcLista[I] <> nil) then
          Begin
            Try
              LcObj.assign( LcLista[I] );
              LcStrDateTime := formatdatetime('yyyy-mm-dd hh:nn:ss', LcObj.Registro.RegistroAlterado);
              LcLasUpdate := StrToDateTimeDef( LcStrDateTime , Now );
              LcObj.save;
              LcMsg := Concat(LcDefmsg,' : ',
                        IntToStr(LcLista.Count),'/',
                        IntToStr(I + 1)
              );
              updateMsgProcess(LcMsg,LcMsg,LcIndice);
            Except
              on E: Exception do
              Begin
                LcMsg := Concat(LcDefmsg,' - ',e.Message);
                GeralogCrashlytics(Concat(LcDefmsg,' - '),e.Message);
              End;
            End;
          End;
        End;
      Except
        on E: Exception do
          GeralogCrashlytics('TUpdateTables.UpdatePriceList - ',e.Message);
      End;
    End;
    LcMsg := concat(LcDefmsg,' - Concluído');
  finally
    if LcLasUpdate > 0 then
      setLastUpdate(FCtrlSync[LcIndice].Name,'E',I,LcLasUpdate);
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    FCtrlSync[LcIndice].Atualizado := 'S';
    //LcObj.DisposeOf;
    //LcLista.DisposeOf;
  end;


end;

procedure TUpdateTables.UpdateProduct;
var
  LcObj : TCtrlMobProduct;
  LcLista : TListProduct;
  I : Integer;
  LcMsg : String;
  LcDefmsg : String;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  LcIndice : Integer;
begin
  try
    LcIndice := 4;
    LcObj := TCtrlMobProduct.Create(nil);
    LcMsg := 'Preparando Atualização Produtos';
    updateMsgProcess(LcMsg,LcMsg,LcIndice);

    LcLista := TJson.JsonToObject<TListProduct>( ZDecompressString ( FCtrlSync[LcIndice].JSon ) );
    LcDefmsg := 'Atualização Produtos';
    LcMsg := LcDefmsg;
    LcLasUpdate := 0;
    if LcLista.Count > 0 then
    Begin
      Try
        for I := 0 to ( LcLista.Count - 1) do
        Begin
          if (LcLista[I] <> nil) then
          Begin
            Try
              LcObj.assign(LcLista[I]);
              LcStrDateTime := formatdatetime('yyyy-mm-dd hh:nn:ss', LcObj.Registro.RegistroAlterado);
              LcLasUpdate := StrToDateTimeDef( LcStrDateTime , Now );
              LcObj.save;
              LcMsg := Concat(LcDefmsg,' : ',
                        IntToStr(LcLista.Count),'/',
                        IntToStr(I + 1)
              );
              updateMsgProcess(LcMsg,LcMsg,LcIndice);
            Except
              on E: Exception do
              Begin
                LcMsg := Concat(LcDefmsg,' - ',e.Message);
                GeralogCrashlytics(Concat(LcDefmsg,' - '),e.Message);
              End;
            End;
          End;
        End;
      Except
        on E: Exception do
          GeralogCrashlytics('TUpdateTables.UpdateProduct - ',e.Message);
      End;
    End;
    LcMsg := concat(LcDefmsg,' - Concluído');
  finally
    if LcLasUpdate > 0 then
      setLastUpdate(FCtrlSync[LcIndice].Name,'E',I,LcLasUpdate);
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    FCtrlSync[LcIndice].Atualizado := 'S';
    //LcObj.DisposeOf;
    //LcLista.DisposeOf;
  end;
end;

procedure TUpdateTables.UpdateSalesman;
var
  LcObj : TCtrlMobSalesman;
  LcReg : TSalesman;
  I : Integer;
  LcMsg : String;
  LcDefmsg : String;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  LcIndice : Integer;
begin
  try
    Try
      LcIndice := 16;
      LcMsg := 'Preparando Atualização Vendedor';
      updateMsgProcess(LcMsg,LcMsg,LcIndice);

      LcObj := TCtrlMobSalesman.Create(nil);
      LcReg := TJson.JsonToObject<TSalesman>( ZDecompressString ( FCtrlSync[LcIndice].JSon ) );
      if (LcReg <> nil ) then
      Begin
        LcObj.assign(LcReg);
        LcDefmsg :=  'Atualização Vendedor(a)';
        LcMsg := LcDefmsg;
        LcLasUpdate := 0;
        if LcObj.Registro.Codigo > 0 then
        Begin
          updateMsgProcess(LcMsg,LcMsg,LcIndice);
          LcObj.save;
          LcLasUpdate := LcReg.RegistroAlterado;
        End;
      End;
    Except
      on E: Exception do
        GeralogCrashlytics('TUpdateTables.UpdateSalesman - ',e.Message);
    End;
  finally
    if LcLasUpdate > 0 then
      setLastUpdate(FCtrlSync[LcIndice].Name,'E',I,LcLasUpdate);
    LcMsg := concat(LcDefmsg,' - Concluído');
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    FCtrlSync[LcIndice].Atualizado := 'S';
    //LcObj.DisposeOf;
    //LcReg.DisposeOf;
  end;
end;

procedure TUpdateTables.UpdateState;
var
  LcObj : TCtrlMobState;
  LcLista : TListState;
  I : Integer;
  LcMsg : String;
  LcDefmsg : String;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  LcIndice : Integer;
begin
  try
    LcIndice := 1;
    LcObj := TCtrlMobState.Create(nil);
    LcMsg := 'Preparando Atualização Estados';
    LcDefmsg := 'Atualização Estados';
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    if FCtrlSync[LcIndice].JSon <> '' then
    Begin
      LcLista := TJson.JsonToObject<TListState>( ZDecompressString ( FCtrlSync[LcIndice].JSon ) );
      LcMsg := LcDefmsg;
      LcLasUpdate := 0;
      if LcLista.Count > 0 then
      Begin
        Try
          for I := 0 to ( LcLista.Count - 1) do
          Begin
            if (LcLista[I] <> nil) then
            Begin
              Try
                LcObj.assign(LcLista[I]);
                LcLasUpdate := LcObj.Registro.RegistroAlterado;
                LcStrDateTime := formatdatetime('yyyy-mm-dd hh:nn:ss', LcObj.Registro.RegistroAlterado);
                LcLasUpdate := StrToDateTimeDef( LcStrDateTime , Now );
                LcObj.save;
                LcMsg := Concat(LcDefmsg,' : ',
                          IntToStr(LcLista.Count),'/',
                          IntToStr(I + 1)
                );
                updateMsgProcess(LcMsg,LcMsg,LcIndice);
              Except
                on E: Exception do
                Begin
                  LcMsg := Concat(LcDefmsg,' - ',e.Message);
                  GeralogCrashlytics(Concat(LcDefmsg,' - '),e.Message);
                End;
              End;
            End;
          End;
        Except
          on E: Exception do
            GeralogCrashlytics('TUpdateTables.UpdateState - ',e.Message);
        End;
      End;
    End;
    LcMsg := concat(LcDefmsg,' - Concluído');
  finally
    if LcLasUpdate > 0 then
      setLastUpdate(FCtrlSync[LcIndice].Name,'E',I,LcLasUpdate);
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    FCtrlSync[LcIndice].Atualizado := 'S';
    //LcObj.DisposeOf;
    //LcLista.DisposeOf;
  end;
end;

procedure TUpdateTables.UpdateStock;
var
  LcObj : TCtrlMobStock;
  LcLista : TListStock;
  I : Integer;
  LcMsg : String;
  LcDefmsg : String;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  LcIndice : Integer;
begin
  try
    LcIndice := 10;
    LcObj := TCtrlMobStock.Create(nil);
    LcMsg := 'Preparando Atualização Estoque';
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    LcLista := TJson.JsonToObject<TListStock>( ZDecompressString ( FCtrlSync[LcIndice].JSon ) );
    LcDefmsg := 'Atualização Estoque';
    LcMsg := LcDefmsg;
    LcLasUpdate := 0;
    if LcLista.Count > 0 then
    Begin
      Try
        for I := 0 to ( LcLista.Count - 1) do
        Begin
          if (LcLista[I] <> nil) then
          Begin
            TRy
              LcObj.assign( LCLista[I]);
              LcLasUpdate := LcObj.Registro.RegistroAlterado;
              LcObj.save;

              LcObj.StockList.Balance.Registro.Estabelecimento  := LcObj.Registro.Estabelecimento;
              LcObj.StockList.Balance.Registro.Mercadoria       := LcObj.Registro.Mercadoria;
              LcObj.StockList.Balance.saveIfnotExist;

              LcMsg := Concat(LcDefmsg,' : ',
                        IntToStr(LcLista.Count),'/',
                        IntToStr(I + 1)
              );
              updateMsgProcess(LcMsg,LcMsg,LcIndice);
            Except
              on E: Exception do
              Begin
                LcMsg := Concat(LcDefmsg,' - ',e.Message);
                GeralogCrashlytics(Concat(LcDefmsg,' - '),e.Message);
              End;
            End;
          End;
        End;
      Except
        on E: Exception do
          GeralogCrashlytics('TUpdateTables.UpdateStock - ',e.Message);
      End;
    End;
    LcMsg := concat(LcDefmsg,' - Concluído');
  finally
    if LcLasUpdate > 0 then
      setLastUpdate(FCtrlSync[LcIndice].Name,'E',I,LcLasUpdate);
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    FCtrlSync[LcIndice].Atualizado := 'S';
    //LcObj.DisposeOf;
    //LcLista.DisposeOf;
  end;
end;

procedure TUpdateTables.UpdateStockBalance;
var
  LcObj : TCtrlMobStockBalance;
  LcLista : TListStockBalance;
  I : Integer;
  LcMsg : String;
  LcDefmsg : String;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  LcLastCOdigo : Integer;
  LcIndice : Integer;
begin
  LcIndice := 14;
  if FCtrlSync[LcIndice].Atualizado = 'N' then
  Begin
    try
      LcObj := TCtrlMobStockBalance.Create(nil);
      LcMsg := 'Preparando Atualização Saldo de Estoque';
      updateMsgProcess(LcMsg,LcMsg,LcIndice);
      LcLista := TJson.JsonToObject<TListStockBalance>( ZDecompressString ( FCtrlSync[LcIndice].JSon ) );
      LcDefmsg := 'Atualização Saldo de Estoque';
      LcMsg := LcDefmsg;
      LcLasUpdate := 0;
      LcLastCOdigo := 1;
      if LcLista.Count > 0 then
      Begin
        try
          for I := 0 to ( LcLista.Count - 1) do
          Begin
            if (LcLista[I] <> nil) then
            Begin
              Try
                //Verifica se o registro do Stock Balance existe e somente se não existir insere com zero quantity
                LcObj.Registro.Estabelecimento  := LcLista[I].Estabelecimento;
                LcObj.Registro.Tabela           := LcLista[I].Tabela;
                LcObj.Registro.Mercadoria       := LcLista[I].Mercadoria;
                LcObj.saveIfnotExist;

                LcObj.ClonarObj( LcLista[I], LcObj.Registro );
                LcObj.save;

                LcStrDateTime := formatdatetime('yyyy-mm-dd hh:nn:ss', LcObj.Movimento.Registro.RegistroAlterado);
                LcLasUpdate := StrToDateTimeDef( LcStrDateTime , Now );
                LcLastCOdigo := LcLista[I].Mercadoria;
                LcMsg := Concat(LcDefmsg,' : ',
                          IntToStr( LcLista.Count),'/',
                          IntToStr(I + 1)
                );
                updateMsgProcess(LcMsg,LcMsg,LcIndice);
              Except
                on E: Exception do
                Begin
                  LcMsg := Concat(LcDefmsg,' - ',e.Message);
                  GeralogCrashlytics(Concat(LcDefmsg,' - '),e.Message);
                End;
              END;
            End;
          End;
        Except
          on E: Exception do
            GeralogCrashlytics('TUpdateTables.UpdateStockBalance - ',e.Message);
        End;
      End;
      LcMsg := concat(LcDefmsg,' - Concluído');
    finally
      if LcLasUpdate > 0 then
      Begin
        setLastUpdate(FCtrlSync[LcIndice].Name,'E',LcLastCOdigo,LcLasUpdate);
        setLastUpdate(FCtrlSync[LcIndice].Name,'S',LcLastCOdigo,LcLasUpdate);
      End;
      updateMsgProcess(LcMsg,LcMsg,LcIndice);
      FCtrlSync[LcIndice].Atualizado := 'S';
    end;
  End;
end;

procedure TUpdateTables.UpdateStockStatement;
var
  LcObj : TCtrlMobStockBalance;
  LcLista : TListStockStatement;
  I : Integer;
  LcMsg : String;
  LcDefmsg : String;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  LcIndice : Integer;
begin
  LcIndice := 22;
  if FCtrlSync[LcIndice].Atualizado = 'N' then
  Begin
    try
      LcObj := TCtrlMobStockBalance.Create(nil);
      LcMsg := 'Preparando Atualização Saldo de Estoque';
      updateMsgProcess(LcMsg,LcMsg,LcIndice);
      LcLista := TJson.JsonToObject<TListStockStatement>( ZDecompressString ( FCtrlSync[LcIndice].JSon ) );
      LcDefmsg := 'Atualização Saldo de Estoque';
      LcMsg := LcDefmsg;
      LcLasUpdate := 0;
      if LcLista.Count > 0 then
      Begin
        try
          for I := 0 to ( LcLista.Count - 1) do
          Begin
           if (LcLista[I] <> nil) then
            Begin
              Try
                //Verifica se o registro do Stock Balance existe e somente se não existir insere com zero quantity
                LcObj.Registro.Estabelecimento  := LcLista[I].Estabelecimento;
                LcObj.Registro.Tabela           := LcLista[I].Estoque;
                LcObj.Registro.Mercadoria       := LcLista[I].Mercadoria;
                LcObj.saveIfnotExist;


                LcObj.Movimento.assign( LcLista[I] );
                LcStrDateTime := formatdatetime('yyyy-mm-dd hh:nn:ss', LcObj.Movimento.Registro.RegistroAlterado);
                LcLasUpdate := StrToDateTimeDef( LcStrDateTime , Now );
                LcObj.Movimento.save;
                LcMsg := Concat(LcDefmsg,' : ',
                          IntToStr( LcLista.Count),'/',
                          IntToStr(I + 1)
                );
                updateMsgProcess(LcMsg,LcMsg,LcIndice);
              Except
                on E: Exception do
                Begin
                  LcMsg := Concat(LcDefmsg,' - ',e.Message);
                  GeralogCrashlytics(Concat(LcDefmsg,' - '),e.Message);
                End;
              END;
            End;
          End;
        Except
          on E: Exception do
            GeralogCrashlytics('TUpdateTables.UpdateStockStatement - ',e.Message);
        End;
      End;
      LcMsg := concat(LcDefmsg,' - Concluído');
    finally
      if LcLasUpdate > 0 then
        setLastUpdate(FCtrlSync[LcIndice].Name,'E',I,LcLasUpdate);
      updateMsgProcess(LcMsg,LcMsg,LcIndice);
      FCtrlSync[LcIndice].Atualizado := 'S';
      //LcObj.DisposeOf;
      //LcLista.DisposeOf;
    end;
  End;
end;

procedure TUpdateTables.UpdateStockList;
var
  LcObj : TCtrlMobStockList;
  LcLista : TListStockList;
  I : Integer;
  LcMsg : String;
  LcDefmsg : String;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  LcIndice : Integer;
begin
  try
    LcIndice := 13;
    LcObj := TCtrlMobStockList.Create(nil);
    LcMsg := 'Preparando Atualização Tabelas de Estoque';
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    LcLista := TJson.JsonToObject<TListStockList>( ZDecompressString ( FCtrlSync[LcIndice].JSon ) );
    LcDefmsg := 'Atualização Tabelas de Estoque';
    LcMsg := LcDefmsg;
    LcLasUpdate := 0;
    if LcLista.Count > 0 then
    Begin
      Try
        for I := 0 to ( LcLista.Count - 1) do
        Begin
          if (LcLista[I] <> nil) then
          Begin
            try
              LcObj.assign( LcLista[I] );
              LcStrDateTime := formatdatetime('yyyy-mm-dd hh:nn:ss', LcObj.Registro.RegistroAlterado);
              LcLasUpdate := StrToDateTimeDef( LcStrDateTime , Now );
              LcObj.save;
              LcMsg := Concat(LcDefmsg,' : ',
                        IntToStr(LcLista.Count),'/',
                        IntToStr(I + 1)
              );
              updateMsgProcess(LcMsg,LcMsg,LcIndice);
            Except
              on E: Exception do
              Begin
                LcMsg := Concat(LcDefmsg,' - ',e.Message);
                GeralogCrashlytics(Concat(LcDefmsg,' - '),e.Message);
              End;
            end;
          End;
        End;
      Except
        on E: Exception do
          GeralogCrashlytics('TUpdateTables.UpdateStockList - ',e.Message);
      End;
    End;
    LcMsg := concat(LcDefmsg,' - Concluído');
  finally
    if LcLasUpdate > 0 then
      setLastUpdate(FCtrlSync[LcIndice].Name,'E',I,LcLasUpdate);
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    FCtrlSync[LcIndice].Atualizado := 'S';
    //LcObj.DisposeOf;
    //LcLista.DisposeOf;
  end;
end;

procedure TUpdateTables.UpdateStockSalesman;
var
  LcObj : TCtrlMobSalesmanHasStock;
  LcLista : TSalesmanHasStock;
  I : Integer;
  LcMsg : String;
  LcDefmsg : String;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  LcIndice : Integer;
begin
  try
    LcIndice := 18;
    LcObj := TCtrlMobSalesmanHasStock.Create(nil);
    LcMsg := 'Preparando Atualização Estoque do Vendedor';
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    LcLista := TJson.JsonToObject<TSalesmanHasStock>( ZDecompressString ( FCtrlSync[LcIndice].JSon ) );
    LcDefmsg := 'Atualização Tabelas de Estoque do Vendedor';
    LcMsg := LcDefmsg;
    LcLasUpdate := 0;
    if ( LcLista <> nil) then
    Begin
      if LcLista.Vendedor > 0 then
      Begin
        Try
          try
            LcObj.assign(LcLista);
            LcObj.save;
            LcStrDateTime := formatdatetime('yyyy-mm-dd hh:nn:ss', LcObj.Registro.RegistroAlterado);
            LcLasUpdate := StrToDateTimeDef( LcStrDateTime , Now );
            LcMsg := Concat(LcDefmsg,' : 1/1');
            updateMsgProcess(LcMsg,LcMsg,LcIndice);
          Except
            on E: Exception do
            Begin
              LcMsg := Concat(LcDefmsg,' - ',e.Message);
              GeralogCrashlytics(Concat(LcDefmsg,' - '),e.Message);
            End;
          end;
        Except
          on E: Exception do
            GeralogCrashlytics('TUpdateTables.UpdateStockSalesman - ',e.Message);
        End;
      End;
    End;
    LcMsg := concat(LcDefmsg,' - Concluído');
  finally
    if LcLasUpdate > 0 then
      setLastUpdate(FCtrlSync[LcIndice].Name,'E',I,LcLasUpdate);
    updateMsgProcess(LcMsg,LcMsg,LcIndice);
    FCtrlSync[LcIndice].Atualizado := 'S';
  end;
end;

end.


