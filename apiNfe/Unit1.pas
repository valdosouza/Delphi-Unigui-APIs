unit Unit1;

interface

type
  ttributacao = class(TComponent)

  private
    { Private declarations }
    Procedure Pc_Obs_Regra_Geral;
    procedure Pc_Obs_CST00;
    procedure Pc_Obs_CST10;
    procedure Pc_Obs_CST20;
    procedure Pc_Obs_CST30;
    procedure Pc_Obs_CST40;
    procedure Pc_Obs_CST50;
    procedure Pc_Obs_CST60;
    procedure Pc_Obs_CST70;
    procedure Pc_Obs_CST80;
    procedure Pc_Obs_CST90;
    procedure Pc_Obs_CSOSN101;
    procedure Pc_Obs_CSOSN102;
    procedure Pc_Obs_CSOSN103;
    procedure Pc_Obs_CSOSN201;
    procedure Pc_Obs_CSOSN202;
    procedure Pc_Obs_CSOSN203;
    procedure Pc_Obs_CSOSN300;
    procedure Pc_Obs_CSOSN400;
    procedure Pc_Obs_CSOSN500;
    procedure Pc_Obs_CSOSN900;
    procedure Pc_Obs_ISSQN;
    Function Fc_Obs_ImpostoAproximado():TStringList;
    procedure Pc_InfoRevendaVeiculos(Pc_Lista: TMemo;Pc_Cd_Pedido:integer);
    function Fc_GeraNumeroNota():Integer;
    procedure Pc_AtualizarItensNota(Pc_Qry:Tibquery);
    procedure Pc_AtualizarItensICMS(Pc_Qry:Tibquery;Pc_Item:TDetCollectionItem);
    procedure Pc_AtualizarItensIPI(Pc_Qry:Tibquery; Pc_Item:TDetCollectionItem);
    procedure Pc_AtualizarItensPIS(Pc_Qry:Tibquery;Pc_Item:TDetCollectionItem);
    procedure Pc_AtualizarItensCOFINS(Pc_Qry:Tibquery;Pc_Item:TDetCollectionItem);
    procedure Pc_AtualizarItensISSQN(Pc_Qry:Tibquery;Pc_Item:TDetCollectionItem);

  protected

    //Variveis para Calculo de tributaçao do ISS
    It_CODTRIBUT : String;
    It_CODSRV116 : String;
    It_AQ_NR_ISS : Real;

    //codigo do Regime Tributario
    It_Cd_CRT : Integer;
    //Verifica se é usuario de Nfe
    It_Usa_Nfe : Boolean;
    //Casas decimais
    It_Casa_Decimal : Integer;



    function Fc_VerificaEntregaDiferente(): Boolean;

  public
    { Public declarations }
    It_Nfe: TACBrNFe;

    //ICMS Permissão de Credito Simples Nacional
    It_Aq_Cred_Icms : REal;
    It_Contribuinte_ICMS : boolean;
    //Variveis para Calcular o Sub. tributaria
    It_Subst_Tributario : Boolean;

    //Repassados da Interface
    It_Decreto108352014 : Boolean;
    it_SomaIPI_Bs_ICMS : Boolean;
    It_SomaIPI_Bs_ICMS_St : Boolean;
    UtilizarMvaOrginal : Boolean;
    It_SomaICMSNaNota : Boolean;
    It_Dist_IPI : Boolean;
    It_Cd_Transportadora:Integer;
    It_Modal_Frete:Integer;
    It_data_saida : Boolean;
    It_Nr_Nota  : Integer;
    It_Dt_Emissao : TDate;
    It_Dt_Saida : TDate;
    It_Qt_Produto:REal;
    It_Especie : String;
    It_Marca : String;
    It_PesoBruto : String;
    It_PesoLiquido : String;
    It_Volume : String;
    It_PlacaVeiculo : String;
    It_Uf_Veiculo : String;
    It_RNTC  : String;
    It_Despachar : String;

    function Fc_DefineTributacao():Integer;

    procedure Pc_Gera_NotaFiscal;
    procedure Pc_AtualizarItens;

    procedure Pc_Obs_NotaFiscal(Pc_Obs:TMemo);
    procedure Pc_Obs_NF_Servico(Pc_Obs:TMemo);
    procedure Pc_CriaSqlTributacao;
    procedure Pc_CriaConsultas;

    procedure Pc_PreencheDadosDanfe;
  end;

procedure Register;

implementation

procedure ttributacao.Pc_Gera_NotaFiscal;
var
  Lc_SerieNF: Integer;
  Lc_Data : String;
  Lc_Nfl_Tipo : String;
  Lc_Modelo : String;
begin
  IF It_Usa_Nfe then
  Begin
    If (Qr_Estabelecimento.FieldByName('NFE_EMISSAO').AsInteger = 2) then
      Lc_SerieNF := 900
    else
      Lc_SerieNF := 1;
  end
  else
  Begin
    Lc_SerieNF := 1;
  end;
  //Registra do modelo da nota impressa
  if It_AutorizacaoNFCE then
    Lc_Modelo := '65'
  else
    Lc_Modelo := '55';

  if It_Sentido = 'S' then
  Begin
    Lc_Nfl_Tipo := 'SI';
  end
  else
  Begin
    if It_AutorizacaoNFE then
      Lc_Nfl_Tipo := 'EI'
    else
      Lc_Nfl_Tipo := 'EE';
  end;

  if It_data_saida then
    Lc_Data := DatetoStr(It_Dt_Saida)
  else
    Lc_Data := '';
  It_Cd_Nota := Fc_Generator(It_BD_Gestao,It_Bd_Faturamento,'GN_NOTA_FISCAL','NFL_CODIGO');
  //Gerar Nota Fiscal
  with It_Nfe.NotasFiscais[0].NFe do
  Begin
    //Soma o ICMS no valor total da Nota
    if It_SomaICMSNaNota then
      Total.ICMSTot.vNF := Total.ICMSTot.vNF + Total.ICMSTot.vICMS;
    Pc_NotaFiscal(It_BD_Gestao,
                  It_Bd_Faturamento,
                  It_Cd_Nota,
                  Lc_Nfl_Tipo,
                  It_Finalidade,
                  StrZero(It_Nr_Nota, 6,0),
                  Lc_SerieNF,
                  Lc_Modelo,
                  It_Cd_CFOP,
                  IT_CD_Pedido,
                  Qr_Pedido.FieldByName('EMP_CODIGO').AsInteger,
                  It_Dt_Emissao,
                  Lc_Data,
                  time,
                  Total.ICMSTot.vBC,
                  Total.ICMSTot.vICMS,
                  Total.ICMSTot.vBCST,
                  Total.ICMSTot.vST,
                  Total.ICMSTot.vProd,
                  Total.ICMSTot.vFrete,
                  Total.ICMSTot.vseg,
                  Total.ICMSTot.vOutro,
                  Total.ICMSTot.vIPI,
                  Total.ICMSTot.vNF,
                  It_Cd_Transportadora,
                  It_Modal_Frete,
                  It_Qt_Produto,
                  It_Especie,
                  It_Marca,
                  It_PesoBruto,
                  It_PesoLiquido,
                  'N',
                  '',
                  'F',
                  Total.ISSQNtot.vServ,
                  Total.ISSQNtot.vISS,
                  Total.ISSQNtot.vISSRet,
                  It_Volume,
                  It_PlacaVeiculo,
                  It_Uf_Veiculo,
                  It_RNTC,
                  It_CodMha);
  end;
end;









function ttributacao.Fc_VerificaEntregaDiferente(): Boolean;
var
  Lc_SqlTxt: String;
  Lc_Cd_Endereco, Lc_Cd_Entrega: Integer;
  Lc_qt_Endereco : Integer;
  Lc_Qry:TIBQuery;
begin
  Result:=true;
  Lc_Qry := TIBQuery.Create(nil);
  with Lc_Qry do
    Begin
    Database := It_BD_Gestao;
    Transaction := It_Bd_transacao;
    ForcedRefresh := True;
    CachedUpdates := True;
    close;
    Sql.Clear;
    Lc_SqlTxt := 'SELECT '+
                 '   END_CODIGO, '+
                 '   END_PRINCIPAL '+
                 'FROM TB_ENDERECO EDD '+
                 'WHERE END_CODEMP =:END_CODEMP ';

    SQL.Add(Lc_SqlTxt);
    ParamByName('END_CODEMP').AsInteger := Qr_Pedido.fieldByName('PED_CODEMP').AsInteger;
    Active := True;
    FetchAll;
    First;
    Lc_qt_Endereco := RecordCount;
    if Lc_qt_Endereco > 1 then
      Locate('END_PRINCIPAL','S',[]);
    Lc_Cd_Endereco := FieldByName('END_CODIGO').AsInteger;

    Active := False;
    Sql.Clear;
    Lc_SqlTxt := '';
    Lc_SqlTxt := 'SELECT                                  '+
                 '  END_CODIGO,                           '+
                 '  END_CNPJ,                             '+
                 '  EMP_PESSOA,                           '+
                 '  PED_CODEND                            '+
                 'FROM TB_ENDERECO EDD                    '+
                 '  INNER JOIN TB_PEDIDO PED              '+
                 '  ON (PED.PED_CODEND = EDD.END_CODIGO)  '+
                 '  INNER JOIN TB_EMPRESA                 '+
                 '  ON (EMP_CODIGO = PED.PED_CODEMP)      '+
                 'WHERE PED.PED_CODIGO=:PED_CODIGO        ';

    SQL.Add(Lc_SqlTxt);
    ParamByName('PED_CODIGO').AsInteger := It_Cd_Pedido;
    Active := True;
    FetchAll;

    //Neste caso tem apenas um endereço e não precisa comparar
    if (Lc_qt_Endereco = 1) then
      Begin
      Result := true;
      Exit;
      end;

    Lc_Cd_Entrega  := FieldByName('PED_CODEND').AsInteger;

    If Lc_cd_Endereco <> Lc_cd_Entrega then
      Begin
      if FieldByName('EMP_PESSOA').AsString = 'J' then
        Begin
        if not (Fc_Valida_CNPJ(TRIM(FieldByName('END_CNPJ').AsString),'endereço de entrega')) then
          begin
          Result := False;
          exit;
          end;
        end;
      if FieldByName('EMP_PESSOA').AsString = 'F' then
        Begin
        IF Trim(FieldByName('END_CNPJ').AsString) <> '' then
          Begin
          if not (Fc_Valida_CPF(TRIM(FieldByName('END_CNPJ').AsString),'endereço de entrega')) then
            begin
            Result := False;
            exit;
            end;
          end;
        end;
      end;
    END;
end;


procedure ttributacao.Pc_PreencheDadosDanfe;
Var
  Lc_Aux : String;
  Lc_Cfop : String;
  Lc_Nr_Item : integer;
  Lc_Vl_BaseImpostoAprox:REal;
  Lc_Vl_Pedido : Real;
  Lc_Tx_Prop : Real;
  Lc_VL_Bs_Icms : Real;
  Lc_VL_Icms : Real;
  Lc_Aq_Icms : Real;
  Lc_VL_Bs_IcmsST : Real;
  Lc_VL_IcmsST : Real;
  Lc_VL_Bs_IPI : Real;
  Lc_VL_IPI : Real;
  Lc_Vl_Frete :Real;
  Lc_Vl_Seguro :Real;
  Lc_Vl_Outro :Real;
  Lc_Contador : Integer;
  Lc_Ok : Boolean;
  LC_VL : REal;
