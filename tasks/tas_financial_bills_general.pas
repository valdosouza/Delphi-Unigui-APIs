unit tas_financial_bills_general;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, tas_financial_bills, Datasnap.Provider,
  Vcl.Menus, uniMainMenu, Data.DB, Datasnap.DBClient, uniBasicGrid, uniDBGrid,
  uniPageControl, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses, uniPanel,
  uniRadioGroup, uniEdit, uniLabel, uniDateTimePicker, uniCheckBox,
  uniGUIBaseClasses, uniGroupBox, uniMultiItem, uniComboBox,ControllerFinancialBills,
  MainModule, UnFunctions;

type
  TTasFinancialBillsGeneral = class(TTasFinancialBills)
    tbs_selecionados: TUniTabSheet;
    pnl_selecionados: TUniPanel;
    DbgSeattled: TUniDBGrid;
    pnl_search_general_row_2: TUniPanel;
    Ctn_entity: TUniContainerPanel;
    Ctn_PaymentType: TUniContainerPanel;
    Cb_Situacao: TUniComboBox;
    cds_searchtb_order_id: TIntegerField;
    cds_searchinv_number: TStringField;
    cds_searchmodel: TStringField;
    cds_searchors_number: TIntegerField;
    cds_searchfnb_number: TStringField;
    cds_searchdt_expiration: TDateField;
    cds_searchparcel: TIntegerField;
    cds_searchtb_customer_id: TIntegerField;
    cds_searchnick_trade: TStringField;
    cds_searchname_company: TStringField;
    cds_searchtag_value: TBCDField;
    cds_searchsettled: TStringField;
    cds_searchsituation: TStringField;
    cds_searchpaid_value: TBCDField;
    cds_searchsettled_code: TIntegerField;
    cds_searchtb_payment_types_id: TIntegerField;
    cds_searchid: TIntegerField;
    cds_searchkind: TStringField;
    cds_searchdt_payment: TDateField;
    cds_searchoperation: TStringField;
    cds_searchstage: TStringField;
    cds_searchtb_institution_id: TIntegerField;
    cds_searchfpl_id: TIntegerField;
    cds_searchfpl_description: TStringField;
    UniPanel1: TUniPanel;
    Sb_Close_settled: TUniSpeedButton;
    Sb_settled_general: TUniSpeedButton;
    tbs_Sb_settled: TUniTabSheet;
    tb_bank_slip: TUniTabSheet;
    tbs_checks: TUniTabSheet;
    UniTabSheet1: TUniTabSheet;
    UniPanel2: TUniPanel;
    Ctn_PaymentTypeSettled: TUniContainerPanel;
    E_VL_Interest: TUniEdit;
    E_Fine: TUniEdit;
    E_Valor_Total: TUniEdit;
    E_Disccount: TUniEdit;
    Dtp_Payment: TUniDateTimePicker;
    E_VL_Payment: TUniEdit;
    E_SeattledPartial: TUniEdit;
    UniPanel3: TUniPanel;
    Sb_BankSlipClose: TUniSpeedButton;
    Sb_BankSlipSettled: TUniSpeedButton;
    Sb_BankSlipPrint: TUniSpeedButton;
    Sb_BankSlipEmail: TUniSpeedButton;
    Sb_BankSlipSearch: TUniSpeedButton;
    Sb_BankSlipDelete: TUniSpeedButton;
    Sb_BankSlipReceive: TUniSpeedButton;
    Sb_BankSlipSend: TUniSpeedButton;
    Sb_BankSlipDueDate: TUniSpeedButton;
    UniGroupBox1: TUniGroupBox;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel7: TUniLabel;
    DbgBankSlip: TUniDBGrid;
    UniPanel4: TUniPanel;
    UniEdit1: TUniEdit;
    Cb_BankSlipSendStatus: TUniComboBox;
    Ctn_carteiraCobranca: TUniContainerPanel;
    Cb_BankSlipSendNumber: TUniComboBox;
    UniDBGrid1: TUniDBGrid;
    UniGroupBox2: TUniGroupBox;
    UniLabel8: TUniLabel;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    UniLabel11: TUniLabel;
    UniPanel5: TUniPanel;
    UniSpeedButton1: TUniSpeedButton;
    UniSpeedButton9: TUniSpeedButton;
  private
    { Private declarations }

  protected
    procedure InitVariable;Override;
    procedure setvariable;override;
    procedure formatGrid;Override;
    procedure FormatScreen;override;
    procedure search;Override;
  public
    { Public declarations }
    FinancialBills : TControllerFinancialBills;
  end;

var
  TasFinancialBillsGeneral: TTasFinancialBillsGeneral;

implementation

{$R *.dfm}

{ TTasFinancialBillsGeneral }

procedure TTasFinancialBillsGeneral.formatGrid;
begin

end;

procedure TTasFinancialBillsGeneral.FormatScreen;
begin
  pnl_search_row_1.Height := 52;
  pnl_search_general_row_2.Height := 52;
  Grp_search_parameter.Height := 130;
  ShowPaymentType(Ctn_PaymentType);
  pg_Principal.ActivePage := tbs_valores;
end;

procedure TTasFinancialBillsGeneral.InitVariable;
begin
  inherited;
  FinancialBills := TControllerFinancialBills.Create(Self);

end;

