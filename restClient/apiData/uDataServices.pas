unit uDataServices;

interface

uses  uDataCC;

type

  TSMServicesClient = class(TDataCC)
  private

  public
    function getZipCode(par: string; const ARequestFilter: string = ''): String;
    function setCrashlytics(par: string; const ARequestFilter: string = ''): String;
    function CNPJUpdateCaptcha(const ARequestFilter: string = ''): String;
    function setImagemFile(par: string; const ARequestFilter: string = ''): String;
    function setXMLFile(par: string; const ARequestFilter: string = ''): String;
  end;



implementation

function TSMServicesClient.getZipCode(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMServices.getZipCode',par,ARequestFilter);
end;

function TSMServicesClient.setCrashlytics(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMServices.setCrashlytics',par,ARequestFilter);
end;


function TSMServicesClient.CNPJUpdateCaptcha(const ARequestFilter: string): String;
begin
  Result := execCommand('TSMServices.CNPJUpdateCaptcha','',ARequestFilter);
end;


function TSMServicesClient.setImagemFile(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMServices.setImagemFile',par,ARequestFilter);
end;

function TSMServicesClient.setXMLFile(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMServices.setXMLFile',par,ARequestFilter);
end;


end.