Begin
  Pc_DefineCasaDecimal;
  Lc_Vl_Pedido := Fc_CalculaTotalPedido;
  It_Cd_Crt := Qr_Estabelecimento.FieldByName('EMP_CRT').AsInteger;
  It_Contribuinte_ICMS := (Length(Trim(Qr_Pedido.FieldByName('EMP_INSC_EST').AsString))>0);
  Fc_tributacao;
  Fc_DefineTributacao;

  {========================== B - Identificação da Nota Fiscal eletrônica ==================================}

  with It_Nfe.NotasFiscais[0].NFe do
  begin
    //Limpa os itens


    {========================== C - Identificação do Emitente da Nota Fiscal eletrônica ====================}

    {========================== D - Identificação do Fisco Emitente da NF-e ================================}
    {========================== E - Identificação do Destinatário da Nota Fiscal eletrônica ================}

    {========================== F - Identificação do Local de Retirada =====================================}
    {========================== G - Identificação do Local de Entrega ======================================}

    {========================== Definie quantas casas decimais =============================================}

    {========================== H - Detalhamento de Produtos e Serviços da NF-e ============================}
    {========================== I - Produtos e Serviços da NF-e ============================================}
    with Qr_ItensPedido do
    Begin
      Lc_Vl_Frete := 0;
      Lc_Vl_Seguro := 0;
      Lc_Vl_Outro := 0;
      Lc_Contador := 0;
      First;
      Lc_Nr_Item := 0;
      First;
      while not Eof do
      begin
        with Det.add do
        Begin
          Lc_Contador := Lc_Contador + 1;
          Fc_tributacao;
          Fc_DefineTributacao;
          Lc_Nr_Item := Lc_Nr_Item + 1;
          Prod.nItem    := Lc_Nr_Item;                                                                 // Número do item (1-990)
          Prod.cProd    := FieldByName('PRO_CODIGOFAB').AsString;                             // Código do produto ou serviço < Preencher com CFOP, caso se trate de itens não relacionados com mercadorias/produto e que o contribuinte não possua codificação
          Prod.xProd    := FieldByName('PRO_DESCRICAO').AsString;
          Lc_Aux        := FieldByName('PRO_CODIGONCM').AsString;
          Lc_Aux        := Fc_RemoveCaracterInformado(Lc_Aux, '.');
          Lc_Aux        := Fc_RemoveCaracterInformado(Lc_Aux, ',');
          Lc_Aux        := Fc_RemoveCaracterInformado(Lc_Aux, '/');
          Lc_Aux        := Fc_RemoveCaracterInformado(Lc_Aux, '-');
          Prod.NCM      := Lc_Aux;
          Prod.uCom    := FieldByName('MED_ABREVIATURA').AsString;              // Unidade Comercial
          Prod.uTrib   := FieldByName('MED_ABREVIATURA').AsString;              // Unidade Tributável

          Prod.vDesc   := FieldByName('ITF_VL_DESC').AsFloat;                   // Valor do Desconto
          Prod.qCom    := roundTo(FieldByName('ITF_QTDE').AsFloat,-4);          // Quantidade Comercial
          Prod.vUnCom  := roundTo(FieldByName('ITF_VL_UNIT').AsFloat,(It_Casa_Decimal * -1));       // Valor Unitário de comercialização

          Prod.vProd   := roundTo((Prod.qCom * Prod.vUnCom),(It_Casa_Decimal * -1));

          Prod.qTrib   := Prod.qCom;                                            // Quantidade Tributável
          Prod.vUnTrib  := Prod.vUnCom                       ;                   // Valor Unitário de tributação
          Prod.CEST     := FieldByName('PRO_CEST').AsString;
          IF FieldByName('PRO_TIPO').AsString = 'S' then
            Prod.IndTot := StrToindTot(Lc_Ok,'0')
          else
            Prod.IndTot := StrToindTot(Lc_Ok,'1');
          //fAZ A DIVISÃO DE VALORES DE FRETES/SEGURO/OUTRAS
          Lc_Tx_Prop := RoundTo(( (FieldByName('ITF_VL_UNIT').AsFloat * FieldByName('ITF_QTDE').AsFloat) - FieldByName('ITF_VL_DESC').AsFloat),-2);
          Lc_Tx_Prop := Fc_ArredondarParaBaixo((Lc_Tx_Prop / Lc_Vl_Pedido),4,True);
          if (Lc_Contador < RecordCount) then
          Begin
            //Valor do Frete
            Prod.vFrete := Fc_ArredondarParaBaixo(Total.ICMSTot.vFrete * Lc_Tx_Prop,2,False);
            Lc_Vl_Frete := Lc_Vl_Frete + Prod.vFrete;
            //Valor do Seguro
            Prod.vSeg := Fc_ArredondarParaBaixo(Total.ICMSTot.vSeg * Lc_Tx_Prop,2,False);
            Lc_Vl_Seguro := Lc_Vl_Seguro + Prod.vSeg;
            //Valor do Outros
            Prod.vOutro := Fc_ArredondarParaBaixo(Total.ICMSTot.vOutro * Lc_Tx_Prop,2,False);
            Lc_Vl_Outro := Lc_Vl_Outro + Prod.vOutro;
          end
          else
          Begin
            //Valor do Frete
            Prod.vFrete := Total.ICMSTot.vFrete - Lc_Vl_Frete;
            //Valor do Seguro
            Prod.vSeg := Total.ICMSTot.vSeg - Lc_Vl_Seguro;
            //Valor do Outros
            Prod.vOutro := Total.ICMSTot.vOutro - Lc_Vl_Outro;
          end;
          {==========================  Tag da Declaração de Importação =====================================}
          {==========================  J - Detalhamento Específico de Veículos novos =======================}
          {==========================  K - Det Esp. de Medic e de mat-primas farm ==========================}
          {==========================  L - Detalhamento Específico de Armamentos ===========================}
          {==========================  L1 - Detalhamento Específico de Combustíveis ========================}
          {==========================  M - Tributos incidentes no Produto ou Serviço =======================}
          {========================== N - ICMS Normal e ST ===============================================}
          IF (It_Cd_CFOP = 0) then
            It_Cd_CFOP := Qr_Tributacao.FieldByName('NAT_CODIGO').AsInteger;
          //Origem da Mercadoria
          case StrToIntDef(Qr_Tributacao.FieldByName('TRB_ORIGEM').AsString,0) OF
            0:Imposto.ICMS.orig := oeNacional;
            1:Imposto.ICMS.orig := oeEstrangeiraImportacaoDireta;
            2:Imposto.ICMS.orig := oeEstrangeiraAdquiridaBrasil;
          end;

          if It_Dist_Icms_NR or It_Dist_Icms_ST then
          Begin
            //Dstribui o ICMS Normal
            if (Lc_Contador < RecordCount) then
            Begin
              //Valor da Base ICMS -
              Imposto.ICMS.vBC := RoundTO(Total.ICMSTot.vBC * Lc_Tx_Prop,-2);
              Lc_VL_Bs_Icms := Lc_VL_Bs_Icms + Imposto.ICMS.vBC;
              //Aliquota do ICMS = VL ICMS / BC
              Lc_Aq_Icms := RoundTO((RoundTO(Total.ICMSTot.vICMS * Lc_Tx_Prop,-2) / Imposto.ICMS.vBC)*100,-2);
              Imposto.ICMS.pICMS := Lc_Aq_Icms;
              //Valor do ICMS - Redefine o valor do ICMS com a Aliquota calculada
              Imposto.ICMS.vICMS := RoundTO((Imposto.ICMS.vBC * Imposto.ICMS.pICMS) / 100,-2);
              Lc_VL_Icms := Lc_VL_Icms + Imposto.ICMS.vICMS;
              Lc_Aq_Icms := Imposto.ICMS.vICMS;
            end
            else
            Begin
              //Valor da Base ICMS
              Imposto.ICMS.vBC  := RoundTO(Total.ICMSTot.vBC - Lc_VL_Bs_Icms,-2);
              //Valor do ICMS
              Imposto.ICMS.vICMS := RoundTO(Total.ICMSTot.vICMS - Lc_VL_Icms,-2);
              //Aliquota do ICMS
              Lc_Aq_Icms := RoundTO((Imposto.ICMS.vICMS / Imposto.ICMS.vBC)*100,-2);
              Imposto.ICMS.pICMS := Lc_Aq_Icms;
              //Redefine o valor do ICMS com a Aliquota calculada
              Imposto.ICMS.vICMS := RoundTO((Imposto.ICMS.vBC * Imposto.ICMS.pICMS) / 100,-2);
            end;
            if It_Dist_Icms_ST then
            Begin
              //Dstribui o ICMS ST
              if (Lc_Contador < RecordCount) then
              Begin
                //Valor da Base ICMS ST
                Imposto.ICMS.vBCST := RoundTo(Total.ICMSTot.vBCST * Lc_Tx_Prop,-2);
                Lc_VL_Bs_IcmsST := Lc_VL_Bs_IcmsST + Imposto.ICMS.vBCST;
                //Valor do ICMS
                Imposto.ICMS.vICMSST := RoundTo(Total.ICMSTot.vST * Lc_Tx_Prop,-2);
                Lc_VL_IcmsST := Lc_VL_IcmsST + Imposto.ICMS.vICMSST;
              end
              else
              Begin
                //Valor da Base ICMS ST
                Imposto.ICMS.vBCST  := Total.ICMSTot.vBCST - Lc_VL_Bs_IcmsST;
                //Valor do ICMS ST
                Imposto.ICMS.vICMSST := Total.ICMSTot.vST - Lc_VL_IcmsST;
              end;
            end;
          end
          else
          Begin
            if FieldByName('ITF_AQ_ICMS').AsFloat = 0 then
              Pc_CalculaIcmsRegra(Imposto)
            else
              Pc_InformaIcmsManual(Imposto);
          end;
          {========================== O - Imposto sobre Produtos Industrializados ========================}
          LC_VL :=0;
          if It_Dist_IPI then
          Begin
            Pc_DefineIPI(Imposto);
            //Dstribui o IPI
            if (Lc_Contador < RecordCount) then
            Begin
              //Valor da Base IPI
              Imposto.IPI.vBC := RoundTo((FieldByName('ITF_VL_UNIT').AsFloat * FieldByName('ITF_QTDE').AsFloat) - FieldByName('ITF_VL_DESC').AsFloat,-2);
              Imposto.IPI.vBC := Roundto(Imposto.IPI.vBC,-2);
              Lc_VL_Bs_IPI := Lc_VL_Bs_IPI + Imposto.IPI.vBC;
              //Valor do IPI
              Imposto.IPI.vIPI := Roundto(Total.ICMSTot.vIPI * Lc_Tx_Prop,-2);
              Lc_VL_IPI := Lc_VL_IPI + Imposto.IPI.vIPI;
            end
            else
            Begin
              //Valor da Base IPI
              Imposto.IPI.vBC  := Lc_Vl_Pedido -  Lc_VL_Bs_IPI;
              //Valor do IPI
              Imposto.IPI.vIPI := Total.ICMSTot.vIPI - Lc_VL_IPI;
            end;
            imposto.IPI.pIPI := (Imposto.IPI.vIPI / Imposto.IPI.vBC) * 100;
          end
          else
          Begin
            //Retirado codigo abaixo em 02/06/2017 - Se não distribui o calculo e feito pela regra ou pelo preenchimento do ITF_aq_ipi
            //if (Qr_ItensPedido.FieldByName('ITF_AQ_IPI').AsFloat > 0) then
              Pc_DefineIPI(Imposto);
          end;
          {========================== P - Imposto de Importação ==========================================}
          Pc_DefineII(Imposto);
          {========================== Q – PIS ============================================================}
          Pc_DefinePIS(Imposto);
          {========================== R – PIS ST =========================================================}
          {========================== S – COFINS =========================================================}
          Pc_DefineCOFINS(Imposto);
          {========================== T - COFINS ST ======================================================}
          {========================== U - ISSQN ==========================================================}
          IF Qr_ItensPedido.FieldByName('PRO_TIPO').AsString = 'S' then
          Begin
            Pc_DefineISSQN(Imposto);
          end;
        end;
        Qr_ItensPedido.next;
      end;
    end;

    {========================== V - Informações adicionais =================================================}
     //tratado na tag I - Produtos e Serviços da NF-e
    {========================== W - Valores Totais da NF-e =================================================}
    {========================== X - Informações do Transporte da NF-e ======================================}
    {========================== Y – Dados da Cobrança ======================================================}
    {========================== Z - Informações Adicionais da NF-e =========================================}
    {========================== ZA - Informações de Comércio Exterior ======================================}
    {========================== ZB - Informações de Compras ================================================}
    {========================== ZC - Informações do Registro de Aquisição de Cana ==========================}
    {========================== ZZ - Informações da Assinatura Digital =====================================}
  end;
