unit rep_order_list_packing;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, rep_order_list, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, QRPDFFilt, QRCtrls,
  QuickRpt, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TRepOrderListPacking = class(TRepOrderList)
    procedure setVAriable;override;
    procedure DetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure Ft_CategoryBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
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
  RepOrderListPacking: TRepOrderListPacking;

implementation

{$R *.dfm}

{ TRepOrderListPacking }

procedure TRepOrderListPacking.DetailBeforePrint(Sender: TQRCustomBand;
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

procedure TRepOrderListPacking.Ft_CategoryBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  E_Subtotal.Caption  := FloatToStrF( SubValue,ffNumber,10,2);
  SubValue := 0;
end;

procedure TRepOrderListPacking.GroupBySql;
begin
  inherited;

end;

procedure TRepOrderListPacking.InnerJoinSql;
begin
  inherited;
  InnerJoinTxt := concat(
                    InnerJoinTxt,
                    ' inner join tb_order_packing opk ',
                    ' on (ord.id = opk.id) and (ord.tb_institution_id = opk.tb_institution_id) ',
                    ' inner join tb_entity en ',
                    'on (en.id = opk.tb_entity_id)'
                  );

end;

procedure TRepOrderListPacking.OrderBySql;
begin
  inherited;
  OrderByTxt := ' order by ord.dt_record, en.name_company ';
end;

procedure TRepOrderListPacking.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  E_Total.Caption  := FloatToStrF( TotalValue,ffNumber,10,2);
  TotalValue := 0;
end;

procedure TRepOrderListPacking.SelectSql;
begin
  inherited;
  SelectTxt := concat(
                  SelectTxt,
                  ' , opk.number, en.name_company '
                );

end;

procedure TRepOrderListPacking.SetParameters;
begin
  inherited;
  if ( Par.Entidade > 0) then
  Begin
    Qry.ParamByName('en_id').AsInteger := Par.Entidade
  End;

end;

procedure TRepOrderListPacking.setVAriable;
begin
  inherited;
  SubValue := 0;
  TotalValue :=0;
end;

procedure TRepOrderListPacking.WhereSql;
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
