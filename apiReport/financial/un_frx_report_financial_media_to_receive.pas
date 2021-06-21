unit un_frx_report_financial_media_to_receive;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, un_frx_base_report_list,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, frxClass, frxExportPDF, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxDBSet;

type
  TFrxBaseReportList1 = class(TFrxBaseReportList)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrxBaseReportList1: TFrxBaseReportList1;

implementation

{$R *.dfm}

end.
