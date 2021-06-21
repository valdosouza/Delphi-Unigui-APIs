unit ControllerTaxaxion;

interface

uses System.Classes, System.SysUtils,BaseController,
      FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerTaxRuler,  ControllerMerchandise,
      tblProduct,tblMerchandise, tblStock;

Type

  TControllerTaxaxion = Class(TBaseController)
  private
    FUtilizaNfe : Boolean;
    FAutorizacaoNFE : Boolean;
    FAutorizacaoNFCE : Boolean;
    FAutorizacaoNFSE : Boolean;
    FAliqCreditoIcms :  Real;
    FMargemValorAgregado : Real;
    FAliqInternaIcms : Real;
    FAliqInternaIcmsSt : Real;
    FListaImpostoAproximado: TStringList;
    FCodigoServico116 : String;
    FMensagemFisco : TStringList;
    FCasasDecimais : Integer;
    FSomaICMSNaNota : Boolean;
    FDisttribuirIcms : Boolean;
    FDisttribuirIcmsST : Boolean;
    FDisttribuirIPI : Boolean;
    FProduto: TProduct;
    FIgnorarST: String;
    FCodigoEstado: Integer;
    FEstoque: TStock;
    FConsumidorFinal: String;
    FEstabelecimento: Integer;
    FCRT: String;
    FMercadoria: TMerchandise;
    FDirecao: String;
    FCFOP: String;



    procedure setAliquotaUFST;
    procedure setAliquotaUF;


    function setTributacao: boolean;
    function ValidaItensNota():Boolean;
    Function VerificaBeneficioICMS():Boolean;
    procedure setFCodigoEstado(const Value: Integer);
    procedure setFConsumidorFinal(const Value: String);
    procedure setFCRT(const Value: String);
    procedure setFEstabelecimento(const Value: Integer);
    procedure setFEstoque(const Value: TStock);
    procedure setFIgnorarST(const Value: String);
    procedure setFProduto(const Value: TProduct);
    procedure setFMercadoria(const Value: TMerchandise);
    procedure setFCFOP(const Value: String);
    procedure setFDirecao(const Value: String);



  public
    TaxRuler : TControllerTaxRuler;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure getTaxa;

    property Estabelecimento: Integer read FEstabelecimento write setFEstabelecimento;
    property ConsumidorFinal: String read FConsumidorFinal write setFConsumidorFinal;
    property IgnorarST: String read FIgnorarST write setFIgnorarST;
    property CRT: String read FCRT write setFCRT;
    property CodigoEstado : Integer read FCodigoEstado write setFCodigoEstado;
    property CFOP: String read FCFOP write setFCFOP;
    property Direcao: String read FDirecao write setFDirecao;

    property Produto : TProduct read FProduto write setFProduto;
    property Mercadoria : TMerchandise read FMercadoria write setFMercadoria;
    property Estoque : TStock read FEstoque  write setFEstoque ;

  End;

implementation
{ TControllerTaxaxion }

constructor TControllerTaxaxion.Create(AOwner: TComponent);
begin
  inherited;
  //ListaImpostoAproximado := TStringList.create;
  // MensagemFisco := TStringList.create;
  TaxRuler := TControllerTaxRuler.Create(Self);
  FProduto := TProduct.Create;
  FMercadoria := TMerchandise.Create;
  FEstoque := TStock.Create;
end;

destructor TControllerTaxaxion.Destroy;
begin
  FreeAndNil(TaxRuler);
  FreeAndNil(FProduto);
  FreeAndNil(FMercadoria);
  FreeAndNil(FEstoque);
  FreeAndNil(FListaImpostoAproximado);
  FreeAndNil(FMensagemFisco);
  inherited;
end;

