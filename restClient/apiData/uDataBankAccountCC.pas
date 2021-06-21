unit uDataBankAccountCC;

interface

uses  uDataCC;
type

  TSMBankAccountClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
  end;

implementation


function TSMBankAccountClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMBankAccount.save',par,ARequestFilter);
end;
end.
