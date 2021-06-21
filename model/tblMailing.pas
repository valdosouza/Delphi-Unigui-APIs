unit tblMailing;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_mailing')]
  TMailing = Class(TGenericEntity)
  private
    Fid : Integer;
    Femail : String;
    Fcreated_at: TDAteTime;
    Fupdated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFemail(const Value: String);
    procedure setFID(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);


  public
    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read FID write setFID;

    [FieldName('email')]
    property Email: String read Femail write setFemail;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation




{ TMailing }

procedure TMailing.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TMailing.setFemail(const Value: String);
begin
  Femail := Value;
end;

procedure TMailing.setFID(const Value: Integer);
begin
  FID := Value;
end;

procedure TMailing.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.

