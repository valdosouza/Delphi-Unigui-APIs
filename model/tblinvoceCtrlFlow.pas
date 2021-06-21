unit tblinvoceCtrlFlow;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_invoce_ctrl_flow_')]
  TInvoceCtrlFlow = Class(TGenericEntity)
  private
    Fid: Integer;
    Fupdated_at: TDatetime;
    Fbond_id: String;
    Ftb_invoice_id: Integer;
    Ftb_institution_id: Integer;
    Fkind: String;
    Fcreated_at: TDatetime;
    procedure setFbond_id(const Value: String);
    procedure setFcreated_at(const Value: TDatetime);
    procedure setFid(const Value: Integer);
    procedure setFkind(const Value: String);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_invoice_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDatetime);


  public
    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read Fid write setFid;

	  [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [KeyField('tb_invoice_id')]
    [FieldName('tb_invoice_id')]
    property Fatura: Integer read Ftb_invoice_id write setFtb_invoice_id;

    [FieldName('kind')]
    property Tipo: String read Fkind write setFkind;

    [FieldName('bond_id')]
    property Vinculo: String read Fbond_id write setFbond_id;

 	  [FieldName('created_at')]
    property RegistroCriado: TDatetime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDatetime read Fupdated_at write setFupdated_at;

	End;

implementation



{ TInvoceCtrlFlow }

procedure TInvoceCtrlFlow.setFbond_id(const Value: String);
begin
  Fbond_id := Value;
end;

procedure TInvoceCtrlFlow.setFcreated_at(const Value: TDatetime);
begin
  Fcreated_at := Value;
end;

procedure TInvoceCtrlFlow.setFid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TInvoceCtrlFlow.setFkind(const Value: String);
begin
  Fkind := Value;
end;

procedure TInvoceCtrlFlow.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TInvoceCtrlFlow.setFtb_invoice_id(const Value: Integer);
begin
  Ftb_invoice_id := Value;
end;

procedure TInvoceCtrlFlow.setFupdated_at(const Value: TDatetime);
begin
  Fupdated_at := Value;
end;

end.
