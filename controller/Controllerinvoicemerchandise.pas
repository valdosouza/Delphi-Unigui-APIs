unit Controllerinvoicemerchandise;

interface
uses  System.Classes, System.SysUtils,Md5, FireDAC.Stan.Param,System.Math,

      tblinvoicemerchandise,  tblEntity, FireDAC.Comp.Client,
      BaseController,ControllerInvoice,ControllerOrder, ControllerOrderItem,
      ControllerMerchandise,ControllerInvoiceShipping, ControllerInvoiceReturn55,
     ObjInvoiceMerchandise,ControllerOrderSale,ControllerOrderPurchase,
     COntrollerOrderStockAdjust;

Type
  TControllerInvoiceMerchandise = Class(TBaseController)
  private
    FDistIPI: String;
    FDistIcmsST: String;
    FDirecao: String;
    FDistIcms: String;


    function setTaxaxion:Boolean;Virtual;
    procedure getTaxaxion;Virtual;
    procedure setICMS(idx : Integer);
    procedure setIPI(idx : Integer);
    procedure setPIS(idx : Integer);
    procedure setCOFINS(idx : Integer);
    procedure setFDirecao(const Value: String);
    procedure setFDistIcms(const Value: String);
    procedure setFDistIcmsST(const Value: String);
    procedure setFDistIPI(const Value: String);

    function saveICMS:boolean;
    function saveIPI:boolean;
    function savePIS:Boolean;
    function saveCofins:Boolean;
    function saveII:Boolean;
  public
    Registro    : Tinvoicemerchandise;
    Nota        : TControllerInvoice;
    Entrega     : TControllerInvoiceShipping;
    Itens       : TControllerOrderItem;
    Retorno     : TControllerInvoiceReturn55;
    Venda       : TControllerOrderSale;
    Compra      : TControllerOrderPurchase;
    Ajuste      : TControllerOrderStockAdjust;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure setVariable;
    function calculate:Boolean;
    function save:boolean;
    function delete:boolean;
    function saveImpostos:boolean;
    procedure clear;
    function getByKey:boolean;
    function getAllByKey:boolean;
    function cancelInvoice:Boolean;
    function saveDataObjeto(DObj : TObjInvoiceMerchandise):Boolean;
    function getOrderSale(VendedorID:Integer):Boolean;
    function getOrderPurchase:Boolean;
    function getOrderStockAdjust:Boolean;


    property Direcao: String read FDirecao write setFDirecao;
    property DistIcms: String read FDistIcms write setFDistIcms;
    property DistIcmsST: String read FDistIcmsST write setFDistIcmsST;
    property DistIPI: String read FDistIPI write setFDistIPI;

  End;

implementation

{ Controllerinvoicemerchandise }

function TControllerInvoiceMerchandise.calculate: Boolean;
begin
  Result := True;
end;

function TControllerInvoiceMerchandise.cancelInvoice: Boolean;
begin
  {
  PedidoItensIcms.Registro.Ordem := Registro.Codigo;
  PedidoItensIcms.Registro.Estabelecimento := Registro.Estabelecimento;
  PedidoItensIcms.deleteByOrdem;

  PedidoItensIpi.Registro.Ordem := Registro.Codigo;
  PedidoItensIpi.Registro.Estabelecimento := Registro.Estabelecimento;
  PedidoItensIpi.deleteByOrdem;

  PedidoItensCofins.Registro.Ordem := Registro.Codigo;
  PedidoItensCofins.Registro.Estabelecimento := Registro.Estabelecimento;
  PedidoItensCofins.deleteByOrdem;

  PedidoItensPis.Registro.Ordem := Registro.Codigo;
  PedidoItensPis.Registro.Estabelecimento := Registro.Estabelecimento;
  PedidoItensPis.deleteByOrdem;

  PedidoItensII.Registro.Ordem := Registro.Codigo;
  PedidoItensII.Registro.Estabelecimento := Registro.Estabelecimento;
  PedidoItensII.deleteByOrdem;

  NotaEntrega.Registro.Codigo := Registro.Codigo;
  NotaEntrega.Registro.Estabelecimento := Registro.Estabelecimento;
  NotaEntrega.delete;

  Retorno.Registro.Codigo := Registro.Codigo;
  Retorno.Registro.Estabelecimento := Registro.Estabelecimento;
  Retorno.delete;

  Observacao.Registro.Codigo := Registro.Codigo;
  Observacao.Registro.Estabelecimento := Registro.Estabelecimento;
  Observacao.delete;

  delete;

  Nota.Registro.Codigo := Registro.Codigo;
  Nota.Registro.Estabelecimento := Registro.Estabelecimento;
  Nota.delete;
  }
