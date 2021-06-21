unit rep_financial_bills;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, rep_financial, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, QRPDFFilt, QRCtrls,
  QuickRpt, Vcl.ExtCtrls, prm_print_financial, Vcl.StdCtrls;

type
  TRepFinancialBills = class(TRepFinancial)
  private
    { Private declarations }
  protected
    procedure WhereSql;override;
  public
    { Public declarations }

  end;

var
  RepFinancialBills: TRepFinancialBills;

implementation

{$R *.dfm}

{ TRepFinancialBills }

procedure TRepFinancialBills.WhereSql;
begin
  inherited;
  WhereTxt := concat(
                WhereTxt,
                ' and ( (fib.kind = ''RA'') or (fib.kind = ''RM'') ) '
              );
end;

end.
