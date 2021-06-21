unit uDataMedMaterialCC;

interface

uses  uDataCC;

type
  TSMMedMaterialClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
  end;

  implementation

{ TSMMedMaterialClient }

function TSMMedMaterialClient.save(par: string;
  const ARequestFilter: string): String;
begin
  Result := execCommand('TSMMedMaterial.save',par,ARequestFilter);
end;

end.
