unit rep_product_file;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, rep_product, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, QRPDFFilt, QRCtrls,
  QuickRpt, Vcl.ExtCtrls, prm_print_product, Vcl.StdCtrls;

type
  TRepProductFile = class(TRepProduct)
    Grp_Category: TQRGroup;
    E_Grupo: TQRLabel;
    Detail: TQRBand;
    E_DescricaoProduto: TQRLabel;
    E_codigoProduto: TQRLabel;
    Ft_Category: TQRBand;
    QRLabel6: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    tl_Count: TQRExpr;
    Qryid: TIntegerField;
    Qryidentifier: TStringField;
    Qryproduct: TStringField;
    Qrycategory: TStringField;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    procedure Grp_CategoryBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  RepProductFile: TRepProductFile;

implementation

{$R *.dfm}

procedure TRepProductFile.DetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  E_codigoProduto.Caption := Qry.FieldByName('identifier').AsString;
  E_DescricaoProduto.Caption := Qry.FieldByName('product').AsString;
end;

procedure TRepProductFile.Grp_CategoryBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  E_Grupo.Caption := Qry.FieldByName('category').AsString;
end;

end.
