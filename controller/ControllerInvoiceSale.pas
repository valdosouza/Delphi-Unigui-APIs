unit ControllerInvoiceSale;

interface
uses System.Classes, System.SysUtils,
      tblEntity, FireDAC.Comp.Client, Md5, FireDAC.Stan.Param,
      ControllerOrderSale, ControllerCustomer,
      BaseController, ControllerMerchandise;

Type
  TControllerInvoiceSale = Class(TBaseController)
  private
    procedure saveInvoice;
    procedure saveInvoiceMerchandise;
    procedure saveInvoiceMerchandiseItems;

    procedure setVariable;
    function execute: Boolean;
  public
    OrderSale : TControllerOrderSale;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;



    function start:Boolean;
    function calculate:Boolean;
    function save:boolean;
  End;

implementation

{ TControllerInvoiceSale }

function TControllerInvoiceSale.calculate: Boolean;
begin

end;

constructor TControllerInvoiceSale.Create(AOwner: TComponent);
begin
  inherited;
  OrderSale := TControllerOrderSale.Create(self);

end;

destructor TControllerInvoiceSale.Destroy;
begin
  FreeAndNil( OrderSale );
  inherited;
end;


function TControllerInvoiceSale.execute: Boolean;
begin
  setVariable;
  saveInvoice;
  saveInvoiceMerchandise;
  saveInvoiceMerchandiseItems;
end;


function TControllerInvoiceSale.save: boolean;
begin

end;

procedure TControllerInvoiceSale.saveInvoice;
begin
  {
  with Mer elf.Registro do
  Begin
    Estabelecimento := Order.Registro.Estabelecimento;

    TipoEmissao
    Finalidade
    Numero
    Serie
    Cfop := Self.CFOP;
    Entidade := Order
  End;
  }
end;

procedure TControllerInvoiceSale.saveInvoiceMerchandise;
begin
  //
end;

procedure TControllerInvoiceSale.saveInvoiceMerchandiseItems;
begin
  //
end;

procedure TControllerInvoiceSale.setVariable;
begin
end;


function TControllerInvoiceSale.start: Boolean;
begin
end;

end.