procedure TControllerTaxaxion.getTaxa;
begin
  //Dados da Tributação
  with TaxRuler do
  Begin
    Estabelecimento := FEstabelecimento;
    Registro.ParaConsumidor := FConsumidorFinal;
    Registro.CRT := FCRT;
    Registro.Estado := FCodigoEstado;
    //Inicia processo de busca pela regra
    Registro.Estabelecimento := FEstabelecimento;
    Registro.Produto := FMercadoria.Codigo;
    Registro.ParaIcmsSt := Estoque.TemST;
    if (Estoque.TemST = 'S') then
    Begin
      if FIgnorarST = 'S' then
        Registro.ParaIcmsSt := 'S';
    end;

    Registro.NCM := FMercadoria.NCM;
    Registro.Origem := FMercadoria.Origem;
    Registro.Direcao := FDirecao;
    Registro.Cfop := FCFOP;
    Registro.TipoTransacao := FMercadoria.TipoTributacao;
    getRuler;
  End;
end;


procedure TControllerTaxaxion.setAliquotaUF;
begin
  {
  if (It_aliq_Interna_NR_Icms = 0) then
  Begin
    Qr_Uf_ICMS_NR.Active := False;
    Qr_Uf_ICMS_NR.ParamByName('UFE_CODIGO').AsInteger := Qr_Estabelecimento.FieldByName('UFE_CODIGO').AsInteger;
    Qr_Uf_ICMS_NR.ParamByName('MUN_CODIGONCM').AsString := Qr_ItensPedido.FieldByName('PRO_CODIGONCM').AsString;
    Qr_Uf_ICMS_NR.ParamByName('MUN_CODMHA').AsInteger := It_CodMha;
    Qr_Uf_ICMS_NR.Active := True;
    Qr_Uf_ICMS_NR.First;
    if Qr_Uf_ICMS_NR.RecordCount > 0 then
    Begin
      if (Qr_Uf_ICMS_NR.FieldByName('MUN_ALIQ_INTERNA').AsFloat > 0) then
        It_aliq_Interna_NR_Icms := Qr_Uf_ICMS_NR.FieldByName('MUN_ALIQ_INTERNA').AsFloat;
    end;
  end;
  }
end;

procedure TControllerTaxaxion.setAliquotaUFST;
Var
  Lc_aliq_Interna_NR_Icms : Real;
  Lc_aliq_Interna_ST_Icms : Real;