end;



procedure ttributacao.Pc_Obs_NotaFiscal(Pc_Obs:TMemo);
Begin
  Pc_InfoRevendaVeiculos(Pc_Obs,It_Cd_Pedido);
  if Length(Trim(Pc_Obs.Text)) > 0 then
  Begin
    Pc_Observacao(It_BD_Gestao,
                  It_Bd_Faturamento,
                  0,
                  It_Cd_Nota,
                  'M',
                  Pc_Obs.Text);
  end;
  IF Qr_Tributacao.RecordCount > 0 then
  Begin
    if ( Fc_Tb_Geral('GRL_G_IMPOSTO_APROX','S') = 'S') then
    Begin
      if pos('VENDA',UpperCase(Qr_Tributacao.FieldByName('NAT_DESCRICAO').AsString))>0 then
        Fc_Obs_ImpostoAproximado();
    End;

    //Observação Fiscal
    Pc_Obs_Regra_Geral;
    if (It_Cd_CRT = 3) then
    Begin
      Pc_Obs_CST00;
      Pc_Obs_CST10;
      Pc_Obs_CST20;
      Pc_Obs_CST30;
      Pc_Obs_CST40;
      Pc_Obs_CST50;
      Pc_Obs_CST60;
      Pc_Obs_CST70;
      Pc_Obs_CST80;
      Pc_Obs_CST90;
    end
    else
    Begin
      Pc_Obs_CSOSN101;
      Pc_Obs_CSOSN102;
      Pc_Obs_CSOSN103;
      Pc_Obs_CSOSN201;
      Pc_Obs_CSOSN202;
      Pc_Obs_CSOSN203;
      Pc_Obs_CSOSN300;
      Pc_Obs_CSOSN400;
      Pc_Obs_CSOSN500;
      Pc_Obs_CSOSN900;
    end;
    Pc_Obs_ISSQN;
  end;
end;

procedure ttributacao.Pc_Obs_NF_Servico(Pc_Obs:TMemo);
Begin
  if Length(Trim(Pc_Obs.Text)) > 0 then
  Begin
    Pc_Observacao(It_BD_Gestao,
                  It_Bd_Faturamento,
                  0,
                  It_Cd_Nota,
                  'S',
                  Pc_Obs.Text);
  end;
End;

Procedure ttributacao.Pc_Obs_Regra_Geral;
Var
  Lc_Memo : TMemo;
begin
  With Qr_Observacao do
  Begin
    Active := False;
    Transaction := It_Bd_transacao;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT OBS_CODIGO, OBS_DETALHES '+
            'FROM TB_OBSERVACAO tb_observacao '+
            'WHERE (OBS_GERAL = ''2'')  '+
            ' AND (OBS_CODMHA =:OBS_CODMHA)  ');
    ParamByName('OBS_CODMHA').AsInteger := It_CodMha;
    Active := True;
    First;
    Lc_Memo := TMemo.Create(Self);
    Lc_Memo.Visible := False;
    while not Eof do
    begin
      Lc_Memo.Text := FieldByName('OBS_DETALHES').AsAnsiString;
      //Registra a Observação
      Pc_Observacao(It_BD_Gestao,
                    It_Bd_Faturamento,
                    0,
                    It_Cd_Nota,
                    'F',
                    Lc_Memo.Text);
      Next;
    end;
    FreeAndNil(Lc_Memo);
  end;
end;

procedure ttributacao.Pc_Obs_CST00;
Var
  Lc_Memo : TMemo;
begin
  with Qr_Observacao do
  Begin
    Active := False;
    SQL.Clear;
    SQL.Add('select distinct  '+
            '  OBS_DETALHES   '+
            'FROM TB_ITENS_ICMS '+
            '  INNER JOIN TB_TRIB_ICMS_NR         '+
            '  ON (TBI_CODIGO = ICM_CODTBI_NR)    '+
            '  INNER JOIN TB_OBSERVACAO           '+
            '  ON (OBS_CODIGO = ICM_CODOBS)       '+
            'WHERE (ICM_CODNFL=:NFL_CODIGO)       '+
            ' AND (OBS_CODMHA =:OBS_CODMHA)       '+
            ' AND (TBI_GRUPO Like ''00'') ');

    ParamByName('OBS_CODMHA').AsInteger := It_CodMha;
    ParamByName('NFL_CODIGO').AsInteger := It_Cd_Nota;
    Active := True;
    FetchAll;
    First;
    IF (RecordCount > 0) THEN
    Begin
      Lc_Memo := TMemo.Create(Self);
      Lc_Memo.Visible := False;
      Lc_Memo.Text := FieldByName('OBS_DETALHES').AsAnsiString;
      //Registra a Observação
      Pc_Observacao(It_BD_Gestao,
                    It_Bd_Faturamento,
                    0,
                    It_Cd_Nota,
                    'F',
                    Lc_Memo.Text);
      It_Bd_transacao.CommitRetaining;
      FreeAndNil(Lc_Memo);
    end;
  end;
end;

procedure ttributacao.Pc_Obs_CST10;
Var
  Lc_vl_Bc_St : Real;
  Lc_vl_St : Real;
  Lc_SqlTxt : String;
begin
  It_M_Fisco.Clear;
  with Qr_Observacao do
  Begin
    Active := False;
    SQL.Clear;
    SQL.Add('select '+
             '   SUM(ICM_VL_BC_ST) ICM_bASE '+
             '  ,SUM(ICM_VL_ST) ICM_VALOR '+
             '  ,OBS_DETALHES '+
             'FROM TB_ITENS_ICMS '+
             '  INNER JOIN TB_TRIB_ICMS_NR '+
             '  ON (TBI_CODIGO = ICM_CODTBI_NR) '+
             '  INNER JOIN TB_OBSERVACAO '+
             '  ON (OBS_CODIGO = ICM_CODOBS) '+
             'WHERE (ICM_CODNFL=:NFL_CODIGO) '+
             '  AND (TBI_GRUPO = ''10'') '+
             ' AND (OBS_CODMHA =:OBS_CODMHA) '+
             'GROUP BY OBS_DETALHES ');

    ParamByName('OBS_CODMHA').AsInteger := It_CodMha;
    ParamByName('NFL_CODIGO').AsInteger := It_Cd_Nota;
    Active := True;
    FetchAll;
    First;
    IF (RecordCount > 0) THEN
    Begin
      Lc_vl_Bc_St := FieldByName('ICM_BASE').AsFloat;
      Lc_vl_St    := FieldByName('ICM_VALOR').AsFloat;
      It_M_Fisco.Add(FieldByName('OBS_DETALHES').AsAnsiString);
      // O simbolo 1&b representa o primeiro valor da Observação que é a base de calculo
      It_M_Fisco.Text := (StringReplace(It_M_Fisco.Text, '1&b', FloatToStrF(Lc_vl_Bc_St,ffFixed,10,2), [rfreplaceAll]));
      // O simbolo 2&b representa o Segundo valor da Observação que é a valor
      It_M_Fisco.Text := (StringReplace(It_M_Fisco.Text, '2&v', FloatToStrF(Lc_vl_St,ffFixed,10,2), [rfreplaceAll]));

      //Registra a Observação
      Pc_Observacao(It_BD_Gestao,
                    It_Bd_Faturamento,
                    0,
                    It_Cd_Nota,
                    'F',
                    It_M_Fisco.Text);
      It_Bd_transacao.CommitRetaining;
    end;
  end;

end;

procedure ttributacao.Pc_Obs_CST20;
Var
  Lc_Aq_Rd_bc : Real;
  Lc_SqlTxt : String;
Begin
  It_M_Fisco.Clear;
  with Qr_Observacao do
  Begin
    Active := False;
    SQL.Clear;
    SQL.Add('select DISTINCT                      '+
             '   ICM_AQ_RD_BC_NR                   '+
             '  ,OBS_DETALHES                      '+
             'FROM TB_ITENS_ICMS                   '+
             '  INNER JOIN TB_TRIB_ICMS_NR         '+
             '  ON (TBI_CODIGO = ICM_CODTBI_NR)    '+
             '  INNER JOIN TB_OBSERVACAO           '+
             '  ON (OBS_CODIGO = ICM_CODOBS)       '+
             'WHERE (ICM_CODNFL=:NFL_CODIGO)       '+
             '  AND (TBI_GRUPO = ''20'')           '+
             ' AND (OBS_CODMHA =:OBS_CODMHA)       ');

    ParamByName('OBS_CODMHA').AsInteger := It_CodMha;
    ParamByName('NFL_CODIGO').AsInteger := It_Cd_Nota;
    Active := True;
    FetchAll;
    First;
    IF (RecordCount > 0) THEN
    Begin
      Lc_Aq_Rd_bc := FieldByName('ICM_AQ_RD_BC_NR').AsFloat;
      It_M_Fisco.Add(FieldByName('OBS_DETALHES').AsAnsiString);
      // O simbolo 1&b representa o primeiro valor da Observação que é a base de calculo
      It_M_Fisco.Text := (StringReplace(It_M_Fisco.Text, '1&v', FloatToStrF(Lc_Aq_Rd_bc,ffFixed,10,2), [rfreplaceAll]));

      //Registra a Observação
      Pc_Observacao(It_BD_Gestao,
                    It_Bd_Faturamento,
                    0,
                    It_Cd_Nota,
                    'F',
                    It_M_Fisco.Text);
      It_Bd_transacao.CommitRetaining;
    end;
  end;
