unit objInvoice;

interface

uses System.SysUtils,System.Generics.Collections,  ObjBase,tblFinancialPlans,
      tblInvoice,tblInvoiceObs, objEntityFiscal, tblorder;

Type
  TlistaObs   = TObjectList<TInvoiceObs>;

  TObjInvoice = Class
  private
    FEmitenteDoc: String;
    FNF: Tinvoice;
    FDestinatarioDoc: String;
    FObservacoes: TlistaObs;
    FOrder: TOrder;
    procedure setFDestinatarioDoc(const Value: String);
    procedure setFEmitenteDoc(const Value: String);
    procedure setFNF(const Value: Tinvoice);
    procedure setFObservacoes(const Value: TlistaObs);
    procedure setFOrder(const Value: TOrder);

  public
    constructor Create;
    destructor Destroy;
    property Order : TOrder read FOrder write setFOrder;
    property NF : Tinvoice read FNF write setFNF;
    property Observacoes : TlistaObs read FObservacoes write setFObservacoes;
    property EmitenteDoc : String read FEmitenteDoc write setFEmitenteDoc;
    property DestinatarioDoc : String read FDestinatarioDoc write setFDestinatarioDoc;
  End;
implementation

{ TObjInvoice }

constructor TObjInvoice.Create;
begin
  inherited;
  FOrder := TOrder.Create;
  FNF := Tinvoice.Create;
  FObservacoes := TlistaObs.create;
end;

destructor TObjInvoice.Destroy;
begin
  FOrder.DisposeOf;
  FNF.DisposeOf;
  FObservacoes.disposeOf;
end;

procedure TObjInvoice.setFDestinatarioDoc(const Value: String);
begin
  FDestinatarioDoc := Value;
end;

procedure TObjInvoice.setFEmitenteDoc(const Value: String);
begin
  FEmitenteDoc := Value;
end;

procedure TObjInvoice.setFNF(const Value: Tinvoice);
begin
  FNF := Value;
end;

procedure TObjInvoice.setFObservacoes(const Value: TlistaObs);
begin
  FObservacoes := Value;
end;

procedure TObjInvoice.setFOrder(const Value: TOrder);
begin
  FOrder := Value;
end;

end.
