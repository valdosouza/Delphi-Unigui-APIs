unit tblBankAcccount;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_bank_account')]
  TBankAcccount = Class(TGenericEntity)
  private
    Fphone: String;
    Ftb_bank_id: Integer;
    Fagency_dv: String;
    Fid: Integer;
    Fdt_contract: TDateTime;
    Fmanager: String;
    Fupdated_at: TDAteTime;
    Fnumber: String;
    Fdt_opening: TDateTime;
    Ftb_institution_id: Integer;
    Fnumber_dv: String;
    Fagency: String;
    Fcreated_at: TDAteTime;
    Flimit_value: Real;
    procedure setFagency(const Value: String);
    procedure setFagency_dv(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdt_contract(const Value: TDateTime);
    procedure setFdt_opening(const Value: TDateTime);
    procedure setFid(const Value: Integer);
    procedure setFlimit_value(const Value: Real);
    procedure setFmanager(const Value: String);
    procedure setFnumber(const Value: String);
    procedure setFnumber_dv(const Value: String);
    procedure setFphone(const Value: String);
    procedure setFtb_bank_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);



  public
    [FieldName('id')]
    [FieldName('id')]
    property Codigo  :Integer read Fid write setFid;

    [FieldName('tb_institution_id')]
    property Estabelecimento :Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_bank_id')]
    property Banco   :Integer read Ftb_bank_id write setFtb_bank_id;

    [FieldName('dt_opening')]
    property DataAbertura    :TDateTime read Fdt_opening write setFdt_opening;

    [FieldName('agency')]
    property Agencia :String read Fagency write setFagency;

    [FieldName('agency_dv')]
    property AgenciaDv  :String read Fagency_dv write setFagency_dv;

    [FieldName('number')]
    property Numero  :String read Fnumber write setFnumber;

    [FieldName('number_dv')]
    property NumeroDv  :String read Fnumber_dv write setFnumber_dv;

    [FieldName('phone')]
    property Fone   :String read Fphone write setFphone;

    [FieldName('manager')]
    property Gerente  :String read Fmanager write setFmanager;

    [FieldName('limit_value')]
    property ValorLimite     :Real read Flimit_value write setFlimit_value;

    [FieldName('dt_contract')]
    property DataContrato    :TDateTime read Fdt_contract write setFdt_contract;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;


  End;
implementation



{ TBankAcccount }

procedure TBankAcccount.setFagency(const Value: String);
begin
  Fagency := Value;
end;

procedure TBankAcccount.setFagency_dv(const Value: String);
begin
  Fagency_dv := Value;
end;

procedure TBankAcccount.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TBankAcccount.setFdt_contract(const Value: TDateTime);
begin
  Fdt_contract := Value;
end;

procedure TBankAcccount.setFdt_opening(const Value: TDateTime);
begin
  Fdt_opening := Value;
end;

procedure TBankAcccount.setFid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TBankAcccount.setFlimit_value(const Value: Real);
begin
  Flimit_value := Value;
end;

procedure TBankAcccount.setFmanager(const Value: String);
begin
  Fmanager := Value;
end;

procedure TBankAcccount.setFnumber(const Value: String);
begin
  Fnumber := Value;
end;

procedure TBankAcccount.setFnumber_dv(const Value: String);
begin
  Fnumber_dv := Value;
end;

procedure TBankAcccount.setFphone(const Value: String);
begin
  Fphone := Value;
end;

procedure TBankAcccount.setFtb_bank_id(const Value: Integer);
begin
  Ftb_bank_id := Value;
end;

procedure TBankAcccount.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TBankAcccount.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
