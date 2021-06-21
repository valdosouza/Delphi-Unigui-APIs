unit prm_entity;

interface

uses tblentity, prm_base;

Type

  TPrmEntity = class(TPrmbase)
  private
    FEntidade: TEntity;
    procedure setFEntidade(const Value: TEntity);

  public
    constructor Create;override;
    destructor Destroy;override;
    property Entidade : TEntity read FEntidade write setFEntidade;
  end;

implementation

{ TPrmEntity }

constructor TPrmEntity.Create;
begin
  inherited;
  FEntidade := TEntity.Create;
end;

destructor TPrmEntity.Destroy;
begin
  FEntidade.DisposeOf;
  inherited;
end;

procedure TPrmEntity.setFEntidade(const Value: TEntity);
begin
  FEntidade := Value;
end;

end.
