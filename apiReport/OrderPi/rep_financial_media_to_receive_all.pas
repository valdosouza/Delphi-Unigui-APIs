unit rep_financial_media_to_receive_all;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, rep_financial_media_to_receive,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, QRPDFFilt, QRCtrls, QuickRpt, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TRepFinancialMediaToRreceiveAll = class(TRepFinancialMediaToReceive)
    Lb_Aberto: TQRLabel;
    Lb_Fechado: TQRLabel;
    E_Vl_fechado: TQRLabel;
    e_VL_Aberto: TQRLabel;
    E_Sb_Vl_Aberto: TQRLabel;
    E_Sb_Vl_Fechado: TQRLabel;
    E_TL_Vl_Aberto: TQRLabel;
    E_TL_Vl_Fechado: TQRLabel;
    procedure DetalheBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure Fte_VeiculoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SumarioBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
    SubValorAberto : Real;
    SubValorFechado : Real;
    TotalValorAberto : Real;
    TotalValorFechado : Real;

  protected
    procedure InitVariable;Override;
  public
    { Public declarations }
  end;

var
  RepFinancialMediaToRreceiveAll: TRepFinancialMediaToRreceiveAll;

implementation

{$R *.dfm}

{ TRepFinancialMediaToRreceiveCidade }


{ TRepFinancialMediaToRreceiveAll }

procedure TRepFinancialMediaToRreceiveAll.DetalheBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  if Qrypaid_value.AsFloat >0 then
  Begin
    e_VL_Aberto.Caption := '0,00';
    E_Vl_fechado.Caption := FloatToStrF(Qrypaid_value.AsFloat, ffNumber,10,2);
    SubValorFechado   := SubValorFechado + Qrypaid_value.AsFloat;
    TotalValorFechado := TotalValorFechado + Qrypaid_value.AsFloat;
  End
  else
  Begin
    E_Vl_fechado.Caption := '0,00';
    e_VL_Aberto.Caption := FloatToStrF(Qryowner_value.AsFloat, ffNumber,10,2);
    SubValorAberto    := SubValorAberto + Qryowner_value.AsFloat;
    TotalValorAberto  := TotalValorAberto  + Qryowner_value.AsFloat;

  End;


end;

procedure TRepFinancialMediaToRreceiveAll.Fte_VeiculoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  E_Sb_Vl_Aberto.Caption := FloatToStrF(SubValorAberto,ffNumber,10,2);
  SubValorAberto := 0;
  E_Sb_Vl_Fechado.Caption := FloatToStrF(SubValorFechado,ffNumber,10,2);
  SubValorFechado := 0;

end;

procedure TRepFinancialMediaToRreceiveAll.InitVariable;
begin
  inherited;
  SubValorAberto    := 0;
  SubValorFechado   := 0;
  TotalValorAberto  := 0;
  TotalValorFechado := 0;

end;

procedure TRepFinancialMediaToRreceiveAll.SumarioBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  E_TL_Vl_Aberto.Caption := FloatToStrF(TotalValorAberto,ffNumber,10,2);
  TotalValorAberto := 0;
  E_TL_Vl_Fechado.Caption := FloatToStrF(TotalValorFechado,ffNumber,10,2);
  TotalValorFechado := 0;

end;

end.
