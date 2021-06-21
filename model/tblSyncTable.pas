unit tblSyncTable;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_sync_table')]
  TSyncTable = Class(TGenericEntity)
  private
    Flast_updated: TDAteTime;
    Fdirection: String;
    FId: String;
    Ftb_institution_id: Integer;
    procedure setFdirection(const Value: String);
    procedure setFId(const Value: String);
    procedure setFlast_updated(const Value: TDAteTime);
    procedure setFtb_institution_id(const Value: Integer);

  public
    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [KeyField('id')]
    [FieldName('id')]
    property Codigo: String read FId write setFId;

    [KeyField('direction')]
    [FieldName('direction')]
    property Direcao: String read Fdirection write setFdirection;

    [FieldName('last_updated')]
    property Atualizacao: TDAteTime read Flast_updated write setFlast_updated;


  End;

implementation



{ TSyncTable }

procedure TSyncTable.setFdirection(const Value: String);
begin
  Fdirection := Value;
end;

procedure TSyncTable.setFId(const Value: String);
begin
  FId := Value;
end;

procedure TSyncTable.setFlast_updated(const Value: TDAteTime);
var
    LDbl : Double;
begin
  //https://en.delphipraxis.net/topic/2522-android-32-bit-debug-projekt-raised-exception-class-bus-error-10/
  Move( Value, LDbl, Sizeof( LDbl) );
  Flast_updated := LDbl;
end;

procedure TSyncTable.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

end.

