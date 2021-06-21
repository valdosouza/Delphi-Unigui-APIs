unit uSMFinancial;

interface

uses System.SysUtils, System.Classes, System.Json,
    uSM,
    REST.json, tblentity, ControllerAgency,
  ObjAgency,ControllerInstitution, un_frx_bud_advertise, un_qrp_bud_advertise,
  rep_financial_media_to_receive, rep_financial_media_to_receive_all,
  rep_financial_media_to_receive_open, rep_financial_media_to_receive_closed,
  prm_print_financial_media, rep_financial_bills,
  rep_financial_payment,prm_print_financial,un_frx_report_financial_manager,
  QRPDFFilt;

type
  {$METHODINFO ON}
  TSMFinancial = class(TSM)
  private

  public

    //Pedido de Inserção
    //Financeiro
    function GetFinancialBills(par: string): string;
    function GetFinancialPayment(par: string): string;
    function GetFinancialRealManager(par: string): string;
    function GetFinancialToReceiveMedia(par: string): string;
    function GetFinancialMediaToReceiveOpen(par: string): string;
    function GetFinancialMediaToReceiveClosed(par: string): string;
    function GetFinancialMediaToReceiveAll(par: string): string;

  end;
  {$METHODINFO OFF}

implementation

{ TSMFinancial }

uses UnFunctions;

function TSMFinancial.GetFinancialBills(par: string): string;
Var
  Form : TRepFinancialBills;
  LcUrl : String;
  LcPath : String;
  Lc_Param : TPrmPrintFinancial;
  LcFile : String;
begin
  try
    try
      Form := TRepFinancialBills.Create(nil);
      Lc_Param := TPrmPrintFinancial.Create;
      Lc_Param := TJSON.JsonToObject<TPrmPrintFinancial>(par);
      With Form do
      Begin
        FEstabelecimento.Registro.Codigo      := Lc_Param.Estabelecimento;
        FEstabelecimento.User.Registro.Codigo := Lc_Param.Usuario;
        FEstabelecimento.getAllByKey;
        FEstabelecimento.getRepository(False,'');

        //somente para teste locais
        LcFile := concat('finBills_',
                        FEstabelecimento.GeneratePrimaryKey,
                        '.pdf');
        FEstabelecimento.getRepository(False,'');
        LcUrl := concat(FEstabelecimento.URL, LcFile );
        LcPath := concat(FEstabelecimento.PathPublico, LcFile );
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

function TSMFinancial.GetFinancialMediaToReceiveAll(par: string): string;
Var
  Form : TRepFinancialMediaToRreceiveAll;
  Lc_Param : TPrmPrintFinancialMedia;
  LcFile : String;
  LcPath,LcURl : STring;
begin
  Try
    try
      Form := TRepFinancialMediaToRreceiveAll.Create(nil);
      Lc_Param := TPrmPrintFinancialMedia.Create;
      Lc_Param := TJSON.JsonToObject<TPrmPrintFinancialMedia>(par);
      with Form do
      Begin
        FEstabelecimento.clear;
        FEstabelecimento.Registro.Codigo := Lc_Param.Estabelecimento;
        FEstabelecimento.USer.Registro.codigo := Lc_Param.Usuario;
        FEstabelecimento.getallByKey;
        FEstabelecimento.getRepository(False,'');
        LcFile := concat('FinancialMediaToReceiveAll_',
                        FEstabelecimento.GeneratePrimaryKey,
                        '.pdf');

        LcUrl := concat(FEstabelecimento.URL, LcFile );
        LcPath := concat(FEstabelecimento.PathPublico, LcFile );
        {$IFDEF DEBUG}
        LcUrl := concat('file:///',LcPath);
        {$ENDIF}
        par := Lc_Param;
        Qrpt.ReportTitle := concat(
                                  'RELATÓRIO DE FATURAMENTO        PERÍODO APURADO  ',
                                  DateToStr(Lc_Param.DataInicial) ,' À ' ,
                                  DateToStr(Lc_Param.DataFinal)
                            );
        Qrpt.Zoom := 100;
        execute;
        Cabecalho;
        Search;
        //Form.GeraRelatorioPF;
        Qrpt.ExportToFilter(TQRPDFDocumentFilter.Create(LcPath));
      End;
      Lc_Param.Resultado := True;
      Lc_Param.url := LcURl;
    except
      on E : Exception do
      BEgin
        LogTarefasDelphi(concat('GetFinancialMediaToReceiveAll : ',E.Message));
        Lc_Param.Resultado := False;
        Lc_Param.url := E.Message;
      End;
    end;
  Finally
    Form.Close;
    Form.DisposeOf;
    Result := TJson.ObjectToJsonString(Lc_Param);
  End;


