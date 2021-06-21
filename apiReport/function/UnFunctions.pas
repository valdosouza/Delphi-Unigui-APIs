unit UnFunctions;

interface

Uses System.SysUtils, System.Classes, System.Math, QRCtrls,QuickRpt,
  System.DateUtils, Vcl.Forms, ControllerCrashlytics;

type
  TMsgPadrao = (mpAlerta, mpErro, mpConfirmacao, mpInformacao);
  TMsgEscape = (bEscape,bNormal);


  function LocalizaComponente(Fc_Parent : TComponent; Pc_Alvo:TClass):TComponent;
  function RemoveCaracterInformado(Str: String; Caracteres: Array of String): String;
  function CalculoCpf(xCPF: string): Boolean;
  function CalculoCnpj(xCGC: string): Boolean;
  Function unMaskField(Text:String):String;
  function MaskFone(comp : String):String;
  Function MaskDocFiscal(comp : String):String;
  Function MaskCep(comp : String):String;
  function StrZero(Num : Real ; Zeros,Deci: integer): string;
  function StrTran(Entra: string ; Search: string ; Replace : string): string;
  function ArredondarParaBaixo(Fc_Valor:Real;Fc_Casas:Integer;Fc_Forcar:Boolean):Real;
  function  Fc_LocalizaComponente(Fc_Parent : TComponent; Pc_Alvo:TClass):TComponent;
  function  Fc_LocalizaComponentePorNome(Fc_Parent : TComponent; Pc_Alvo:TClass;Pc_Nome:String;Pc_tamanho:Integer):TComponent;
  function DiaDaSemana(Data:TDateTime): String;
  Function ConverteData(Data:TDate) : String;
  function NumeroMes (Data : TDateTime) : Integer;
  function NumeroAno(Data : TDateTime;completo:Boolean) : Integer;
  function DescricaoMes(lcN_nummes : integer; Lc_Upper : Boolean) : string;
  function UltDiaDoMes(Data: TDateTime): Word;
  procedure LogTarefasDelphi(pc_Texto:String);
  function getPathExe:String;
  procedure GeralogCrashlytics(Origem,msg:String);
  procedure GeralogFile(Origem,msg:String);
const
  EOLN  = #13;

implementation

uses unMessages;


function DiaDaSemana(Data:TDateTime): String;
{Para exibir uma data por extenso no Delphi, coloque a seguinte rotina}
var
  NoDia : Integer;
  Now: TdateTime;
  DiaDaSemana : array [1..7] of String;
begin
  { Dias da Semana }
  DiaDasemana [1]:= 'Domingo';
  DiaDasemana [2]:= 'Segunda';
  DiaDasemana [3]:= 'Terça';
  DiaDasemana [4]:= 'Quarta';
  DiaDasemana [5]:= 'Quinta';
  DiaDasemana [6]:= 'Sexta';
  DiaDasemana [7]:= 'Sábado';
  NoDia := DayOfWeek (Data);
  Result := DiaDaSemana [NoDia];
end;
Function ConverteData(Data:TDate) : String;
begin
  Result := concat(IntToStr(YearOf(Data)) , '/' , IntToStr(MonthOf(Data)) , '/' + IntToStr(DayOf(data)));
end;

function NumeroMes (Data : TDateTime) : Integer;
begin
   Result := StrToIntDef(Copy(DateToStr(Data),4,2),1);
end;

function NumeroAno(Data : TDateTime;completo:Boolean) : Integer;
begin
  //31/12/2017
  if completo then
    Result := StrToIntDef(Copy(DateToStr(Data),7,4),1)
  else
   Result := StrToIntDef(Copy(DateToStr(Data),9,4),1);
end;

function DescricaoMes(lcN_nummes : integer; Lc_Upper : Boolean) : string;
var
    lcA_Mes : array [1..12] of string;
begin
   lcA_Mes[01] := 'Janeiro';
   lcA_Mes[02] := 'Fevereiro';
   lcA_Mes[03] := 'Março';
   lcA_Mes[04] := 'Abril';
   lcA_Mes[05] := 'Maio';
   lcA_Mes[06] := 'Junho';
   lcA_Mes[07] := 'Julho';
   lcA_Mes[08] := 'Agosto';
   lcA_Mes[09] := 'Setembro';
   lcA_Mes[10] := 'Outubro';
   lcA_Mes[11] := 'Novembro';
   lcA_Mes[12] := 'Dezembro';
   if (lcN_nummes = 0) or (lcN_nummes > 12) then
   begin
      DescricaoMes := '______________';
   end
   else
   begin
      //que que volte com a primeira letra maiuscula
      if Lc_Upper then
         DescricaoMes := Copy(UpperCase(lcA_Mes[lcN_nummes]),1,1)+Copy(lcA_Mes[lcN_nummes],2,Length(lcA_Mes[lcN_nummes])-1)
      else
         DescricaoMes := lcA_Mes[lcN_nummes];
   end;

