unit uSMGeneral;

interface

uses System.SysUtils, System.Classes, System.Json,
    uSM,
  rep_product_file, prm_print_product, prm_print_entities,
  prm_print_Invoice,  rep_invoice_list, rep_customer_file, rep_provider_file,
  rep_carrier_file, prm_print_order_list, rep_order_list, rep_order_list_adjust,
  rep_order_list_job, rep_order_list_packing, rep_order_list_purchase,
  rep_order_list_sale, rep_order_list_stock_transfer, rep_order_pi_02,
  ControllerInstitution, un_frx_base_report,base_report, prm_rep_order,
  UnFunctions,  un_frx_report_media_parts, prm_print_media_parts,
  rep_order_purchase_01,rep_order_stock_transfer_01,rep_order_packing_01,
  rep_order_job_01, REST.Json, QRPDFFilt ;


type
  {$METHODINFO ON}
  TSMGeneral = class(TSM)
  private

  public
    //Pedidos
    function GetOrderPurchase(par:String):String;
    function GetOrderStockTransfer(par:String):String;
    function GetOrderJob(par:String):String;
    function GetOrderPacking(par:String):String;

    function GetProductFile(par: string): string;
    //Order List
    function GetOrderListPurchase(par: string): string;
    function GetOrderListSale(par: string): string;
    function GetOrderListAdjust(par: string): string;
    function GetOrderListPacking(par: string): string;
    function GetOrderListJob(par: string): string;
    function GetOrderListStockTransfer(par: string): string;
    //Empresas
    function GetCustomerFile(par: string): string;
    function GetProviderFile(par: string): string;
    function GetCarrierFile(par: string): string;
    //Lista de Pedidos
    function GetJobList(par: string): string;
    //Notas
    function GetInvoiceList(par: string): string;

  end;

implementation


function TSMGeneral.GetCarrierFile(par: string): string;
Var
  Form : TRepCarrierFile;
  LcUrl : String;
  LcPath : String;
  Lc_Param : TPrmPrintEntities;
  LcFile : String;
