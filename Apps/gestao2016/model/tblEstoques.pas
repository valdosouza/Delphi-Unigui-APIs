unit tblEstoques;

interface

Uses TEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_estoques')]
  TEstoques = Class(TGenericEntity)
  private
    FTPR_MODALIDADE: String;
    FTPR_NOME: String;
    FTPR_CODIGO: Integer;
    FTPR_CODEMP: Integer;
    procedure setFTPR_CODEMP(const Value: Integer);
    procedure setFTPR_CODIGO(const Value: Integer);
    procedure setFTPR_MODALIDADE(const Value: String);
    procedure setFTPR_NOME(const Value: String);

  public

    [KeyField('ETS_CODIGO')]
    [FieldName('ETS_CODIGO')]
    property Codigo: Integer read FTPR_CODIGO write setFTPR_CODIGO;

    [FieldName('ETS_CODMHA')]
    property Estabelecimento: Integer read FTPR_CODEMP write setFTPR_CODEMP;

    [FieldName('ETS_DESCRICAO')]
    property Descricao: String read FTPR_NOME write setFTPR_NOME;

    [FieldName('ETS_PRINCIPAL')]
    property Principal: String read FTPR_MODALIDADE write setFTPR_MODALIDADE;


  End;

implementation

{ TEstoques }

procedure TEstoques.setFTPR_CODEMP(const Value: Integer);
begin
  FTPR_CODEMP := Value;
end;

procedure TEstoques.setFTPR_CODIGO(const Value: Integer);
begin
  FTPR_CODIGO := Value;
end;

procedure TEstoques.setFTPR_MODALIDADE(const Value: String);
begin
  FTPR_MODALIDADE := Value;
end;

procedure TEstoques.setFTPR_NOME(const Value: String);
begin
  FTPR_NOME := Value;
end;

end.
