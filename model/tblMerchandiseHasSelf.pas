unit tblMerchandiseHasSelf;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_merchandise_has_self')]
  TMerchandiseHasSelf = Class(TGenericEntity)
  private
    Ftb_master_id: Integer;
    Fupdated_at: TDAteTime;
    Fquantity: Real;
    Ftb_detail_id: Integer;
    Ftb_institution_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFquantity(const Value: Real);
    procedure setFtb_detail_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_master_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);



  public
    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_master_id')]
    [KeyField('tb_master_id')]
    property Mestre: Integer read Ftb_master_id write setFtb_master_id;

    [FieldName('tb_detail_id')]
    [KeyField('tb_detail_id')]
    property Detalhe: Integer read Ftb_detail_id write setFtb_detail_id;

    [FieldName('quantity')]
    property Quantidade: Real read Fquantity write setFquantity;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation





{ TMerchandiseHasSelf }

procedure TMerchandiseHasSelf.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TMerchandiseHasSelf.setFquantity(const Value: Real);
begin
  Fquantity := Value;
end;

procedure TMerchandiseHasSelf.setFtb_detail_id(const Value: Integer);
begin
  Ftb_detail_id := Value;
end;

procedure TMerchandiseHasSelf.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TMerchandiseHasSelf.setFtb_master_id(const Value: Integer);
begin
  Ftb_master_id := Value;
end;

procedure TMerchandiseHasSelf.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
