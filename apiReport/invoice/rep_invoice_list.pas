unit rep_invoice_list;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, rep_invoice, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, QRPDFFilt, QRCtrls,
  QuickRpt, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TRepInvoiceList = class(TRepInvoice)
    Detail: TQRBand;
    E_Entidade: TQRLabel;
    E_Number: TQRLabel;
    E_Date: TQRLabel;
    E_Value: TQRLabel;
    Grp_Category: TQRGroup;
    lb_Entidade: TQRLabel;
    Lb_Pedido: TQRLabel;
    Lb_Data: TQRLabel;
    Lb_Value: TQRLabel;
    Ft_Category: TQRBand;
    lb_Subtotal: TQRLabel;
    E_Subtotal: TQRLabel;
    QRBand3: TQRBand;
    LB_Total: TQRLabel;
    E_Total: TQRLabel;
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
  RepInvoiceList: TRepInvoiceList;

implementation

{$R *.dfm}

{ TRepInvoiceList }

procedure TRepInvoiceList.DetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with Qry do
  Begin
    E_Date.Caption      := FieldByName('dt_emission').AsString;
    E_Number.Caption    := FieldByName('number').AsString;
    E_Entidade.Caption  := FieldByName('name_company').AsString;
    E_Value.Caption     := FloatToStrF( FieldByName('value').AsFloat,ffNumber,10,2);
    SubValue            := SubValue + FieldByName('value').AsFloat;
    TotalValue          := TotalValue + FieldByName('value').AsFloat;
  End;
end;

procedure TRepInvoiceList.Ft_CategoryBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  E_Subtotal.Caption  := FloatToStrF( SubValue,ffNumber,10,2);
  SubValue := 0;
end;

procedure TRepInvoiceList.GroupBySql;
begin
  inherited;

end;

procedure TRepInvoiceList.InnerJoinSql;
begin
  inherited;

end;

procedure TRepInvoiceList.OrderBySql;
begin
  inherited;

end;

procedure TRepInvoiceList.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  E_Total.Caption  := FloatToStrF( TotalValue,ffNumber,10,2);
  TotalValue := 0;
end;

procedure TRepInvoiceList.SelectSql;
begin
  inherited;

end;

procedure TRepInvoiceList.SetParameters;
begin
  inherited;

end;

procedure TRepInvoiceList.setVariable;
begin
  inherited;
  SubValue := 0;
  TotalValue :=0;
end;

procedure TRepInvoiceList.WhereSql;
begin
  inherited;
  WhereTxt := concat(
                WhereTxt,
                ' and (inv.model = ''55'') '
              );
end;

end.
