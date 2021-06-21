unit UnFunctions;

interface

Uses System.SysUtils, System.Classes, System.Math, ACBrValidador,System.DateUtils,
      synacode,ControllerCrashlytics, zLib, Vcl.Forms;

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
  function  ValidDocFiscal(doc:String):String;
  function  ValidInscEstadual(Numero,Estado:String): String;
  Function ValidCep(cep:String):String;
  function ValidPhone(Numero : String): String;
  function ValidNCM(Numero : String): String;
  function ValidCEST(Numero : String): String;
  function ValidBarCode(Numero : String): String;
  function getDecimalPoint(numero:String):Integer;
//  Function ConverteData(Data:TDateTime) : String;
  procedure GeralogCrashlytics(Origem,msg:String);
  procedure Geraloglocal(Origem,msg:String);
  procedure GeralogFile(Origem,msg:String);
  function ZCompressString(aText: string; aCompressionLevel: TZCompressionLevel): string;
  function ZDecompressString(aText: string): string;

const
  EOLN  = #13;

implementation

uses unMessages;


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

function  ValidDocFiscal(doc:String):String;
Var
  Lc_Doc : String;
Begin
  Result := 'OK';
  Lc_Doc := TRIM(unMaskField(Doc));
  if ( Length(Lc_Doc) = 11 ) then
  begin
    if not (CalculoCpf(Lc_Doc)) then
    begin
      Result := 'Número de C.P.F. Inválido.';
      exit;
    end;
  end
  else
  begin
    if not (CalculoCnpj(Lc_Doc)) then
    begin
      Result := 'Número de C.N.P.J. Inválido.';
      exit;
    end;
  end;
End;

function  ValidInscEstadual(Numero,Estado:String): String;
Var
  Lc_Val_Insc_Est:TACBrValidador;
Begin
  Result := 'OK';
  if (UpperCase(Numero) = 'ISENTO') OR (UpperCase(Numero) = 'ISENTA')  then
  BEgin
    Result := 'Informação de Isento(a) não deve ser colocado no campo de Inscrição.'+EOLN+
              'Verifique campo Indicador da Inscrição Estadual do Destinatário';
    exit;
  end;

  if (Trim(Numero) = '') then
  Begin
    Result := 'Inscrição deve ser preenchida.';
    exit;
  end;

  if (Trim(Numero) <> '') then
  Begin
    Lc_Val_Insc_Est := TACBrValidador.Create(nil);
    Lc_Val_Insc_Est.TipoDocto := docInscEst;
    Lc_Val_Insc_Est.IgnorarChar := './-';
    Lc_Val_Insc_Est.Documento := Numero;
    Lc_Val_Insc_Est.Complemento := upperCase(Estado);
    if not Lc_Val_Insc_Est.Validar then
    Begin
      Result := 'Inscrição Estadual é inválida.';
    end;
    Lc_Val_Insc_Est.DisposeOf;
  end;
end;

Function ValidCep(cep:String):String;
BEGIN
  Result := 'OK';
  cep := RemoveCaracterInformado(cep, ['.','.','-']);
  if (cep= '') or (Length(cep) < 8) OR (cep= '00000000')  then
  begin
    Result := ' Endereço com CEP incompleto.';
  end;
END;

function ValidPhone(Numero : String): String;
begin
  Result:= 'OK';
  Numero := RemoveCaracterInformado(Numero, ['.',',','/','-','(',')']);
  if(trim(Numero) <> '') and (Length(trim(Numero)) < 10) then

    Result := 'Número Telefone inválido';
end;

function ValidNCM(Numero : String): String;
begin
  Result:= 'OK';
  Numero := RemoveCaracterInformado(Numero, ['.',',','/','-','(',')']);
  if (Numero = '') or (Length(Numero)<>8) or (Numero = '00000000') then

    Result := 'Número NCM inválido';
end;

function ValidCEST(Numero : String): String;
begin
  Result:= 'OK';
  Numero := RemoveCaracterInformado(Numero, ['.',',','/','-','(',')']);
  if (Numero = '') or (Length(Numero)<>7) or (Numero = '0000000') then

    Result := 'Número CEST inválido';
end;

function ValidBarCode(Numero : String): String;
Var
  ValidaEANGTIN  : TACBrValidador;
