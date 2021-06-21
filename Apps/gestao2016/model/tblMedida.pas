unit tblMedida;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_medida')]
  TMedida = Class(TGenericEntity)
  private
    FMED_SEQUENCIA: iNTEGER;
    FMED_ESCALA: String;
    FMED_DESCRICAO: String;
    FMED_CODIGO: Integer;
    FMED_ABREVIATURA: String;
    FMED_ESPECIAL: String;
    FMED_PROPORCAO: Real;

    procedure setFMED_CODIGO( Value : INTEGER);
    procedure setFMED_DESCRICAO( Value : String);
    procedure setFMED_ABREVIATURA( Value : String);
    procedure setFMED_ESCALA( Value : String);
    procedure setFMED_ESPECIAL( Value : String);
    procedure setFMED_PROPORCAO( Value : Real);
    procedure setFMED_SEQUENCIA( Value : INTEGER);

  public

    [KeyField('MED_CODIGO')]
    [FieldName('MED_CODIGO')]
    property Codigo: Integer read FMED_CODIGO write setFMED_CODIGO;


    [FieldName('MED_DESCRICAO')]
    property Descricao: String read FMED_DESCRICAO write setFMED_DESCRICAO;

    [FieldName('MED_ABREVIATURA')]
    property Abreviatura: String read FMED_ABREVIATURA write setFMED_ABREVIATURA;

    [FieldName('MED_ESCALA')]
    property Escala: String read FMED_ESCALA write setFMED_ESCALA;

    [FieldName('MED_ESPECIAL')]
    property MedidaCardapio: String read FMED_ESPECIAL write setFMED_ESPECIAL;

    [FieldName('MED_PROPORCAO')]
    property Proporcao: Real read FMED_PROPORCAO write setFMED_PROPORCAO;

    [FieldName('MED_SEQUENCIA')]
    property Sequencia: iNTEGER read FMED_SEQUENCIA write setFMED_SEQUENCIA;
  End;

implementation


{ TMedida }

procedure TMedida.setFMED_ABREVIATURA(Value: String);
begin
  FMED_ABREVIATURA := Value;
end;

procedure TMedida.setFMED_CODIGO(Value: INTEGER);
begin
  FMED_CODIGO := Value;
end;

procedure TMedida.setFMED_DESCRICAO(Value: String);
begin
  FMED_DESCRICAO := Value;
end;

procedure TMedida.setFMED_ESCALA(Value: String);
begin
  FMED_ESCALA := Value;
end;

procedure TMedida.setFMED_ESPECIAL(Value: String);
begin
  FMED_ESPECIAL := Value;
end;

procedure TMedida.setFMED_PROPORCAO(Value: Real);
begin
  FMED_PROPORCAO := Value;
end;

procedure TMedida.setFMED_SEQUENCIA(Value: INTEGER);
begin
  FMED_SEQUENCIA := Value;
end;

end.