end;

procedure TControllerinvoicemerchandise.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerinvoicemerchandise.Create(AOwner: TComponent);
begin
  inherited;
  Registro  := Tinvoicemerchandise.Create;
  Nota      := TControllerInvoice.Create(Self);
  Entrega   := TControllerInvoiceShipping.Create(self);
  Itens     := TControllerOrderItem.Create(self);
  Retorno   := TControllerInvoiceReturn55.Create(Self);
  Venda     := TControllerOrderSale.Create(Self);
  Compra    := TControllerOrderPurchase.Create(Self);
  Ajuste    := TControllerOrderStockAdjust.Create(Self);

end;

function TControllerInvoiceMerchandise.delete: boolean;
begin
  deleteObj(Registro)
end;

destructor TControllerinvoicemerchandise.Destroy;
begin
  Nota.DisposeOf;
  Entrega.DisposeOf;
  Itens.DisposeOf;
  Registro.DisposeOf;
  Retorno.DisposeOf;
  Venda.DisposeOf;
  Compra.DisposeOf;
  Ajuste.DisposeOf;
  inherited;
end;

function TControllerinvoicemerchandise.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerInvoiceMerchandise.saveCofins: Boolean;
begin
  //
end;

function TControllerInvoiceMerchandise.saveDataObjeto(
  DObj: TObjInvoiceMerchandise): Boolean;
Var
  I : Integer;
begin
  Try
    Nota.saveDataObjeto(DObj.Nota);

    Self.ClonarObj( DObj.Mercadoria,Registro);
    self.save;

    Self.ClonarObj( DObj.Entrega,self.Entrega.Registro);
    self.Entrega.save;


    for I := 0 to DObj.Nota.Observacoes.Count - 1 do
    Begin
      clearObj(Nota.Observacao.Registro);
      Self.ClonarObj( DObj.Nota.Observacoes[I],Nota.Observacao.Registro) ;
      Nota.Observacao.save;
    End;

    for I := 0 to DObj.ItemsICMS.Count - 1 do
    Begin
      clearObj(Itens.Icms.Registro);
      Self.ClonarObj( DObj.ItemsICMS[I], Itens.Icms.Registro ) ;
      Itens.Icms.save;
    End;

    for I := 0 to DObj.ItemsIPI.Count - 1 do
    Begin
      clearObj(Itens.Ipi.Registro);
      Self.ClonarObj( DObj.ItemsIPI[I],Itens.Ipi.Registro );
      Itens.Ipi.save;
    End;

    for I := 0 to DObj.ItemsPIS.Count - 1 do
    Begin
      clearObj(Itens.Pis.Registro);
      Self.ClonarObj( DObj.ItemsPIS[I],Itens.Pis.Registro );
      Itens.Pis.save;
    End;

    for I := 0 to DObj.ItemsCofins.Count - 1 do
    Begin
      clearObj(Itens.Cofins.Registro);
      Self.ClonarObj( DObj.ItemsCofins[I], Itens.Cofins.Registro );
      Itens.Cofins.save;
    End;

    for I := 0 to DObj.ItemsII.Count - 1 do
    Begin
      clearObj(Itens.II.Registro);
      Self.ClonarObj( DObj.ItemsII[I], Itens.II.Registro );
      Itens.II.save;
    End;
    Result := True;
  Except
    Result := FAlse;
  End;
end;

function TControllerInvoiceMerchandise.saveICMS: boolean;
Var
  I : Integer;
begin
  for I := 0 to Itens.Icms.Lista.Count - 1 do
  Begin
    Itens.ClonarObj(Itens.Icms.Lista[I],Itens.Icms.Registro);
    Itens.Icms.save;
  End;
end;

function TControllerInvoiceMerchandise.saveII: Boolean;
Var
  I : Integer;
begin
  for I := 0 to Itens.II.Lista.Count - 1 do
  Begin
    Itens.ClonarObj(Itens.II.Lista[I],Itens.II.Registro);
    Itens.II.save;
  End;
end;

function TControllerInvoiceMerchandise.saveImpostos: boolean;
begin
  saveICMS;
  saveIPI;
  savePIS;
  saveCofins;
  saveII;
end;

function TControllerInvoiceMerchandise.saveIPI: boolean;
Var
  I : Integer;