end;

procedure ttributacao.Pc_Obs_CST30;
Var
  Lc_vl_Bc_St : Real;
  Lc_vl_St : Real;
begin
  IT_M_Fisco.Clear;
  with Qr_Observacao do
  Begin
    Active := False;
    SQL.Clear;
    SQL.Add('select                               '+
             '   SUM(ICM_VL_BC_ST) ICM_bASE        '+
             '  ,SUM(ICM_VL_ST) ICM_VALOR          '+
             '  ,OBS_DETALHES                      '+
             'FROM TB_ITENS_ICMS                   '+
             '  INNER JOIN TB_TRIB_ICMS_NR         '+
             '  ON (TBI_CODIGO = ICM_CODTBI_NR)    '+
             '  INNER JOIN TB_OBSERVACAO           '+
             '  ON (OBS_CODIGO = ICM_CODOBS)       '+
             'WHERE (ICM_CODNFL=:NFL_CODIGO)       '+
             '  AND (TBI_GRUPO = ''30'')           '+
             ' AND (OBS_CODMHA =:OBS_CODMHA)       '+
             'GROUP BY OBS_DETALHES                ');

    ParamByName('OBS_CODMHA').AsInteger := It_CodMha;
    ParamByName('NFL_CODIGO').AsInteger := It_Cd_Nota;
    Active := True;
    FetchAll;
    First;
    IF (RecordCount > 0) THEN
    Begin
      Lc_vl_Bc_St := FieldByName('ICM_BASE').AsFloat;
      Lc_vl_St    := FieldByName('ICM_VALOR').AsFloat;
      It_M_Fisco.add(FieldByName('OBS_DETALHES').AsAnsiString);
      // O simbolo 1&b representa o primeiro valor da Observação que é a base de calculo
      It_M_Fisco.Text := (StringReplace(It_M_Fisco.Text, '1&v', FloatToStrF(Lc_vl_Bc_St,ffFixed,10,2), [rfreplaceAll]));
      // O simbolo 2&b representa o Segundo valor da Observação que é a valor
      It_M_Fisco.Text := (StringReplace(It_M_Fisco.Text, '2&v', FloatToStrF(Lc_vl_St,ffFixed,10,2), [rfreplaceAll]));

      //Registra a Observação
      Pc_Observacao(It_BD_Gestao,
                    It_Bd_Faturamento,
                    0,
                    It_Cd_Nota,
                    'F',
                    It_M_Fisco.Text);
      It_Bd_transacao.CommitRetaining;
    end;
  end;
end;

procedure ttributacao.Pc_Obs_CST40;
begin
  It_M_Fisco.Clear;
  with Qr_Observacao do
  Begin
    Active := False;
    SQL.Clear;
    SQL.Add('select distinct                      '+
             '  OBS_DETALHES                        '+
             'FROM TB_ITENS_ICMS                   '+
             '  INNER JOIN TB_TRIB_ICMS_NR         '+
             '  ON (TBI_CODIGO = ICM_CODTBI_NR)    '+
             '  INNER JOIN TB_OBSERVACAO           '+
             '  ON (OBS_CODIGO = ICM_CODOBS)       '+
             'WHERE (ICM_CODNFL=:NFL_CODIGO)       '+
             ' AND (OBS_CODMHA =:OBS_CODMHA)       '+
             ' AND (TBI_GRUPO Like ''4%'')        ');

    ParamByName('OBS_CODMHA').AsInteger := It_CodMha;
    ParamByName('NFL_CODIGO').AsInteger := It_Cd_Nota;
    Active := True;
    FetchAll;
    First;
    IF (RecordCount > 0) THEN
    Begin
      It_M_Fisco.add(FieldByName('OBS_DETALHES').AsAnsiString);
      //Registra a Observação
      Pc_Observacao(It_BD_Gestao,
                    It_Bd_Faturamento,
                    0,
                    It_Cd_Nota,
                    'F',
                    It_M_Fisco.Text);
      It_Bd_transacao.CommitRetaining;
    end;
  end;
end;

procedure ttributacao.Pc_Obs_CST50;
begin
  It_M_Fisco.Clear;
  with Qr_Observacao do
  Begin
    Active := False;
    SQL.Clear;
    SQL.Add('select distinct                      '+
             '  OBS_DETALHES                       '+
             'FROM TB_ITENS_ICMS                   '+
             '  INNER JOIN TB_TRIB_ICMS_NR         '+
             '  ON (TBI_CODIGO = ICM_CODTBI_NR)    '+
             '  INNER JOIN TB_OBSERVACAO           '+
             '  ON (OBS_CODIGO = ICM_CODOBS)       '+
             'WHERE (ICM_CODNFL=:NFL_CODIGO)       '+
             ' AND (OBS_CODMHA =:OBS_CODMHA)       '+
             ' AND (TBI_GRUPO Like ''5%'')        ');

    ParamByName('OBS_CODMHA').AsInteger := It_CodMha;
    ParamByName('NFL_CODIGO').AsInteger := It_Cd_Nota;
    Active := True;
    FetchAll;
    First;
    IF (RecordCount > 0) THEN
    Begin
      It_M_Fisco.add(FieldByName('OBS_DETALHES').AsAnsiString);
      //Registra a Observação
      Pc_Observacao(It_BD_Gestao,
                    It_Bd_Faturamento,
                    0,
                    It_Cd_Nota,
                    'F',
                    It_M_Fisco.Text);
      It_Bd_transacao.CommitRetaining;
    end;
  end;
end;

procedure ttributacao.Pc_Obs_CST60;
Var
  Lc_vl_Bc_St : Real;
  Lc_vl_St : Real;
begin
  It_M_Fisco.Clear;
  with Qr_Observacao do
  Begin
    Active := False;
    SQL.Clear;
    SQL.Add('select '+
             '   SUM(ICM_VL_BC_ST_RET) ICM_bASE    '+
             '  ,SUM(ICM_VL_ST_RET) ICM_VALOR      '+
             '  ,OBS_DETALHES                      '+
             'FROM TB_ITENS_ICMS                   '+
             '  INNER JOIN TB_TRIB_ICMS_NR         '+
             '  ON (TBI_CODIGO = ICM_CODTBI_NR)    '+
             '  INNER JOIN TB_OBSERVACAO           '+
             '  ON (OBS_CODIGO = ICM_CODOBS)       '+
             'WHERE (ICM_CODNFL=:NFL_CODIGO)       '+
             ' AND (OBS_CODMHA =:OBS_CODMHA)       '+
             ' AND (TBI_GRUPO Like ''6%'')         '+
             'GROUP BY OBS_DETALHES                ');
    ParamByName('OBS_CODMHA').AsInteger := It_CodMha;
    ParamByName('NFL_CODIGO').AsInteger := It_Cd_Nota;
    Active := True;
    FetchAll;
    First;
    IF (RecordCount > 0) THEN
    Begin
      Lc_vl_Bc_St := FieldByName('ICM_BASE').AsFloat;
      Lc_vl_St    := FieldByName('ICM_VALOR').AsFloat;
      It_M_Fisco.add(FieldByName('OBS_DETALHES').AsAnsiString);
      // O simbolo 1&b representa o primeiro valor da Observação que é a base de calculo
      It_M_Fisco.Text := (StringReplace(It_M_Fisco.Text, '1&v', FloatToStrF(Lc_vl_Bc_St,ffFixed,10,2), [rfreplaceAll]));
      // O simbolo 2&b representa o Segundo valor da Observação que é a valor
      It_M_Fisco.Text := (StringReplace(It_M_Fisco.Text, '2&v', FloatToStrF(Lc_vl_St,ffFixed,10,2), [rfreplaceAll]));
      //Registra a Observação
      Pc_Observacao(It_BD_Gestao,
                    It_Bd_Faturamento,
                   0,
                   It_Cd_Nota,
                   'F',
                   It_M_Fisco.Text);
     It_Bd_transacao.CommitRetaining;
    end;
  end;
end;

procedure ttributacao.Pc_Obs_CST70;
Var
  Lc_Aq_rd_Bc_Nr : Real;
  Lc_vl_Bc_St : Real;
  Lc_vl_St : Real;
  Lc_SqlTxt : String;
begin
  It_M_Fisco.Clear;
  with Qr_Observacao do
  Begin
    Active := False;
    Transaction := It_Bd_Transacao;
    SQL.Clear;
    Lc_SqlTxt := 'select                               '+
                 '   SUM(ICM_VL_BC_ST_RET) ICM_bASE    '+
                 '  ,SUM(ICM_VL_ST_RET) ICM_VALOR      '+
                 '  ,OBS_DETALHES                      '+
                 '  ,ICM_AQ_RD_BC_NR                   '+
                 'FROM TB_ITENS_ICMS                   '+
                 '  INNER JOIN TB_TRIB_ICMS_NR         '+
                 '  ON (TBI_CODIGO = ICM_CODTBI_NR)    '+
                 '  INNER JOIN TB_OBSERVACAO           '+
                 '  ON (OBS_CODIGO = ICM_CODOBS)       '+
                 'WHERE (ICM_CODNFL=:NFL_CODIGO)       '+
                 ' AND (OBS_CODMHA =:OBS_CODMHA)       '+
                 ' AND (TBI_GRUPO Like ''7%'')         '+
                 'GROUP BY OBS_DETALHES, ICM_AQ_RD_BC_NR ';

    SQL.Add(Lc_SqlTxt);
    ParamByName('OBS_CODMHA').AsInteger := It_CodMha;
    ParamByName('NFL_CODIGO').AsInteger := It_Cd_Nota;
    Active := True;
    FetchAll;
    First;
    IF (RecordCount > 0) THEN
    Begin
      Lc_vl_Bc_St := FieldByName('ICM_BASE').AsFloat;
      Lc_vl_St    := FieldByName('ICM_VALOR').AsFloat;
      Lc_Aq_rd_Bc_Nr := FieldByName('ICM_AQ_RD_BC_NR').AsFloat;
      It_M_Fisco.add(FieldByName('OBS_DETALHES').AsAnsiString);
      // O simbolo 1&b representa o primeiro valor da Observação que é a base de calculo
      It_M_Fisco.Text := (StringReplace(It_M_Fisco.Text, '1&v', FloatToStrF(Lc_vl_Bc_St,ffFixed,10,2), [rfreplaceAll]));
      // O simbolo 2&b representa o Segundo valor da Observação que é a valor
      It_M_Fisco.Text := (StringReplace(It_M_Fisco.Text, '2&v', FloatToStrF(Lc_vl_St,ffFixed,10,2), [rfreplaceAll]));
      // O simbolo 3&R representa o Terceiro Valor da Observação que é a Redução da Base de Calculo
      It_M_Fisco.Text := (StringReplace(It_M_Fisco.Text, '3&v', FloatToStrF(Lc_Aq_rd_Bc_Nr,ffFixed,10,2), [rfreplaceAll]));

      //Registra a Observação
      Pc_Observacao(It_BD_Gestao,
                    It_Bd_Faturamento,
                     0,
                     It_Cd_Nota,
                     'F',
                     It_M_Fisco.Text);
       It_Bd_Transacao.CommitRetaining;
    end;
  end;