end;

function UltDiaDoMes(Data: TDateTime): Word;
// Retorna o Ultimo dia do mes de uma determinada
// data
var
  d,m,a: Word;
  dt: TDateTime;
begin
  DecodeDate(Data, a,m,d);
  Inc(m);
  if m = 13 then
  begin
    m := 1;
  end;
  dt := EncodeDate(a,m,1);
  dt := dt - 1;
  DecodeDate(dt, a,m,d);
  Result := d;
end;


function  LocalizaComponente(Fc_Parent : TComponent; Pc_Alvo:TClass):TComponent;
Var
  Lc_I : Integer;
Begin
  Result := Nil;
  for Lc_I := 0 to Fc_Parent.ComponentCount - 1 do
  begin
    if (Fc_Parent.Components[Lc_I].ClassType = Pc_Alvo) then
    begin
      Result := Fc_Parent.Components[Lc_I];
      Break;
    end
    else
    begin
      continue;
    end;
  end;
end;


function RemoveCaracterInformado(Str: String; Caracteres: Array of String): String;
var
  I: Integer;
begin
  Result := Str;
  for I := 0 to High(Caracteres) do
  begin
    Result := StringReplace(Result, Caracteres[I], '', [rfReplaceAll,rfIgnoreCase]);
//    while Pos(Caracteres[I], Result) > 0 do
//      Delete(Result, Pos(Caracteres[I], Result), 1);
  end;
end;

function CalculoCpf(xCPF: string): Boolean;
{Testa se o CPF é válido ou não}
var
   d1, d4, xx, nCount, resto, digito1, digito2: Integer;
   Check: string;
begin
  if (xCPF = '11111111111') or (xCPF = '22222222222') or (xCPF = '33333333333') or (xCPF = '44444444444') or
     (xCPF = '55555555555') or (xCPF = '66666666666') or (xCPF = '77777777777') or (xCPF = '88888888888') or
     (xCPF = '99999999999') OR  (TRIM(xCPF) = '')or (xCPF = '00000000000000') then
  begin
    Result := False;
    Exit;
  end;

  if (xCPF = '00000000000') then
  begin
    Result := False;
    Exit;
  end;

  d1 := 0; d4 := 0; xx := 1;
  for nCount := 1 to Length(xCPF) - 2 do
  begin
    if Pos(Copy(xCPF, nCount, 1), '/-.') = 0 then
    begin
         d1 := d1 + (11 - xx) * StrToInt(Copy(xCPF, nCount, 1));
         d4 := d4 + (12 - xx) * StrToInt(Copy(xCPF, nCount, 1));
         xx := xx + 1;
    end;
  end;
  resto := (d1 mod 11);

  if resto < 2 then
  begin
    digito1 := 0;
  end
  else
  begin
    digito1 := 11 - resto;
  end;
  d4 := d4 + 2 * digito1;
  resto := (d4 mod 11);
  if resto < 2 then
  begin
    digito2 := 0;
  end
  else
  begin
    digito2 := 11 - resto;
  end;
  Check := IntToStr(Digito1) + IntToStr(Digito2);
  if Check <> copy(xCPF, succ(length(xCPF) - 2), 2) then
  begin
    Result := False;
  end
  else
  begin
    Result := True;
  end;
end;

function CalculoCnpj(xCGC: string): Boolean;
{Testa se o CGC é válido ou não}
var
   d1, d4, xx, nCount, fator, resto, digito1, digito2: Integer;
   Check: string;
