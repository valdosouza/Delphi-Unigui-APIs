unit prm_valid_to_invoice;

interface

uses
  System.Classes, System.Generics.Collections;

Type

  TPrmValidToInvoicer = Class
  private
    FDestinatario: Integer;
    FDirecaoOperacao: String;
    FEmitente: Integer;
    FCFOP: String;
    FTipo: String;
    FOrdem: Integer;
    FResultado: boolean;
    procedure setFCFOP(const Value: String);
    procedure setFDestinatario(const Value: Integer);
    procedure setFDirecaoOperacao(const Value: String);
    procedure setFEmitente(const Value: Integer);
    procedure setFOrdem(const Value: Integer);
    procedure setFTipo(const Value: String);
    procedure setFResultado(const Value: boolean);

  public
    property Ordem: Integer read FOrdem write setFOrdem;
    property Emitente: Integer read FEmitente write setFEmitente;
    property Destinatario: Integer read FDestinatario write setFDestinatario;
    property Tipo: String read FTipo write setFTipo;
    property DirecaoOperacao: String read FDirecaoOperacao write setFDirecaoOperacao;
    property CFOP: String read FCFOP write setFCFOP;
    property Resultado: boolean read FResultado write setFResultado;


    constructor Create;
    destructor Destroy;

  End;
implementation

{ TPrmValidToInvoicer }

constructor TPrmValidToInvoicer.Create;
begin

end;

destructor TPrmValidToInvoicer.Destroy;
begin

end;

procedure TPrmValidToInvoicer.setFCFOP(const Value: String);
begin
  FCFOP := Value;
end;

procedure TPrmValidToInvoicer.setFDestinatario(const Value: Integer);
begin
  FDestinatario := Value;
end;

procedure TPrmValidToInvoicer.setFDirecaoOperacao(const Value: String);
begin
  FDirecaoOperacao := Value;
end;

procedure TPrmValidToInvoicer.setFEmitente(const Value: Integer);
begin
  FEmitente := Value;
end;


procedure TPrmValidToInvoicer.setFOrdem(const Value: Integer);
begin
  FOrdem := Value;
end;

procedure TPrmValidToInvoicer.setFResultado(const Value: boolean);
begin
  FResultado := Value;
end;

procedure TPrmValidToInvoicer.setFTipo(const Value: String);
begin
  FTipo := Value;
end;

end.