end;

procedure ttributacao.Pc_Obs_CST80;
Begin

end;

procedure ttributacao.Pc_Obs_CST90;
Var
  Lc_SqlTxt : String;
begin
  It_M_Fisco.Clear;
  with Qr_Observacao do
  begin
    Active := False;
    SQL.Clear;
    Lc_SqlTxt := 'select distinct                      '+
                 '  OBS_DETALHES                       '+
                 'FROM TB_ITENS_ICMS                   '+
                 '  INNER JOIN TB_TRIB_ICMS_NR         '+
                 '  ON (TBI_CODIGO = ICM_CODTBI_NR)    '+
                 '  INNER JOIN TB_OBSERVACAO           '+
                 '  ON (OBS_CODIGO = ICM_CODOBS)       '+
                 'WHERE (ICM_CODNFL=:NFL_CODIGO)       '+
                 ' AND (OBS_CODMHA =:OBS_CODMHA)       '+
                 ' AND (TBI_GRUPO Like ''9%'')         ';

    SQL.Add(Lc_SqlTxt);
    ParamByName('OBS_CODMHA').AsInteger := It_CodMha;
    ParamByName('NFL_CODIGO').AsInteger := It_Cd_Nota;
    Active := True;
    FetchAll;
    First;
    IF (RecordCount > 0) THEN
    Begin
      It_M_Fisco.add(FieldByName('OBS_DETALHES').AsAnsiString);
      //Registra a Observação
      Pc_Observacao(It_BD_Gestao,
                    It_Bd_Faturamento,
                     0,
                     It_Cd_Nota,
                     'F',
                     It_M_Fisco.Text);
      It_Bd_Transacao.CommitRetaining;
    end;
  end;
end;

procedure ttributacao.Pc_Obs_CSOSN101;
Var
  Lc_Aq : Real;
  Lc_VL : Real;
  Lc_SqlTxt : String;
  Lc_texto :TMemoryStream;
begin
  It_M_Fisco.Clear;
  with Qr_Observacao do
  begin
    Active := False;
    Transaction := It_Bd_Transacao;
    SQL.Clear;
    Lc_SqlTxt := 'select distinct                      '+
                 '  SUM(ICM_AQ_CALC_CRED) ICM_AQ       '+
                 ' ,SUM(ICM_VL_CRED_APRO) ICM_VL       '+
                 ' ,OBS_DETALHES                       '+
                 'FROM TB_ITENS_ICMS                   '+
                 '  INNER JOIN TB_TRIB_ICMS_SN         '+
                 '  ON (TBI_CODIGO = ICM_CODTBI_SN)    '+
                 '  INNER JOIN TB_OBSERVACAO           '+
                 '  ON (OBS_CODIGO = ICM_CODOBS)       '+
                 'WHERE (ICM_CODNFL=:NFL_CODIGO)       '+
                 ' AND (OBS_CODMHA =:OBS_CODMHA)       '+
                 ' AND (TBI_GRUPO = ''101'')           '+
                 'GROUP BY OBS_DETALHES                ';

    SQL.Add(Lc_SqlTxt);
    ParamByName('OBS_CODMHA').AsInteger := It_CodMha;
    ParamByName('NFL_CODIGO').AsInteger := It_Cd_Nota;
    Active := True;
    FetchAll;
    First;
    IF (RecordCount > 0) THEN
    Begin
      Lc_Aq := StrToFloatDef(Fc_Tb_Geral('GRL_G_AQ_CRED_ICMS',''),0);
      Lc_VL := FieldByName('ICM_VL').AsFloat;
      It_M_Fisco.add(FieldByName('OBS_DETALHES').AsAnsiString);
      // O simbolo 1&b representa o Primeiro valor da Observação que é a valor
      It_M_Fisco.Text := (StringReplace(It_M_Fisco.Text, '1&v', FloatToStrF(Lc_VL,ffFixed,10,2), [rfreplaceAll]));

      // O simbolo 2&b representa o Segunda valor da Observação que é a Aliquota
      It_M_Fisco.Text := (StringReplace(It_M_Fisco.Text, '2&v', FloatToStrF(Lc_Aq,ffFixed,10,2), [rfreplaceAll]));


      //Registra a Observação
      Pc_Observacao(It_BD_Gestao,
                    It_Bd_Faturamento,
                     0,
                     It_Cd_Nota,
                     'F',
                     It_M_Fisco.Text);
      It_Bd_Transacao.CommitRetaining;
    end;
  end;
end;

procedure ttributacao.Pc_Obs_CSOSN102;
Var
  Lc_SqlTxt : String;
begin
  It_M_Fisco.Clear;
  with Qr_Observacao do
  begin
    Active := False;
    Transaction := It_Bd_Transacao;
    SQL.Clear;
    Lc_SqlTxt := 'select distinct                      '+
                 '  OBS_DETALHES                       '+
                 'FROM TB_ITENS_ICMS                   '+
                 '  INNER JOIN TB_TRIB_ICMS_SN         '+
                 '  ON (TBI_CODIGO = ICM_CODTBI_SN)    '+
                 '  INNER JOIN TB_OBSERVACAO           '+
                 '  ON (OBS_CODIGO = ICM_CODOBS)       '+
                 'WHERE (ICM_CODNFL=:NFL_CODIGO)       '+
                 ' AND (OBS_CODMHA =:OBS_CODMHA)       '+
                 ' AND (TBI_GRUPO = ''102'')           ';

    SQL.Add(Lc_SqlTxt);
    ParamByName('OBS_CODMHA').AsInteger := It_CodMha;
    ParamByName('NFL_CODIGO').AsInteger := It_Cd_Nota;
    Active := True;
    FetchAll;
    First;
    IF (RecordCount > 0) THEN
    Begin
      It_M_Fisco.add(FieldByName('OBS_DETALHES').AsAnsiString);
      //Registra a Observação
      Pc_Observacao(It_BD_Gestao,
                    It_Bd_Faturamento,
                     0,
                     It_Cd_Nota,
                     'F',
                     It_M_Fisco.Text);
      It_Bd_Transacao.CommitRetaining;
    end;
  end;
end;



procedure ttributacao.Pc_Obs_CSOSN103;
Var
  Lc_SqlTxt : String;
begin
  It_M_Fisco.Clear;
  with Qr_Observacao do
  begin
    Active := False;
    Transaction := It_Bd_Transacao;
    SQL.Clear;
    Lc_SqlTxt := 'select distinct                      '+
                 '  OBS_DETALHES                       '+
                 'FROM TB_ITENS_ICMS                   '+
                 '  INNER JOIN TB_TRIB_ICMS_SN         '+
                 '  ON (TBI_CODIGO = ICM_CODTBI_SN)    '+
                 '  INNER JOIN TB_OBSERVACAO           '+
                 '  ON (OBS_CODIGO = ICM_CODOBS)       '+
                 'WHERE (ICM_CODNFL=:NFL_CODIGO)       '+
                 ' AND (OBS_CODMHA =:OBS_CODMHA)       '+
                 ' AND (TBI_GRUPO = ''103'')           ';

    SQL.Add(Lc_SqlTxt);
    ParamByName('OBS_CODMHA').AsInteger := It_CodMha;
    ParamByName('NFL_CODIGO').AsInteger := It_Cd_Nota;
    Active := True;
    FetchAll;
    First;
    IF (RecordCount > 0) THEN
    Begin
      It_M_Fisco.add(FieldByName('OBS_DETALHES').AsAnsiString);
      //Registra a Observação
      Pc_Observacao(It_BD_Gestao,
                    It_Bd_Faturamento,
                     0,
                     It_Cd_Nota,
                     'F',
                     It_M_Fisco.Text);
      It_Bd_Transacao.CommitRetaining;
    end;
  end;
end;

procedure ttributacao.Pc_Obs_CSOSN201;
Var
  Lc_vl_bc_st : Real;
  Lc_vl_st : Real;
  Lc_Aq : Real;
  Lc_VL : Real;
  Lc_SqlTxt : String;
begin
  It_M_Fisco.Clear;
  with Qr_Observacao do
  begin
    Active := False;
    Transaction := It_Bd_Transacao;
    SQL.Clear;
    Lc_SqlTxt := 'select distinct  '+
                 '  SUM(ICM_VL_BC_ST) ICM_bASE        '+
                 ' ,SUM(ICM_VL_ST) ICM_VALOR          '+
                 ' ,SUM(ICM_AQ_CALC_CRED) ICM_AQ      '+
                 ' ,SUM(ICM_VL_CRED_APRO) ICM_VL       '+
                 ' ,OBS_DETALHES                       '+
                 'FROM TB_ITENS_ICMS                   '+
                 '  INNER JOIN TB_TRIB_ICMS_SN         '+
                 '  ON (TBI_CODIGO = ICM_CODTBI_SN)    '+
                 '  INNER JOIN TB_OBSERVACAO           '+
                 '  ON (OBS_CODIGO = ICM_CODOBS)       '+
                 'WHERE (ICM_CODNFL=:NFL_CODIGO)       '+
                 ' AND (OBS_CODMHA =:OBS_CODMHA)       '+
                 ' AND (TBI_GRUPO = ''201'')           '+
                 'GROUP BY OBS_DETALHES                ';

    SQL.Add(Lc_SqlTxt);
    ParamByName('OBS_CODMHA').AsInteger := It_CodMha;
    ParamByName('NFL_CODIGO').AsInteger := It_Cd_Nota;
    Active := True;
    FetchAll;
    First;
    IF (RecordCount > 0) THEN
    Begin
      Lc_Aq := StrToFloatDef(Fc_Tb_Geral('GRL_G_AQ_CRED_ICMS',''),0);
      Lc_VL := FieldByName('ICM_VL').AsFloat;
      It_M_Fisco.add(FieldByName('OBS_DETALHES').AsAnsiString);
      // O simbolo 1&b representa o Primeiro valor da Observação que é a valor
      It_M_Fisco.Text := (StringReplace(It_M_Fisco.Text, '1&v', FloatToStrF(Lc_VL,ffFixed,10,2), [rfreplaceAll]));

      // O simbolo 2&b representa o Segunda valor da Observação que é a Aliquota
      It_M_Fisco.Text := (StringReplace(It_M_Fisco.Text, '2&v', FloatToStrF(Lc_Aq,ffFixed,10,2), [rfreplaceAll]));
      Lc_vl_bc_st := FieldByName('ICM_bASE').AsFloat;
      Lc_vl_st := FieldByName('ICM_VALOR').AsFloat;
      Lc_Aq := FieldByName('ICM_AQ').AsFloat;
      Lc_VL := FieldByName('ICM_VL').AsFloat;
      // O simbolo 1&b representa o primeiro valor da Observação que é a base
      It_M_Fisco.Text := (StringReplace(It_M_Fisco.Text, '1&v', FloatToStrF(Lc_vl_bc_st,ffFixed,10,2), [rfreplaceAll]));
      // O simbolo 2&b representa o Segundo valor da Observação que é a valor do ICMS_sT
      It_M_Fisco.Text := (StringReplace(It_M_Fisco.Text, '2&v', FloatToStrF(Lc_vl_st,ffFixed,10,2), [rfreplaceAll]));
      // O simbolo 1&b representa o Terceiro valor da Observação que é a Aliquota
      It_M_Fisco.Text := (StringReplace(It_M_Fisco.Text, '3&v', FloatToStrF(Lc_Aq,ffFixed,10,2), [rfreplaceAll]));
      // O simbolo 2&b representa o Quarta valor da Observação que é a valor
      It_M_Fisco.Text := (StringReplace(It_M_Fisco.Text, '4&v', FloatToStrF(Lc_VL,ffFixed,10,2), [rfreplaceAll]));

      //Registra a Observação
      Pc_Observacao(It_BD_Gestao,
                    It_Bd_Faturamento,
                     0,
                     It_Cd_Nota,
                     'F',
                     It_M_Fisco.Text);
       It_Bd_Transacao.CommitRetaining;
    end;
  end;

