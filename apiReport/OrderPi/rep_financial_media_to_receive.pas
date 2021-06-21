unit rep_financial_media_to_receive;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_report_list, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, QRPDFFilt, QRCtrls,
  QuickRpt, Vcl.ExtCtrls,prm_print_financial_media, System.StrUtils, UnFunctions,
  Vcl.StdCtrls;

type
  TRepFinancialMediaToReceive = class(TBaseReportList)
    Detalhe: TQRBand;
    Sumario: TQRBand;
    QRBand3: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QryPDI_VEICULO: TStringField;
    Qrynr_original: TStringField;
    Qrynr_internal: TIntegerField;
    Qryid: TIntegerField;
    QryPDI_AGENCIA: TStringField;
    QryPDI_ANUNCIANTE: TStringField;
    Qrygross_value: TBCDField;
    Qrykickback_value: TBCDField;
    Qryowner_value: TBCDField;
    Qrynet_value: TBCDField;
    Qrydt_expiration: TDateField;
    Qrytb_order_id: TIntegerField;
    Qrydt_payment: TDateField;
    Qrykind: TStringField;
    Qrytag_value: TBCDField;
    Qr_Acao: TFDQuery;
    Qryname: TStringField;
    QryPDI_RAZAOVEICULO: TStringField;
    Grp_Veiculo: TQRGroup;
    E_Cidade: TQRDBText;
    Lb_Cidade: TQRLabel;
    Lb_Veiculo: TQRLabel;
    E_Veiculo: TQRDBText;
    Lb_PI_Agencia: TQRLabel;
    Lb_Dt_Vencimento: TQRLabel;
    Lb_Valor_Bruto: TQRLabel;
    Lb_Agencia: TQRLabel;
    Lb_PI_Interna: TQRLabel;
    Lb_Anunciante: TQRLabel;
    Fte_Veiculo: TQRBand;
    QRLabel14: TQRLabel;
    Lb_Pi_Original: TQRLabel;
    e_VL_Empresa: TQRDBText;
    E_Vencimento: TQRDBText;
    E_Valor_BRuto: TQRDBText;
    E_AGencia: TQRDBText;
    E_PI_Interna: TQRDBText;
    E_Anunciante: TQRDBText;
    E_PI_Original: TQRDBText;
    Lb_Valor_Liquido: TQRLabel;
    E_Valor_Liquido: TQRDBText;
    E_Sb_VL_Empresa: TQRExpr;
    E_Sb_VL_Bruto: TQRExpr;
    E_Sb_VL_Liquido: TQRExpr;
    QRLabel4: TQRLabel;
    E_TL_VL_Empresa: TQRExpr;
    E_TL_VL_BRuto: TQRExpr;
    E_TL_VL_Liquido: TQRExpr;
    DataSource1: TDataSource;
    Qrynumber: TStringField;
    Qrypaid_value: TBCDField;
  private
    { Private declarations }
    function UltimoPagamento(): String;
    function SaldoAPagar(): String;

  protected
    procedure SelectSql;Override;
    procedure FromSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;
    procedure GroupBySql;Override;
    procedure SetParameters;Override;

    procedure FormatScreen;Override;
  public
    { Public declarations }
    par :TPrmPrintFinancialMedia;
    procedure Execute;Override;
  end;

var
  RepFinancialMediaToReceive: TRepFinancialMediaToReceive;

implementation

{$R *.dfm}

uses uMain, MainModule;

{ TRepFinancialMediaToReceive }

procedure TRepFinancialMediaToReceive.Execute;
begin
  inherited;

end;

procedure TRepFinancialMediaToReceive.FormatScreen;
begin
  inherited;

end;

procedure TRepFinancialMediaToReceive.FromSql;
begin
  FromTxt := 'from tb_order_pi opi ';
end;

procedure TRepFinancialMediaToReceive.GroupBySql;
begin

end;


