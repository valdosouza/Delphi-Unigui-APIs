unit prm_call_invoice;

interface

uses prm_base;

Type
  TPrmCallInvoice = class(TPrmBase)

    private
    FDestinatario: Integer;
    FModeloNFe: String;
    FEmitente: Integer;
    FAutroizaNfe: Boolean;
    FMostraSentido: Boolean;
    FSentido: String;
    FOrder: Integer;
    procedure setFAutroizaNfe(const Value: Boolean);
    procedure setFDestinatario(const Value: Integer);
    procedure setFEmitente(const Value: Integer);
    procedure setFModeloNFe(const Value: String);
    procedure setFMostraSentido(const Value: Boolean);
    procedure setFOrdem(const Value: Integer);
    procedure setFSentido(const Value: String);

    public
      property Ordem: Integer read FOrder write setFOrdem;
      property Emitente: Integer read FEmitente write setFEmitente;
      property Destinatario: Integer read FDestinatario write setFDestinatario;
      property Sentido: String read FSentido write setFSentido;
      property MostraSentido: Boolean read FMostraSentido write setFMostraSentido;
      property AutroizaNfe: Boolean read FAutroizaNfe write setFAutroizaNfe;
      property ModeloNFe : String read FModeloNFe write setFModeloNFe;
  End;
implementation

{ TPrmCallInvoice }

procedure TPrmCallInvoice.setFAutroizaNfe(const Value: Boolean);
begin
  FAutroizaNfe := Value;
end;

procedure TPrmCallInvoice.setFDestinatario(const Value: Integer);
begin
  FDestinatario := Value;
end;

procedure TPrmCallInvoice.setFEmitente(const Value: Integer);
begin
  FEmitente := Value;
end;

procedure TPrmCallInvoice.setFModeloNFe(const Value: String);
begin
  FModeloNFe := Value;
end;

procedure TPrmCallInvoice.setFMostraSentido(const Value: Boolean);
begin
  FMostraSentido := Value;
end;

procedure TPrmCallInvoice.setFOrdem(const Value: Integer);
begin
  FOrder := Value;
end;

procedure TPrmCallInvoice.setFSentido(const Value: String);
begin
  FSentido := Value;
end;

end.
