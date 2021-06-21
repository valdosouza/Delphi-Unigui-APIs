unit uDataRestSubgroupCC;

interface

uses  uDataCC;

type
  TSMRestSubgroupClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
  end;

implementation


function TSMRestSubgroupClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMRestSubgroup.save',par,ARequestFilter);
end;



end.
