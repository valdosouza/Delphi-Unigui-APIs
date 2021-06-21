unit tblEmbalagem;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_embalagem')]
  TEmbalagem = Class(TGenericEntity)
  private
    FEMB_DESCRICAO: String;
    FEMB_CODIGO: Integer;
    FEMB_ABREVIATURA: String;
    procedure setFEMB_ABREVIATURA(const Value: String);
    procedure setFEMB_CODIGO(const Value: Integer);
    procedure setFEMB_DESCRICAO(const Value: String);

  public

    [KeyField('EMB_CODIGO')]
    [FieldName('EMB_CODIGO')]
    property Codigo: Integer read FEMB_CODIGO write setFEMB_CODIGO;

    [FieldName('EMB_DESCRICAO')]
    property Descricao: String read FEMB_DESCRICAO write setFEMB_DESCRICAO;

    [FieldName('EMB_ABREVIATURA')]
    property Abreviatura: String read FEMB_ABREVIATURA write setFEMB_ABREVIATURA;

  End;

implementation


{ TEmbalagem }

procedure TEmbalagem.setFEMB_ABREVIATURA(const Value: String);
begin
  FEMB_ABREVIATURA := Value;
end;

procedure TEmbalagem.setFEMB_CODIGO(const Value: Integer);
begin
  FEMB_CODIGO := Value;
end;

procedure TEmbalagem.setFEMB_DESCRICAO(const Value: String);
begin
  FEMB_DESCRICAO := Value;
end;

end.
