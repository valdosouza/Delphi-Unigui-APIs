unit prm_base;

interface

uses System.SysUtils;

Type
  TPrmBase = class
  private
    FUltimaAtualizacao: String;
    FLimite: String;
    FUsuario: Integer;
    FDataFinal: TDate;
    FDataInicial: TDate;
    FPagina: Integer;
    FEstabelecimento: Integer;
    FResultado: Boolean;
    procedure setFDataFinal(const Value: TDate);
    procedure setFDataInicial(const Value: TDate);
    procedure setFLimite(const Value: String);
    procedure setFPagina(const Value: Integer);
    procedure setFUltimaAtualizacao(const Value: String);
    procedure setFUsuario(const Value: Integer);
    procedure setFEstabelecimento(const Value: Integer);
    procedure setFResultado(const Value: Boolean);

  public
    constructor Create;Virtual;
    destructor Destroy;override;

    property Usuario: Integer read FUsuario write setFUsuario;
    property Pagina : Integer read FPagina write setFPagina;
    property DataInicial : TDate read FDataInicial write setFDataInicial;
    property DataFinal : TDate read FDataFinal write setFDataFinal;
    property Limite : String read FLimite write setFLimite;
    property UltimaAtualizacao:String read FUltimaAtualizacao write setFUltimaAtualizacao;
    property Estabelecimento : Integer read FEstabelecimento write setFEstabelecimento;
    property Resultado : Boolean read FResultado write setFResultado;
  end;
implementation

{ TPrmBase }

constructor TPrmBase.Create;
begin
end;

destructor TPrmBase.Destroy;
begin

end;

procedure TPrmBase.setFDataFinal(const Value: TDate);
begin
  FDataFinal := Value;
end;

procedure TPrmBase.setFDataInicial(const Value: TDate);
begin
  FDataInicial := Value;
end;

procedure TPrmBase.setFEstabelecimento(const Value: Integer);
begin
  FEstabelecimento := Value;
end;

procedure TPrmBase.setFLimite(const Value: String);
begin
  FLimite := Value;
end;

procedure TPrmBase.setFPagina(const Value: Integer);
begin
  FPagina := Value;
end;

procedure TPrmBase.setFResultado(const Value: Boolean);
begin
  FResultado := Value;
end;

procedure TPrmBase.setFUltimaAtualizacao(const Value: String);
begin
  FUltimaAtualizacao := Value;
end;

procedure TPrmBase.setFUsuario(const Value: Integer);
begin
  FUsuario := Value;
end;

end.
