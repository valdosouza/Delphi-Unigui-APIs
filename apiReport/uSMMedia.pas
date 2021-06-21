unit uSMMedia;

interface

uses System.SysUtils, System.Classes, System.Json,
    uSM,
    REST.json, tblentity, ControllerAgency,
  ObjAgency,ControllerInstitution, un_frx_bud_advertise, un_qrp_bud_advertise;

type
  {$METHODINFO ON}
  TSMMedia = class(TSM)
  private

  public

    //Pedido de Inserção
    function GetOrderPI(par:String):String;
    function GetVisualizacaoPecas(par:String):String;
    function GetCotacaoOnline(par:String):String;

  end;
  {$METHODINFO OFF}

implementation

uses
  un_frx_report_media_parts, prm_print_media_parts, rep_order_pi_02,
  prm_rep_order, QRPDFFilt, prm_rep_budg_advertise, MainModule;


{ TSMMedia }

function TSMMedia.GetCotacaoOnline(par: String): String;
Var
  Form : TQrpBudAdvertise;
  LcUrl : String;
  LcPath : String;
  Lc_file : String;
  Lc_Param : TPrmRepBudgAdvertise;
begin
  try
    Lc_Param := TPrmRepBudgAdvertise.Create;
    Form := TQrpBudAdvertise.Create(nil);
    With Form do
    Begin
      Lc_Param :=  TJSON.JsonToObject<TPrmRepBudgAdvertise>(par);
      PArametro := Lc_Param;
      FEstabelecimento.Registro.Codigo      := Lc_Param.Estabelecimento;
      FEstabelecimento.USer.Registro.codigo := Lc_Param.Usuario;
      FEstabelecimento.getRepository(False,'');
      //somente para teste locais

      Lc_file := concat('budAdvertise_',
                      FEstabelecimento.GeneratePrimaryKey,
                      '.pdf');
      Lc_Param.Arquivo := Lc_file;
      if ( Lc_Param.Local = 'standard' ) then
      Begin
        LcPath := concat(FEstabelecimento.PathPublico, Lc_File );
        LcUrl := concat(FEstabelecimento.URL, Lc_File );
      End
      else
      Begin
        LcPath := concat('C:\gestaoweb\appsweb\cotacaoonline\files\', Lc_file);
      End;
      {$IFDEF DEBUG}
      LcPath := concat('D:\Bin\appsweb\cotacaoonline\files\', Lc_file);
      {$ENDIF}
      execute;
      //Cabecalho;
      Composicao.ExportToFilter(TQRPDFDocumentFilter.Create(LcPath));
    End;
  finally
    Form.Close;
    Form.DisposeOf;
    Lc_Param.Resultado := True;
    Lc_Param.Publico := LcPath;//Caso especifico devolver somente o nome do arquivo
    Lc_Param.URL := LcUrl;
    Result := TJson.ObjectToJsonString(Lc_Param);
  end;
end;

function TSMMedia.GetOrderPI(par: String): String;
Var
  Form : TRepOrderPi_02;
  Lc_Param : TPrmRepOrder;
  LcFile : String;
  LcPath,LcURl : STring;
begin
  Try
    Form := TRepOrderPi_02.Create(nil);
    Lc_Param := TJSON.JsonToObject<TPrmRepOrder>(par);
    try
      with Form do
      Begin
        FEstabelecimento.Registro.Codigo := Lc_Param.Estabelecimento;
        FEstabelecimento.USer.Registro.codigo := Lc_Param.Usuario;
        FEstabelecimento.getbyKey;
        LcFile := concat('pedPI_',
                        FEstabelecimento.GeneratePrimaryKey,
                        '.pdf');

        FEstabelecimento.getRepository(False,'');
        LcUrl := concat(FEstabelecimento.URL, LcFile );
        LcPath := concat(FEstabelecimento.PathPublico, LcFile );
        {$IFDEF DEBUG}
        LcUrl := concat('file:///',LcPath);
        {$ENDIF}
        CodigoRegistro := Lc_Param.Codigo;
        Qrpt.Zoom := 100;
        execute;
        //Form.GeraRelatorioPF;
        Qrpt.ExportToFilter(TQRPDFDocumentFilter.Create(LcPath));

        Lc_Param.Resultado := True;
      End;
    except
      on E : Exception do
      Begin
        Lc_Param.Resultado := False ;
        Geralog('TSMMedia.GetOrderPI',E.Message);
      End;
    end;
  Finally
    Form.Close;
    Form.DisposeOf;
    Lc_Param.url := LcURl;
    Result := TJson.ObjectToJsonString(Lc_Param);
  End;


end;

function TSMMedia.GetVisualizacaoPecas(par: String): String;
Var
  Form : TFrxReportMediaParts;
  LcUrl : String;
  LcPath : String;
  Lc_Param : TPrmPrintMediaParts;
  LcFile : String;
begin
  Try
    try
      try
        Form := TFrxReportMediaParts.Create(nil);
        Lc_Param := TPrmPrintMediaParts.Create;
        Lc_Param := TJSON.JsonToObject<TPrmPrintMediaParts>(par);
        with Form do
        Begin
          FEstabelecimento.Registro.Codigo := Lc_Param.Estabelecimento;
          FEstabelecimento.USer.Registro.codigo := Lc_Param.Usuario;
          FEstabelecimento.getALlByKey;
          FEstabelecimento.getRepository(False,'');
          LcFile := concat('MediaViewParts_',
                          FEstabelecimento.GeneratePrimaryKey,
                          '.pdf');
          LcUrl := concat(FEstabelecimento.URL,LcFile );
          LcPath := concat(FEstabelecimento.PathPublico, LcFile );
          {$IFDEF DEBUG}
          LcUrl := concat('file:///',LcPath);
          {$ENDIF}
          Titulo := 'Visualização de Peças';
          Par := Lc_Param;
          Path := LcPath;
          execute;
        End;
      except
        on E : Exception do
          Geralog('TSMMedia.GetVisualizacaoPecas',E.Message);
      end;
    finally
      Form.Close;
      Form.DisposeOf;
      Lc_Param.Resultado := True;
      Lc_Param.url := LcURl;
      Result := TJson.ObjectToJsonString(Lc_Param);
    end;
  except
    on E : Exception do
    Begin
      Lc_Param.Resultado := False;
      Lc_Param.url := E.Message;
    End;
  end;


end;

end.