procedure TRepFinancialMediaToReceive.InnerJoinSql;
begin
  InnerJoinTxt := concat(
          '   inner join tb_entity brd ',
          '   on (brd.id = opi.tb_broadcaster_id ) ',
          '    inner join tb_address ad                                ',
          '    on ( ad.id = brd.id )                                     ',
          '    inner join tb_city ct                                   ',
          '    on (ad.tb_city_id = ct.id  )                            ',

          '   inner join tb_entity age ',
          '   on (age.id = opi.tb_agency_id ) ',

          '   inner join tb_entity adv ',
          '   on (adv.id = opi.tb_advertiser_id) ',

          '  INNER JOIN  tb_invoice  inv ',
          '  ON (opi.id = inv.id) ',
          '      and (opi.tb_institution_id = inv.tb_institution_id) ',


          '  INNER JOIN  tb_financial  fn ',
          '  ON (opi.id = fn.tb_order_id) ',
          '      and (opi.tb_institution_id = fn.tb_institution_id) ',


          '  INNER JOIN  tb_financial_bills  fnb ',
          '  ON (fn.tb_order_id = fnb.tb_order_id) ',
          '      and (fn.tb_institution_id  = fnb.tb_institution_id) ',
          '      and (fn.terminal           = fnb.terminal) ',
          '      and (fn.parcel             = fnb.parcel) ',

          '  left outer join tb_financial_payment fnp ',
          '  ON (fnb.tb_order_id = fnp.tb_order_id) ',
          '      and (fnb.tb_institution_id = fnp.tb_institution_id) ',
          '      and (fnb.terminal          = fnp.terminal) ',
          '      and (fnb.parcel            = fnp.parcel) '

  )
end;

procedure TRepFinancialMediaToReceive.OrderBySql;
begin
  //Se precisar alterar cudado pois a ordenação aqui é crucial para o agrupamento nos relatorios
  OrderByTxt := 'order by brd.nick_trade, ct.name, opi.dt_expiration ';
end;

function TRepFinancialMediaToReceive.SaldoAPagar: String;
begin
  Screen.Cursor:=crHourGlass;
  with Qr_Acao do
  Begin
    Close;
    Connection := getConnection;
    Sql.Clear;
    SQL.Add(concat(
            'SELECT SUM(tag_value) AS DUP_TOTAL '+
            'from tb_order_pi opi                                        ',
            '    inner join tb_entity brd                                ',
            '    on (brd.id = opi.tb_broadcaster_id )                    ',
            '    inner join tb_entity age                                ',
            '    on (age.id = opi.tb_agency_id )                         ',
            '    inner join tb_entity adv                                ',
            '    on (adv.id = opi.tb_advertiser_id)                      ',
            '    INNER JOIN  tb_financial  fn                            ',
            '    ON (opi.id = fn.tb_order_id)                            ',
            '    and (opi.tb_institution_id = fn.tb_institution_id)      ',
            '    INNER JOIN  tb_financial_bills  fnb                     ',
            '    ON (fn.tb_order_id = fnb.tb_order_id)                   ',
            '       and (fn.tb_institution_id  = fnb.tb_institution_id)  ',
            '       and (fn.terminal           = fnb.terminal)           ',
            '       and (fn.parcel             = fnb.parcel)             ',
            '    left outer join tb_financial_payment fnp                ',
            '    ON (fnb.tb_order_id = fnp.tb_order_id)                  ',
            '       and (fnb.tb_institution_id = fnp.tb_institution_id)  ',
            '       and (fnb.terminal          = fnp.terminal)           ',
            '       and (fnb.parcel            = fnp.parcel)             ',
            'where (opi.tb_institution_id =:institution_id)              ',
            '  and (fnp.dt_payment is not null)                          '
    ));

    //Incrementar o SQL
    if ( par.Anunciante > 0 ) then
      Sql.Add(' AND ( tb_advertiser_id =:advertiser_id ) ');

    if ( Par.Veiculo >0  ) then
      Sql.Add(' AND ( tb_broadcaster_id =:broadcaster_id ) ');

    if ( Par.Agencia >0  ) then
      Sql.Add(' AND ( tb_agency_id =:agency_id ) ');

    //Passagem de parametros
    ParamByName('institution_id').AsInteger := par.Estabelecimento;


    if ( par.Anunciante > 0 ) then
      ParamByName('advertiser_id').AsInteger := par.Anunciante;


    if ( Par.Veiculo >0  ) then
      ParamByName('broadcaster_id').AsInteger := par.Veiculo;

    if ( Par.Agencia >0  ) then
      ParamByName('agency_id').AsInteger := par.Agencia;

    Open;
    Result := FloatToStrF(Qr_Acao.FieldByName('DUP_TOTAL').AsFloat,ffFixed,10,2);
  End;

