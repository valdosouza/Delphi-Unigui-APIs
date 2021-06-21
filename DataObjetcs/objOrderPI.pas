unit objOrderPI;

interface

uses System.SysUtils, objEntityFiscal, tblCustomer, ObjSalesMan, tblOrder,
  tblOrderPi, tblMedParts, tblMedPartsJr, tblMedPartsRt, tblMedInsertDate,
  System.Generics.Collections;

Type
  TListPecas = TObjectList<TMedParts>;
  TListPecasJR = TObjectList<TMedPartsJr>;
  TListPecasRT = TObjectList<TMedPartsRt>;
  TListDataInsercao = TObjectList<TMedInsertDate>;

  TObjOrderPI = Class
  private
    FPecasRT: TListPecasRt;
    FPecasJR: TListPecasJr;
    FPecas: TListPecas;
    FDataInsercao: TListDataInsercao;
    FOrdemPI: TOrderPi;
    FEstabelecimento: Integer;
    FOrdem: TOrder;
    FPagina: Integer;
    FAnuncianteCNPJ: String;
    FVeiculoCNPJ: String;
    FAgenciaCNPJ: String;
    procedure setFDataInsercao(const Value: TListDataInsercao);
    procedure setFEstabelecimento(const Value: Integer);
    procedure setFOrdem(const Value: TOrder);
    procedure setFOrdemPI(const Value: TOrderPi);
    procedure setFPagina(const Value: Integer);
    procedure setFPecas(const Value: TListPecas);
    procedure setFPecasJR(const Value: TListPecasJr);
    procedure setFPecasRT(const Value: TListPecasRt);
    procedure setFAgenciaCNPJ(const Value: String);
    procedure setFAnuncianteCNPJ(const Value: String);
    procedure setFVeiculoCNPJ(const Value: String);

  public
      constructor Create;
      destructor Destroy;
      property Pagina : Integer read FPagina write setFPagina;
      property Estabelecimento : Integer Read FEstabelecimento write setFEstabelecimento;
      property Ordem : TOrder read FOrdem write setFOrdem;
      property OrdemPI : TOrderPi read FOrdemPI write setFOrdemPI;
      property AgenciaCNPJ : String read FAgenciaCNPJ write setFAgenciaCNPJ;
      property AnuncianteCNPJ : String read FAnuncianteCNPJ write setFAnuncianteCNPJ;
      property VeiculoCNPJ : String read FVeiculoCNPJ write setFVeiculoCNPJ;
      property Pecas : TListPecas read FPecas write setFPecas;
      property PecasJR : TListPecasJr read FPecasJR write setFPecasJR;
      property PecasRT : TListPecasRt read FPecasRT write setFPecasRT;
      property DataInsercao : TListDataInsercao read FDataInsercao write setFDataInsercao;
  End;

implementation
{ TObjOrderPI }

constructor TObjOrderPI.Create;
begin
  inherited;
  FOrdem         := TOrder.Create;
  FOrdemPI       := TOrderPi.Create;
  FPecas         := TListPecas.Create;
  FPecasJR       := TListPecasJr.Create;
  FPecasRT       := TListPecasRt.Create;
  FDataInsercao  := TListDataInsercao.Create;
end;

destructor TObjOrderPI.Destroy;
begin
  FOrdem.DisposeOf;
  FOrdemPI.DisposeOf;
  FPecas.DisposeOf;
  FPecasJR.DisposeOf;
  FPecasRT.DisposeOf;
  FDataInsercao.DisposeOf;
  inherited;
end;

procedure TObjOrderPI.setFAgenciaCNPJ(const Value: String);
begin
  FAgenciaCNPJ := Value;
end;

procedure TObjOrderPI.setFAnuncianteCNPJ(const Value: String);
begin
  FAnuncianteCNPJ := Value;
end;

procedure TObjOrderPI.setFDataInsercao(const Value: TListDataInsercao);
begin
  FDataInsercao := Value;
end;

procedure TObjOrderPI.setFEstabelecimento(const Value: Integer);
begin
  FEstabelecimento := Value;
end;

procedure TObjOrderPI.setFOrdem(const Value: TOrder);
begin
  FOrdem := Value;
end;

procedure TObjOrderPI.setFOrdemPI(const Value: TOrderPi);
begin
  FOrdemPI := Value;
end;

procedure TObjOrderPI.setFPagina(const Value: Integer);
begin
  FPagina := Value;
end;

procedure TObjOrderPI.setFPecas(const Value: TListPecas);
begin
  FPecas := Value;
end;

procedure TObjOrderPI.setFPecasJR(const Value: TListPecasJr);
begin
  FPecasJR := Value;
end;

procedure TObjOrderPI.setFPecasRT(const Value: TListPecasRt);
begin
  FPecasRT := Value;
end;

procedure TObjOrderPI.setFVeiculoCNPJ(const Value: String);
begin
  FVeiculoCNPJ := Value;
end;

end.
