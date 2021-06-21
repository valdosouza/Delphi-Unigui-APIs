unit UnFunctions;

interface

Uses System.SysUtils, System.Classes, System.Math,ACBrValidador, Data.DBXJSONReflect,
  System.Contnrs, Datasnap.Provider, System.JSON, System.RegularExpressions,
  System.DateUtils,ControllerCrashlytics, Vcl.Forms;

  function StrTran(Entra: string ; Search: string ; Replace : string): string;
  function StrZero(Num : Real ; Zeros,Deci: integer): string;
  function JsonMinify(const S: string): string;
  Function ConverteData(Data:TDateTime) : String;
  procedure GeralogCrashlytics(Origem,msg:String);
  function RemoveCaracterInformado(Str: String; Caracteres: Array of String): String;
  procedure GeralogFile(Origem,msg:String);
implementation

{-----------------------------
 Função : StrTran
 Descrição : Procura pelas ocorrencias de um caracter numa
             string e troca por outro valor.
 OBS : Esta função ainda não é totalmente com o Clipper.
       É necessário acrescentar dois parametros para a
       compatibilidade total.
------------------------------}
function StrTran(Entra: string ; Search: string ; Replace : string): string;
var
   tamanho,
   Count : Integer;
   StrTemp,
   Sai : string;
begin
  If Pos(Search,Entra) = 0 Then
  Begin
    Result := Entra;
    Exit;
  End;
  tamanho := length(Search);
  Sai := '';
  for count := 1 to length(Entra) do
  begin
      StrTemp := StrTemp + Entra[count];

      if length (StrTemp) = tamanho then
      begin
          if AnsiCompareText (StrTemp,Search) = 0 then
          begin
              if Replace <> '' then
              begin
                  Sai := Sai + Replace;
              end;
              StrTemp := '';
         end
         else
         begin
            Sai := Sai + StrTemp[1];
            Strtemp := copy (StrTemp,2,tamanho - 1);
         end;
      end;
  end;
  Sai := Sai + StrTemp;

  Result := Sai;
end;

{-------------------------------------------------------------------
 Função : StrZero
 Descrição : Acresenta zeros na frente de um numero
 -------------------------------------------------------------------}
function StrZero(Num : Real ; Zeros,Deci: integer): string;
var tam,z : integer;
    res,zer : string;
    lc_negativo : boolean;
begin
   //verifica se o numero é negativo
   Lc_Negativo := False;
   if Num < 0 then
   begin
      Lc_Negativo := True;
      Num := Num * -1;
   end;
   Str(Num:Zeros:Deci, res);
   res := trim(res);
   tam := Length(res);
   zer := '';
   for z := 1 to (Zeros-tam) do
   begin
      //se for numero negativo coloca sinha negativo
      If (Lc_Negativo) and (z = (Zeros-tam)) then
         zer := '-' + zer
      else
         zer := zer + '0';
   end;
   Result := zer+res;
   If Deci <> 0 then
      Result := StrTran(Result,'.',',');
end;
{Fim de StrZero}

function JsonMinify(const S: string): string;
Var
  SL : TStringStream;
begin
  SL := TStringStream.Create;
  Result := StringReplace(S,'\','',[rfReplaceAll]);
  Result := Copy(Result,2,Length(Result)-2);
  SL.WriteString(Result);
  REsult := SL.DataString;
  FreeAndNil(SL);
end;

Function ConverteData(Data:TDateTime) : String;
begin
  Result := concat(IntToStr(YearOf(Data)) , '-' ,
                   StrZero(MonthOf(Data),2,0) , '-',
                   StrZero(DayOf(data),2,0), ' ',
                   TimeToStr(Data)
            );
end;

procedure GeralogCrashlytics(Origem,msg:String);
Var
  LcCrash : TControllerCrashlytics;
  LcJson : String;
begin
 Try
    LcCrash := TControllerCrashlytics.Create(nil);
    LcCrash.Registro.Estabelecimento := 0;
    LcCrash.Registro.Usuario         := 0;
    LcCrash.Registro.Origem          := origem;
    LcCrash.Registro.Mensagem        := msg;
    LcCrash.Registro.RegistroCriado  := Now;
    LcCrash.Registro.RegistroAlterado  := Now;
    LcCrash.insert;
  Finally
    LcCrash.DisposeOf;
  End;
end;

function RemoveCaracterInformado(Str: String; Caracteres: Array of String): String;
var
  I: Integer;
begin
  Result := Str;
  for I := 0 to High(Caracteres) do
  begin
    while Pos(Caracteres[I], Result) > 0 do
      Delete(Result, Pos(Caracteres[I], Result), 1);
  end;
end;


procedure GeralogFile(Origem,msg:String);
var
  Lc_File: TextFile;
  Lc_PathFileName : String;
  Lc_DateTime : String;
begin
  Try
    Lc_PathFileName := ExtractFilePath(Application.ExeName) + 'log_api_auth.txt';
    AssignFile(Lc_File, Lc_PathFileName);
    if FileExists(Lc_PathFileName) then
      Append(Lc_File)
    else
      Rewrite(Lc_File);
    Lc_DateTime := DateTimeToStr(Now);
    Writeln(Lc_File, concat(Lc_DateTime , ' - ' , Origem , ' - ' , msg));
    Flush(Lc_File);  { ensures that the text was actusally written to file }
                    { insert code here that would require a Flush before closing the file }
  Finally
    CloseFile(Lc_File);
  End;
end;

end.
