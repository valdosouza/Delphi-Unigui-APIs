unit uDataPromotionItemsCC;

interface
uses  uDataCC;

Type

  TSMPromotionItemsClient = class(TDataCC)
  private
  public
    function getList(par:String; const ARequestFilter: string = ''): String;
    function save(par:String;const ARequestFilter: string = ''): String;
    function delete(par:String; const ARequestFilter: string = ''): String;
    function getSyncronize(par:String;const ARequestFilter: string = ''): String;
  end;

implementation

{ TSMPromotionItemsClient }

function TSMPromotionItemsClient.delete(par:String; const ARequestFilter: string = ''): String;
begin
  Result := execCommand('TSMPromotionItems.delete',par,ARequestFilter);
end;

function TSMPromotionItemsClient.getList(par:String;  const ARequestFilter: string): String;
begin
  Result := execCommand('TSMPromotionItems.getList',par,ARequestFilter);
end;

function TSMPromotionItemsClient.getSyncronize(par:String;const ARequestFilter: string): String;
begin
  Result := execCommand('TSMPromotionItems.getSyncronize',par,ARequestFilter);
end;

function TSMPromotionItemsClient.save(par:String; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMPromotionItems.save',par,ARequestFilter);
end;

end.