end;

procedure ttributacao.Pc_Obs_CSOSN202;
Var
  Lc_vl_bc_st : Real;
  Lc_vl_st : Real;
  Lc_SqlTxt : String;
begin
  It_M_Fisco.Clear;
  with Qr_Observacao do
  begin
    Active := False;
    Transaction := It_Bd_Transacao;
    SQL.Clear;
    Lc_SqlTxt := 'select distinct                      '+
                 '  SUM(ICM_VL_BC_ST) ICM_bASE        '+
                 ' ,SUM(ICM_VL_ST) ICM_VALOR          '+
                 ' ,OBS_DETALHES                      '+
                 'FROM TB_ITENS_ICMS                  '+
                 '  INNER JOIN TB_TRIB_ICMS_SN        '+
                 '  ON (TBI_CODIGO = ICM_CODTBI_SN)   '+
                 '  INNER JOIN TB_OBSERVACAO          '+
                 '  ON (OBS_CODIGO = ICM_CODOBS)      '+
                 'WHERE (ICM_CODNFL=:NFL_CODIGO)      '+
                 ' AND (OBS_CODMHA =:OBS_CODMHA)      '+
                 ' AND (TBI_GRUPO = ''202'')          '+
                 'GROUP BY OBS_DETALHES               ';

    SQL.Add(Lc_SqlTxt);
    ParamByName('OBS_CODMHA').AsInteger := It_CodMha;
    ParamByName('NFL_CODIGO').AsInteger := It_Cd_Nota;
    Active := True;
    FetchAll;
    First;
    IF (RecordCount > 0) THEN
    Begin
      Lc_vl_bc_st := FieldByName('ICM_bASE').AsFloat;
      Lc_vl_st := FieldByName('ICM_VALOR').AsFloat;
      It_M_Fisco.add(FieldByName('OBS_DETALHES').AsAnsiString);
      // O simbolo 1&b representa o primeiro valor da Observação que é a base
      It_M_Fisco.Text := (StringReplace(It_M_Fisco.Text, '1&v', FloatToStrF(Lc_vl_bc_st,ffFixed,10,2), [rfreplaceAll]));
      // O simbolo 2&b representa o Segundo valor da Observação que é a valor do ICMS_sT
      It_M_Fisco.Text := (StringReplace(It_M_Fisco.Text, '2&v', FloatToStrF(Lc_vl_st,ffFixed,10,2), [rfreplaceAll]));

      //Registra a Observação
      Pc_Observacao(It_BD_Gestao,
                    It_Bd_Faturamento,
                     0,
                     It_Cd_Nota,
                     'F',
                     It_M_Fisco.Text);
      It_Bd_Transacao.CommitRetaining;
    end;
  end;
end;

procedure ttributacao.Pc_Obs_CSOSN203;
Var
  Lc_SqlTxt : String;
begin
  It_M_Fisco.Clear;
  with Qr_Observacao do
  begin
    Active := False;
    SQL.Clear;
    Lc_SqlTxt := 'select distinct                      '+
                 ' OBS_DETALHES                       '+
                 'FROM TB_ITENS_ICMS                   '+
                 '  INNER JOIN TB_TRIB_ICMS_SN         '+
                 '  ON (TBI_CODIGO = ICM_CODTBI_SN)    '+
                 '  INNER JOIN TB_OBSERVACAO           '+
                 '  ON (OBS_CODIGO = ICM_CODOBS)       '+
                 'WHERE (ICM_CODNFL=:NFL_CODIGO)       '+
                 ' AND (OBS_CODMHA =:OBS_CODMHA)       '+
                 ' AND (TBI_GRUPO = ''203'')           ';


    SQL.Add(Lc_SqlTxt);
    ParamByName('OBS_CODMHA').AsInteger := It_CodMha;
    ParamByName('NFL_CODIGO').AsInteger := It_Cd_Nota;
    Active := True;
    FetchAll;
    First;
    IF (RecordCount > 0) THEN
    Begin
      It_M_Fisco.add(FieldByName('OBS_DETALHES').AsAnsiString);
      //Registra a Observação
      Pc_Observacao(It_BD_Gestao,
                    It_Bd_Faturamento,
                     0,
                     It_Cd_Nota,
                     'F',
                     It_M_Fisco.Text);
      It_Bd_Transacao.CommitRetaining;
    end;
  end;
end;

procedure ttributacao.Pc_Obs_CSOSN300;
Var
  Lc_SqlTxt : String;
begin
  It_M_Fisco.Clear;
  with Qr_Observacao do
  begin
    Active := False;
    SQL.Clear;
    Lc_SqlTxt := 'select distinct                      '+
                 ' OBS_DETALHES                       '+
                 'FROM TB_ITENS_ICMS                   '+
                 '  INNER JOIN TB_TRIB_ICMS_SN         '+
                 '  ON (TBI_CODIGO = ICM_CODTBI_SN)    '+
                 '  INNER JOIN TB_OBSERVACAO           '+
                 '  ON (OBS_CODIGO = ICM_CODOBS)       '+
                 'WHERE (ICM_CODNFL=:NFL_CODIGO)       '+
                 ' AND (OBS_CODMHA =:OBS_CODMHA)       '+
                 ' AND (TBI_GRUPO = ''300'')           ';

    SQL.Add(Lc_SqlTxt);
    ParamByName('OBS_CODMHA').AsInteger := It_CodMha;
    ParamByName('NFL_CODIGO').AsInteger := It_Cd_Nota;
    Active := True;
    FetchAll;
    First;
    IF (RecordCount > 0) THEN
    Begin
      It_M_Fisco.add(FieldByName('OBS_DETALHES').AsAnsiString);
      //Registra a Observação
      Pc_Observacao(It_BD_Gestao,
                    It_Bd_Faturamento,
                     0,
                     It_Cd_Nota,
                     'F',
                     It_M_Fisco.Text);
      It_Bd_Transacao.CommitRetaining;
    end;
  end;
end;

procedure ttributacao.Pc_Obs_CSOSN400;
Var
  Lc_SqlTxt : String;
begin
  It_M_Fisco.Clear;
  with Qr_Observacao do
  begin
    Active := False;
    SQL.Clear;
    Lc_SqlTxt := 'select distinct                      '+
                 ' OBS_DETALHES                       '+
                 'FROM TB_ITENS_ICMS                   '+
                 '  INNER JOIN TB_TRIB_ICMS_SN         '+
                 '  ON (TBI_CODIGO = ICM_CODTBI_SN)    '+
                 '  INNER JOIN TB_OBSERVACAO           '+
                 '  ON (OBS_CODIGO = ICM_CODOBS)       '+
                 'WHERE (ICM_CODNFL=:NFL_CODIGO)       '+
                 ' AND (OBS_CODMHA =:OBS_CODMHA)       '+
                 ' AND (TBI_GRUPO = ''400'')           ';


    SQL.Add(Lc_SqlTxt);
    ParamByName('NFL_CODIGO').AsInteger := It_Cd_Nota;
    Active := True;
    FetchAll;
    First;
    IF (RecordCount > 0) THEN
    Begin
      It_M_Fisco.add(FieldByName('OBS_DETALHES').AsAnsiString);
      //Registra a Observação
      Pc_Observacao(It_BD_Gestao,
                    It_Bd_Faturamento,
                     0,
                     It_Cd_Nota,
                     'F',
                     It_M_Fisco.Text);
      It_Bd_Transacao.CommitRetaining;
    end;
  end;
end;

procedure ttributacao.Pc_Obs_CSOSN500;
Var
  Lc_SqlTxt : String;
begin
  It_M_Fisco.Clear;
  with Qr_Observacao do
  begin
  Active := False;
  Transaction := It_Bd_Transacao;
  SQL.Clear;
  Lc_SqlTxt := 'select distinct                      '+
               ' OBS_DETALHES                       '+
               'FROM TB_ITENS_ICMS                   '+
               '  INNER JOIN TB_TRIB_ICMS_SN         '+
               '  ON (TBI_CODIGO = ICM_CODTBI_SN)    '+
               '  INNER JOIN TB_OBSERVACAO           '+
               '  ON (OBS_CODIGO = ICM_CODOBS)       '+
               'WHERE (ICM_CODNFL=:NFL_CODIGO)       '+
               ' AND (OBS_CODMHA =:OBS_CODMHA)       '+
               ' AND (TBI_GRUPO = ''500'')           ';


  SQL.Add(Lc_SqlTxt);
  ParamByName('OBS_CODMHA').AsInteger := It_CodMha;
  ParamByName('NFL_CODIGO').AsInteger := It_Cd_Nota;
  Active := True;
  FetchAll;
  First;
  IF (RecordCount > 0) THEN
    Begin
    It_M_Fisco.add(FieldByName('OBS_DETALHES').AsAnsiString);
    //Registra a Observação
      Pc_Observacao(It_BD_Gestao,
                    It_Bd_Faturamento,
                   0,
                   It_Cd_Nota,
                   'F',
                   It_M_Fisco.Text);
    It_Bd_Transacao.CommitRetaining;
    end;
  end;
end;

procedure ttributacao.Pc_Obs_CSOSN900;
Var
  Lc_SqlTxt : String;
begin
  It_M_Fisco.Clear;
  with Qr_Observacao do
  begin
    Active := False;
    SQL.Clear;
    Lc_SqlTxt := 'select distinct                      '+
                 ' OBS_DETALHES                       '+
                 'FROM TB_ITENS_ICMS                   '+
                 '  INNER JOIN TB_TRIB_ICMS_SN         '+
                 '  ON (TBI_CODIGO = ICM_CODTBI_SN)    '+
                 '  INNER JOIN TB_OBSERVACAO           '+
                 '  ON (OBS_CODIGO = ICM_CODOBS)       '+
                 'WHERE (ICM_CODNFL=:NFL_CODIGO)       '+
                 ' AND (OBS_CODMHA =:OBS_CODMHA)       '+
                 ' AND (TBI_GRUPO = ''900'')           ';


    SQL.Add(Lc_SqlTxt);
    ParamByName('OBS_CODMHA').AsInteger := It_CodMha;
    ParamByName('NFL_CODIGO').AsInteger := It_Cd_Nota;
    Active := True;
    FetchAll;
    First;
    IF (RecordCount > 0) THEN
    Begin
      It_M_Fisco.add(FieldByName('OBS_DETALHES').AsAnsiString);
      //Registra a Observação
      Pc_Observacao(It_BD_Gestao,
                    It_Bd_Faturamento,
                     0,
                     It_Cd_Nota,
                     'F',
                     It_M_Fisco.Text);
      It_Bd_Transacao.CommitRetaining;
    end;
  end;