begin
  for I := 0 to Itens.Ipi.Lista.Count - 1 do
  Begin
    Itens.ClonarObj(Itens.Ipi.Lista[I],Itens.Ipi.Registro);
    Itens.Ipi.save;
  End;
end;

function TControllerInvoiceMerchandise.savePIS: Boolean;
Var
  I : Integer;
begin
  for I := 0 to Itens.Pis.Lista.Count - 1 do
  Begin
    Itens.ClonarObj(Itens.Pis.Lista[I],Itens.Pis.Registro);
    Itens.Pis.save;
  End;
end;

procedure TControllerInvoiceMerchandise.setCOFINS(idx : Integer);
begin
  {
  with Itens.Cofins.Registro, Itens.Taxas do
  Begin
    if TaxRuler.Registro.AliquotaCofins > 0 then
    Begin
      ItemOrdem         := TOrderItem( PedidoItens.Lista.Items[idx]).Codigo;
      Estabelecimento   := TOrderItem( PedidoItens.Lista.Items[idx]).Estabelecimento;
      TaxRuler.Cofins.Registro.Codigo := TaxRuler.Registro.CstCofins;
      TaxRuler.Cofins.getByKey;
      if TaxRuler.Cofins.exist then
        Cst              := TaxRuler.PIS.Registro.Codigo
      else
          Cst              := '99';
      ValorBase         := TOrderItem( PedidoItens.Lista.Items[idx]).ValorUnitario;
      ValorBase         := ( ValorBase * TOrderItem( PedidoItens.Lista.Items[idx]).Quantidade);
      ValorBase         := ( ValorBase - TOrderItem( PedidoItens.Lista.Items[idx]).ValorDesconto);
      ValorBase         :=  RoundTo(ValorBase,-2);

      Aliquota       := TaxRuler.Registro.AliquotaCofins;
      Valor         := 0;
      QuantVendas         := 0;
      QuantValorAliquota  := 0;
      PedidoItensCofins.Lista.Add(PedidoItensCofins.Registro);
    End;
  End;
  }
end;

procedure TControllerInvoiceMerchandise.setFDirecao(const Value: String);
begin
  FDirecao := Value;
end;

procedure TControllerInvoiceMerchandise.setFDistIcms(const Value: String);
begin
  FDistIcms := Value;
end;

procedure TControllerInvoiceMerchandise.setFDistIcmsST(const Value: String);
begin
  FDistIcmsST := Value;
end;

procedure TControllerInvoiceMerchandise.setFDistIPI(const Value: String);
begin
  FDistIPI := Value;
end;

procedure TControllerInvoiceMerchandise.setICMS(idx : Integer);
BEgin
  {
  with PedidoItensIcms.Registro, Taxas do
  Begin
    //Inicia as Variaveis
    ItemOrdem         := TOrderItem( PedidoItens.Lista.Items[idx]).Codigo;
    Estabelecimento   := TOrderItem( PedidoItens.Lista.Items[idx]).Estabelecimento;
    Origem            := TaxRuler.Registro.Origem;
    //Verifica se é com CST
    if TaxRuler.Registro.CST <> '' then
    Begin
      TaxRuler.TaxIcmsNr.Registro.Codigo := TaxRuler.Registro.CST;
      TaxRuler.TaxIcmsNr.getByKey;
        cst := TaxRuler.TaxIcmsNr.Registro.Codigo;
    End
    else
    Begin
      //Verifica se é com CSOSN
      TaxRuler.TaxIcmsSn.Registro.Codigo := TaxRuler.Registro.CSOSN;
      TaxRuler.TaxIcmsSn.getByKey;
        cst               := TaxRuler.TaxIcmsSn.Registro.Codigo;
    End;
    TaxRuler.DeterBaseTaxIcms.Registro.Codigo := TaxRuler.Registro.DeterminacaoBaseIcms;
    TaxRuler.DeterBaseTaxIcms.getByKey;
      DetermincaoBase   := TaxRuler.DeterBaseTaxIcms.Registro.Codigo;

    TaxRuler.DeterBaseTaxIcmsST.Registro.Codigo := TaxRuler.Registro.DeterminacaoBaseIcmsSt;
    TaxRuler.DeterBaseTaxIcmsST.getByKey;
      DetermincaoBaseST   := TaxRuler.DeterBaseTaxIcmsST.Registro.Codigo;

    TaxRuler.DischargeIcms.Registro.Codigo := TaxRuler.Registro.Desoneracao;
    TaxRuler.DischargeIcms.getByKey;
      Desoneracao       := TaxRuler.DischargeIcms.Registro.Codigo;

    AliqReducaoBase   := TaxRuler.Registro.ReducaoBaseICMS;

    ValorBase         := TOrderItem( PedidoItens.Lista.Items[idx]).ValorUnitario;
    ValorBase         := ( ValorBase * TOrderItem( PedidoItens.Lista.Items[idx]).Quantidade);
    ValorBase         := ( ValorBase - TOrderItem( PedidoItens.Lista.Items[idx]).ValorDesconto);
    ValorBase         :=  RoundTo(ValorBase,-2);

    Aliquota          := TaxRuler.Registro.AliquotaICMS;
    ReducaoAliquota   := TaxRuler.Registro.ReducaoAliqICMS;
    Valor             := (ValorBase * Aliquota ) / 100;
    AliqReducaoBaseST := 0;
    ValorBaseST       := 0;
    AliquotaST        := 0;
    ReducaoAliquotaST := 0;
    ValorST           := 0;
    MVA               := 0;
    ValorBaseRetido   := 0;
    ValorRetido       := 0;
    ValorBaseRetidoST := 0;
    ValorRetidoST     := 0;
    PArtilha          := 'N';
    Repasse           := 'N';
    Aliquota_CalcCred := 0;
    Valor_CredExpl    := 0;
    ValorFrete        := 0;
    ValorSeguro       := 0;
    ValorDespesas     := 0;
    Cfop              := TaxRuler.Registro.Cfop;
  End;
  PedidoItensIcms.Lista.Add(PedidoItensIcms.Registro);
  }
