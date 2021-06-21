unit tblMedCopyEdition;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_med_copy_edition')]
  TMedCopyEdition = Class(TGenericEntity)
  private
    Fnr_copy: Integer;
    Fupdated_at: TDAteTime;
    Ftb_broadcaster_id: Integer;
    Ftb_city_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFnr_copy(const Value: Integer);
    procedure setFtb_broadcaster_id(const Value: Integer);
    procedure setFtb_city_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);

  public
    [KeyField('tb_broadcaster_id')]
    [FieldName('tb_broadcaster_id')]
    property Veiculo: Integer read Ftb_broadcaster_id write setFtb_broadcaster_id;

    [KeyField('tb_city_id')]
    [FieldName('tb_city_id')]
    property Cidade: Integer read Ftb_city_id write setFtb_city_id;

    [FieldName('nr_copy')]
    property TIragem: Integer read Fnr_copy write setFnr_copy;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation

{ TMedCopyEdition }

procedure TMedCopyEdition.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TMedCopyEdition.setFnr_copy(const Value: Integer);
begin
  Fnr_copy := Value;
end;

procedure TMedCopyEdition.setFtb_broadcaster_id(const Value: Integer);
begin
  Ftb_broadcaster_id := Value;
end;

procedure TMedCopyEdition.setFtb_city_id(const Value: Integer);
begin
  Ftb_city_id := Value;
end;

procedure TMedCopyEdition.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