begin
  if (xCGC = '11111111111111') or (xCGC = '22222222222222') or (xCGC = '33333333333333') or (xCGC = '44444444444444') or
     (xCGC = '55555555555555') or (xCGC = '66666666666666') or (xCGC = '77777777777777') or (xCGC = '88888888888888') or
     (xCGC = '99999999999999') OR  (TRIM(xCGC) = '') or (xCGC = '00000000000000')then
  begin
    Result := False;
    Exit;
  end;

  d1 := 0;
  d4 := 0;
  xx := 1;
  for nCount := 1 to Length(xCGC) - 2 do
  begin
    if Pos(Copy(xCGC, nCount, 1), '/-.') = 0 then
    begin
      if xx < 5 then
      begin
        fator := 6 - xx;
      end
      else
      begin
        fator := 14 - xx;
      end;
      d1 := d1 + StrToInt(Copy(xCGC, nCount, 1)) * fator;
      if xx < 6 then
      begin
        fator := 7 - xx;
      end
      else
      begin
        fator := 15 - xx;
      end;
       d4 := d4 + StrToInt(Copy(xCGC, nCount, 1)) * fator;
       xx := xx + 1;
    end;
  end;
  resto := (d1 mod 11);
  if resto < 2 then
  begin
    digito1 := 0;
  end
  else
  begin
    digito1 := 11 - resto;
  end;
  d4 := d4 + 2 * digito1;
  resto := (d4 mod 11);
  if resto < 2 then
  begin
    digito2 := 0;
  end
  else
  begin
    digito2 := 11 - resto;
  end;
  Check := IntToStr(Digito1) + IntToStr(Digito2);
  if Check <> copy(xCGC, succ(length(xCGC) - 2), 2) then
  begin
    Result := False;
  end
  else
  begin
    Result := True;
  end;
end;

Function unMaskField(Text:String):String;
Begin
  Result := Text;
  Result := stringReplace(Result, '-', '', []);
  Result := stringReplace(Result, '-', '', []);
  Result := stringReplace(Result, '(', '', []);
  Result := stringReplace(Result, ')', '', []);
  Result := stringReplace(Result, '.', '', []);
  Result := stringReplace(Result, '.', '', []);
  Result := stringReplace(Result, '/', '', []);
  Result := stringReplace(Result, '-', '', []);
  Result := stringReplace(Result, ' ', '', []);
End;


function  MaskFone(comp : String):String;
var
  Lc_Text: string;
begin
  Lc_Text := comp;
  Lc_Text := unMaskField(Lc_Text);
  if (Copy(Lc_Text,1,4) = '0800')OR (Copy(Lc_Text,1,4) = '0300') then
  Begin//0800-41-1910
    case Length(Lc_Text) of
      5..6: REsult := concat( Copy(Lc_Text,1,4),'-',Copy(Lc_Text,5,2));
      7..10:REsult := concat( Copy(Lc_Text,1,4),'-',Copy(Lc_Text,5,2),'-' + Copy(Lc_Text,7,4));
      11:   REsult := concat( Copy(Lc_Text,1,4),'-',Copy(Lc_Text,5,3),'-' + Copy(Lc_Text,8,4));
    else
      REsult :=  Lc_Text;
    end;
  end
  else
  Begin
    case Length(Lc_Text) of
      5..8:   Begin
                case Length(Lc_Text) of
                  5:Result := concat( Copy(Lc_Text,1,4), '-' , Copy(Lc_Text,5,1));
                  6:Result := concat( Copy(Lc_Text,1,4), '-' , Copy(Lc_Text,5,2));
                  7:Result := concat( Copy(Lc_Text,1,4), '-' , Copy(Lc_Text,5,3));
                  8:Result := concat( Copy(Lc_Text,1,4), '-' , Copy(Lc_Text,5,4));
                end;
              end;
      9:      Begin
                Result := concat( Copy(Lc_Text,1,5), '-' , Copy(Lc_Text,6,4) );
              end;
      10..11: Begin
                case Length(Lc_Text) of
                  10:Result := concat( '(' , Copy(Lc_Text,1,2) , ') ' , Copy(Lc_Text,3,4) , '-' , Copy(Lc_Text,7,4) );
                  11:Result := concat( '(' , Copy(Lc_Text,1,2) , ') ' , Copy(Lc_Text,3,5) , '-' + Copy(Lc_Text,8,4) );
                end;
             end;
    end;
  end;
end;

function  MaskDocFiscal(comp : String):String;
var
  Lc_Text: string;
