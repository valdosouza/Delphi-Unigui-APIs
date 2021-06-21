unit ctn_cashier;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  container_form, FMX.ListBox, FMX.Layouts, FMX.MultiView,
  FMX.Controls.Presentation, FMX.Objects;

type
  TCtnCashier = class(TContainerForm)
    MnuNew: TListBoxItem;
    MnuSearch: TListBoxItem;
    MnuClose: TListBoxItem;
    MnuResumo: TListBoxItem;
    procedure MnuCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CtnCashier: TCtnCashier;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.fmx}


procedure TCtnCashier.MnuCloseClick(Sender: TObject);
begin
  Self.Close;
end;

end.