end;

function TSMFinancial.GetFinancialMediaToReceiveClosed(par: string): string;
Var
  Form : TRepFinancialMediaToRreceiveClosed;
  Lc_Param : TPrmPrintFinancialMedia;
  LcFile : String;
  LcPath,LcURl : STring;
begin
  Try
    try
      Form := TRepFinancialMediaToRreceiveClosed.Create(nil);
      Lc_Param := TPrmPrintFinancialMedia.Create;
      Lc_Param := TJSON.JsonToObject<TPrmPrintFinancialMedia>(par);
      with Form do
      Begin
        FEstabelecimento.clear;
        FEstabelecimento.Registro.Codigo := Lc_Param.Estabelecimento;
        FEstabelecimento.USer.Registro.codigo := Lc_Param.Usuario;
        FEstabelecimento.getAllByKey;
        FEstabelecimento.getRepository(False,'');
        LcFile := concat('FinancialMediaToReceiveClosed_',
                        FEstabelecimento.GeneratePrimaryKey,
                        '.pdf');

        LcUrl := concat(FEstabelecimento.URL, LcFile );
        LcPath := concat(FEstabelecimento.PathPublico, LcFile );
        {$IFDEF DEBUG}
        LcUrl := concat('file:///',LcPath);
        {$ENDIF}
        par := Lc_Param;
        Qrpt.ReportTitle := concat(
                                      'RELATÓRIO DE BAIXA DE COMISSÕES /VEÍCULO         PERÍODO APURADO  ',
                                      DateToStr(Lc_Param.DataInicial) ,' À ' ,
                                      DateToStr(Lc_Param.DataFinal)
                              );
        Qrpt.Zoom := 100;
        execute;
        Cabecalho;
        Search;
        //Form.GeraRelatorioPF;
        Form.Qrpt.ExportToFilter(TQRPDFDocumentFilter.Create(LcPath));
      End;
      Lc_Param.Resultado := True;
      Lc_Param.url := LcURl;
    except
      on E : Exception do
      Begin
        LogTarefasDelphi(concat('GetFinancialMediaToReceiveClosed : ',E.Message));
        Lc_Param.Resultado := False;
        Lc_Param.url := E.Message;
      End;
    end;
  Finally
    Form.close;
    Form.DisposeOf;
    Result := TJson.ObjectToJsonString(Lc_Param);
  End;


end;

function TSMFinancial.GetFinancialMediaToReceiveOpen(par: string): string;
Var
  Form : TRepFinancialMediaToRreceiveOpen;
  Lc_Param : TPrmPrintFinancialMedia;
  LcFile : String;
  LcPath,LcURl : STring;
begin
  Try
    try
      Form := TRepFinancialMediaToRreceiveOpen.Create(nil);
      Lc_Param := TPrmPrintFinancialMedia.Create;
      Lc_Param := TJSON.JsonToObject<TPrmPrintFinancialMedia>(par);
      With Form do
      Begin
        FEstabelecimento.Clear;
        FEstabelecimento.Registro.Codigo := Lc_Param.Estabelecimento;
        FEstabelecimento.User.Registro.Codigo := Lc_Param.Usuario;
        FEstabelecimento.getRepository(False,'');
        FEstabelecimento.getALlByKey;
        FEstabelecimento.USer.Registro.codigo := Lc_Param.Usuario;

        LcFile := concat('FinancialMediaToReceiveOpen_',
                        FEstabelecimento.GeneratePrimaryKey,
                        '.pdf');

        LcUrl := concat(FEstabelecimento.URL, LcFile );
        LcPath := concat(FEstabelecimento.PathPublico, LcFile );
        {$IFDEF DEBUG}
        LcUrl := concat('file:///',LcPath);
        {$ENDIF}
        par := Lc_Param;
        Qrpt.ReportTitle := concat(
                                      'RELATÓRIO COMISSÕES EM ABERTO/VEICULO         PERÍODO APURADO  ',
                                      DateToStr(Lc_Param.DataInicial) ,' À ' ,
                                      DateToStr(Lc_Param.DataFinal)
                      );
        Qrpt.Zoom := 100;
        execute;
        Cabecalho;
        Search;
        Qrpt.ExportToFilter(TQRPDFDocumentFilter.Create(LcPath));
      End;
      Lc_Param.Resultado := True;
      Lc_Param.url := LcURl;
    except
      on E : Exception do
      Begin
        LogTarefasDelphi(concat('GetFinancialMediaToReceiveOpen : ',E.Message));
        Lc_Param.Resultado := False;
        Lc_Param.url := E.Message;
      End;
    end;
  Finally
    Form.Close;
    Form.DisposeOf;
    Result := TJson.ObjectToJsonString(Lc_Param);
  End;


