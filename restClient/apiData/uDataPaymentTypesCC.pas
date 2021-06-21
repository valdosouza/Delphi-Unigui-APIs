unit uDataPaymentTypesCC;

interface

uses  uDataCC;

type

  TSMPaymentTypesClient = class(TDataCC)
  private
  public
    function getList(par:String; const ARequestFilter: string = ''): String;
    function save(par:String; const ARequestFilter: string = ''): String;
    function delete(par:String; const ARequestFilter: string = ''): String;
    function getSyncronize(par:String; const ARequestFilter: string = ''): String;
  end;

implementation

function TSMPaymentTypesClient.getList(par:String; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMPaymentTypes.getList',par,ARequestFilter);
end;

function TSMPaymentTypesClient.save(par:String; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMPaymentTypes.save',par,ARequestFilter);
end;

function TSMPaymentTypesClient.delete(par:String; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMPaymentTypes.delete',par,ARequestFilter);
end;


function TSMPaymentTypesClient.getSyncronize(par:String; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMPaymentTypes.getSyncronize',par,ARequestFilter);
end;

end.