begin
  {
  Qr_Uf_Mva_NCM.Active := False;
  Qr_Uf_Mva_NCM.ParamByName('UFE_CODIGO').AsInteger := Qr_Pedido.FieldByName('UFE_CODIGO').AsInteger;
  Qr_Uf_Mva_NCM.ParamByName('MUN_CODMHA').AsInteger := It_CodMha;
  Qr_Uf_Mva_NCM.Active := True;
  Qr_Uf_Mva_NCM.First;

  It_aliq_Interna_ST_Icms := Qr_Uf_Mva_NCM.FieldByName('MUN_ALIQ_INTERNA').AsFloat;
  //Verifica se precisamos pegar o MVA de um NCM especifico
  if Trim(Qr_ItensPedido.FieldByName('PRO_CODIGONCM').AsString)<> '' then
  Begin
    IF (Qr_Uf_Mva_NCM.Locate('MUN_CODIGONCM', Qr_ItensPedido.FieldByName('PRO_CODIGONCM').AsString, [])) then
    Begin
      MargemValorAgregado := Qr_Uf_Mva_NCM.FieldByName('MUN_MR_VL_AGREGADO').AsFloat;
      if (Qr_Uf_Mva_NCM.FieldByName('MUN_ALIQ_INTERNA').AsFloat > 0) then
        It_aliq_Interna_St_Icms := Qr_Uf_Mva_NCM.FieldByName('MUN_ALIQ_INTERNA').AsFloat;
    end;
  end;

  if not UtilizarMvaOrginal then
  Begin
    Lc_aliq_Interna_NR_Icms := It_aliq_Interna_NR_Icms;
    Lc_aliq_Interna_ST_Icms := It_aliq_Interna_ST_Icms;
    MargemValorAgregado := 0;
    if (Qr_Tributacao.Active ) then
    Begin
      //Margem de Valor Agregado
      //Observar não so as aliquotas mas a carga tributaria real do ICMS Próprio e o ICMS do Destino
      Lc_aliq_Interna_NR_Icms := (It_aliq_Interna_NR_Icms - ( (It_aliq_Interna_NR_Icms * Qr_Tributacao.FieldByName('TRB_RD_BS_ICMS').AsFloat)/100) );
      Lc_aliq_Interna_NR_Icms := RoundTO(Lc_aliq_Interna_NR_Icms,-2);
      //Verifica se a redução da base será propagada para o calculo da base da ST
      if (Qr_Tributacao.FieldByName('TRB_RD_BS_ICMS_ST').AsString = 'S') then
      Begin
        Lc_aliq_Interna_ST_Icms := (It_aliq_Interna_ST_Icms - ( (It_aliq_Interna_ST_Icms * Qr_Tributacao.FieldByName('TRB_RD_BS_ICMS').AsFloat)/100) );
        Lc_aliq_Interna_ST_Icms := RoundTO(Lc_aliq_Interna_ST_Icms,-2);
      End;
      //MVA ajustada = [(1+ MVA ST original) x (1 - ALQ inter) / (1- ALQ intra)] -1
      //TRansformada no Excel =((B8 * (1-C8)) / (1-D8))
      MargemValorAgregado := Qr_Uf_Mva_NCM.FieldByName('MUN_MR_VL_AGREGADO').AsFloat;
      MargemValorAgregado := ( ( MargemValorAgregado * (100 - Lc_aliq_Interna_NR_Icms)) / (100 - Lc_aliq_Interna_ST_Icms)) ;
      MargemValorAgregado := RoundTO(MargemValorAgregado,-4);
    End;
  End;
  //Caso seja empesa optante pelo Simples deixar 50% da aliquota
  if Qr_Pedido.FieldByName('EMP_MICRO').AsString = 'S' then
  Begin
    if (MargemValorAgregado > 0) then
    Begin
      if (Fc_Tb_Geral('GRL_G_DECRETO108352014','N') = 'S') then
      Begin
        //Verifica se o Estado é de Santa Catarina
        if (Qr_Uf_Mva_NCM.FieldByName('UFE_SIGLA').AsString = 'SC') then
        Begin
          MargemValorAgregado := ((MargemValorAgregado - 1) * 0.3) + 1;
        end
        else
        Begin
          if (Lc_aliq_Interna_ST_Icms < 18) or (VerificaBeneficioICMS) then
          Begin
            MargemValorAgregado := ((MargemValorAgregado - 1) * 0.5) + 1;
          end
          else
          Begin
            MargemValorAgregado := ((MargemValorAgregado - 1) * 0.3) + 1;
          end;
        end;
      end;
    end;
  end;
  }
end;



procedure TControllerTaxaxion.setFCFOP(const Value: String);
begin
  FCFOP := Value;
end;

procedure TControllerTaxaxion.setFCodigoEstado(const Value: Integer);
begin
  FCodigoEstado := Value;
end;

procedure TControllerTaxaxion.setFConsumidorFinal(const Value: String);
begin
  FConsumidorFinal := Value;
end;

procedure TControllerTaxaxion.setFCRT(const Value: String);
begin
  FCRT := Value;
end;

procedure TControllerTaxaxion.setFDirecao(const Value: String);
begin
  FDirecao := Value;
end;

procedure TControllerTaxaxion.setFEstabelecimento(const Value: Integer);
begin
  FEstabelecimento := Value;
end;

procedure TControllerTaxaxion.setFEstoque(const Value: TStock);
begin
  FEstoque := Value;
end;

procedure TControllerTaxaxion.setFIgnorarST(const Value: String);
begin
  FIgnorarST := Value;
end;

procedure TControllerTaxaxion.setFMercadoria(const Value: TMerchandise);
begin
  FMercadoria := Value;
end;

procedure TControllerTaxaxion.setFProduto(const Value: TProduct);
begin
  FProduto := Value;