end;


procedure ttributacao.Pc_Obs_ISSQN;
Var
  Lc_SqlTxt : String;
  Lc_texto :TMemoryStream;
begin
  Lc_texto := TMemoryStream.Create;
  It_M_Fisco.Clear;
  with Qr_Observacao do
  begin
    Active := False;
    SQL.Clear;
    Lc_SqlTxt := 'select Sum(iss_vl_ret) valor '+
                 ' from tb_itens_issqn '+
                 ' where tb_itens_issqn.iss_codnfl =:NFL_CODIGO ';

    SQL.Add(Lc_SqlTxt);
    ParamByName('NFL_CODIGO').AsInteger := It_Cd_Nota;
    Active := True;
    FetchAll;
    First;
    IF (FieldByName('valor').asfloat > 0) THEN
    Begin
      //Registra a Observação
      Pc_Observacao(It_BD_Gestao,
                    It_Bd_Faturamento,
                    0,
                    It_Cd_Nota,
                    'A',
                    'Valor do ISSQN retido/Substituto Tributário: R$ ' + FloatToStrF(FieldByName('valor').AsFloat,ffFixed,10,2));
      It_Bd_Transacao.CommitRetaining;
    end;
  end;
  FreeAndNil(Lc_texto);
end;

Function ttributacao.Fc_Obs_ImpostoAproximado():TStringList;
Var
  Lc_Qry:TIBQuery;
  Lc_Campo : String;
  Lc_Vl_Produto:Real;
  Lc_Vl_Base : Real;
  Lc_Imp_Aprox : TStringList;

  Lc_Tx_Imp_Nacional : real;
  Lc_Tx_Imp_Estadual : real;
  Lc_Tx_Imp_Municipal : real;

  Lc_Vl_Imp_Nacional : real;
  Lc_Vl_Imp_Estadual : real;
  Lc_Vl_Imp_Municipal : real;
  Lc_Obs : String;
Begin
  Result := TStringList.Create;
  Result.Clear;
  Lc_Qry := TIBQuery.Create(nil);
  with Lc_Qry do
  Begin
    Database := It_BD_Gestao;
    Transaction := It_Bd_transacao;
    ForcedRefresh := True;
    CachedUpdates := True;
    Active := False;
    SQL.Clear;
    SQL.Add('select ITF_VL_UNIT, ITF_QTDE, ITF_VL_DESC,PRO_CODIGONCM,PRO_ORIGEM '+
            'FROM TB_NOTA_FISCAL '+
            '  INNER JOIN tb_itens_nfl '+
            '  ON (ITF_CODNFL = NFL_CODIGO) '+
            '  INNER JOIN TB_PRODUTO '+
            '  ON (PRO_CODIGO = ITF_CODPRO) '+
            'WHERE NFL_CODIGO =:NFL_CODIGO ');
    ParamByName('NFL_CODIGO').AsInteger := It_Cd_Nota;
    Active := True;
    First;
    Lc_Vl_Produto := 0;

    Lc_Vl_Base := 0;

    Lc_Tx_Imp_Nacional := 0;
    Lc_Tx_Imp_Estadual := 0;
    Lc_Tx_Imp_Municipal := 0;

    Lc_Vl_Imp_Nacional := 0;
    Lc_Vl_Imp_Estadual := 0;
    Lc_Vl_Imp_Municipal := 0;

    Lc_Imp_Aprox := TStringList.Create;
    while not eof do
    Begin
      Lc_Imp_Aprox.Clear;
      Lc_Imp_Aprox := Fc_ImpostoAproximado(FieldByName('PRO_CODIGONCM').AsString,
                                           FieldByName('PRO_ORIGEM').AsString);
      Lc_Tx_Imp_Nacional  := StrToFloatDef(Lc_Imp_Aprox.Strings[0],0);
      Lc_Tx_Imp_Estadual  := StrToFloatDef(Lc_Imp_Aprox.Strings[1],0);
      Lc_Tx_Imp_Municipal := StrToFloatDef(Lc_Imp_Aprox.Strings[2],0);

      Lc_Vl_Base := RoundTo((FieldByName('ITF_VL_UNIT').AsFloat * FieldByName('ITF_QTDE').AsFloat) - FieldByName('ITF_VL_DESC').AsFloat,-2);
      Lc_Vl_Produto := Lc_Vl_Produto + Lc_Vl_Base;

      Lc_Vl_Imp_Nacional  := Lc_Vl_Imp_Nacional + (Lc_Vl_Base * (Lc_Tx_Imp_Nacional / 100));
      Lc_Vl_Imp_Estadual  := Lc_Vl_Imp_Estadual + (Lc_Vl_Base * (Lc_Tx_Imp_Estadual / 100));
      Lc_Vl_Imp_Municipal := Lc_Vl_Imp_Municipal + (Lc_Vl_Base * (Lc_Tx_Imp_Municipal / 100));

      next;
    end;
    FreeAndNil(Lc_Imp_Aprox);
  end;

  //Verifica a media dos impostos
  Lc_Tx_Imp_Nacional  := (RoundTo((Lc_Vl_Imp_Nacional / Lc_Vl_Produto),-4))*100;
  Lc_Tx_Imp_Estadual  := (RoundTo((Lc_Vl_Imp_Estadual / Lc_Vl_Produto),-4))*100;
  Lc_Tx_Imp_Municipal := (RoundTo((Lc_Vl_Imp_Municipal / Lc_Vl_Produto),-4))*100;

  Result.Append(FloatToStr(RoundTo(Lc_Vl_Imp_Nacional,-4)));
  Result.Append(FloatToStr(RoundTo(Lc_Vl_Imp_Estadual,-4)));
  Result.Append(FloatToStr(RoundTo(Lc_Vl_Imp_Municipal,-4)));
  Result.Append(FloatToStr(RoundTo(Lc_vl_Imp_Nacional + Lc_vl_Imp_Estadual + Lc_vl_Imp_Municipal,-4)));


  //Registra a Observação
  Lc_Obs := '';
  if (Lc_Vl_Imp_Nacional > 0) then
  Begin
    Lc_Obs := 'Valor aprox Imp. Nacional R$ ' + FloatToStrF(Lc_Vl_Imp_Nacional,ffFixed,10,2) + ' ('+ FloatToStrF(Lc_Tx_Imp_Nacional,ffFixed,10,2) +')%'
  end;
  if (Lc_Vl_Imp_Estadual > 0) then
  Begin
    Lc_Obs := Lc_Obs + '| Imp. Estadual R$ ' + FloatToStrF(Lc_Vl_Imp_Estadual,ffFixed,10,2) + ' ('+ FloatToStrF(Lc_Tx_Imp_Estadual,ffFixed,10,2) +')%'
  end;
  if (Lc_Vl_Imp_Municipal > 0) then
  Begin
    Lc_Obs := Lc_Obs + '| Imp. Municipal R$ ' + FloatToStrF(Lc_Vl_Imp_Municipal,ffFixed,10,2) + ' ('+ FloatToStrF(Lc_Tx_Imp_Municipal,ffFixed,10,2) +')%'
  end;


  if (Trim(Lc_Obs)<> '') then
  Begin
      Pc_Observacao(It_BD_Gestao,
                    It_Bd_Faturamento,
                    0,
                    It_Cd_Nota,
                    'A',
                    Lc_Obs);
  end;
  Lc_Qry.Close;
  FreeAndNil(Lc_Qry);
end;

procedure ttributacao.Pc_InfoRevendaVeiculos(Pc_Lista: TMemo;Pc_Cd_Pedido:integer);
var
  Lc_I: Integer;
  Lc_Qry: TIBQuery;
begin
  if(Fc_Tb_Geral('PRO_G_LABEL_PRO','')= 'S') then
  begin
    Lc_Qry := TIBQuery.Create(Nil);
    with Lc_Qry do
    BEgin
      Database := It_BD_Gestao;
      Transaction := It_Bd_transacao;
      ForcedRefresh := True;
      CachedUpdates := True;
      SQL.Clear;
      SQL.Add('SELECT DISTINCT PRO_CODIGOFAB AS PRO_CHASSI,          '+
              'PRO_CODIGOBAR AS PRO_PLACA, PRO_CODIGOFOR AS PRO_RENAVAN '+
              '  FROM TB_ITENS_NFL ITF                               '+
              '     INNER JOIN TB_PRODUTO PRO                        '+
              '     ON (PRO.PRO_CODIGO = ITF.ITF_CODPRO)             '+
              'WHERE ITF_CODPED=:ITF_CODPED                          ');
      ParamByName('ITF_CODPED').AsInteger := Pc_Cd_Pedido;
      Active := True;
      First;
      if RecordCount > 0 then
      begin
        if FieldByName('PRO_CHASSI').AsString <> '' then
          Pc_Lista.Lines.Add('  CHASSIS: '+ FieldByName('PRO_CHASSI').AsString);

        if FieldByName('PRO_PLACA').AsString <> '' then
          Pc_Lista.Lines.Add('  PLACA: '+ FieldByName('PRO_PLACA').AsString);

        if FieldByName('PRO_RENAVAN').AsString <> '' then
          Pc_Lista.Lines.Add('  RENAVAN: '+ FieldByName('PRO_RENAVAN').AsString);
      end;
    end;
    Lc_Qry.close;
    FreeandNil(Lc_Qry);
  end;
end;

function ttributacao.Fc_GeraNumeroNota(): Integer;
var
   Lc_Qry: TIBQuery;
   Lc_SqlTxt: string;
begin
  It_Bd_Faturamento.Active := True;
  Lc_Qry := TIBQuery.Create(nil);
  with Lc_Qry do
  Begin
    DataBase := It_BD_Gestao;
    Transaction := It_Bd_Faturamento;
    ForcedRefresh := true;
    CachedUpdates := True;
    Active := False;
    SQL.Clear;

    Lc_SqlTxt := ' select max(nfe_nota_fim)Ult_NF from tb_retorno_nfe where nfe_codmha = :cod_empresa ';
    SQL.Add(Lc_SqlTxt);
    ParamByName('cod_empresa').AsInteger := It_CodMha;
    if It_Bd_Faturamento.InTransaction then It_Bd_Faturamento.Commit;
    if not It_Bd_Faturamento.InTransaction then It_Bd_Faturamento.StartTransaction;

    Active := True;
    IF FieldByName('Ult_NF').IsNull THEN
     Result :=1
    else
     Result := StrToIntDef(FieldByName('Ult_NF').AsString,0) + 1;
    if It_Bd_Faturamento.InTransaction then It_Bd_Faturamento.Commit;
  end;
  Lc_Qry.Close;
  FreeAndNil(Lc_Qry);