end;

procedure TRepFinancialMediaToReceive.SelectSql;
begin
  SelectTxt :=concat(
          'SELECT brd.nick_trade PDI_VEICULO,brd.name_company PDI_RAZAOVEICULO, opi.nr_original, opi.nr_internal, opi.id, ',
          'age.nick_trade PDI_AGENCIA, adv.nick_trade PDI_ANUNCIANTE, opi.gross_value, ',
          'opi.kickback_value, opi.owner_value, opi.net_value, opi.dt_expiration, ',
          'fn.tb_order_id, fnp.dt_payment, fnb.kind, fn.tag_value,inv.number ',
          ', ct.name, fnp.paid_value '
    );
end;

procedure TRepFinancialMediaToReceive.SetParameters;
begin
  with qry do
  Begin
    ParamByName('institution_id').AsInteger := par.Estabelecimento;

    if par.Periodo then
    Begin
      ParamByName('dataini').AsString := ConverteData( par.DataInicial );
      ParamByName('datafim').AsString := ConverteData( par.DataFinal );
    End;

    if ( par.Anunciante > 0 ) then
      ParamByName('advertiser_id').AsInteger := par.Anunciante;


    if ( Par.Veiculo >0  ) then
      ParamByName('broadcaster_id').AsInteger := par.Veiculo;

    if ( Par.Agencia >0  ) then
      ParamByName('agency_id').AsInteger := par.Agencia;

  End;
end;

function TRepFinancialMediaToReceive.UltimoPagamento: String;
VaR
  Lc_Dt_venc : TDate;
