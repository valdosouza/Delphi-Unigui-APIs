unit un_report_med_financial_to_bill;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_report_list, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, QRPDFFilt, QRCtrls,
  QuickRpt, Vcl.ExtCtrls;

type
  TBaseReportList1 = class(TBaseReportList)
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    Lb_Titulo: TQRLabel;
    Lb_NumeroNota: TQRLabel;
    E_NumeroNota: TQRLabel;
    LB_Tipo: TQRLabel;
    Lb_Empresa: TQRLabel;
    Detalhe: TQRBand;
    QRDBText10: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText4: TQRDBText;
    Sumario: TQRBand;
    Lb_1: TQRLabel;
    E_1: TQRLabel;
    QRLabel8: TQRLabel;
    Lb_Datas: TQRLabel;
    Lb_ContaCorrente: TQRLabel;
    Lb_2: TQRLabel;
    E_2: TQRLabel;
    Lb_3: TQRLabel;
    E_3: TQRLabel;
    QRBand3: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BaseReportList1: TBaseReportList1;

implementation

{$R *.dfm}

end.
