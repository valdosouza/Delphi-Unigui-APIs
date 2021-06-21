unit prm_cashier_items;

interface

uses tblcashierItems, System.SysUtils, prm_base ;

Type
  TPrmCashierItems = class(TPrmBase)
  private
    FCaixaItens: TCashierItems;
    procedure setFCaixaItens(const Value: TCashierItems);
  public
    Property CaixaItens : TCashierItems read FCaixaItens write setFCaixaItens;
  end;


implementation

{ TPrmCashierItems }

procedure TPrmCashierItems.setFCaixaItens(const Value: TCashierItems);
begin
  FCaixaItens := Value;
end;

end.
