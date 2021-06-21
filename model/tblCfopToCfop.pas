unit tblCfopToCfop;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_cfop_to_cfop')]
  TCfopToCfop = Class(TGenericEntity)

  private
    Ftb_cfop_id_des: String;
    Ftb_cfop_id_ori: String;
    Fupdated_at: TDAteTime;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFtb_cfop_id_des(const Value: String);
    procedure setFtb_cfop_id_ori(const Value: String);
    procedure setFupdated_at(const Value: TDAteTime);

   public
    [KeyField('tb_cfop_id_ori')]
    [FieldName('tb_cfop_id_ori')]
    property CfopOrigem: String read Ftb_cfop_id_ori write setFtb_cfop_id_ori;

    [FieldName('tb_cfop_id_des')]
    property CfopDestino: String read Ftb_cfop_id_des write setFtb_cfop_id_des;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation

{ TCfopToCfop }

procedure TCfopToCfop.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TCfopToCfop.setFtb_cfop_id_des(const Value: String);
begin
  Ftb_cfop_id_des := Value;
end;

procedure TCfopToCfop.setFtb_cfop_id_ori(const Value: String);
begin
  Ftb_cfop_id_ori := Value;
end;

procedure TCfopToCfop.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