end;

procedure TControllerInvoiceMerchandise.setIPI(idx : Integer);
begin
  {
  with PedidoItensIpi.Registro, Taxas do
  Begin
    if TaxRuler.Registro.AliquotaIPI > 0 then
    Begin
      ItemOrdem         := TOrderItem( PedidoItens.Lista.Items[idx]).Codigo;
      Estabelecimento   := TOrderItem( PedidoItens.Lista.Items[idx]).Estabelecimento;
      TaxRuler.IPI.Registro.Codigo := TaxRuler.Registro.CstIpi;
      TaxRuler.IPI.getByKey;
      if TaxRuler.IPI.exist then
        Cst              := TaxRuler.IPI.Registro.Codigo
      else
          Cst              := '99';
      Classe_Frame       := '';
      CnpjFabricante     := '';
      Selo_ctrl          := '';
      Selo_Quant         := 0;
      Classe_FrameCode   := '';

      ValorBase         := TOrderItem( PedidoItens.Lista.Items[idx]).ValorUnitario;
      ValorBase         := ( ValorBase * TOrderItem( PedidoItens.Lista.Items[idx]).Quantidade);
      ValorBase         := ( ValorBase - TOrderItem( PedidoItens.Lista.Items[idx]).ValorDesconto);
      ValorBase         :=  RoundTo(ValorBase,-2);

      ValorAliquota      := TaxRuler.Registro.AliquotaIPI;
      QuantUnidade       := 0;
      ValorUnitario      := 0;
      PedidoItensIpi.Lista.Add(PedidoItensIpi.Registro);
    END;
  End;
  }
end;



procedure TControllerInvoiceMerchandise.setPIS(idx : Integer);
begin
  {
  with PedidoItensPis.Registro, Taxas do
  Begin
    if TaxRuler.Registro.AliquotaPIS > 0 then
    Begin
      ItemOrdem         := TOrderItem( PedidoItens.Lista.Items[idx]).Codigo;
      Estabelecimento   := TOrderItem( PedidoItens.Lista.Items[idx]).Estabelecimento;
      TaxRuler.PIS.Registro.Codigo := TaxRuler.Registro.CstPis;
      TaxRuler.PIS.getByKey;
      if TaxRuler.PIS.exist then
        Cst              := TaxRuler.PIS.Registro.Codigo
      else
          Cst              := '99';
      ValorBase         := TOrderItem( PedidoItens.Lista.Items[idx]).ValorUnitario;
      ValorBase         := ( ValorBase * TOrderItem( PedidoItens.Lista.Items[idx]).Quantidade);
      ValorBase         := ( ValorBase - TOrderItem( PedidoItens.Lista.Items[idx]).ValorDesconto);
      ValorBase         :=  RoundTo(ValorBase,-2);

      Aliquota       := TaxRuler.Registro.AliquotaPIS;
      Valor         := 0;
      QuantVendas         := 0;
      QuantValorAliquota  := 0;
      PedidoItensPis.Lista.Add(PedidoItensPis.Registro);
    End;
  End;
  }
