unit tblIterationAttachment;

interface
Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_iteration_attachment')]
  TIterationAttachment = Class(TGenericEntity)
  private
    Fpath_file: String;
    Ftb_iteration_id: integer;
    Fid: integer;
    Fupdated_at: TDAteTime;
    Ftb_institution_id: integer;
    Ftb_order_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFid(const Value: integer);
    procedure setFpath_file(const Value: String);
    procedure setFtb_institution_id(const Value: integer);
    procedure setFtb_iteration_id(const Value: integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);



  public

    [FieldName('id')]
    [KeyField('id')]
    property Codigo: integer read Fid write setFid;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_order_id')]
    [KeyField('tb_order_id')]
    property Ordem: Integer read Ftb_order_id write setFtb_order_id;

    [FieldName('tb_iteration_id')]
    [KeyField('tb_iteration_id')]
    property Iteracao: integer read Ftb_iteration_id write setFtb_iteration_id;

    [FieldName('path_file')]
    property Caminho: String read Fpath_file write setFpath_file;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation

{ TIterationAttachment }

procedure TIterationAttachment.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TIterationAttachment.setFid(const Value: integer);
begin
  Fid := Value;
end;

procedure TIterationAttachment.setFpath_file(const Value: String);
begin
  Fpath_file := Value;
end;

procedure TIterationAttachment.setFtb_institution_id(const Value: integer);
begin
  Ftb_institution_id := Value;
end;

procedure TIterationAttachment.setFtb_iteration_id(const Value: integer);
begin
  Ftb_iteration_id := Value;
end;

procedure TIterationAttachment.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TIterationAttachment.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
