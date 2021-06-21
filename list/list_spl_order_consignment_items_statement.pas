unit list_spl_order_consignment_items_statement;

interface

uses list_spl_order_items;

type
  TListSplOrderConsignmentItemsStatement = class(TListSplOrderItems)
    private
    FTipo: String;
    FData: String;
    procedure setFData(const Value: String);
    procedure setFTipo(const Value: String);


   public
      property Data : String read FData write setFData;
      property Tipo : String read FTipo write setFTipo;
  end;

implementation


{ TListSplOrderConsignmentItemsStatement }

procedure TListSplOrderConsignmentItemsStatement.setFData(const Value: String);
begin
  FData := Value;
end;

procedure TListSplOrderConsignmentItemsStatement.setFTipo(const Value: String);
begin
  FTipo := Value;
end;

end.
