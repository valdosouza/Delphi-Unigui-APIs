unit tblBankChargeSlip;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_bank_charge_slip')]
  TBankChargeSlip = Class(TGenericEntity)
  private
    FId: Integer;
    Ftb_institution_id: Integer;
    Ftb_bank_account_id: Integer;
    Ftb_bank_charge_ticket_id: Integer;
    Ftb_bank_charge_kind_id: Integer;
    Fagreement: String;
    Fvariacao: Integer;
    Faccept: String;
    Flayout: Integer;
    Flayout_shipping: String;
    Finstruction_1: String;
    Finstruction_2: String;
    Finstruction: String;
    Faliq_discount: Real;
    Faliq_interest: Real;
    Faliq_late:  Real;
    Fvalue_late_min: Real;
    Fvalue_fine: Real;
    Faliq_fine: Real;
    Fvalue_rate: Real;
    Fpath_files: String;
    Fname_files: String;
    Fprotest:  String;
    Fday_protest: Integer;
    Fpayment_local: String;
    Ftransmission_code: String;
    Fbenefic_post: String;
    Fcreated_at: Tdatetime;
    Fupdated_at: Tdatetime;
    Fnumber: String;
    procedure setFagreement(const Value: String);
    procedure setFaliq_discount(const Value: Real);
    procedure setFaliq_fine(const Value: Real);
    procedure setFaliq_interest(const Value: Real);
    procedure setFaliq_late(const Value: Real);
    procedure setFbenefic_post(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFday_protest(const Value: Integer);
    procedure setFId(const Value: Integer);
    procedure setFinstruction(const Value: String);
    procedure setFinstruction_1(const Value: String);
    procedure setFinstruction_2(const Value: String);
    procedure setFlayout(const Value: Integer);
    procedure setFlayout_shipping(const Value: String);
    procedure setFname_files(const Value: String);
    procedure setFnumber(const Value: String);
    procedure setFpath_files(const Value: String);
    procedure setFpayment_local(const Value: String);
    procedure setFprotest(const Value: String);
    procedure setFtb_bank_charge_kind_id(const Value: Integer);
    procedure setFtb_bank_charge_ticket_id(const Value: Integer);
    procedure setFtb_bank_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtransmission_code(const Value: String);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFvalue_fine(const Value: Real);
    procedure setFvalue_late_min(const Value: Real);
    procedure setFvalue_rate(const Value: Real);
    procedure setFvariacao(const Value: Integer);


  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_bank_account_id')]
    property ContaCorrente: Integer read Ftb_bank_account_id write setFtb_bank_id;

    [FieldName('tb_bank_charge_ticket_id')]
    property Carteira: Integer read Ftb_bank_charge_ticket_id write setFtb_bank_charge_ticket_id;

    [FieldName('tb_bank_charge_kind_id')]
    property Especie: Integer read Ftb_bank_charge_kind_id write setFtb_bank_charge_kind_id;

    [FieldName('agreement')]
    property Convenio: String read Fagreement write setFagreement;

    [FieldName('variacao')]
    property Variacao: Integer read Fvariacao write setFvariacao;

    [FieldName('accept')]
    property Aceita: String read Fnumber write setFnumber;

    [FieldName('layout')]
    property Modelo: Integer read Flayout write setFlayout;

    [FieldName('layout_shipping')]
    property EnvioModelo: String read Flayout_shipping write setFlayout_shipping;

    [FieldName('instruction_1')]
    property Instrucao1: String read Finstruction_1 write setFinstruction_1;

    [FieldName('instruction_2')]
    property Instrucao2: String read Finstruction_2 write setFinstruction_2;

    [FieldName('instruction')]
    property Instrucao: String read Finstruction write setFinstruction;

    [FieldName('aliq_discount')]
    property DescontoAliq: Real read Faliq_discount write setFaliq_discount;

    [FieldName('aliq_interest')]
    property Juro: Real read Faliq_interest write setFaliq_interest;

    [FieldName('aliq_late')]
    property AliqAtrasado: Real read Faliq_late write setFaliq_late;

    [FieldName('value_late_min')]
    property ValorMoraMin: Real read Fvalue_late_min write setFvalue_late_min;

    [FieldName('value_fine')]
    property Multa: Real read Fvalue_fine write setFvalue_fine;

    //Esse campo não usado na interface
    [FieldName('aliq_fine')]
    property BomAliq: Real read Faliq_fine write setFaliq_fine;

    [FieldName('value_rate')]
    property ValorTaxa: Real read Fvalue_rate write setFvalue_rate;

    [FieldName('path_files')]
    property ArqCaminho: String read Fpath_files write setFpath_files;

    //Esse campo não usado na interface
    [FieldName('name_files')]
    property NomeArquivado: String read Fname_files write setFname_files;

    [FieldName('protest')]
    property Protesto: String read Fprotest write setFprotest;

    [FieldName('day_protest')]
    property DiaProtesto: Integer read Fday_protest write setFday_protest;

    [FieldName('payment_local')]
    property PgtoLocal: String read Fpayment_local write setFpayment_local;

    [FieldName('transmission_code')]
    property CodigoTransicao: String read Ftransmission_code write setFtransmission_code;

    [FieldName('benefic_post')]
    property Benefica: String read Fbenefic_post write setFbenefic_post;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation

{ TBankChargeSlip }

procedure TBankChargeSlip.setFagreement(const Value: String);
begin
  Fagreement := Value;
end;

procedure TBankChargeSlip.setFaliq_discount(const Value: Real);
begin
  Faliq_discount := Value;
end;

procedure TBankChargeSlip.setFaliq_fine(const Value: Real);
begin
  Faliq_fine := Value;
end;

procedure TBankChargeSlip.setFaliq_interest(const Value: Real);
begin
  Faliq_interest := Value;
end;

procedure TBankChargeSlip.setFaliq_late(const Value: Real);
begin
  Faliq_late := Value;
end;

procedure TBankChargeSlip.setFbenefic_post(const Value: String);
begin
  Fbenefic_post := Value;
end;

procedure TBankChargeSlip.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TBankChargeSlip.setFday_protest(const Value: Integer);
begin
  Fday_protest := Value;
end;

procedure TBankChargeSlip.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TBankChargeSlip.setFinstruction(const Value: String);
begin
  Finstruction := Value;
end;

procedure TBankChargeSlip.setFinstruction_1(const Value: String);
begin
  Finstruction_1 := Value;
end;

procedure TBankChargeSlip.setFinstruction_2(const Value: String);
begin
  Finstruction_2 := Value;
end;

procedure TBankChargeSlip.setFlayout(const Value: Integer);
begin
  Flayout := Value;
end;

procedure TBankChargeSlip.setFlayout_shipping(const Value: String);
begin
  Flayout_shipping := Value;
end;

procedure TBankChargeSlip.setFname_files(const Value: String);
begin
  Fname_files := Value;
end;

procedure TBankChargeSlip.setFnumber(const Value: String);
begin
  Fnumber := Value;
end;

procedure TBankChargeSlip.setFpath_files(const Value: String);
begin
  Fpath_files := Value;
end;

procedure TBankChargeSlip.setFpayment_local(const Value: String);
begin
  Fpayment_local := Value;
end;

procedure TBankChargeSlip.setFprotest(const Value: String);
begin
  Fprotest := Value;
end;

procedure TBankChargeSlip.setFtb_bank_charge_kind_id(const Value: Integer);
begin
  Ftb_bank_charge_kind_id := Value;
end;

procedure TBankChargeSlip.setFtb_bank_charge_ticket_id(const Value: Integer);
begin
  Ftb_bank_charge_ticket_id := Value;
end;

procedure TBankChargeSlip.setFtb_bank_id(const Value: Integer);
begin
  Ftb_bank_account_id := Value;
end;

procedure TBankChargeSlip.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TBankChargeSlip.setFtransmission_code(const Value: String);
begin
  Ftransmission_code := Value;
end;

procedure TBankChargeSlip.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

procedure TBankChargeSlip.setFvalue_fine(const Value: Real);
begin
  Fvalue_fine := Value;
end;

procedure TBankChargeSlip.setFvalue_late_min(const Value: Real);
begin
  Fvalue_late_min := Value;
end;

procedure TBankChargeSlip.setFvalue_rate(const Value: Real);
begin
  Fvalue_rate := Value;
end;

procedure TBankChargeSlip.setFvariacao(const Value: Integer);
begin
  Fvariacao := Value;
end;

end.