begin
  Result:= 'OK';
  if trim(Numero) <> '' then
  Begin
  //Valida o codigo de barras calculado
  ValidaEANGTIN  := TACBrValidador.Create(nil);
  ValidaEANGTIN.TipoDocto := docGTIN;
  ValidaEANGTIN.Documento := TRIM(Numero);
  if not ValidaEANGTIN.Validar then
    Result := 'O código EAN/GTIN está incorreto.';
  End;
end;


function getDecimalPoint(numero:String):Integer;
Var
  Lc_I : Integer;
  Lc_Contar : Boolean;
  Lc_numero : String;
  Lc_Casa : String;
Begin
  Lc_Contar := False;
  For Lc_I := 1 to Length(numero) do
  Begin
    if (numero[Lc_I] =',') or (numero[Lc_I] ='.') then Lc_Contar := True;
    if Lc_Contar and ((numero[Lc_I] <>',') and (numero[Lc_I] <>'.')) then Lc_numero := Lc_numero + numero[Lc_I];
  end;
  Lc_Contar := False;
  For Lc_I := Length(Lc_numero) downto 1 do
  Begin
    if (lc_numero[Lc_I] = '0')and not Lc_Contar then
    Begin
      Lc_Contar := false;
    end
    else
    Begin
      Lc_Contar := true;
      Lc_Casa := lc_numero[Lc_I] + Lc_Casa;
    end;
  end;
  Result := Length(Lc_Casa);
end;

{
Function ConverteData(Data:TDateTime) : String;
begin
  try
    Result := concat(IntToStr(YearOf(Data)) , '-' ,
                     StrZero(MonthOf(Data),2,0) , '-',
                     StrZero(DayOf(data),2,0), ' ',
                     TimeToStr(Data)
              );
  Except
    Result := '1900-01-01 01:00:00'
  end;
end;
}
procedure GeralogCrashlytics(Origem,msg:String);
Var
  LcCrash : TControllerCrashlytics;
  LcJson : String;
begin
  Try
    Try
      LcCrash := TControllerCrashlytics.Create(nil);
      LcCrash.Registro.Estabelecimento := 0;
      LcCrash.Registro.Usuario         := 0;
      LcCrash.Registro.Origem          := origem;
      LcCrash.Registro.Mensagem        := msg;
      LcCrash.Registro.RegistroCriado  := Now;
      LcCrash.Registro.RegistroAlterado  := Now;
      LcCrash.insert;
    except
      on E: exception do
        Geraloglocal(Origem,msg);
    End;
  Finally
    LcCrash.DisposeOf;
  End;
end;
procedure Geraloglocal(Origem,msg:String);
var
  Lc_File: TextFile;
  Lc_PathFileName : String;
  Lc_DateTime : String;
begin
  Try
    Lc_PathFileName := concat(ExtractFilePath(ParamStr(0))) + '\log_api_data.txt';
    AssignFile(Lc_File, Lc_PathFileName);
    if FileExists(Lc_PathFileName) then
      Append(Lc_File)
    else
      Rewrite(Lc_File);
    Lc_DateTime := DateTimeToStr(Now);
    Writeln(Lc_File, concat(Lc_DateTime , ' - ' , Origem , ' - ' , msg));
    Flush(Lc_File);
  Finally
    CloseFile(Lc_File);
  End;

End;

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

function ZCompressString(aText: string; aCompressionLevel: TZCompressionLevel): string;
var
  strInput,
  strOutput: TStringStream;
  Zipper: TZCompressionStream;
begin
  REsult := aText;
  exit;

  Result:= '';
  strInput:= TStringStream.Create(aText);
  strOutput:= TStringStream.Create;
  try
    Zipper:= TZCompressionStream.Create(strOutput);
    try
      Zipper.CopyFrom(strInput, strInput.Size);
    finally
      Zipper.Free;
    end;
    Result:= strOutput.DataString;
    Result := EncodeBase64 ( Result );
  finally
    strInput.Free;
    strOutput.Free;
  end;
end;

function ZDecompressString(aText: string): string;
var
  strInput,
  strOutput: TStringStream;
  Unzipper: TZDecompressionStream;
begin
  REsult := aText;
  exit;

  Result:= '';
  aText := DecodeBase64( aText );
  strInput:= TStringStream.Create(aText);
  strOutput:= TStringStream.Create;
  try
    Unzipper:= TZDecompressionStream.Create(strInput);
    try
      strOutput.CopyFrom(Unzipper, Unzipper.Size);
    finally
      Unzipper.Free;
    end;
    Result:= strOutput.DataString;
  finally
    strInput.Free;
    strOutput.Free;
  end;
end;

end.
