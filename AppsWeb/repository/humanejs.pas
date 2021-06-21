unit humanejs;

interface

type
  humane = class
  public
    class procedure log(str: string);
    class procedure info(str: string);
    class procedure error(str: string);
    class procedure success(str: string);
    class procedure timeout(milliseconds: integer);
    class procedure waitForMove(value: boolean);
    class procedure clickToClose(value: boolean);
  end;

implementation

uses
  SysUtils, UniGUIApplication;

//=========================================================================
function HTMLEncode(const Data: string): string;
var
  iPos, i: Integer;

  procedure Encode(const AStr: String);
  begin
    Move(AStr[1], result[iPos], Length(AStr) * SizeOf(Char));
    Inc(iPos, Length(AStr));
  end;

begin
  SetLength(result, Length(Data) * 6);
  iPos := 1;
  for i := 1 to length(Data) do
    case Data[i] of
      //'<': Encode('&lt;');
      //'>': Encode('&gt;');
      //'&': Encode('&amp;');
      '"': Encode('&quot;');
    else
      result[iPos] := Data[i];
      Inc(iPos);
    end;
  SetLength(result, iPos - 1);
end;

//=========================================================================
function BoolToStr(const value : boolean) : string;
begin
   if value then Result := 'true' else Result := 'false';
end;

//=========================================================================
class procedure humane.log(str: string);
begin
  UniSession.AddJS('humane.log("' + HTMLEncode(str) + '");');
end;

//=========================================================================
class procedure humane.info(str: string);
begin
  UniSession.AddJS('humane.info("' + HTMLEncode(str) + '");');
end;

//=========================================================================
class procedure humane.error(str: string);
begin
  UniSession.AddJS('humane.error("' + HTMLEncode(str) + '");');
end;

//=========================================================================
class procedure humane.success(str: string);
begin
  UniSession.AddJS('humane.success("' + HTMLEncode(str) + '");');
end;

//=========================================================================
class procedure humane.timeout(milliseconds: integer);
begin
  UniSession.AddJS('humane.timeout=' + IntToStr(milliseconds) + ';');
end;

//=========================================================================
class procedure humane.waitForMove(value: boolean);
begin
  UniSession.AddJS('humane.waitForMove=' + BoolToStr(value) + ';');
end;

//=========================================================================
class procedure humane.clickToClose(value: boolean);
begin
  UniSession.AddJS('humane.clickToClose=' + BoolToStr(value) + ';');
end;

end.
