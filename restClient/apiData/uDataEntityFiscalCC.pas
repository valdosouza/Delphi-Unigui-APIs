unit uDataEntityFiscalCC;

interface

uses  uDataCC;
type

  TSMEntityFiscalClient = class(TDataCC)
  private

  public
    function getByKey(par:String; const ARequestFilter: string = ''): String;
  end;


implementation

function TSMEntityFiscalClient.getByKey(par:String;const ARequestFilter: string): String;
begin
  Result := execCommand('TSMEntityFiscal.getByKey',par,ARequestFilter);
end;


end.
