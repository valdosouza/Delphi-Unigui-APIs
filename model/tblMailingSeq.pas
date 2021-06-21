unit tblMailingSeq;

interface

Uses GenericEntity,CAtribEntity, System.SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_mailing_seq')]
  TMailingSeq = Class(TGenericEntity)
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

{ TMailingSeq }

procedure TMailingSeq.setFID(const Value: Integer);
begin
  FID := Value;
end;

procedure TMailingSeq.setFused(const Value: String);
begin
  Fused := Value;
end;

end.
