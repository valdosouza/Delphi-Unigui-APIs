unit un_frx_report_media_parts;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, un_frx_base_report_list,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxDBSet,prm_print_media_parts, unFunctions,
  frxExportPDF;

type
  TFrxReportMediaParts = class(TFrxBaseReportList)
  private
    { Private declarations }
  protected
    procedure InitVariable; Override;
    procedure SetVariable; Override;
    procedure setImages; Override;
    procedure ClearFields; Override;
    // Operações com Sql
    procedure SelectSql; Override;
    procedure FromSql; Override;
    procedure InnerJoinSql; Override;
    procedure WhereSql; Override;
    procedure OrderBySql; Override;
    procedure GroupBySql; Override;
    procedure SetParameters; Override;
    procedure feedCsdClient;
  public
    { Public declarations }
    Par : TPrmPrintMediaParts;
    Path:String;
    procedure execute;Override;

  end;

var
  FrxReportMediaParts: TFrxReportMediaParts;

implementation

{$R *.dfm}

uses prm_rep_budg_advertise;

{ TFrxReportMediaParts }

procedure TFrxReportMediaParts.ClearFields;
begin
  inherited;

end;

procedure TFrxReportMediaParts.execute;
Var
  LcExport : TfrxCustomExportFilter;
begin
  inherited;
  frxBase.PrepareReport(True);
  LcExport := TfrxCustomExportFilter(frxPDF);
  LcExport.ShowDialog := FAlse;
  LcExport.FileName := Path;
  frxBase.Export( LcExport );
end;

procedure TFrxReportMediaParts.feedCsdClient;
begin

end;

procedure TFrxReportMediaParts.FromSql;
begin
  inherited;
  FromTxt := concat(
                'from tb_med_insert_date mdi                                           '
              );
end;

procedure TFrxReportMediaParts.GroupBySql;
begin
  inherited;
end;

procedure TFrxReportMediaParts.InitVariable;
begin
  inherited;
  Par := TPrmPrintMediaParts.Create;
end;

procedure TFrxReportMediaParts.InnerJoinSql;
begin
  InnerJoinTxt := concat(
    'inner join tb_med_parts mp                              ',
    'on(mp.id =  mdi.tb_med_parts_id)                        ',
    '	and (mp.tb_institution_id = mdi.tb_institution_id )    ',
    '    and (mp.tb_order_id = mdi.tb_order_id )             ',

    'inner join tb_med_parts_jr jr                           ',
    'on(mp.id =  jr.id)                                      ',
    '	and (mp.tb_institution_id = jr.tb_institution_id)      ',
    '    and (mp.tb_order_id = jr.tb_order_id )              ',

    'inner join tb_order_pi orp                              ',
    'on (orp.id = mp.tb_order_id)                            ',
    '	and (orp.tb_institution_id = mp.tb_institution_id)     ',

    'inner join tb_entity brd                                ',
    'on (brd.id = orp.tb_broadcaster_id)                     ',

    'inner join tb_entity adv                                ',
    'on (adv.id = orp.tb_advertiser_id)                      ',

    'inner join tb_med_price_list_jr mpl                     ',
    'on (mpl.id = mp.tb_med_price_list_id)                   ',
    '  and (mpl.tb_institution_id = mp.tb_institution_id)    ',

    'inner join tb_med_pos_prog mpp                         ',
    'on (mpp.id = mpl.tb_med_pos_prog_id)                    ',
    '  and (mpp.tb_institution_id = mp.tb_institution_id)    '

    );

end;

procedure TFrxReportMediaParts.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by mdi.dt_insertion asc ';
end;

procedure TFrxReportMediaParts.SelectSql;
begin
  SelectTxt := concat(
    ' SELECT  orp.id,mdi.dt_insertion, brd.nick_trade broadcaster,                ',
    'adv.nick_trade advetiser, mp.tittle,mpp.description  ,                ',
    'concat(jr.nr_column , ''COL X '' , jr.nr_height , ''cm'') as parts_format,mdi.qt_insertion '
    );
end;

procedure TFrxReportMediaParts.setImages;
begin
  inherited;

end;

procedure TFrxReportMediaParts.SetParameters;
begin
  with Qry do
  Begin
    ParamByName('institution_id').AsInteger := Par.Estabelecimento;
  if Par.Periodo then
  BEgin
    ParamByName('dataini').AsString := ConverteData(Par.DataInicial);
    ParamByName('datafim').AsString := ConverteData(Par.DataFinal);
  End;

  if Par.VeiculoCom <> '' then
    ParamByName('nick_trade').AsString := Par.VeiculoCom ;
  End;

end;

procedure TFrxReportMediaParts.SetVariable;
begin
  inherited;
//  Qry.Active := True; - comentado em 29/04/2019 - 323:38 não entendi por que ativando antes do sql
end;

procedure TFrxReportMediaParts.WhereSql;
begin
  inherited;
  WhereTxt := 'where mdi.tb_institution_id =:institution_id ';

  if Par.Periodo then
  BEgin
      WhereTxt := concat(
                      WhereTxt,
                      ' and (mdi.dt_insertion between :dataini and :datafim) '
                  );
  End;

  if Par.VeiculoCom <> '' then
    WhereTxt := concat(
                      WhereTxt +
                      ' and (enbd.nick_trade like :nick_trade) '
                );

end;

end.
