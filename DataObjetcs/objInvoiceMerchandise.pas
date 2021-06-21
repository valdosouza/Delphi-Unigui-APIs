unit objInvoiceMerchandise;

interface
  uses System.SysUtils,System.Generics.Collections,objInvoice, tblinvoiceMerchandise,
      tblOrderItemIcms, tblOrderItemIpi, tblOrderItemPis, tblOrderItemCofins,
    tblOrderItemII,tblOrderItemISSqn, ObjBase, tblInvoiceShipping,tblInvoiceObs;

Type
  TlistaIcms    = TObjectList<TOrderItemIcms>;
  TlistaIpi     = TObjectList<TOrderItemIpi>;
  TlistaPis     = TObjectList<TOrderItemPis>;
  TlistaCofins  = TObjectList<TOrderItemCofins>;
  TlistaII      = TObjectList<TOrderItemII>;
  TlistaIss     = TObjectList<TOrderItemIssQN>;
  TlistaObs     = TObjectList<TInvoiceObs>;

  TObjInvoiceMerchandise = Class(TObjBase)
  private
    FItemsIPI: TlistaIpi;
    FItemsII: TlistaII;
    FItemsICMS: TlistaIcms;
    FItemsISS: TlistaIss;
    FItemsPIS: TlistaPis;
    FItemsCofins: TlistaCofins;
    FMercadoria: TInvoiceMerchandise;
    FNota: TObjInvoice;
    FEntrega: TInvoiceShipping;
    FObservacao: TlistaObs;
    procedure setFItemsCofins(const Value: TlistaCofins);
    procedure setFItemsICMS(const Value: TlistaIcms);
    procedure setFItemsII(const Value: TlistaII);
    procedure setFItemsIPI(const Value: TlistaIpi);
    procedure setFItemsISS(const Value: TlistaIss);
    procedure setFItemsPIS(const Value: TlistaPis);
    procedure setFMercadoria(const Value: TInvoiceMerchandise);
    procedure setFNota(const Value: TObjInvoice);
    procedure setFEntrega(const Value: TInvoiceShipping);
    procedure setFObservacao(const Value: TlistaObs);


  public
    constructor Create;Override;
    destructor Destroy;Override;
    property Nota           : TObjInvoice read FNota write setFNota;
    property Mercadoria     : TInvoiceMerchandise read FMercadoria write setFMercadoria;
    property Entrega        : TInvoiceShipping read FEntrega write setFEntrega;
    property ItemsICMS      : TlistaIcms    read FItemsICMS write setFItemsICMS;
    property ItemsIPI       : TlistaIpi     read FItemsIPI write setFItemsIPI;
    property ItemsPIS       : TlistaPis     read FItemsPIS write setFItemsPIS;
    property ItemsCofins    : TlistaCofins  read FItemsCofins write setFItemsCofins;
    property ItemsII        : TlistaII      read FItemsII write setFItemsII;
    property ItemsIss       : TlistaIss     read FItemsISS write setFItemsISS;
    property Observacao     : TlistaObs    read FObservacao write setFObservacao;
  End;
implementation

{ TObjInvoiceMerchandise }

constructor TObjInvoiceMerchandise.Create;
begin
  inherited;
  FNota           := TObjInvoice.Create;
  FMercadoria     := TInvoiceMerchandise.Create;
  FEntrega         := TInvoiceShipping.Create;
  FItemsICMS      := TlistaIcms.Create;
  FItemsIPI       := TlistaIpi.Create;
  FitemsPIS       := TlistaPis.Create;
  FItemsCofins    := TlistaCofins.Create;
  FItemsII        := TlistaII.Create;
  FItemsIss       := TlistaIss.Create;
  FObservacao     := TlistaObs.Create;
end;

destructor TObjInvoiceMerchandise.Destroy;
begin
  FNota.Destroy;
  FMercadoria.DisposeOf;
  FEntrega.DisposeOf;
  FItemsICMS.DisposeOf;
  FItemsIPI.DisposeOf;
  FitemsPIS.DisposeOf;
  FItemsCofins.DisposeOf;
  FItemsII.DisposeOf;
  FItemsIss.DisposeOf;
  FObservacao.DisposeOf;
end;

procedure TObjInvoiceMerchandise.setFEntrega(const Value: TInvoiceShipping);
begin
  FEntrega := Value;
end;

procedure TObjInvoiceMerchandise.setFItemsCofins(const Value: TlistaCofins);
begin
  FItemsCofins := Value;
end;

procedure TObjInvoiceMerchandise.setFItemsICMS(const Value: TlistaIcms);
begin
  FItemsICMS := Value;
end;

procedure TObjInvoiceMerchandise.setFItemsII(const Value: TlistaII);
begin
  FItemsII := Value;
end;

procedure TObjInvoiceMerchandise.setFItemsIPI(const Value: TlistaIpi);
begin
  FItemsIPI := Value;
end;

procedure TObjInvoiceMerchandise.setFItemsISS(const Value: TlistaIss);
begin
  FItemsISS := Value;
end;

procedure TObjInvoiceMerchandise.setFItemsPIS(const Value: TlistaPis);
begin
  FItemsPIS := Value;
end;

procedure TObjInvoiceMerchandise.setFNota(const Value: TObjInvoice);
begin
  FNota := Value;
end;

procedure TObjInvoiceMerchandise.setFObservacao(const Value: TlistaObs);
begin
  FObservacao := Value;
end;

procedure TObjInvoiceMerchandise.setFMercadoria(const Value: TInvoiceMerchandise);
begin
  FMercadoria := Value;
end;

end.