end;

function TControllerTaxaxion.ValidaItensNota():Boolean;
Var
  Lc_Tp_Cliente : String;
  Lc_Tp_tributa : String;
  Lc_Aux:String;
//  Lc_ValidaEANGTIN : TACBrValidador;
Begin
  {
  //valida Itens da Nota
  Result := true;
  It_M_Fisco.Clear;
  with Qr_ItensPedido do
  Begin
    Active := True;
    first;
    while not Eof do
    begin
      IF not Fc_Tributacao then
      Begin
        It_M_Fisco.Add(FieldByName('ITF_CODPRO').AsString + ' - ' + FieldByName('PRO_DESCRICAO').AsString);
        //Monta a mensagem para produtos com Substituição tributária
        if (FieldByName('PRO_SUB_TRIB').AsString <> 'S') then
          It_M_Fisco.Add('      ' + 'Este produto não está sob o regime de Substituição tributária.')
        else
          It_M_Fisco.Add('      ' + 'Este produto está sob o regime de Substituição tributária.');
        //Monta a Mensagem para a Finalidade de Tributação
        if Trim(FieldByName('PRO_TRIBUTACAO').AsString) = '' then
          It_M_Fisco.Add('      ' + 'Finalidade para a tributação não foi definido.')
        else
        Begin
          case StrToIntDef(FieldByName('PRO_TRIBUTACAO').AsString,0) of
            0:Lc_Tp_tributa := 'Não foi definido.';
            1:Lc_Tp_tributa := 'Revenda.';
            2:Lc_Tp_tributa := 'Produção.';
            3:Lc_Tp_tributa := 'Consignado.';
            4:Lc_Tp_tributa := 'Industrialização.';
            5:Lc_Tp_tributa := 'Consumo Interno.';
            6:Lc_Tp_tributa := 'Prestação de Serviço.';
          end;
          It_M_Fisco.Add('      ' + 'Finalidade para a tributação está como '+ Lc_Tp_tributa +'.');
        end;
        //Monta a Mensagem para a origem da Mercadoria
        case StrToIntDef(FieldByName('PRO_ORIGEM').AsString,0) of
          0:It_M_Fisco.Add('      ' + ' 0 - Nacional, exceto as indicadas nos códigos 3, 4, 5 e 8.');
          1:It_M_Fisco.Add('      ' + ' 1 - Estrangeira - Importação direta, exceto a indicada no código 6.');
          2:It_M_Fisco.Add('      ' + ' 2 - Estrangeira - Adquirida no mercado interno, exceto a indicada no código 7.');
          3:It_M_Fisco.Add('      ' + ' 3 - Nacional, mercadoria ou bem com Conteúdo de Importação superior a 40% e inferior ou igual a 70%.');
          4:It_M_Fisco.Add('      ' + ' 4 - Nacional, cuja prod. tenha sido feita em conf. os proc. produtivos básicos conf as legislações citadas nos Ajustes.');
          5:It_M_Fisco.Add('      ' + ' 5 - Nacional, mercadoria ou bem com Conteúdo de Importação inferior ou igual a 40%.');
          6:It_M_Fisco.Add('      ' + ' 6 - Estrangeira - Importação direta, sem similar nacional,constante em lista da CAMEX e gás natural.');
          7:It_M_Fisco.Add('      ' + ' 7 - Estrangeira - Adquirida no mercado interno, sem similar nacional, constante lista CAMEX e gás natural.');
          8:It_M_Fisco.Add('      ' + ' 8 - Nacional, mercadoria ou bem com Conteúdo de Importação superior a 70%.');
        end;
        //Pede verificação do CFOP em Relação a operação
        It_M_Fisco.Add('');
        It_M_Fisco.Add('Verifique se o CFOP utilizado é o correto para operação de ' + Lc_Tp_tributa);
        It_M_Fisco.Add('Verifique se o CFOP utilizado é o correto para estado do ' + Qr_Pedido.FieldByName('UFE_SIGLA').AsString);
      end;
      Next;
    end;

    if (Length(It_M_Fisco.Text) >0 ) then
    Begin
      It_M_Fisco.Add('');
      It_M_Fisco.Add('Existe regra para estes critérios relacionado ao destinatário?');
      //Mostra o Estado do cliente
      It_M_Fisco.Add('       1º Para o estado do '+ Qr_Pedido.FieldByName('UFE_SIGLA').AsString);
      //Monta a mensagem para tipo do Cliente consumidor / Revenda
      if Qr_Pedido.FieldByName('EMP_CONSUMIDOR').AsString = 'S' then
        Lc_Tp_Cliente := 'Consumidor'
      else
        Lc_Tp_Cliente := 'Revenda';
      It_M_Fisco.Add('       2º Para destinatário do tipo ' + Lc_Tp_Cliente);

      //Monta a mensagem Cliente micro empresa ou não
      if Qr_Pedido.FieldByName('EMP_MICRO').AsString = 'S' then
        It_M_Fisco.Add('       3º Este destinatário está marcado como Optante pelo simples.')
      else
        It_M_Fisco.Add('       3º Este destinatário não está marcado como Optante pelo simples.');

      MensagemPadrao('Mensagem', 'A T E N Ç Ã O!.' + EOLN + EOLN +
                     'Regra de Tributação não encontrada para os seguintes Produtos.' + EOLN + EOLN +
                      It_M_Fisco.Text + EOLN +
                     'Verifique e tente novamente.' + EOLN,
                     ['OK'], [bEscape], mpErro);

      Result := False;
      exit;
    end;
    //vERIFICA O ncm
    It_M_Fisco.Clear;
    First;
    while not Eof do
    begin
      if (FieldByName('PRO_TIPO').AsString <> 'S') then
      Begin
        Lc_Aux := TRIM(FieldByName('PRO_CODIGONCM').AsString);
        Lc_Aux := Fc_RemoveCaracterInformado(Lc_Aux, '.');
        Lc_Aux := Fc_RemoveCaracterInformado(Lc_Aux, ',');
        Lc_Aux := Fc_RemoveCaracterInformado(Lc_Aux, '/');
        Lc_Aux := Fc_RemoveCaracterInformado(Lc_Aux, '-');
        if (Lc_Aux = '') or (Length(Lc_Aux)<>8) or (Lc_Aux = '00000000') then
          It_M_Fisco.Add(FieldByName('ITF_CODPRO').AsString + ' - ' + FieldByName('PRO_DESCRICAO').AsString);
      end;
      Next;
    end;
    if (Length(It_M_Fisco.Text) >0 ) then
    Begin
      MensagemPadrao('Mensagem', 'A T E N Ç Ã O!.' + EOLN + EOLN +
                     'Verificar o Cód. Class. Fiscal(NCM) dos seguintes produtos.' + EOLN +
                     'Falta de preenchimento ou não contém 8 digitos.' + EOLN +
                      It_M_Fisco.Text + EOLN +
                     'Verifique e tente novamente.' + EOLN,
                     ['OK'], [bEscape], mpErro);
      Result := False;
      exit;
    end;
    //VERIFICA O CEST
    It_M_Fisco.Clear;
    First;
    while not Eof do
    begin
      if (FieldByName('PRO_SUB_TRIB').AsString = 'S') then
      Begin
        Lc_Aux := TRIM(FieldByName('PRO_CEST').AsString);
        if (Lc_Aux = '') or (Length(Lc_Aux)<>7) or (Lc_Aux = '0000000') then
          It_M_Fisco.Add(FieldByName('ITF_CODPRO').AsString + ' - ' + FieldByName('PRO_DESCRICAO').AsString);
      end;
      Next;
    end;
    if (Length(It_M_Fisco.Text) >0 ) then
    Begin
      MensagemPadrao('Mensagem', 'A T E N Ç Ã O!.' + EOLN + EOLN +
                     'Verificar o Código especificador da S.T dos seguintes produtos.' + EOLN +
                     'Falta de preenchimento ou não contém 7 digitos.' + EOLN +
                      It_M_Fisco.Text + EOLN +
                     'Verifique e tente novamente.' + EOLN,
                     ['OK'], [bEscape], mpErro);
      Result := False;
      exit;
    end;

    //valida o Preenchimento do Unidade Comercial
    It_M_Fisco.Clear;
    First;
    while not Eof do
    begin
      if (TRIM(FieldByName('MED_ABREVIATURA').AsString) = '') then
        It_M_Fisco.Add(FieldByName('ITF_CODPRO').AsString + ' - ' + FieldByName('PRO_DESCRICAO').AsString);
      Next;
    end;
    if (Length(It_M_Fisco.Text) >0 ) then
    Begin
      MensagemPadrao('Mensagem', 'A T E N Ç Ã O!.' + EOLN + EOLN +
                     'Verificar o campo unidade dos seguintes produtos.' + EOLN +
                     'Falta de preenchimento.' + EOLN +
                      It_M_Fisco.Text + EOLN +
                     'Verifique e tente novamente.' + EOLN,
                     ['OK'], [bEscape], mpErro);
      Result := False;
      exit;
    end;

    //valida o Preenchimento do Código de Barras - Exceto quando for revenda de veiculos
    if (Fc_Tb_Geral('PRO_G_LABEL_PRO','')='N') then
    Begin
      It_M_Fisco.Clear;
      First;
      while not Eof do
      begin
        if (TRIM(FieldByName('PRO_CODIGOBAR').AsString) <> '') and
          ((Length(FieldByName('PRO_CODIGOBAR').AsString)<8) or (Length(FieldByName('PRO_CODIGOBAR').AsString)>14)) then
          It_M_Fisco.Add(FieldByName('ITF_CODPRO').AsString + ' - ' + FieldByName('PRO_DESCRICAO').AsString);
        Next;
      end;
      if (Length(It_M_Fisco.Text) >0 ) then
      Begin
        MensagemPadrao('Mensagem', 'A T E N Ç Ã O!.' + EOLN + EOLN +
                       'Verificar o Cód. de barras dos seguintes produtos.' + EOLN +
                       'Não contém o mímino de 8 digitos.' + EOLN +
                        It_M_Fisco.Text + EOLN +
                       'Verifique e tente novamente.' + EOLN,
                       ['OK'], [bEscape], mpErro);
        Result := False;
        exit;
      end;
      //Valida o codigo de barras calculado
      Lc_ValidaEANGTIN  := TACBrValidador.Create(Self);
      Lc_ValidaEANGTIN.TipoDocto := docGTIN;
      It_M_Fisco.Clear;
      First;
      while not Eof do
      begin
        if (TRIM(FieldByName('PRO_CODIGOBAR').AsString) <> '') then
        BEgin
          Lc_ValidaEANGTIN.Documento := TRIM(FieldByName('PRO_CODIGOBAR').AsString);
          if not Lc_ValidaEANGTIN.Validar then
            It_M_Fisco.Add(FieldByName('ITF_CODPRO').AsString + ' - ' + FieldByName('PRO_DESCRICAO').AsString);
        end;
        Next;
      end;
      if (Length(It_M_Fisco.Text) >0 ) then
      Begin
        MensagemPadrao('Mensagem', 'A T E N Ç Ã O!.' + EOLN + EOLN +
                       'Verificar o Cód. de barras dos seguintes produtos.' + EOLN +
                       'O código EAN/GTIN está incorreto.' + EOLN +
                        It_M_Fisco.Text + EOLN +
                       'Verifique e tente novamente.' + EOLN,
                       ['OK'], [bEscape], mpErro);
        Result := False;
        exit;
      end;
    end;

    IF (Qr_ItensPedido.FieldByName('ITF_VL_UNIT').AsFloat  = 0) then
    Begin
      MensagemPadrao('Mensagem de Alerta', 'A T E N Ç Ã O!.' + EOLN + EOLN +
                    'Este produto está com o preço Zerado.' + EOLN +
                    'Verifique antes de continuar.' + EOLN,
                    ['OK'], [bEscape], mpAlerta);
      Result := false;
      exit;
    end;

    if Trim(FieldByName('PRO_DESCRICAO').AsString)='' then
    begin
      MensagemPadrao('Mensagem','A T E N Ç Ã O!.'+EOLN+EOLN+
                     'O produto está com problemas em sua descrição.'+EOLN+
                     'Verifique e tente novamente.'+EOLN,
                     ['OK'],[bEscape],mpAlerta);
      Result := False;
      exit;
    end;
  end;
  }