Begin
  Lc_Text := comp;
  Lc_Text := unMaskField(Lc_Text);
  if ( Length(Lc_Text) > 0 ) then
  Begin

    if Length(Lc_Text) = 11 then //01731131925
    Begin
      case Length(Lc_Text) of
        4:      Result := concat( Copy(Lc_Text,1,3) , '.' , Copy(Lc_Text,4,1) );
        7:      Result := concat( Copy(Lc_Text,1,3) , '.' , Copy(Lc_Text,4,3) , '.' , Copy(Lc_Text,7,1) );
        11:     Result := concat( Copy(Lc_Text,1,3) , '.' , Copy(Lc_Text,4,3) , '.' , Copy(Lc_Text,7,3) , '-' , Copy(Lc_Text,10,2) );
        12..14 :Result := concat( Copy(Lc_Text,1,3) , '.' , Copy(Lc_Text,4,3) , '.' , Copy(Lc_Text,7,3) , '-' , Copy(Lc_Text,10,2) );
      end;
    End
    else
    Begin
      case Length(Lc_Text) of
        3: Result := concat( Copy(Lc_Text,1,2) , '.' , Copy(Lc_Text,3,1) );
        6: Result := concat( Copy(Lc_Text,1,2) , '.' , Copy(Lc_Text,3,3) , '.' , Copy(Lc_Text,6,1) );
        9: Result := concat( Copy(Lc_Text,1,2) , '.' , Copy(Lc_Text,3,3) , '.' , Copy(Lc_Text,6,3) , '/' , Copy(Lc_Text,9,4) );
        14:Result := concat( Copy(Lc_Text,1,2) , '.' , Copy(Lc_Text,3,3) , '.' , Copy(Lc_Text,6,3) , '/' , Copy(Lc_Text,9,4)+ '-' ,  Copy(Lc_Text,13,2) );
      end;
    End;
  End;
End;

function  Maskcep(comp : String):String;
Begin
  REsult := Concat( Copy(comp,1,2),'.',
                    Copy(comp,3,3),'-',
                    Copy(comp,6,3)
            );
End;

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

function ArredondarParaBaixo(Fc_Valor:Real;Fc_Casas:Integer;Fc_Forcar:Boolean):Real;
Var
  Lc_strAux : String;
Begin
  if Fc_Forcar then
    Fc_Valor := Fc_Valor - (5 / (power(10,Fc_Casas+1)));
  Lc_strAux := FloatToStrf(Fc_Valor,ffFixed,10,Fc_Casas);
  //Retorna a string com duas casas para o valor Real
  Result := StrToFloatDef(Lc_strAux,0);
end;

function  Fc_LocalizaComponente(Fc_Parent : TComponent; Pc_Alvo:TClass):TComponent;
Var
  Lc_I : Integer;
Begin
  for Lc_I := 0 to Fc_Parent.ComponentCount - 1 do
  begin
    if (Fc_Parent.Components[Lc_I].ClassType = Pc_Alvo) then
    begin
      Result := Fc_Parent.Components[Lc_I];
      Break;
    end
    else
    begin
      continue;
    end;
  end;
end;

function  Fc_LocalizaComponentePorNome(Fc_Parent : TComponent; Pc_Alvo:TClass;Pc_Nome:String;Pc_tamanho:Integer):TComponent;
Var
  Lc_I : Integer;
Begin
  for Lc_I := 0 to Fc_Parent.ComponentCount - 1 do
    begin
    if (Fc_Parent.Components[Lc_I].ClassType = Pc_Alvo) then
      begin
      if (copy(Fc_Parent.Components[Lc_I].Name,1,Pc_tamanho) = Pc_Nome) then
        Begin
        Result := Fc_Parent.Components[Lc_I];
        Break;
        end;
      end
    else
      begin
      continue;
      end;
    end;
end;

procedure LogTarefasDelphi(pc_Texto:String);
var
  Lc_File: TextFile;
  Lc_PathFileName : String;
  Lc_DateTime : String;
begin
  Try
    Lc_PathFileName :=  concat(getPathExe,'log\apireport_exe\logtarefas.txt');
    AssignFile(Lc_File, Lc_PathFileName);
    if FileExists(Lc_PathFileName) then
      Append(Lc_File)
    else
      Rewrite(Lc_File);
    Lc_DateTime := TimeToStr(Now);
    Writeln(Lc_File, Lc_DateTime + ' - ' + pc_Texto);
    Flush(Lc_File);  { ensures that the text was actually written to file }
                    { insert code here that would require a Flush before closing the file }
  Finally
    CloseFile(Lc_File);
  End;
end;

function getPathExe:String;
Begin
  Result := ExtractFilePath(Application.ExeName) ;
End;

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

procedure GeralogFile(Origem,msg:String);
var
  Lc_File: TextFile;
  Lc_PathFileName : String;
  Lc_DateTime : String;
begin
  Try
    Lc_PathFileName := ExtractFilePath(Application.ExeName) + 'log_api_data.txt';
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
