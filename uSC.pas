unit uSC;

interface

uses FireDAC.Comp.Client;


function getConnection(): TFDConnection;

implementation

uses UnFunctions, MainModule;

function getConnection: TFDConnection;
begin
  Result := UMM.DB;
end;

end.
