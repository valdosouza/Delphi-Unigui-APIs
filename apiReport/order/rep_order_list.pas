unit rep_order_list;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_report_list, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, QRPDFFilt, QRCtrls,
  QuickRpt, Vcl.ExtCtrls, prm_print_order_list,  Vcl.StdCtrls;

type
  TRepOrderList = class(TBaseReportList)
    Grp_Category: TQRGroup;
    Detail: TQRBand;
    Ft_Category: TQRBand;
    lb_Subtotal: TQRLabel;
    QRBand3: TQRBand;
    LB_Total: TQRLabel;
    lb_Entidade: TQRLabel;
    Lb_Pedido: TQRLabel;
    Lb_Data: TQRLabel;
    Lb_Value: TQRLabel;
    E_Entidade: TQRLabel;
    E_Number: TQRLabel;
    E_Date: TQRLabel;
    E_Value: TQRLabel;
    E_Subtotal: TQRLabel;
    E_Total: TQRLabel;
  private
    { Private declarations }
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
    Par : TPrmPrintOrderList;
  end;

var
  RepOrderList: TRepOrderList;

implementation

{$R *.dfm}

{ TRepOrderList }

procedure TRepOrderList.FromSql;
begin
  FromTxt :=  ' from tb_order ord ';
end;

procedure TRepOrderList.GroupBySql;
begin
  inherited;

end;

procedure TRepOrderList.InnerJoinSql;
begin
  InnerJoinTxt := concat(
                  ' Inner join tb_order_totalizer ot ',
                  ' on (ord.id = ot.id) and (ord.tb_institution_id = ot.tb_institution_id) '
                  );

end;

procedure TRepOrderList.OrderBySql;
begin

end;

procedure TRepOrderList.SelectSql;
begin
  SelectTxt := concat(
                  ' Select distinct ord.id, ord.dt_record, ot.total_value '
                );
end;

procedure TRepOrderList.SetParameters;
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

procedure TRepOrderList.WhereSql;
begin
  WhereTxt := ' where ord.tb_institution_id =:institution_id ';

  if par.Periodo then
  Begin
    WhereTxt := concat(
                  WhereTxt,
                  ' and (ord.dt_record between :dataini and :datafim)'
                );
  End;
end;

end.