end;

function TSMFinancial.GetFinancialPayment(par: string): string;
Var
  Form : TRepFinancialPayment;
  LcUrl : String;
  LcPath : String;
  Lc_Param : TPrmPrintFinancial;
  LcFile : String;
begin
  try
    try
      Form := TRepFinancialPayment.Create(nil);
      Lc_Param := TPrmPrintFinancial.Create;
      Lc_Param := TJSON.JsonToObject<TPrmPrintFinancial>(par);
      with Form do
      Begin
        FEstabelecimento.Registro.Codigo := Lc_Param.Estabelecimento;
        FEstabelecimento.User.Registro.Codigo := Lc_Param.Usuario;
        FEstabelecimento.getAllByKey;
        FEstabelecimento.getRepository(False,'');

        //somente para teste locais
        LcFile := concat('finPayment_',
                      FEstabelecimento.GeneratePrimaryKey,
                      '.pdf');
        FEstabelecimento.getRepository(False,'');
        LcUrl := concat(FEstabelecimento.URL, LcFile );
        LcPath := concat(FEstabelecimento.PathPublico, LcFile );
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

function TSMFinancial.GetFinancialRealManager(par: string): string;
Var
  Form : TFrxReportFinancialManager;
  LcUrl : String;
  LcPath : String;
  Lc_Param : TPrmPrintFinancial;
  LcFile : String;
begin
  try
    try
      Form := TFrxReportFinancialManager.Create(nil);
      Lc_Param := TPrmPrintFinancial.Create;
      Lc_Param := TJSON.JsonToObject<TPrmPrintFinancial>(par);
      with Form do
      Begin
        FEstabelecimento.Registro.Codigo := Lc_Param.Estabelecimento;
        FEstabelecimento.User.Registro.Codigo := Lc_Param.Usuario;
        FEstabelecimento.USer.Registro.codigo        := Lc_Param.Usuario;
        FEstabelecimento.getAllByKey;
        FEstabelecimento.getRepository(False,'');

        LcFile := concat('finRealFinancialManager_',
                        FEstabelecimento.GeneratePrimaryKey,
                        '.pdf');
        LcUrl := concat(FEstabelecimento.URL, LcFile );
        LcPath := concat(FEstabelecimento.PathPublico, LcFile );
        {$IFDEF DEBUG}
        LcUrl := concat('file:///',LcPath);
        {$ENDIF}

        Titulo := 'Relatório Gerencial - Realizado';
        Par := Lc_Param;
        Path := LcPath;
        execute;
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

function TSMFinancial.GetFinancialToReceiveMedia(par: string): string;
Var
  Form : TRepFinancialMediaToReceive;
  Lc_Param : TPrmPrintFinancialMedia;
  LcFile : String;
  LcPath,LcURl : STring;
begin
  Try
    try
      try
        Form := TRepFinancialMediaToReceive.Create(nil);
        Lc_Param := TPrmPrintFinancialMedia.Create;
        Lc_Param := TJSON.JsonToObject<TPrmPrintFinancialMedia>(par);
        with Form do
        Begin
          FEstabelecimento.Registro.Codigo := Lc_Param.Estabelecimento;
          FEstabelecimento.USer.Registro.codigo := Lc_Param.Usuario;
          FEstabelecimento.getAllByKey;
          FEstabelecimento.getRepository(False,'');
          LcFile := concat('FinancialMediaToReceive_',
                          FEstabelecimento.GeneratePrimaryKey,
                          '.pdf');

          LcUrl := concat(FEstabelecimento.URL, LcFile );
          LcPath := concat(FEstabelecimento.PathPublico, LcFile );
          {$IFDEF DEBUG}
          LcUrl := concat('file:///',LcPath);
          {$ENDIF}
          par := Lc_Param;
          Qrpt.Zoom := 100;
          execute;
          Cabecalho;
          Search;
          //Form.GeraRelatorioPF;
          Qrpt.ExportToFilter(TQRPDFDocumentFilter.Create(LcPath));
        End;
        Form.Close;
        Lc_Param.Resultado := True;
        Lc_Param.url := LcURl;
      except
        on E : Exception do
        Begin
          LogTarefasDelphi(concat('GetFinancialToReceiveMedia : ',E.Message));
          Lc_Param.Resultado := False;
          Lc_Param.url := E.Message;
        End;
      end;
    finally
    end;
  Finally
    Form.Close;
    Form.DisposeOf;
    Result := TJson.ObjectToJsonString(Lc_Param);
  End;


end;

end.
