unit rep_financial_media_to_receive_open;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, rep_financial_media_to_receive,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, QRPDFFilt, QRCtrls, QuickRpt, Vcl.ExtCtrls,   Vcl.StdCtrls;

type
  TRepFinancialMediaToRreceiveOpen = class(TRepFinancialMediaToReceive)
    QRBand1: TQRBand;
  private
    { Private declarations }
  protected

  public
    { Public declarations }
  end;

var
  RepFinancialMediaToRreceiveOpen: TRepFinancialMediaToRreceiveOpen;

implementation

{$R *.dfm}

{ TRepFinancialMediaToRreceiveNormal }


end.
