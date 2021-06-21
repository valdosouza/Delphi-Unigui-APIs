unit uDataRestMenuHasIngredientCC;

interface

uses  uDataCC;

type
  TSMRestMenuHasIngredientClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
  end;

implementation


function TSMRestMenuHasIngredientClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMRestMenuHasIngredient.save',par,ARequestFilter);
end;



end.

