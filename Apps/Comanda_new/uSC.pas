unit uSC;

interface

uses
  FireDAC.Comp.Client, MainModule;

function getConnection(): TFDConnection;

implementation


function getConnection: TFDConnection;
begin
  Result := umm.DB;
end;

end.