begin
  try
    try
      Form := TRepCarrierFile.Create(nil);
      Lc_Param := TPrmPrintEntities.Create;
      Lc_Param := TJSON.JsonToObject<TPrmPrintEntities>(par);
      with Form do
      Begin
        FEstabelecimento.Registro.Codigo := Lc_Param.Estabelecimento;
        FEstabelecimento.User.Registro.Codigo := Lc_Param.Usuario;
        FEstabelecimento.getAllByKey;
        FEstabelecimento.getRepository(False,'');

        LcFile := concat('carrierList_',
                        FEstabelecimento.GeneratePrimaryKey,
                        '.pdf');

        LcUrl := concat(FEstabelecimento.URL,FEstabelecimento.User.Registro.Codigo.ToString,'/', LcFile );
        LcPath := concat(FEstabelecimento.PathPublico,FEstabelecimento.User.Registro.Codigo.ToString,'\', LcFile );
        {$IFDEF DEBUG}
        LcUrl := concat('file:///',LcPath);
        {$ENDIF}
        Par := Lc_Param;
        execute;
        Cabecalho;
        Search;
        Qrpt.ExportToFilter(TQRPDFDocumentFilter.Create(LcPath));
      end;
    finally
      Form.Close;
      Form.DisposeOf;
      Lc_Param.Resultado := True;
      Lc_Param.url := LcUrl;
      Result := TJson.ObjectToJsonString(Lc_Param);
    end;
  except
    Lc_Param.Resultado := False;
    Lc_Param.url := '';
  end;
end;


function TSMGeneral.GetCustomerFile(par: string): string;
Var
  Form : TRepCustomerFile;
  LcUrl : String;
  LcPath : String;
  Lc_Param : TPrmPrintEntities;
  LcFile : String;
begin
  try
    try
      Form := TRepCustomerFile.Create(nil);
      Lc_Param := TPrmPrintEntities.Create;
      Lc_Param := TJSON.JsonToObject<TPrmPrintEntities>(par);
      with Form do
      Begin
        FEstabelecimento.Registro.Codigo := Lc_Param.Estabelecimento;
        FEstabelecimento.User.Registro.Codigo := Lc_Param.Usuario;
        LcFile := concat('customerList_',
                        FEstabelecimento.GeneratePrimaryKey,
                        '.pdf');
        FEstabelecimento.getRepository(False,'');
        LcUrl := concat(FEstabelecimento.URL,FEstabelecimento.User.Registro.codigo.ToString,'/', LcFile );
        LcPath := concat(FEstabelecimento.PathPublico,FEstabelecimento.User.Registro.codigo.ToString,'\', LcFile );
        {$IFDEF DEBUG}
        LcUrl := concat('file:///',LcPath);
        {$ENDIF}

        Par := Lc_Param;
        execute;
        Cabecalho;
        Search;
        Qrpt.ExportToFilter(TQRPDFDocumentFilter.Create(LcPath));
      End;
    finally
      Form.Close;
      Form.DisposeOf;
      Lc_Param.Resultado := True;
      Lc_Param.url := LcUrl;
      Result := TJson.ObjectToJsonString(Lc_Param);
    end;
  except
    Lc_Param.Resultado := False;
    Lc_Param.url := '';
  end;

end;



function TSMGeneral.GetInvoiceList(par: string): string;
Var
  Form : TRepInvoiceList;
  LcUrl : String;
  LcPath : String;
  Lc_Param : TPrmPrintInvoice;
  LcFile : String;
begin
  try
    try
      Form := TRepInvoiceList.Create(nil);
      Lc_Param := TPrmPrintInvoice.Create;
      Lc_Param := TJSON.JsonToObject<TPrmPrintInvoice>(par);
      with Form do
      BEgin
        FEstabelecimento.Registro.Codigo  := Lc_Param.Estabelecimento;
        FEstabelecimento.USer.Registro.codigo          := Lc_Param.Usuario;
        //somente para teste locais
        LcFile := concat('invoiceList_',
                        FEstabelecimento.GeneratePrimaryKey,
                        '.pdf');
        LcUrl := concat(FEstabelecimento.URL,FEstabelecimento.User.Registro.codigo.ToString,'/', LcFile );
        LcPath := concat(FEstabelecimento.PathPublico,FEstabelecimento.User.Registro.codigo.ToString,'\', LcFile );
        {$IFDEF DEBUG}
        LcUrl := concat('file:///',LcPath);
        {$ENDIF}

        Par := Lc_Param;
        execute;
        Cabecalho;
        Search;
        Qrpt.ExportToFilter(TQRPDFDocumentFilter.Create(LcPath));
      End;
    finally
      Form.Close;
      Form.DisposeOf;
      Lc_Param.Resultado := True;
      Lc_Param.url := LcUrl;
      Result := TJson.ObjectToJsonString(Lc_Param);
    end;
  except
    Lc_Param.Resultado := False;
    Lc_Param.url := '';
  end;
end;

function TSMGeneral.GetJobList(par: string): string;
Var
  Form : TRepOrderJob_01;
  LcUrl : String;
  LcPath : String;
  Lc_Param : TPrmRepOrder;
  LcFile : String;
begin
  try
    try
      Form := TRepOrderJob_01.Create(nil);
      Lc_Param := TPrmRepOrder.Create;
      with Form do
      Begin
        Lc_Param := TJSON.JsonToObject<TPrmRepOrder>(par);
        FEstabelecimento.Registro.Codigo := Lc_Param.Estabelecimento;
        FEstabelecimento.USer.Registro.codigo        := Lc_Param.Usuario;
        //somente para teste locais
        LcFile := concat('pedJobList_',
                        FEstabelecimento.GeneratePrimaryKey,
                        '.pdf');
        LcUrl := concat(FEstabelecimento.URL,FEstabelecimento.User.Registro.codigo.ToString,'/', LcFile );
        LcPath := concat(FEstabelecimento.PathPublico,FEstabelecimento.User.Registro.codigo.ToString,'\', LcFile );
        {$IFDEF DEBUG}
        LcUrl := concat('file:///',LcPath);
        {$ENDIF}

        CodigoRegistro := Lc_Param.Codigo;
        execute;
        Qrpt.ExportToFilter(TQRPDFDocumentFilter.Create(LcPath));
      End;
    finally
      Form.Close;
      Form.DisposeOf;
      Lc_Param.Resultado := True;
      Lc_Param.url := LcUrl;
      Result := TJson.ObjectToJsonString(Lc_Param);

    end;
  except
    Lc_Param.Resultado := False;
    Lc_Param.url := '';
  end;


end;

function TSMGeneral.GetOrderJob(par: String): String;
Var
  Form : TRepOrderJob_01;
  LcUrl : String;
  LcPath : String;
  Lc_Param : TPrmRepOrder;
  LcFile : String;
begin
  try
    try
      Form := TRepOrderJob_01.Create(nil);
      Lc_Param := TPrmRepOrder.Create;
      with Form do
      Begin
        Lc_Param := TJSON.JsonToObject<TPrmRepOrder>(par);
        FEstabelecimento.Registro.Codigo := Lc_Param.Estabelecimento;
        FEstabelecimento.User.Registro.Codigo := Lc_Param.Usuario;
        LcFile := concat('pedidocompra_',
                        FEstabelecimento.GeneratePrimaryKey,
                        '.pdf');
        FEstabelecimento.getRepository(False,'');
        LcUrl := concat(FEstabelecimento.URL,FEstabelecimento.User.Registro.codigo.ToString,'/', LcFile );
        LcPath := concat(FEstabelecimento.PathPublico,FEstabelecimento.User.Registro.codigo.ToString,'\', LcFile );
        {$IFDEF DEBUG}
        LcUrl := concat('file:///',LcPath);
        {$ENDIF}

        CodigoRegistro := Lc_Param.Codigo;
        execute;
        Qrpt.ExportToFilter(TQRPDFDocumentFilter.Create(LcPath));
      End;
    finally
      Form.Close;
      Form.DisposeOf;
      Lc_Param.Resultado := True;
      Lc_Param.url := LcUrl;
      Result := TJson.ObjectToJsonString(Lc_Param);

    end;
  except
    Lc_Param.Resultado := False;
    Lc_Param.url := '';
  end;


end;

function TSMGeneral.GetOrderListAdjust(par: string): string;
Var
  Form : TRepOrderListAdjust;
  LcUrl : String;
  LcPath : String;
  Lc_Param : TPrmPrintOrderList;
  LcFile : String;
begin
  try
    try
      Form := TRepOrderListAdjust.Create(nil);
      Lc_Param := TPrmPrintOrderList.Create;
      Lc_Param := TJSON.JsonToObject<TPrmPrintOrderList>(par);
      With Form do
      Begin
        FEstabelecimento.Registro.Codigo := Lc_Param.Estabelecimento;
        FEstabelecimento.USer.Registro.codigo        := Lc_Param.Usuario;
        //somente para teste locais

        LcFile := concat('OrderListAdjust_',
                        FEstabelecimento.GeneratePrimaryKey,
                        '.pdf');
        LcUrl := concat(FEstabelecimento.URL,FEstabelecimento.User.Registro.codigo.ToString,'/', LcFile );
        LcPath := concat(FEstabelecimento.PathPublico,FEstabelecimento.User.Registro.codigo.ToString,'\', LcFile );
        {$IFDEF DEBUG}
        LcUrl := concat('file:///',LcPath);
        {$ENDIF}

        Par := Lc_Param;
        execute;
        Cabecalho;
        Search;
        Qrpt.ExportToFilter(TQRPDFDocumentFilter.Create(LcPath));
      End;
    finally
      Form.Close;
      Form.DisposeOf;
      Lc_Param.Resultado := True;
      Lc_Param.url := LcUrl;
      Result := TJson.ObjectToJsonString(Lc_Param);
    end;
  except
    Lc_Param.Resultado := False;
    Lc_Param.url := '';
  end;
end;

function TSMGeneral.GetOrderListJob(par: string): string;
Var
  Form : TRepOrderListJob;
  LcUrl : String;
  LcPath : String;
  Lc_Param : TPrmPrintOrderList;
  LcFile : String;
begin
  try
    try
      Form := TRepOrderListJob.Create(nil);
      Lc_Param := TPrmPrintOrderList.Create;
      Lc_Param := TJSON.JsonToObject<TPrmPrintOrderList>(par);
      with Form do
      Begin
        FEstabelecimento.Registro.Codigo := Lc_Param.Estabelecimento;
        FEstabelecimento.USer.Registro.codigo        := Lc_Param.Usuario;
        //somente para teste locais

        LcFile := concat('OrderListJob_',
                        FEstabelecimento.GeneratePrimaryKey,
                        '.pdf');
        LcUrl := concat(FEstabelecimento.URL,FEstabelecimento.User.Registro.codigo.ToString,'/', LcFile );
        LcPath := concat(FEstabelecimento.PathPublico,FEstabelecimento.User.Registro.codigo.ToString,'\', LcFile );
        {$IFDEF DEBUG}
        LcUrl := concat('file:///',LcPath);
        {$ENDIF}

        Par := Lc_Param;
        execute;
        Cabecalho;
        Search;
        Qrpt.ExportToFilter(TQRPDFDocumentFilter.Create(LcPath));
      End;
    finally
      Form.Close;
      Form.DisposeOf;
      Lc_Param.Resultado := True;
      Lc_Param.url := LcUrl;
      Result := TJson.ObjectToJsonString(Lc_Param);
    end;
  except
    Lc_Param.Resultado := False;
    Lc_Param.url := '';
  end;
end;

function TSMGeneral.GetOrderListPacking(par: string): string;
Var
  Form : TRepOrderListPacking;
  LcUrl : String;
  LcPath : String;
  Lc_Param : TPrmPrintOrderList;
  LcFile : String;
begin
  try
    try
      Form := TRepOrderListPacking.Create(nil);
      Lc_Param := TPrmPrintOrderList.Create;
      Lc_Param := TJSON.JsonToObject<TPrmPrintOrderList>(par);
      with Form do
      Begin
        FEstabelecimento.Registro.Codigo := Lc_Param.Estabelecimento;
        FEstabelecimento.USer.Registro.codigo        := Lc_Param.Usuario;
        //somente para teste locais

        LcFile := concat('OrderListPacking_',
                        FEstabelecimento.GeneratePrimaryKey,
                        '.pdf');
        LcUrl := concat(FEstabelecimento.URL,FEstabelecimento.User.Registro.codigo.ToString,'/', LcFile );
        LcPath := concat(FEstabelecimento.PathPublico,FEstabelecimento.User.Registro.codigo.ToString,'\', LcFile );
        {$IFDEF DEBUG}
        LcUrl := concat('file:///',LcPath);
        {$ENDIF}

        Par := Lc_Param;
        execute;
        Cabecalho;
        Search;
        Qrpt.ExportToFilter(TQRPDFDocumentFilter.Create(LcPath));
      End;
    finally
      Form.Close;
      Form.DisposeOf;
      Lc_Param.Resultado := True;
      Lc_Param.url := LcUrl;
      Result := TJson.ObjectToJsonString(Lc_Param);
    end;
  except
    Lc_Param.Resultado := False;
    Lc_Param.url := '';
  end;


end;

function TSMGeneral.GetOrderListPurchase(par: string): string;
Var
  Form : TRepOrderListPurchase;
  LcUrl : String;
  LcPath : String;
  Lc_Param : TPrmPrintOrderList;
  LcFile : String;
begin
  try
    try
      Form := TRepOrderListPurchase.Create(nil);
      Lc_Param := TPrmPrintOrderList.Create;
      Lc_Param := TJSON.JsonToObject<TPrmPrintOrderList>(par);
      with Form do
      Begin
        FEstabelecimento.Registro.Codigo := Lc_Param.Estabelecimento;
        FEstabelecimento.USer.Registro.codigo        := Lc_Param.Usuario;
        //somente para teste locais

        LcFile := concat('OrderListPurchase_',
                        FEstabelecimento.GeneratePrimaryKey,
                        '.pdf');
        LcUrl := concat(FEstabelecimento.URL,FEstabelecimento.User.Registro.codigo.ToString,'/', LcFile );
        LcPath := concat(FEstabelecimento.PathPublico,FEstabelecimento.User.Registro.codigo.ToString,'\', LcFile );
        {$IFDEF DEBUG}
        LcUrl := concat('file:///',LcPath);
        {$ENDIF}

        Par := Lc_Param;
        execute;
        Cabecalho;
        Search;
        Qrpt.ExportToFilter(TQRPDFDocumentFilter.Create(LcPath));
      End;
    finally
      Form.Close;
      Form.DisposeOf;
      Lc_Param.Resultado := True;
      Lc_Param.url := LcUrl;
      Result := TJson.ObjectToJsonString(Lc_Param);
    end;
  except
    Lc_Param.Resultado := False;
    Lc_Param.url := '';
  end;
end;

function TSMGeneral.GetOrderListSale(par: string): string;
Var
  Form : TRepOrderListSale;
  LcUrl : String;
  LcPath : String;
  Lc_Param : TPrmPrintOrderList;
  LcFile : String;
begin
  try
    try
      Form := TRepOrderListSale.Create(nil);
      Lc_Param := TPrmPrintOrderList.Create;
      Lc_Param := TJSON.JsonToObject<TPrmPrintOrderList>(par);
      with Form do
      Begin
        FEstabelecimento.Registro.Codigo := Lc_Param.Estabelecimento;
        FEstabelecimento.USer.Registro.codigo        := Lc_Param.Usuario;
        //somente para teste locais

        LcFile := concat('OrderListSale_',
                        FEstabelecimento.GeneratePrimaryKey,
                        '.pdf');
        LcUrl := concat(FEstabelecimento.URL,FEstabelecimento.User.Registro.codigo.ToString,'/', LcFile );
        LcPath := concat(FEstabelecimento.PathPublico,FEstabelecimento.User.Registro.codigo.ToString,'\', LcFile );
        {$IFDEF DEBUG}
        LcUrl := concat('file:///',LcPath);
        {$ENDIF}

        Par := Lc_Param;
        execute;
        Cabecalho;
        Search;
        Qrpt.ExportToFilter(TQRPDFDocumentFilter.Create(LcPath));
      End;
    finally
      Form.Close;
      Form.DisposeOf;
      Lc_Param.Resultado := True;
      Lc_Param.url := LcUrl;
      Result := TJson.ObjectToJsonString(Lc_Param);
    end;
  except
    Lc_Param.Resultado := False;
    Lc_Param.url := '';
  end;
end;

function TSMGeneral.GetOrderListStockTransfer(par: string): string;
Var
  Form : TRepOrderListStockTransfer;
  LcUrl : String;
  LcPath : String;
  Lc_Param : TPrmPrintOrderList;
  LcFile : String;
begin
  try
    try
      Form := TRepOrderListStockTransfer.Create(nil);
      Lc_Param := TPrmPrintOrderList.Create;
      Lc_Param := TJSON.JsonToObject<TPrmPrintOrderList>(par);
      with Form do
      Begin
        FEstabelecimento.Registro.Codigo := Lc_Param.Estabelecimento;
        FEstabelecimento.USer.Registro.codigo        := Lc_Param.Usuario;
        //somente para teste locais

        LcFile := concat('OrderListStockList_',
                        FEstabelecimento.GeneratePrimaryKey,
                        '.pdf');
        LcUrl := concat(FEstabelecimento.URL,FEstabelecimento.User.Registro.codigo.ToString,'/', LcFile );
        LcPath := concat(FEstabelecimento.PathPublico,FEstabelecimento.User.Registro.codigo.ToString,'\', LcFile );
        {$IFDEF DEBUG}
        LcUrl := concat('file:///',LcPath);
        {$ENDIF}

        Par := Lc_Param;
        execute;
        Cabecalho;
        Search;
        Qrpt.ExportToFilter(TQRPDFDocumentFilter.Create(LcPath));
      End;
    finally
      Form.Close;
      Form.DisposeOf;
      Lc_Param.Resultado := True;
      Lc_Param.url := LcUrl;
      Result := TJson.ObjectToJsonString(Lc_Param);
    end;
  except
    Lc_Param.Resultado := False;
    Lc_Param.url := '';
  end;
end;

function TSMGeneral.GetOrderPurchase(par: String): String;
Var
  Form : TRepOrderPurchase_01;
  LcUrl : String;
  LcPath : String;
  LcFile : String;
  Lc_Param : TPrmRepOrder;
begin
  try
    try
      Form := TRepOrderPurchase_01.Create(nil);
      Lc_Param := TPrmRepOrder.Create;
      with Form do
      Begin
        Lc_Param := TJSON.JsonToObject<TPrmRepOrder>(par);
        FEstabelecimento.Registro.Codigo := Lc_Param.Estabelecimento;
        FEstabelecimento.User.Registro.Codigo := Lc_Param.Usuario;
        FEstabelecimento.getAllByKey;
        FEstabelecimento.getRepository(False,'');

        LcFile := concat('pedidocompra_',
                        FEstabelecimento.GeneratePrimaryKey,
                        '.pdf');

        LcUrl := concat(FEstabelecimento.URL,FEstabelecimento.User.Registro.codigo.ToString,'/', LcFile );
        LcPath := concat(FEstabelecimento.PathPublico,FEstabelecimento.User.Registro.codigo.ToString,'\', LcFile );
        {$IFDEF DEBUG}
        LcUrl := concat('file:///',LcPath);
        {$ENDIF}

        CodigoRegistro := Lc_Param.Codigo;
        execute;
        Qrpt.ExportToFilter(TQRPDFDocumentFilter.Create(LcPath));
      End;
    finally
      Form.Close;
      Form.DisposeOf;
      Lc_Param.Resultado := True;
      Lc_Param.url := LcUrl;
      Result := TJson.ObjectToJsonString(Lc_Param);

    end;
  except
    Lc_Param.Resultado := False;
    Lc_Param.url := '';
  end;
end;

function TSMGeneral.GetOrderPacking(par: String): String;
Var
  Form : TRepOrderPacking_01;
  LcUrl : String;
  LcPath : String;
  Lc_Param : TPrmRepOrder;
  LcFile : String;
begin
  try
    try
      Form := TRepOrderPacking_01.Create(nil);
      Lc_Param := TPrmRepOrder.Create;
      with Form do
      Begin
        Lc_Param := TJSON.JsonToObject<TPrmRepOrder>(par);
        FEstabelecimento.Registro.Codigo := Lc_Param.Estabelecimento;
        FEstabelecimento.User.Registro.Codigo := Lc_Param.Usuario;
        LcFile := concat('pedidocompra_',
                        FEstabelecimento.GeneratePrimaryKey,
                        '.pdf');
        FEstabelecimento.getRepository(False,'');
        LcUrl := concat(FEstabelecimento.URL,FEstabelecimento.User.Registro.codigo.ToString,'/', LcFile );
        LcPath := concat(FEstabelecimento.PathPublico,FEstabelecimento.User.Registro.codigo.ToString,'\', LcFile );
        {$IFDEF DEBUG}
        LcUrl := concat('file:///',LcPath);
        {$ENDIF}

        CodigoRegistro := Lc_Param.Codigo;
        execute;
        Qrpt.ExportToFilter(TQRPDFDocumentFilter.Create(LcPath));
      End;
    finally
      Form.Close;
      Form.DisposeOf;
      Lc_Param.Resultado := True;
      Lc_Param.url := LcUrl;
      Result := TJson.ObjectToJsonString(Lc_Param);

    end;
  except
    Lc_Param.Resultado := False;
    Lc_Param.url := '';
  end;
end;


function TSMGeneral.GetOrderStockTransfer(par: String): String;
Var
  Form : TRepOrderStockTransfer_01;
  LcUrl : String;
  LcPath : String;
  Lc_Param : TPrmRepOrder;
  LcFile : String;
begin
  try
    try
      Form := TRepOrderStockTransfer_01.Create(nil);
      Lc_Param := TPrmRepOrder.Create;
      with Form do
      Begin
        Lc_Param := TJSON.JsonToObject<TPrmRepOrder>(par);
        FEstabelecimento.Registro.Codigo := Lc_Param.Estabelecimento;
        FEstabelecimento.USer.Registro.codigo          := Lc_Param.Usuario;
        LcFile := concat('pedidocompra_',
                        FEstabelecimento.GeneratePrimaryKey,
                        '.pdf');
        FEstabelecimento.getRepository(False,'');
        LcUrl := concat(FEstabelecimento.URL,FEstabelecimento.User.Registro.codigo.ToString,'/', LcFile );
        LcPath := concat(FEstabelecimento.PathPublico,FEstabelecimento.User.Registro.codigo.ToString,'\', LcFile );
        {$IFDEF DEBUG}
        LcUrl := concat('file:///',LcPath);
        {$ENDIF}

        CodigoRegistro := Lc_Param.Codigo;
        execute;
        Qrpt.ExportToFilter(TQRPDFDocumentFilter.Create(LcPath));
      End;
    finally
      Form.Close;
      Form.DisposeOf;
      Lc_Param.Resultado := True;
      Lc_Param.url := LcUrl;
      Result := TJson.ObjectToJsonString(Lc_Param);

    end;
  except
    Lc_Param.Resultado := False;
    Lc_Param.url := '';
  end;
end;

function TSMGeneral.GetProductFile(par: string): string;
Var
  Form : TRepProductFile;
  LcUrl : String;
  LcPath : String;
  Lc_Param : TPrmPrintProduct;
  LcFile : String;
begin
  try
    try
      Form := TRepProductFile.Create(nil);
      Lc_Param := TPrmPrintProduct.Create;
      With Form do
      Begin
        Lc_Param := TJSON.JsonToObject<TPrmPrintProduct>(par);
        FEstabelecimento.Registro.Codigo := Lc_Param.Estabelecimento;
        FEstabelecimento.USer.Registro.codigo        := Lc_Param.Usuario;
        //somente para teste locais

        LcFile := concat('productFile_',
                        FEstabelecimento.GeneratePrimaryKey,
                        '.pdf');
        LcUrl := concat(FEstabelecimento.PathPublico, LcFile );
        LcPath := concat(FEstabelecimento.PathPrivado, LcFile);


        LcParam := Lc_Param;
        execute;
        Cabecalho;
        Search;
        Qrpt.ExportToFilter(TQRPDFDocumentFilter.Create(LcPath));
      End;
    finally
      Form.Close;
      Form.DisposeOf;
      Lc_Param.Resultado := True;
      Lc_Param.url := LcUrl;
      Result := TJson.ObjectToJsonString(Lc_Param);

    end;
  except
    Lc_Param.Resultado := False;
    Lc_Param.url := '';
  end;


end;

function TSMGeneral.GetProviderFile(par: string): string;
Var
  Form : TRepProviderFile;
  LcUrl : String;
  LcPath : String;
  Lc_Param : TPrmPrintEntities;
  LcFile : String;
begin
  try
    try
      Form := TRepProviderFile.Create(nil);
      Lc_Param := TPrmPrintEntities.Create;
      Lc_Param := TJSON.JsonToObject<TPrmPrintEntities>(par);
      with Form do
      Begin
        FEstabelecimento.Registro.Codigo := Lc_Param.Estabelecimento;
        FEstabelecimento.USer.Registro.codigo          := Lc_Param.Usuario;
        //somente para teste locais

        LcFile := concat('providerList_',
                        FEstabelecimento.GeneratePrimaryKey,
                        '.pdf');
        LcUrl := concat(FEstabelecimento.URL,FEstabelecimento.User.Registro.codigo.ToString,'/', LcFile );
        LcPath := concat(FEstabelecimento.PathPublico,FEstabelecimento.User.Registro.codigo.ToString,'\', LcFile );
        {$IFDEF DEBUG}
        LcUrl := concat('file:///',LcPath);
        {$ENDIF}

        Par := Lc_Param;
        execute;
        Cabecalho;
        Search;
        Qrpt.ExportToFilter(TQRPDFDocumentFilter.Create(LcPath));
      End;
    finally
      Form.Close;
      Form.DisposeOf;
      Lc_Param.Resultado := True;
      Lc_Param.url := LcUrl;
      Result := TJson.ObjectToJsonString(Lc_Param);
    end;
  except
    Lc_Param.Resultado := False;
    Lc_Param.url := '';
  end;
end;


end.
