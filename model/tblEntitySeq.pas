unit tblEntitySeq;

interface

Uses GenericEntity,CAtribEntity, System.SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_entity_seq')]
  TEntitySeq = Class(TGenericEntity)
  private
    FID: Integer;
    Fused: String;
    procedure setFID(const Value: Integer);
    procedure setFused(const Value: String);


  public
    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read FID write setFID;

    [FieldName('used')]
    property Usado: String read Fused write setFused;

  End;

implementation

{ TEntitySeq }

procedure TEntitySeq.setFID(const Value: Integer);
begin
  FID := Value;
end;

procedure TEntitySeq.setFused(const Value: String);
begin
  Fused := Value;
end;

end.
