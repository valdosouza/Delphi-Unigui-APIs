unit rep_order_list_adjust;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, rep_order_list, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, QRPDFFilt, QRCtrls,
  QuickRpt, Vcl.ExtCtrls, base_report_list,  Vcl.StdCtrls;

type
  TRepOrderListAdjust = class(TRepOrderList)
    procedure setVariable;override;
    procedure DetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure Ft_CategoryBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    SubValue, TotalValue : Real;
  protected
    procedure SelectSql;override;
    procedure InnerJoinSql;override;
    procedure WhereSql;override;
    procedure OrderBySql;override;
    procedure GroupBySql;override;
    procedure SetParameters;override;
  public
    { Public declarations }
  end;

var
  RepOrderListAdjust: TRepOrderListAdjust;

implementation

{$R *.dfm}

{ TRepOrderListAdjust }

procedure TRepOrderListAdjust.DetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with Qry do
  Begin
    E_Date.Caption      := FieldByName('dt_record').AsString;
    E_Number.Caption    := FieldByName('number').AsString;
    E_Entidade.Caption  := FieldByName('name_company').AsString;
    E_Value.Caption     := FloatToStrF( FieldByName('total_value').AsFloat,ffNumber,10,2);
    SubValue            := SubValue + FieldByName('total_value').AsFloat;
    TotalValue          := TotalValue + FieldByName('total_value').AsFloat;
  End;
end;

procedure TRepOrderListAdjust.Ft_CategoryBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  E_Subtotal.Caption  := FloatToStrF( SubValue,ffNumber,10,2);
  SubValue := 0;
end;

procedure TRepOrderListAdjust.GroupBySql;
begin
  inherited;

end;

procedure TRepOrderListAdjust.InnerJoinSql;
begin
  inherited;
  InnerJoinTxt := concat(
                    InnerJoinTxt,
                    ' inner join tb_order_stock_adjust osa ',
                    ' on (ord.id = osa.id) and (ord.tb_institution_id = osa.tb_institution_id) ',
                    ' inner join tb_entity en ',
                    'on (en.id = osa.tb_entity_id)'
                  );

end;

procedure TRepOrderListAdjust.OrderBySql;
begin
  inherited;
  OrderByTxt := ' order by ord.dt_record, en.name_company ';
end;

procedure TRepOrderListAdjust.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  E_Total.Caption  := FloatToStrF( TotalValue,ffNumber,10,2);
  TotalValue := 0;
end;

procedure TRepOrderListAdjust.SelectSql;
begin
  inherited;
  SelectTxt := concat(
                  SelectTxt,
                  ' , osa.number, en.name_company '
                );

end;

procedure TRepOrderListAdjust.SetParameters;
begin
  inherited;
  if ( Par.Entidade > 0) then
  Begin
    Qry.ParamByName('en_id').AsInteger := Par.Entidade
  End;
end;

procedure TRepOrderListAdjust.setVariable;
begin
  inherited;
  SubValue := 0;
  TotalValue :=0;

end;

procedure TRepOrderListAdjust.WhereSql;
begin
  inherited;
  if ( Par.Entidade > 0) then
  Begin
    WhereTxt := concat(
                    WhereTxt,
                    ' and (en.id =:en_id)'
                );
  End;
end;

end.
