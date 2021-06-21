unit openForms;

interface

uses
  FMX.Forms,System.SysUtils, sea_customer, tas_order_sale, sea_product, sea_cashier,
  cad_user, tas_config, System.UITypes, FMX.Types;

    procedure OpenConfig(CodeId:Integer;aParent:TFmxObject);



implementation

uses  ctn_cashier,  cad_entity, ctn_config;


procedure OpenConfig(CodeId:Integer;aParent:TFmxObject);
Var
  Form : TTasConfig;
begin
  Form := TTasConfig.Create(Application);
  Form.Parent := aParent;
  Form.ShowModal(
  procedure(ModalResult : TModalResult)
  begin

  end);
End;

procedure OpenCtnCashier;
Var
  Form : TCtnCashier;
begin
  try
    Form := TCtnCashier.Create(Application);
    {$IFDEF ANDROID}
      Form.Show;
    {$ENDIF ANDROID}
    {$IFDEF WIN32}
      Form.ShowModal;
    {$ENDIF WIN32}
  finally
    Form.DisposeOf;
  end;
end;


end.