begin
  with Qr_Acao do
  Begin
    Close;
    Connection := getConnection;
    Sql.Clear;
    Sql.Add(concat(
            'SELECT DISTINCT fnp.dt_payment                             ',
            'from tb_order_pi opi                                        ',
            '    INNER JOIN  tb_financial  fn                            ',
            '    ON (opi.id = fn.tb_order_id)                            ',
            '    and (opi.tb_institution_id = fn.tb_institution_id)      ',
            '    INNER JOIN  tb_financial_bills  fnb                     ',
            '    ON (fn.tb_order_id = fnb.tb_order_id)                   ',
            '       and (fn.tb_institution_id  = fnb.tb_institution_id)  ',
            '       and (fn.terminal           = fnb.terminal)           ',
            '       and (fn.parcel             = fnb.parcel)             ',
            '    inner join tb_financial_payment fnp                ',
            '    ON (fnb.tb_order_id = fnp.tb_order_id)                  ',
            '       and (fnb.tb_institution_id = fnp.tb_institution_id)  ',
            '       and (fnb.terminal          = fnp.terminal)           ',
            '       and (fnb.parcel            = fnp.parcel)             ',
            'where (opi.tb_institution_id =:institution_id)              '
      ));

    //Incremenar SQL

    if par.Periodo then
    Begin
      Sql.Add(' AND (fnp.dt_payment <:dt_payment  ) ');
    End;

    if ( par.Anunciante > 0 ) then
      Sql.Add(' AND ( tb_advertiser_id =:advertiser_id ) ');

    if ( Par.Veiculo >0  ) then
      Sql.Add(' AND ( tb_broadcaster_id =:broadcaster_id ) ');

    if ( Par.Agencia >0  ) then
      Sql.Add(' AND ( tb_agency_id =:agency_id ) ');

      Sql.Add(' ORDER BY fnp.dt_payment DESC ');
      Sql.Add(' limit 0,1 ');
    //Passagem de parametros
    ParamByName('institution_id').AsInteger := par.Estabelecimento;

    if par.Periodo then
    Begin
      ParamByName('dt_payment').AsString := ConverteData( par.DataInicial );
    End;

    if ( par.Anunciante > 0 ) then
      ParamByName('advertiser_id').AsInteger := par.Anunciante;


    if ( Par.Veiculo >0  ) then
      ParamByName('broadcaster_id').AsInteger := par.Veiculo;

    if ( Par.Agencia >0  ) then
      ParamByName('agency_id').AsInteger := par.Agencia;

    Qr_Acao.Active := True;
    Lc_Dt_venc := Qr_Acao.fieldByname('dt_payment').AsDateTime;

    Close;
    Sql.Clear;
    Sql.Add(concat(
            'SELECT SUM(tag_value) AS DUP_TOTAL                          ',
            'from tb_order_pi opi                                        ',
            '    INNER JOIN  tb_financial  fn                            ',
            '    ON (opi.id = fn.tb_order_id)                            ',
            '       and (opi.tb_institution_id = fn.tb_institution_id)   ',
            '    INNER JOIN  tb_financial_bills  fnb                     ',
            '    ON (fn.tb_order_id = fnb.tb_order_id)                   ',
            '       and (fn.tb_institution_id  = fnb.tb_institution_id)  ',
            '       and (fn.terminal           = fnb.terminal)           ',
            '       and (fn.parcel             = fnb.parcel)             ',
            '    inner join tb_financial_payment fnp                ',
            '    ON (fnb.tb_order_id = fnp.tb_order_id)                  ',
            '       and (fnb.tb_institution_id = fnp.tb_institution_id)  ',
            '       and (fnb.terminal          = fnp.terminal)           ',
            '       and (fnb.parcel            = fnp.parcel)             ',
            'where (opi.tb_institution_id =:institution_id)              '
    ));

    //Incremenar SQL
    if ( par.Anunciante > 0 ) then
      Sql.Add(' AND ( tb_advertiser_id =:advertiser_id ) ');

    if ( Par.Veiculo >0  ) then
      Sql.Add(' AND ( tb_broadcaster_id =:broadcaster_id ) ');

    if ( Par.Agencia >0  ) then
      Sql.Add(' AND ( tb_agency_id =:agency_id ) ');

    Sql.Add(' AND (fnp.dt_payment =:dt_payment) ');

    //Passagem de parametros
    ParamByName('institution_id').AsInteger := par.Estabelecimento;

    if ( par.Anunciante > 0 ) then
      ParamByName('advertiser_id').AsInteger := par.Anunciante;


    if ( Par.Veiculo >0  ) then
      ParamByName('broadcaster_id').AsInteger := par.Veiculo;

    if ( Par.Agencia >0  ) then
      ParamByName('agency_id').AsInteger := par.Agencia;

    ParamByName('dt_payment').AsString := ConverteData( Lc_Dt_venc );

    Open;

    Result := FloatToStrF(Qr_Acao.FIELDBYNAME('DUP_TOTAL').AsFloat,ffFixed,10,2);
  End;


end;

procedure TRepFinancialMediaToReceive.WhereSql;
begin
  WhereTxt := 'where (opi.tb_institution_id =:institution_id) ';

  case AnsiIndexStr(UpperCase(par.Situacao), ['A', 'F','T']) of
    0:Begin
        WhereTxt := WhereTxt + ' and (fnp.dt_payment is null) ';
      End;
    1:Begin
        WhereTxt := WhereTxt + ' and (fnp.dt_payment is not null) ';
      End;
  end;

  if par.Periodo then
  Begin
    case AnsiIndexStr(UpperCase(par.TipoData), ['DT_INTERNAL', 'DT_EXPIRATION','DT_PAYMENT']) of
      0:WhereTxt := WhereTxt + ' AND ( opi.dt_internal between :dataini and :datafim ) ';
      1:WhereTxt := WhereTxt + ' AND ( opi.dt_expiration between :dataini and :datafim ) ';
      2:WhereTxt := WhereTxt + ' AND ( fnp.dt_payment between :dataini and :datafim ) ';

    end;
  End;

  if ( par.Anunciante > 0 ) then
    WhereTxt := WhereTxt + ' AND ( tb_advertiser_id =:advertiser_id ) ';

  if ( Par.Veiculo >0  ) then
    WhereTxt := WhereTxt +' AND ( tb_broadcaster_id =:broadcaster_id ) ';

  if ( Par.Agencia >0  ) then
    WhereTxt := WhereTxt + ' AND ( tb_agency_id =:agency_id ) ';
end;

end.