end;



function TControllerTaxaxion.VerificaBeneficioICMS: Boolean;
begin
  {
  Result := False;
  if Qr_Tributacao.RecordCount > 0 then
  Begin
    if ( Qr_Tributacao.FieldByName('TRB_RD_BS_ICMS').AsFloat > 0 ) or
       ( Qr_Tributacao.FieldByName('TRB_RD_AQ_ICMS').AsFloat > 0 ) then
    Begin
      Result := True;
    End;
  End;
  }
end;



function TControllerTaxaxion.setTributacao: boolean;
Var
  Lc_Lista : Variant;
  Lc_Uf_Emissor : Integer;
Begin
  {
  Result := 0;
  It_NatCFOP := '';
  with Qr_Tributacao do
  Begin
    if RecordCount > 1 then
    Begin
      Lc_Lista := VarArrayCreate([0, 1], varVariant);
      Lc_Lista[0] := Qr_Pedido.FieldByName('UFE_CODIGO').AsInteger;
      Lc_Lista[1] := Qr_ItensPedido.FieldBYName('ITF_CODPRO').AsInteger;
      if not (locate('TRB_ESTADO;TRB_CODPRO', Lc_Lista, [])) then
        if not (locate('TRB_ESTADO', Qr_Pedido.FieldByName('UFE_CODIGO').AsInteger, [])) then
          locate('TRB_CODPRO', Qr_Pedido.FieldByName('UFE_CODIGO').AsInteger, []);

    end;
     //Define a aliquota de Tributação pela Regra
    It_aliq_Interna_NR_Icms := Qr_Tributacao.FieldByName('TRB_AQ_ICMS').AsFloat;
    //Nesta função verificamos se o NCM tem uma aliquota interna diferente da definida na regra e trocamos
    Pc_Aliquota_UF_NR;
    Pc_Aliquota_UF_ST;
    //Se a pesquisa trazer um registro ainda assim precisamos saber se este registro
    //se refere ao estado do Paraná, caso contrario nega a regra.
    if (Qr_Pedido.FieldByName('UFE_CODIGO').AsInteger = Qr_Estabelecimento.FieldByName('UFE_CODIGO').AsInteger) and
       (FieldByName('TRB_ESTADO').AsInteger <> Qr_Pedido.FieldByName('UFE_CODIGO').AsInteger) then
    Begin
      Result := -1;
      exit;
    end;
    //Variveis para Calculo de tributaçao do ICMS

    //Variveis para Calculo de tributaçao do ISS
    case StrToIntDef(Fc_Tb_Geral('OSR_G_NFSE_TRIB','0'),0) of
      0:It_CODTRIBUT := 'N';
      1:It_CODTRIBUT := 'S';
      2:It_CODTRIBUT := 'R';
      3:It_CODTRIBUT := 'I';
    end;
    It_CODSRV116 := Fc_Tb_Geral('OSR_G_NFSE_CL116','');
    It_AQ_NR_ISS := FieldByName('TRB_AQ_ISS').AsFloat;
    //Define se a operação é como Substituto Tributario
    It_Subst_Tributario := (FieldByName('TRB_SUB_TRI').AsString = 'S');
    It_NatCFOP := FieldByName('NAT_CFOP').AsString;
  end;
  }
end;

end.