end;


procedure ttributacao.Pc_AtualizarItens;
Var
  Lc_I :Integer;
  Lc_Qry:Tibquery;
begin
  //Cria Query Auxiliar
  Lc_Qry := Tibquery.Create(nil);
  Lc_Qry.Database := It_BD_Gestao;
  Lc_Qry.Transaction := It_Bd_Faturamento;
  Lc_Qry.ForcedRefresh := True;
  Lc_Qry.CachedUpdates := True;
  //Atualiza os itens Primarios da nota
  with Qr_ItensPedido do
  Begin
    First;
    Lc_I := 0;
    while not Eof do
    Begin
      if not It_Bd_Faturamento.InTransaction then It_Bd_Faturamento.StartTransaction;
      Fc_tributacao;
      Fc_DefineTributacao;
      Pc_AtualizarItensNota(Lc_Qry);
      Pc_AtualizarItensICMS(Lc_Qry,It_Nfe.NotasFiscais[0].NFe.Det[Lc_I]);
      Pc_AtualizarItensIPI(Lc_Qry,It_Nfe.NotasFiscais[0].NFe.Det[Lc_I]);
      Pc_AtualizarItensPIS(Lc_Qry,It_Nfe.NotasFiscais[0].NFe.Det[Lc_I]);
      Pc_AtualizarItensCOFINS(Lc_Qry,It_Nfe.NotasFiscais[0].NFe.Det[Lc_I]);
      Pc_AtualizarItensISSQN(Lc_Qry,It_Nfe.NotasFiscais[0].NFe.Det[Lc_I]);
      if It_Bd_Faturamento.InTransaction then It_Bd_Faturamento.Commit;
      next;
      inc(Lc_I);
    end;
  end;
end;

procedure ttributacao.Pc_AtualizarItensNota(Pc_Qry:Tibquery);
Var
  Lc_Custo: Real;
begin
  with Qr_ItensPedido do
  Begin
    IF FieldByName('ITF_OPER').AsString = 'C' then
    Begin
      if (FieldByName('ITF_VL_CUSTO').AsFloat = 0) then
        Lc_Custo := FieldByName('PRO_VL_CUSTO').AsFloat
      else
        Lc_Custo := FieldByName('ITF_VL_CUSTO').AsFloat;
      IF (Lc_Custo = 0) or (FieldByName('ITF_VL_CUSTO').AsFloat < FieldByName('ITF_VL_UNIT').AsFloat) then
        lc_custo := FieldByName('ITF_VL_UNIT').AsFloat;
    end
    else
    Begin
      lc_custo := FieldByName('PRO_VL_CUSTO').AsFloat;
    end;

    It_Tx_Imp_Aprox.Clear;
    It_Tx_Imp_Aprox := Fc_ImpostoAproximado(FieldByName('PRO_CODIGONCM').AsString,FieldByName('PRO_ORIGEM').AsString);
    Fc_AtualizaItensNfl(Pc_Qry,
                        FieldByName('ITF_CODIGO').AsInteger,
                        It_Cd_Pedido,
                        It_Cd_Nota,
                        FieldByName('ITF_CODPRO').AsInteger,
                        FieldByName('ITF_QTDE').AsFloat,
                        Lc_Custo,
                        FieldByName('ITF_VL_UNIT').AsFloat,
                        FieldByName('ITF_AQ_DESC').AsFloat,
                        FieldByName('ITF_VL_DESC').AsFloat,
                        FieldByName('ITF_AQ_COM').AsFloat,
                        FieldByName('ITF_OPER').AsString,
                        FieldByName('ITF_ESTOQUE').AsString,
                        FieldByName('ITF_DESPACHO').AsString,
                        FieldByName('ITF_AQ_IPI').AsFloat,
                        FieldByName('ITF_AQ_ICMS').AsFloat,
                        FieldByName('ITF_CODEST').AsInteger,
                        FieldByName('ITF_CODTPR').AsInteger,
                        It_Sentido,
                        StrToFloatDef(It_Tx_Imp_Aprox.Strings[3],0));
  end;
end;

procedure ttributacao.Pc_AtualizarItensICMS(Pc_Qry:TIbQuery;Pc_Item:TDetCollectionItem);
begin
  if It_AutorizacaoNFE then
  Begin
    //Atualiza os itens Primarios da nota
    with Pc_Item,Qr_ItensPedido do
    Begin
      Pc_AtualizaItensICMS(Pc_Qry,
                           It_Cd_Nota,
                           FieldByName('ITF_CODIGO').AsInteger,
                           Qr_Tributacao.FieldByName('cst_CODIGO').AsInteger,
                           Qr_Tributacao.FieldByName('CSOSN_CODIGO').AsInteger,
                           FieldByName('PRO_ORIGEM').AsString,
                           Qr_Tributacao.FieldByName('MODAL_CODIGO_NR').AsString,
                           Qr_Tributacao.FieldByName('TRB_RD_AQ_ICMS').AsFloat,
                           RoundTo(Imposto.ICMS.vBC,-2),
                           Imposto.ICMS.pICMS,
                           Imposto.ICMS.pRedBC,
                           Imposto.ICMS.vICMS,
                           Qr_Tributacao.FieldByName('MODAL_CODIGO_ST').AsString,
                           Imposto.ICMS.pRedBCST,
                           Imposto.ICMS.pMVAST,
                           Imposto.ICMS.vBCST,
                           Imposto.ICMS.pICMSST,
                           0, //It_Aq_Rd_St_ICMS,
                           Imposto.ICMS.vICMSST,
                           0, // It_CodDsi_ICMS,
                           0, //It_VL_Bc_St_Ret_ICMS,
                           0, //It_VL_St_Ret_ICMS,
                           '',//It_Partilha,
                           '', //It_Repasse_ICMS,
                           0, //It_Vl_Bc_Ret_ICMS,
                           0, //It_Vl_Ret_ICMS,
                           Imposto.ICMS.pCredSN,
                           Imposto.ICMS.vCredICMSSN,
                           Prod.vFrete,
                           Prod.vSeg,
                           Prod.vOutro,
                           Qr_Tributacao.FieldByName('NAT_CODIGO').AsInteger,
                           Qr_Tributacao.FieldByName('TRB_DESTAQUE').AsString,
                           Qr_Tributacao.FieldByName('TRB_CODOBS').AsInteger);
    end;
  End;
end;

procedure ttributacao.Pc_AtualizarItensIPI(Pc_Qry:TIbQuery;Pc_Item:TDetCollectionItem);
Var
  Lc_I :Integer;
begin
  if It_AutorizacaoNFE then
  Begin
    //Atualiza os itens Primarios da nota
    with Pc_Item,Qr_ItensPedido do
    Begin
      if (Trim(CSTIPIToStr(imposto.IPI.CST)) <> '') then
      Begin
        Pc_AtualizaItensIPI(Pc_Qry,
                            It_Cd_Nota,                                   // IPI_CODNFL
                            FieldByName('ITF_CODIGO').AsInteger, // IPI_CODITF
                            Qr_Tributacao.FieldByName('CST_CODIGO_IPI').AsInteger,
                            '',                                                     // IPI_CL_ENQD
                            '',                                                     // IPI_CNPJ_PROD
                            '',                                                     // IPI_CD_SELO
                            0,                                                      // IPI_QT_SELO
                            '',                                                     // IPI_CD_ENQD
                            imposto.IPI.vBC ,                                       // IPI_VL_BC
                            imposto.IPI.pIPI,                                       // IPI_AQ_NR
                            0,                                                      // IPI_QT_UNID
                            imposto.IPI.vIPI);                                      // IPI_VL_UNID
      end;
    end;
  End;
end;

procedure ttributacao.Pc_AtualizarItensPIS(Pc_Qry:TIbQuery;Pc_Item:TDetCollectionItem);
Var
  Lc_I :Integer;
begin
  if It_AutorizacaoNFE then
  Begin
    //Atualiza os itens Primarios da nota
    with Pc_Item,Qr_ItensPedido do
    Begin
      if (imposto.PIS.vBC > 0) then
      Begin
        Pc_AtualizaItensPIS(Pc_Qry,
                            It_Cd_Nota,                                             // PIS_CODNFL
                            FieldByName('ITF_CODIGO').AsInteger,                    // PIS_CODITF
                            Qr_Tributacao.FieldByName('CST_CODIGO_PIS').AsInteger,  // PIS_CODTBP
                            imposto.PIS.vBC,                                        // PIS_VL_BC
                            imposto.PIS.pPIS,                                       // PIS_AQ_NR
                            imposto.PIS.vPIS,                                       // PIS_VL_NR
                            0,                                                      // PIS_QT_VDA
                            0);                                                     // PIS_VL_AQ
      end;
    end;
  End;
end;

procedure ttributacao.Pc_AtualizarItensCOFINS(Pc_Qry:TIbQuery;Pc_Item:TDetCollectionItem);
Var
  Lc_I :Integer;
begin
  if It_AutorizacaoNFE then
  Begin
    //Atualiza os itens Primarios da nota
    with Pc_Item,Qr_ItensPedido do
    Begin
      if Imposto.COFINS.vBC > 0 then
      Begin
        Pc_AtualizaItensCFS(Pc_Qry,
                            It_Cd_Nota,                                             // CFS_CODNFL
                            FieldByName('ITF_CODIGO').AsInteger,                    // CFS_CODITF
                            Qr_Tributacao.FieldByName('CST_CODIGO_CFS').AsInteger,  // CFS_CODTBC
                            Imposto.COFINS.vBC,                                     // CFS_VL_BC
                            Imposto.COFINS.pCOFINS,                                 // CFS_AQ_NR
                            Imposto.COFINS.vCOFINS,                                 // CFS_VL_NR
                            0,                                                      // CFS_QT_UNID
                            0);                                                     // CFS_VL_AQ
      end;
    end;
  End;
end;

procedure ttributacao.Pc_AtualizarItensISSQN(Pc_Qry:TIbQuery;Pc_Item:TDetCollectionItem);
Var
  Lc_I :Integer;
begin
  if It_AutorizacaoNFE then
  Begin
    //Atualiza os itens Primarios da nota
    with Pc_Item do
    Begin
      if (Pc_Item.Imposto.ISSQN.vBC > 0) then
      Begin
        Pc_AtualizaItensISSQN(Pc_Qry,
                              It_Cd_Nota,
                              Qr_ItensPedido.FieldByName('ITF_CODIGO').AsInteger,
                              Pc_Item.Imposto.ISSQN.vBC,
                              Pc_Item.Imposto.ISSQN.vAliq,
                              Pc_Item.Imposto.ISSQN.vISSQN,
                              Pc_Item.Imposto.ISSQN.cMunFG,
                              It_CODSRV116, //Pc_Item.Imposto.ISSQN,
                              'N',//It_CODTRIBUT,
                              0, //Lc_Vl_Bc * (It_AQ_NR_PIS/100),
                              0,//Lc_Vl_Bc * (It_AQ_NR_CFS/100));
                              Pc_Item.Imposto.ISSQN.vISSRet);
      end;
    end;
  End;
end;