procedure TTasFinancialBillsGeneral.search;
Begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              'SELECT DISTINCT ',
              'fin.tb_order_id, ',
              'inv.number inv_number, ',
              'inv.model, ',
              'ors.number ors_number, ',
              'fnb.number fnb_number, ',
              'fin.dt_expiration, ',
              'fin.parcel, ',
              'ors.tb_customer_id, ',
              'etd.nick_trade, ',
              'etd.name_company, ',
              'fin.tag_value, ',
              'fnp.settled, ',
              'fnb.situation, ',
              'fnp.paid_value, ',
              'fnp.settled_code, ',
              'fin.tb_payment_types_id, ',
              'ors.id, ',
              'fnb.kind, ',
              'fnp.dt_payment, ',
              'fnb.operation, ',
              'fnb.stage, ',
              'fin.tb_institution_id, ',
              'fpl.id fpl_id, ',
              'fpl.description fpl_description ',
              'FROM tb_financial fin ',
              '  inner join tb_financial_bills fnb ',
              '  ON (fin.tb_order_id = fnb.tb_order_id ) ',
              '    and ( fin.tb_institution_id = fnb.tb_institution_id) ',
              '    and ( fin.terminal = fnb.terminal ) ',
              '    and ( fin.parcel = fnb.parcel ) ',
              '  INNER JOIN tb_invoice inv ',
              '  ON (inv.id = fin.tb_order_id) ',
              '      and (inv.tb_institution_id = fin.tb_institution_id) ',
              '      and ( inv.terminal = fin.terminal ) ',
              '  inner join tb_entity etd ',
              '  on (etd.id = inv.tb_entity_id) ',
              '  left outer join tb_financial_payment fnp ',
              '  ON (fnp.tb_order_id = fnb.tb_order_id ) ',
              '      and (fnp.tb_institution_id = fnb.tb_institution_id) ',
              '      and ( fnp.parcel = fnb.parcel ) ',
              '      and ( fnp.terminal = fnb.terminal ) ',
              '  left outer join tb_order_sale ors ',
              '  ON (ors.id = fin.tb_order_id) ',
              '    and (ors.tb_institution_id = fin.tb_institution_id) ',
              '    and (ors.terminal = fin.terminal) ',

              '  inner join tb_order ord ',
              '  ON (ord.id = fin.tb_order_id) ',
              '    and (ord.tb_institution_id = fin.tb_institution_id) ',
              '    and (ord.terminal = fin.terminal) ',

              '  left outer join tb_financial_plans fpl ',
              '  ON (fpl.id = fnb.tb_financial_plans_id)  ',
              '     and (fpl.tb_institution_id = fnb.tb_institution_id) ',
              'WHERE  fin.tb_institution_id =:tb_institution_id ',
              ' and (fnb.kind =:fnb_kind) '
    ));

    if ChBx_Periodo.Checked then
    Begin
      case Rg_tipo_data.ItemIndex of
        0:sql.Add(' AND ( ord.dt_record between :dataini and :datafim ) ');
        1:sql.Add(' AND ( fin.dt_expiration between :dataini and :datafim ) ');
        2:sql.Add(' AND ( fnp.dt_payment between :dataini and :datafim ) ');

      end;
    End;

    if ( Trim(E_Nr_Ordem.Text) <> '' ) then
      sql.Add(' AND ( ors.number =:number ) ');


    if ( Trim(E_Nr_Invoice.Text) <> '' ) then
      sql.Add(' AND ( inv.number = :inv_number ) ');

    { Normais
      Destinadas
      Baixadas
      Inativas
      Todas }
    //Situação
    case Cb_Situacao.ItemIndex of
      0:sql.Add(' and (fnb.situation =  ''N'') ');
      1:sql.Add(' and (fnb.situation =  ''D'') ');
    end;
    //BAixa
    case Cb_Situacao.ItemIndex of
      0..1:Begin
          sql.Add(' and (fnp.dt_payment is null) ');
        End;
      2:Begin
          sql.Add(' and (fnp.dt_payment is not null) ');
        End;
    end;

    if ( Trim(FrPaymentType.DBLCB_Lista.Text) <> '' ) then
      sql.Add(' AND ( fin.tb_payment_type_id =:tb_payment_type_id ) ');

    //Passagem de PArametros
    ParamByName('fnb_kind').AsString := 'RA';

    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    if ChBx_Periodo.Checked then
    Begin
      ParamByName('dataini').AsString := ConverteData( DTP_Date_Initial.DateTime );
      ParamByName('datafim').AsString := ConverteData( DTP_Date_End.DateTime );
    End;

    if ( Trim(E_Nr_Ordem.Text) <> '' ) then
      ParamByName('nr_pi').AsString := E_Nr_Ordem.Text;

    if ( Trim(E_Nr_Invoice.Text) <> '' ) then
      ParamByName('inv_number').AsString := E_Nr_Invoice.Text;

    if ( Trim(FrPaymentType.DBLCB_Lista.Text) <> '' ) then
      ParamByName('tb_payment_type_id').AsInteger := FrPaymentType.DBLCB_Lista.KeyVAlue;

    Active := True;
  End;


end;

procedure TTasFinancialBillsGeneral.setvariable;
begin
  inherited;
  buttonIcon(Sb_Close_settled,'close.bmp');
  buttonIcon(Sb_settled_general,'confirm.bmp');
  //Boleto
  buttonIcon(Sb_BankSlipDueDate,'calendar.bmp');
  buttonIcon(Sb_BankSlipSend,'sending.bmp');
  buttonIcon(Sb_BankSlipReceive,'receiving.bmp');
  buttonIcon(Sb_BankSlipDelete,'delete.bmp');
  buttonIcon(Sb_BankSlipSearch,'search.bmp');
  buttonIcon(Sb_BankSlipEmail,'email.bmp');
  buttonIcon(Sb_BankSlipPrint,'print.bmp');
  buttonIcon(Sb_BankSlipSettled,'confirm.bmp');
  buttonIcon(Sb_BankSlipClose,'close.bmp');


end;

end.
