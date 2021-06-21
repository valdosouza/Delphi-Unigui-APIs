unit UnFunctions;

interface

uses
  System.SysUtils, System.JSON;

  function getPathExe:String;
  function getCamposJsonString(json,value:String): String;
  procedure Pc_LogTarefasDelphi(pc_Texto:String);

implementation

uses
  FMX.Forms;

function getPathExe:String;
Var
  LcTam : Integer;
  LcAux : String;
begin
  {$IFDEF ANDROID}// if the operative system is Android
    Result := GetHomePath;
  {$ENDIF ANDROID}
  {$IFDEF WIN32}
    REsult  :=  ExtractFilePath(ParamStr(0));
    LcTam := Length(Result);
    LcAux := Copy(REsult,LcTam,1);
    if (LcAux <> '\') then
      REsult := concat(REsult,'\');
  {$ENDIF WIN32}
End;

function getCamposJsonString(json,value:String): String;
var
   LJSONObject: TJSONObject;
   function TrataObjeto(jObj:TJSONObject):string;
   var i:integer;
       jPar: TJSONPair;
   begin
        result := '';
        for i := 0 to jObj.Size - 1 do
        begin
             jPar := jObj.Get(i);
             if jPar.JsonValue Is TJSONObject then
                result := TrataObjeto((jPar.JsonValue As TJSONObject)) else
             if sametext(trim(jPar.JsonString.Value),value) then
             begin
                  Result := jPar.JsonValue.Value;
                  break;
             end;
             if result <> '' then
                break;
        end;
   end;
begin
   try
      LJSONObject := nil;
      LJSONObject := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(json),0) as TJSONObject;
      result := TrataObjeto(LJSONObject);
   finally
      LJSONObject.Free;
   end;
end;

procedure Pc_LogTarefasDelphi(pc_Texto:String);
var
  Lc_File: TextFile;
  Lc_PathFileName : String;
  Lc_DateTime : String;
begin
  Try
    Lc_PathFileName := getPathExe + 'logtarefas.txt';
    AssignFile(Lc_File, Lc_PathFileName);
    if FileExists(Lc_PathFileName) then
      Append(Lc_File)
    else
      Rewrite(Lc_File);
    Lc_DateTime := DateTimeToStr(Now);
    Writeln(Lc_File, Lc_DateTime + ' - ' + pc_Texto);
    Flush(Lc_File);  { ensures that the text was actually written to file }
                    { insert code here that would require a Flush before closing the file }
  Finally
    CloseFile(Lc_File);
  End;
end;

end.
