unit uDataPromotionCC;

interface

uses  uDataCC;

type
  TSMPromotionClient = class(TDataCC)
  private
  public
    function getList(par:String; const ARequestFilter: string = ''): String;
    function save(par: string; const ARequestFilter: string = ''): String;
    function getByKey(par:String; const ARequestFilter: string = ''): String;
    function delete(par:String; const ARequestFilter: string = ''): String;
    function getSyncronize(par: string; const ARequestFilter: string = ''): String;
  end;


implementation

{ TSMPromotionClient }

function TSMPromotionClient.getList(par:String;  const ARequestFilter: string): String;
begin
  Result := execCommand('TSMPromotion.getList',par,ARequestFilter);
end;

function TSMPromotionClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMPromotion.save',par,ARequestFilter);
end;

function TSMPromotionClient.getByKey(par:String;  const ARequestFilter: string): String;
begin
  Result := execCommand('TSMPromotion.getByKey',par,ARequestFilter);
end;

function TSMPromotionClient.delete(par:String;  const ARequestFilter: string): String;
begin
  Result := execCommand('TSMPromotion.delete',par,ARequestFilter);
end;

function TSMPromotionClient.getSyncronize(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMPromotion.getSyncronize',par,ARequestFilter);
end;

end.