end;

function TControllerInvoiceMerchandise.setTaxaxion: Boolean;
Var
  I : Integer;
begin
  {
  for I := 0 to PedidoItens.Lista.Count - 1 do
  Begin
    //Determina a Tributaçao pela Regra
    with PedidoItens.Mercadoria do
    Begin
      clear;
      Registro.Estabelecimento := TOrderItem( PedidoItens.Lista.Items[I]).Estabelecimento;
      Registro.Codigo := TOrderItem( PedidoItens.Lista.Items[I]).Produto;
      getByKey;
    End;
    //Verificar se é uma mercadoria
    if PedidoItens.Mercadoria.exist then
    Begin
      getTaxaxion;
      {========================== N - ICMS Normal e ST ===============================================
      setICMS(I);
      {========================== O - Imposto sobre Produtos Industrializados ========================
      setIPI(I);
      {========================== Q – PIS ============================================================
      setPIS(I);
      {========================== R – PIS ST =========================================================
      {========================== S – COFINS =========================================================
      setCOFINS(I);
      {========================== T - COFINS ST ======================================================
      {========================== P - Imposto de Importação ==========================================
        //colocar na invoice purchase
      //========================== U - ISSQN ==========================================================
      //colocar na invoice service
    End;
  end;
  }
end;


procedure TControllerInvoiceMerchandise.setVariable;
begin
  //Abrir Pedido - Dados Foram Repassados na Interface
  Nota.Pedido.getByKey;
  //Dados do emitente Estabelecimento
  //Pedido.Estabelecimento.Registro.Codigo := Pedido.Registro.Estabelecimento;
  //Pedido.Estabelecimento.getByKey;
  //Casas Decimais

  //Lista de Itens do PEdido
  Itens.Registro.Ordem := Nota.Pedido.Registro.Codigo;
  Itens.Registro.Estabelecimento := Nota.Pedido.Registro.Estabelecimento;
  Itens.getList;
end;


function TControllerInvoiceMerchandise.getAllByKey: boolean;
begin
  _getByKey(Registro);

  //Nota Principal
  Nota.Registro.Estabelecimento := Self.Registro.Estabelecimento;
  Nota.Registro.Codigo := Self.Registro.Codigo;
  Nota.getByKey;
  //Cfop
  Nota.Cfop.Registro.Codigo := Nota.Registro.Cfop;
  Nota.Cfop.getByKey;
  //Retorno nota
  Retorno.Registro.Estabelecimento := Self.Registro.Estabelecimento;
  Retorno.Registro.Codigo := Self.Registro.Codigo;
  Retorno.getByKey;
end;

function TControllerInvoiceMerchandise.getByKey: boolean;
begin
  _getByKey(Registro);
end;



function TControllerInvoiceMerchandise.getOrderPurchase: Boolean;
begin
  compra.Parametro.OrdemCompra.Estabelecimento  := Nota.Registro.Estabelecimento;
  compra.Parametro.OrdemCompra.Terminal         := Nota.Registro.Terminal;
  compra.Parametro.OrdemCompra.Codigo           := Nota.Registro.Codigo;
  compra.getByKey;
  result := compra.exist;
end;

function TControllerInvoiceMerchandise.getOrderSAle(VendedorID:Integer): Boolean;
begin
  Venda.Parametro.OrdemVenda.Estabelecimento  := Nota.Registro.Estabelecimento;
  Venda.Parametro.OrdemVenda.Terminal         := Nota.Registro.Terminal;
  Venda.Parametro.OrdemVenda.Codigo           := Nota.Registro.Codigo;
  Venda.Parametro.OrdemVenda.Vendedor         := VendedorID;
  Venda.getByKey;
  result := Venda.exist;
end;

function TControllerInvoiceMerchandise.getOrderStockAdjust: Boolean;
begin

end;

procedure TControllerInvoiceMerchandise.getTaxaxion;
BEgin
  {
  Taxas. .Produto    := OrderItems.Mercadoria.Produto.Registro;
  Invoice.Taxaxion.Mercadoria := OrderItems.Mercadoria.Registro;
  Invoice.Taxaxion.Estoque    := OrderItems.Mercadoria.Estoque.Registro;
  }
end;

end.
