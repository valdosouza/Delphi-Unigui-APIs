unit prm_auth_login;

interface

uses
  System.Classes, prm_base;

Type
  TPrmAuthLogin = class(TPrmBase)
  private
    Femail: String;
    FNomeEmpresa: String;
    FNomeUsuario: String;
    Fpassword: String;
    FDispositivo: Integer;
    procedure setFemail(const Value: String);
    procedure setFNomeEmpresa(const Value: String);
    procedure setFNomeUsuario(const Value: String);
    procedure setFpassword(const Value: String);
    procedure setFDispositivo(const Value: Integer);
  public
    constructor Create;Override;
    destructor Destroy;Override;
    property email: String read Femail write setFemail;
    property password: String read Fpassword write setFpassword;
    property NomeUsuario : String read FNomeUsuario write setFNomeUsuario;

    property NomeEmpresa : String read FNomeEmpresa write setFNomeEmpresa;
    property Dispositivo : Integer read FDispositivo write setFDispositivo;

  End;
implementation

{ TPrmAuthLogin }

constructor TPrmAuthLogin.Create;
begin
  inherited;
end;

destructor TPrmAuthLogin.Destroy;
begin
  inherited;
end;

procedure TPrmAuthLogin.setFDispositivo(const Value: Integer);
begin
  FDispositivo := Value;
end;

procedure TPrmAuthLogin.setFemail(const Value: String);
begin
  Femail := Value;
end;

procedure TPrmAuthLogin.setFNomeEmpresa(const Value: String);
begin
  FNomeEmpresa := Value;
end;

procedure TPrmAuthLogin.setFNomeUsuario(const Value: String);
begin
  FNomeUsuario := Value;
end;

procedure TPrmAuthLogin.setFpassword(const Value: String);
begin
  Fpassword := Value;
end;

end.
