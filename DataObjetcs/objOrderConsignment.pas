unit objOrderConsignment;

interface

uses System.SysUtils, objEntityFiscal, tblCustomer, tblOrder,
  tblOrderPi, tblMedParts, tblMedPartsJr, tblMedPartsRt, tblMedInsertDate,
  System.Generics.Collections, tblOrderItem, tblOrderConsignment,tblOrderConsignmentOperation,
  TypesCollection;

Type
  TObjOrderConsignment = Class
  private
    FDocFiscalVendedor: String;
    FDescricao: String;
    FItems: TListOrdemItem;
    FCliente: TCustomer;
    FOrdem: TOrder;
    FEstabelecimento: Integer;
    FConsignacao: TOrderConsignment;
    FFiscal: TObjEntityFiscal;
    FCodigoWeb: Integer;
    FTerminal: Integer;
    FOperacoes: TListOrdemConsignmentOperation;
    FPagina: Integer;
    procedure setFCliente(const Value: TCustomer);
    procedure setFCodigoWeb(const Value: Integer);
    procedure setFConsignacao(const Value: TOrderConsignment);
    procedure setFDescricao(const Value: String);
    procedure setFDocFiscalVendedor(const Value: String);
    procedure setFEstabelecimento(const Value: Integer);
    procedure setFFiscal(const Value: TObjEntityFiscal);
    procedure setFItems(const Value: TListOrdemItem);
    procedure setFOperacoes(const Value: TListOrdemConsignmentOperation);
    procedure setFOrdem(const Value: TOrder);
    procedure setFPagina(const Value: Integer);
    procedure setFTerminal(const Value: Integer);
  public
      constructor Create;
      destructor Destroy;
      property Pagina : Integer read FPagina write setFPagina;
      property Estabelecimento : Integer Read FEstabelecimento write setFEstabelecimento;
      property Terminal     : Integer Read FTerminal write setFTerminal;
      property Descricao : String read FDescricao write setFDescricao;
      property CodigoWeb : Integer Read FCodigoWeb write setFCodigoWeb;
      property DocFiscalVendedor  : String read FDocFiscalVendedor write setFDocFiscalVendedor;
      property Order        : TOrder read FOrdem write setFOrdem;
      property Fiscal       : TObjEntityFiscal read FFiscal write setFFiscal;
      property Cliente      : TCustomer read FCliente write setFCliente;
      property Consignacao  : TOrderConsignment read FConsignacao write setFConsignacao;
      property Operacoes    : TListOrdemConsignmentOperation read FOperacoes write setFOperacoes;
      property Items        : TListOrdemItem  read FItems write setFItems;

  End;
implementation

{ TObjOrderConsignment }

constructor TObjOrderConsignment.Create;
begin
  FOrdem        := TOrder.Create;
  FFiscal       := TObjEntityFiscal.Create;
  FCliente      := TCustomer.Create;
  FConsignacao  := TOrderConsignment.Create;
  FOperacoes    := TListOrdemConsignmentOperation.Create;
  FItems        := TListOrdemItem.Create;
end;

destructor TObjOrderConsignment.Destroy;
begin
  {$IFDEF WIN32}
  FOperacoes.DisposeOf;
  FItems.DisposeOf;
  FFiscal.Destroy;
  FCliente.DisposeOf;
  FConsignacao.DisposeOf;
  FOrdem.DisposeOf;
  inherited;

  {$ENDIF }
end;

procedure TObjOrderConsignment.setFCliente(const Value: TCustomer);
begin
  FCliente := Value;
end;

procedure TObjOrderConsignment.setFCodigoWeb(const Value: Integer);
begin
  FCodigoWeb := Value;
end;

procedure TObjOrderConsignment.setFConsignacao(const Value: TOrderConsignment);
begin
  FConsignacao := Value;
end;

procedure TObjOrderConsignment.setFDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TObjOrderConsignment.setFDocFiscalVendedor(const Value: String);
begin
  FDocFiscalVendedor := Value;
end;

procedure TObjOrderConsignment.setFEstabelecimento(const Value: Integer);
begin
  FEstabelecimento := Value;
end;

procedure TObjOrderConsignment.setFFiscal(const Value: TObjEntityFiscal);
begin
  FFiscal := Value;
end;

procedure TObjOrderConsignment.setFItems(const Value: TListOrdemItem);
begin
  FItems := Value;
end;

procedure TObjOrderConsignment.setFOperacoes(
  const Value: TListOrdemConsignmentOperation);
begin
  FOperacoes := Value;
end;

procedure TObjOrderConsignment.setFOrdem(const Value: TOrder);
begin
  FOrdem := Value;
end;

procedure TObjOrderConsignment.setFPagina(const Value: Integer);
begin
  FPagina := Value;
end;

procedure TObjOrderConsignment.setFTerminal(const Value: Integer);
begin
  FTerminal := Value;
end;

end.

