unit rep_financial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_report_list, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, QRPDFFilt, QRCtrls,
  QuickRpt, Vcl.ExtCtrls, prm_print_financial, Vcl.StdCtrls;

type
  TRepFinancial = class(TBaseReportList)
    Detalhe: TQRBand;
    fp_SubTotal: TQRBand;
    Lb_Subtotal: TQRLabel;
    E_Subtotal: TQRLabel;
    Sumario: TQRBand;
    Lb_Total: TQRLabel;
    E_Total: TQRLabel;
    Grupo1: TQRGroup;
    E_grp_Expiration: TQRLabel;
    E_Entidade: TQRLabel;
    E_Dt_Emission: TQRLabel;
    E_Value: TQRLabel;
    E_Dt_Expiration: TQRLabel;
    E_fin_Numero: TQRLabel;
    Lb_Entidade: TQRLabel;
    Lb_Dt_Emission: TQRLabel;
    Lb_Value: TQRLabel;
    Lb_Dt_Expiration: TQRLabel;
    Lb_Fin_Numero: TQRLabel;
    procedure setVariable;override;
    procedure DetalheBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure fp_SubTotalBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SumarioBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure Grupo1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
    SubValue, TotalValue : Real;
  protected
    procedure SelectSql;override;
    procedure FromSql;override;
    procedure InnerJoinSql;override;
    procedure WhereSql;override;
    procedure OrderBySql;override;
    procedure GroupBySql;override;
    procedure SetParameters;override;
  public
    { Public declarations }
    Par : TPrmPrintFinancial;
  end;

var
  RepFinancial: TRepFinancial;

implementation

{$R *.dfm}

procedure TRepFinancial.DetalheBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with Qry do
  Begin
    E_Entidade.Caption      := FieldByName('name_company').AsString;
    E_Dt_Emission.Caption   := FieldByName('dt_emission').AsString;
    E_fin_Numero.Caption    := FieldByName('number').AsString;
    E_Dt_Expiration.Caption := FieldByName('dt_expiration').AsString;
    E_Value.Caption     := FloatToStrF( FieldByName('tag_value').AsFloat,ffNumber,10,2);
    SubValue            := SubValue + FieldByName('tag_value').AsFloat;
    TotalValue          := TotalValue + FieldByName('tag_value').AsFloat;
  End;
end;

procedure TRepFinancial.FromSql;
begin
  FromTxt := '  from tb_invoice inv ';

end;

procedure TRepFinancial.GroupBySql;
begin
  inherited;

end;

procedure TRepFinancial.Grupo1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  E_grp_Expiration.Caption := Qry.FieldByName('dt_expiration').AsString;
end;

procedure TRepFinancial.InnerJoinSql;
begin
  InnerJoinTxt := concat(
                    '    inner join tb_financial fin '+
                    '  on (fin.tb_order_id = inv.id) '+
                    '  	  and (fin.tb_institution_id = inv.tb_institution_id) '+
                    '  inner join tb_financial_bills fib '+
                    '  on (fib.tb_order_id = fin.tb_order_id) '+
                    '  	  and (fib.tb_institution_id = fin.tb_institution_id) '+
                    '      and (fib.parcel = fin.parcel) '+
                    '  inner join tb_entity en '+
                    '  on (en.id = inv.tb_entity_id) '
                );

end;

procedure TRepFinancial.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by dt_expiration, name_company ';
end;

procedure TRepFinancial.SelectSql;
begin
  SelectTxt := concat(
                'SELECT inv.id, inv.number ,inv.dt_emission ,fin.dt_expiration ',
                ', en.name_company, fin.tag_value, fin.parcel '
              );
end;

procedure TRepFinancial.SetParameters;
begin
  with Qry do
  Begin
    ParamByName('institution_id').AsInteger := par.Estabelecimento;
    if par.Periodo then
    Begin
      ParamByName('dataini').AsDate := par.DataInicial;
      ParamByName('datafim').AsDate := par.DataFinal;
    End;
  End;
  if ( Par.Entidade > 0) then
  Begin
    Qry.ParamByName('en_id').AsInteger := Par.Entidade
  End;

end;

procedure TRepFinancial.setVariable;
begin
  inherited;
  SubValue := 0;
  TotalValue :=0;
end;

procedure TRepFinancial.fp_SubTotalBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  E_Subtotal.Caption  := FloatToStrF( SubValue,ffNumber,10,2);
  SubValue := 0;
end;

procedure TRepFinancial.SumarioBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  E_Total.Caption  := FloatToStrF( TotalValue,ffNumber,10,2);
  TotalValue := 0;
end;

procedure TRepFinancial.WhereSql;
begin
  WhereTxt := ' where inv.tb_institution_id =:institution_id ';

  if par.Periodo then
  Begin
    WhereTxt := concat(
                  WhereTxt,
                  ' and (fin.dt_expiration between :dataini and :datafim)'
                );
  End;

  if ( Par.Entidade > 0) then
  Begin
    WhereTxt := concat(
                    WhereTxt,
                    ' and (en.id =:en_id)'
                );
  End;

end;

end.
