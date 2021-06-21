unit rep_invoice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_report_list, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, QRPDFFilt, QRCtrls,
  QuickRpt, Vcl.ExtCtrls, prm_print_invoice, Vcl.StdCtrls;

type
  TRepInvoice = class(TBaseReportList)
  private
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
    Par : TPrmPrintInvoice;
  end;

var
  RepInvoice: TRepInvoice;

implementation

{$R *.dfm}

{ TRepInvoice }

procedure TRepInvoice.FromSql;
begin
  FromTxt := ' FROM tb_invoice inv ';
end;

procedure TRepInvoice.GroupBySql;
begin
  inherited;

end;

procedure TRepInvoice.InnerJoinSql;
begin
  inherited;
  InnerJoinTxt := concat(
                    ' INNER JOIN tb_entity ent ',
                    ' ON (ent.id = inv.tb_entity_id) '
                 );
end;

procedure TRepInvoice.OrderBySql;
begin
  inherited;

end;

procedure TRepInvoice.SelectSql;
begin
  SelectTxt := concat(
                ' SELECT inv.id , inv.number,inv.dt_emission ,inv.kind_emis ',
                ',ent.name_company ,inv.value ,inv.model '
               );

end;

procedure TRepInvoice.SetParameters;
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
end;

procedure TRepInvoice.WhereSql;
begin
  WhereTxt := ' where inv.tb_institution_id =:institution_id ';

  if par.Periodo then
  Begin
    WhereTxt := concat(
                  WhereTxt,
                  ' and (inv.dt_emission between :dataini and :datafim)'
                );
  End;


end;

end.
