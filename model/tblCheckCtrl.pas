unit tblCheckCtrl;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_check_ctrl')]
  TCheckCtrl = Class(TGenericEntity)
  private
    Fissuer: String;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Fbank_number : String;
    Fbank_agency : String;
    Fnumber : String;
    Faccount : String;
    Fcheck_value : Real;
    Fcheck_date : TDateTime;
    Fkind : String;
    Fsituation : String;
    Ftb_institution_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFaccount(const Value: String);
    procedure setFbank_agency(const Value: String);
    procedure setFbank_number(const Value: String);
    procedure setFcheck_date(const Value: TDateTime);
    procedure setFcheck_value(const Value: Real);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFId(const Value: Integer);
    procedure setFissuer(const Value: String);
    procedure setFkind(const Value: String);
    procedure setFnumber(const Value: String);
    procedure setFsituation(const Value: String);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);


  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('issuer')]
    property Emitente: String read Fissuer write setFissuer;

    [FieldName('bank_number')]
    property NumeroBanco: String read Fbank_number write setFbank_number;

    [FieldName('bank_agency')]
    property AgenciaBanco: String read Fbank_agency write setFbank_agency;

    [FieldName('number')]
    property Numero: String read Fnumber write setFnumber;

    [FieldName('account')]
    property Conta: String read Faccount write setFaccount;

    [FieldName('check_value')]
    property ValorCheque: Real read Fcheck_value write setFcheck_value;

    [FieldName('check_date')]
    property DataCheque: TDateTime read Fcheck_date write setFcheck_date;

    [FieldName('kind')]
    property Tipo: String read Fkind write setFkind;

    [FieldName('situation')]
    property Situacao: String read Fsituation write setFsituation;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation
{ TCheckCtrl }

procedure TCheckCtrl.setFaccount(const Value: String);
begin
  Faccount := Value;
end;

procedure TCheckCtrl.setFbank_agency(const Value: String);
begin
  Fbank_agency := Value;
end;

procedure TCheckCtrl.setFbank_number(const Value: String);
begin
  Fbank_number := Value;
end;

procedure TCheckCtrl.setFcheck_date(const Value: TDateTime);
begin
  Fcheck_date := Value;
end;

procedure TCheckCtrl.setFcheck_value(const Value: Real);
begin
  Fcheck_value := Value;
end;

procedure TCheckCtrl.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TCheckCtrl.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TCheckCtrl.setFissuer(const Value: String);
begin
  Fissuer := Value;
end;

procedure TCheckCtrl.setFkind(const Value: String);
begin
  Fkind := Value;
end;

procedure TCheckCtrl.setFnumber(const Value: String);
begin
  Fnumber := Value;
end;

procedure TCheckCtrl.setFsituation(const Value: String);
begin
  Fsituation := Value;
end;

procedure TCheckCtrl.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TCheckCtrl.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
