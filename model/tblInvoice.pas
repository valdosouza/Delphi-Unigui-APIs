unit tblinvoice;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_invoice')]
  Tinvoice = Class(TGenericEntity)

  private
    Fnote: String;
    Ftb_entity_id: Integer;
    Fvalue: Real;
    Fdt_emission: TDateTime;
    Fid: Integer;
    Fserie: String;
    Fmodel: String;
    Fupdated_at: TDatetime;
    Fissuer: Integer;
    Ftb_cfop_id: String;
    Fnumber: String;
    Fkind: String;
    Fstatus: String;
    Ffinality: String;
    Ftb_institution_id: Integer;
    Fterminal: Integer;
    Fcreated_at: TDatetime;
    procedure setFcreated_at(const Value: TDatetime);
    procedure setFdt_emission(const Value: TDateTime);
    procedure setFfinality(const Value: String);
    procedure setFid(const Value: Integer);
    procedure setFissuer(const Value: Integer);
    procedure setFkind(const Value: String);
    procedure setFmodel(const Value: String);
    procedure setFnote(const Value: String);
    procedure setFnumber(const Value: String);
    procedure setFserie(const Value: String);
    procedure setFstatus(const Value: String);
    procedure setFtb_cfop_id(const Value: String);
    procedure setFtb_entity_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFterminal(const Value: Integer);
    procedure setFupdated_at(const Value: TDatetime);
    procedure setFvalue(const Value: Real);

  public
    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read Fid write setFid;
	
    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('terminal')]
    [KeyField('terminal')]
    property Terminal: Integer read Fterminal write setFterminal;

    [FieldName('issuer')]
    property Emitente: Integer read Fissuer write setFissuer;

    [FieldName('kind_emis')]
    property TipoEmissao: String read Fkind write setFkind;
	
    [FieldName('finality')]
    property Finalidade: String read Ffinality write setFfinality;

    [FieldName('number')]
    property Numero: String read Fnumber write setFnumber;
	
	  [FieldName('serie')]
    property Serie: String read Fserie write setFserie;
	
	  [FieldName('tb_cfop_id')]
    property Cfop: String read Ftb_cfop_id write setFtb_cfop_id;

	  [FieldName('tb_entity_id')]
    property Destinatario: Integer read Ftb_entity_id write setFtb_entity_id;
	
	  [FieldName('dt_emission')]
    property Data_emissao: TDateTime read Fdt_emission write setFdt_emission;
	
	  [FieldName('value')]
    property Valor: Real read Fvalue write setFvalue;

	  [FieldName('model')]
    property Modelo: String read Fmodel write setFmodel;

	  [FieldName('note')]
    property Observacao: String read Fnote write setFnote;

	  [FieldName('status')]
    property Status: String read Fstatus write setFstatus;


	  [FieldName('created_at')]
    property RegistroCriado: TDatetime read Fcreated_at write setFcreated_at;

	  [FieldName('updated_at')]
    property RegistroAlterado: TDatetime read Fupdated_at write setFupdated_at;

  End;

implementation

{ Tinvoice }

procedure Tinvoice.setFcreated_at(const Value: TDatetime);
begin
  Fcreated_at := Value;
end;

procedure Tinvoice.setFdt_emission(const Value: TDateTime);
begin
  Fdt_emission := Value;
end;

procedure Tinvoice.setFfinality(const Value: String);
begin
  Ffinality := Value;
end;

procedure Tinvoice.setFid(const Value: Integer);
begin
  Fid := Value;
end;

procedure Tinvoice.setFissuer(const Value: Integer);
begin
  Fissuer := Value;
end;

procedure Tinvoice.setFkind(const Value: String);
begin
  Fkind := Value;
end;

procedure Tinvoice.setFmodel(const Value: String);
begin
  Fmodel := Value;
end;

procedure Tinvoice.setFnote(const Value: String);
begin
  Fnote := Value;
end;

procedure Tinvoice.setFnumber(const Value: String);
begin
  Fnumber := Value;
end;

procedure Tinvoice.setFserie(const Value: String);
begin
  Fserie := Value;
end;

procedure Tinvoice.setFstatus(const Value: String);
begin
  Fstatus := Value;
end;

procedure Tinvoice.setFtb_cfop_id(const Value: String);
begin
  Ftb_cfop_id := Value;
end;

procedure Tinvoice.setFtb_entity_id(const Value: Integer);
begin
  Ftb_entity_id := Value;
end;

procedure Tinvoice.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure Tinvoice.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure Tinvoice.setFupdated_at(const Value: TDatetime);
begin
  Fupdated_at := Value;
end;

procedure Tinvoice.setFvalue(const Value: Real);
begin
  Fvalue := Value;
end;

end.
