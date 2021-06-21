unit tblDischargeIcms;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_discharge_icms')]
  TDischargeIcms = Class(TGenericEntity)
  private
    Fid : Integer;
    Fdescription : String;
    Fcreated_at : TDateTime;
	  Fupdated_at : TDateTime;

    procedure setFid(Value : Integer);
    procedure setFdescription(Value : String);
    procedure setFcreated_at(Value : tdatetime);
	  procedure setFupdated_at(Value : tdatetime);

  public

    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read Fid write setFid;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

	  [FieldName('created_at')]
    property RegistroCriado: TDatetime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDatetime read Fupdated_at write setFupdated_at;

	End;

implementation


{ TDischargeIcms }

procedure TDischargeIcms.setFcreated_at(Value: tdatetime);
begin
  Fcreated_at := Value;
end;

procedure TDischargeIcms.setFdescription(Value: String);
begin
  Fdescription := Value;
end;

procedure TDischargeIcms.setFid(Value: Integer);
begin
   Fid := Value;
end;

procedure TDischargeIcms.setFupdated_at(Value: tdatetime);
begin
   Fupdated_at := Value;
end;

end.
