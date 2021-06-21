unit prm_user;

interface

uses prm_base,tbluser,tblentity, tblMailing, TypesCollection, System.SysUtils ;

Type
  TPrmUser = class(TPrmBase)
  private
    FNovaSenha: String;
    FEntidade: TEntity;
    FEmail: TMailing;
    FTelaInterface: Integer;
    FUser: TUser;
    FSenha: String;
    procedure setFEmail(const Value: TMailing);
    procedure setFEntidade(const Value: TEntity);
    procedure setFNovaSenha(const Value: String);
    procedure setFTelaInterface(const Value: Integer);
    procedure setFUser(const Value: TUser);
    procedure setFSenha(const Value: String);


  public
    constructor Create;
    destructor Destroy;
    property User :TUser read FUser write setFUser;
    property Entidade :TEntity read FEntidade write setFEntidade;
    property Email : TMailing read FEmail write setFEmail;
    property Senha : String read FSenha write setFSenha;
    property NovaSenha : String read FNovaSenha write setFNovaSenha;
    property TelaInterface: Integer read FTelaInterface write setFTelaInterface;
  end;

implementation

{ TPrmUser }

constructor TPrmUser.Create;
begin
  inherited;
  FUser   := TUser.create;
  FEntidade  := TEntity.create;
  FEmail     := TMailing.create;
end;

destructor TPrmUser.Destroy;
begin
  FUser.DisposeOf;
  FEntidade.DisposeOf;
  FEmail.DisposeOf;
  inherited;
end;


procedure TPrmUser.setFEmail(const Value: TMailing);
begin
  FEmail := Value;
end;

procedure TPrmUser.setFEntidade(const Value: TEntity);
begin
  FEntidade := Value;
end;

procedure TPrmUser.setFNovaSenha(const Value: String);
begin
  FNovaSenha := Value;
end;

procedure TPrmUser.setFSenha(const Value: String);
begin
  FSenha := Value;
end;

procedure TPrmUser.setFTelaInterface(const Value: Integer);
begin
  FTelaInterface := Value;
end;

procedure TPrmUser.setFUser(const Value: TUser);
begin
  FUser := Value;
end;

end.
