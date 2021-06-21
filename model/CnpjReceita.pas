unit CnpjReceita;

interface

Uses Classes, SysUtils;

Type
  //nome da classe de entidade

  TCnpjReceita = class(TPersistent)
  private
    FGetIBGE_UF: String;
    FFantasia: String;
    FCNPJ: String;
    FBairro: String;
    FEndEletronico: string;
    FCodigoIBGE: String;
    FUF: String;
    FCEP: String;
    FEFR: string;
    FNumero: String;
    FEmpresaTipo: String;
    FAbertura: TDateTime;
    FDataSituacao: TDateTime;
    FRazaoSocial: String;
    FPesquisarIBGE: Boolean;
    FSituacao: String;
    FComplemento: String;
    FCNAE2: TStringList;
    FMotivoSituacaoCad: string;
    FCidade: String;
    FNaturezaJuridica: String;
    FEndereco: String;
    FCNAE1: String;
    FTelefone: String;
    FPorte: String;
    procedure setFAbertura(const Value: TDateTime);
    procedure setFBairro(const Value: String);
    procedure setFCEP(const Value: String);
    procedure setFCidade(const Value: String);
    procedure setFCNAE1(const Value: String);
    procedure setFCNAE2(const Value: TStringList);
    procedure setFCNPJ(const Value: String);
    procedure setFCodigoIBGE(const Value: String);
    procedure setFComplemento(const Value: String);
    procedure setFDataSituacao(const Value: TDateTime);
    procedure setFEFR(const Value: string);
    procedure setFEmpresaTipo(const Value: String);
    procedure setFEndEletronico(const Value: string);
    procedure setFEndereco(const Value: String);
    procedure setFFantasia(const Value: String);
    procedure setFGetIBGE_UF(const Value: String);
    procedure setFMotivoSituacaoCad(const Value: string);
    procedure setFNaturezaJuridica(const Value: String);
    procedure setFNumero(const Value: String);
    procedure setFPesquisarIBGE(const Value: Boolean);
    procedure setFPorte(const Value: String);
    procedure setFRazaoSocial(const Value: String);
    procedure setFSituacao(const Value: String);
    procedure setFTelefone(const Value: String);
    procedure setFUF(const Value: String);


  public
    constructor Create;
    destructor Destroy;
    property CNPJ:              String Read FCNPJ Write setFCNPJ;
    property EmpresaTipo:       String Read FEmpresaTipo write setFEmpresaTipo;
    property Abertura:       TDateTime Read FAbertura write setFAbertura;
    property RazaoSocial:       String Read FRazaoSocial write setFRazaoSocial;
    property Fantasia:          String Read FFantasia write setFFantasia;
    property Porte:             String read FPorte write setFPorte;
    property CNAE1:             String Read FCNAE1 write setFCNAE1;
    property CNAE2:             TStringList Read FCNAE2 write setFCNAE2;
    property Endereco:          String Read FEndereco write setFEndereco;
    property Numero:            String Read FNumero write setFNumero;
    property Complemento:       String Read FComplemento write setFComplemento;
    property CEP:               String Read FCEP write setFCEP;
    property Bairro:            String Read FBairro write setFBairro;
    property Cidade:            String Read FCidade write setFCidade;
    property UF:                String Read FUF write setFUF;
    property Situacao:          String Read FSituacao write setFSituacao;
    property DataSituacao:   TDateTime Read FDataSituacao write setFDataSituacao;
    property NaturezaJuridica:  String Read FNaturezaJuridica write setFNaturezaJuridica;
    property EndEletronico:     string read FEndEletronico write setFEndEletronico;
    property Telefone:          String read FTelefone write setFTelefone;
    property EFR:               string read FEFR write setFEFR;
    property MotivoSituacaoCad: string read FMotivoSituacaoCad write setFMotivoSituacaoCad;
    property IBGE_Municipio  :  String read FCodigoIBGE write setFCodigoIBGE;
    property IBGE_UF         :  String read FGetIBGE_UF write setFGetIBGE_UF;
    property PesquisarIBGE:     Boolean read FPesquisarIBGE write setFPesquisarIBGE;
  End;

implementation


{ TCnpjReceita }

constructor TCnpjReceita.Create;
begin
  CNAE2 := TStringList.Create;
end;

destructor TCnpjReceita.Destroy;
begin
  CNAE2.DisposeOf;
end;

procedure TCnpjReceita.setFAbertura(const Value: TDateTime);
begin
  FAbertura := Value;
end;

procedure TCnpjReceita.setFBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TCnpjReceita.setFCEP(const Value: String);
begin
  FCEP := Value;
end;

procedure TCnpjReceita.setFCidade(const Value: String);
begin
  FCidade := Value;
end;

procedure TCnpjReceita.setFCNAE1(const Value: String);
begin
  FCNAE1 := Value;
end;

procedure TCnpjReceita.setFCNAE2(const Value: TStringList);
begin
  FCNAE2 := Value;
end;

procedure TCnpjReceita.setFCNPJ(const Value: String);
begin
  FCNPJ := Value;
end;

procedure TCnpjReceita.setFCodigoIBGE(const Value: String);
begin
  FCodigoIBGE := Value;
end;

procedure TCnpjReceita.setFComplemento(const Value: String);
begin
  FComplemento := Value;
end;

procedure TCnpjReceita.setFDataSituacao(const Value: TDateTime);
begin
  FDataSituacao := Value;
end;

procedure TCnpjReceita.setFEFR(const Value: string);
begin
  FEFR := Value;
end;

procedure TCnpjReceita.setFEmpresaTipo(const Value: String);
begin
  FEmpresaTipo := Value;
end;

procedure TCnpjReceita.setFEndEletronico(const Value: string);
begin
  FEndEletronico := Value;
end;

procedure TCnpjReceita.setFEndereco(const Value: String);
begin
  FEndereco := Value;
end;

procedure TCnpjReceita.setFFantasia(const Value: String);
begin
  FFantasia := Value;
end;

procedure TCnpjReceita.setFGetIBGE_UF(const Value: String);
begin
  FGetIBGE_UF := Value;
end;

procedure TCnpjReceita.setFMotivoSituacaoCad(const Value: string);
begin
  FMotivoSituacaoCad := Value;
end;

procedure TCnpjReceita.setFNaturezaJuridica(const Value: String);
begin
  FNaturezaJuridica := Value;
end;

procedure TCnpjReceita.setFNumero(const Value: String);
begin
  FNumero := Value;
end;

procedure TCnpjReceita.setFPesquisarIBGE(const Value: Boolean);
begin
  FPesquisarIBGE := Value;
end;

procedure TCnpjReceita.setFPorte(const Value: String);
begin
  FPorte := Value;
end;

procedure TCnpjReceita.setFRazaoSocial(const Value: String);
begin
  FRazaoSocial := Value;
end;

procedure TCnpjReceita.setFSituacao(const Value: String);
begin
  FSituacao := Value;
end;

procedure TCnpjReceita.setFTelefone(const Value: String);
begin
  FTelefone := Value;
end;

procedure TCnpjReceita.setFUF(const Value: String);
begin
  FUF := Value;
end;

end.
