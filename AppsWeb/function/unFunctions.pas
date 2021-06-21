unit unFunctions;

interface

Uses System.SysUtils, uniBasicGrid, uniStringGrid, System.Classes, uniEdit,
    UniLabel, System.Math,ACBrValidador, Data.DBXJSONReflect,
  System.Contnrs, Datasnap.Provider, System.JSON, tblinvoiceMerchandise,
  System.RegularExpressions,Data.DBXJSON, uniDateTimePicker, uniGUIDialogs,
  System.DateUtils, ControllerCrashlytics;
type
  TMsgPadrao = (mpAlerta, mpErro, mpConfirmacao, mpInformacao);
  TMsgEscape = (bEscape,bNormal);

  procedure LimpaStringGrid(Grid : TUniStringGrid);
  function  LocalizaComponente(Fc_Parent : TComponent; Pc_Alvo:TClass):TComponent;
  function RemoveCaracterInformado(Str: String; Caracteres: Array of String): String;
  function CalculoCpf(xCPF: string): Boolean;
  function CalculoCnpj(xCGC: string): Boolean;
  Function unMaskField(Text:String):String;
  procedure MaskPhone(comp : TUniEdit);
  procedure MaskCPF(comp : TUniEdit);
  procedure MaskCNPJ(comp : TUniEdit);
  procedure MaskCep(comp : TUniEdit);
  procedure MaskDate(Comp : TUniDateTimePicker);
  function tamStringpxl(s: TUniLabel):integer;
  function StrZero(Num : Real ; Zeros,Deci: integer): string;
  function StrTran(Entra: string ; Search: string ; Replace : string): string;
  function ArredondarParaBaixo(Fc_Valor:Real;Fc_Casas:Integer;Fc_Forcar:Boolean):Real;
  function ValidDocFiscal(doc:String):Boolean;
  function ValidInscEstadual(Numero,Estado:String): Boolean;
  function DiaDaSemana(Data:TDateTime): String;
  Function ConverteData(Data:TDate) : String;
  function JsonMinify(const S: string): string;
  function  LocalizaComponentePorNome(Fc_Parent : TComponent; Pc_Alvo:TClass;Pc_Nome:String;Pc_tamanho:Integer):TComponent;
  procedure GeralogCrashlytics(Origem,msg:String);

const
  EOLN  = #13;

implementation

uses  MainModule;


procedure LimpaStringGrid(Grid : TUniStringGrid);
Var
  Lc_I,Lc_J : Integer;
Begin
  For Lc_I := 1 to Grid.RowCount - 1 do
    For Lc_J := 0 to Grid.ColCount do
      Grid.Cells[Lc_J,Lc_I] := '';
  Grid.RowCount := 2;
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
  Result := stringReplace(Result, '-', '', [rfReplaceAll]);
  Result := stringReplace(Result, '-', '', [rfReplaceAll]);
  Result := stringReplace(Result, '(', '', [rfReplaceAll]);
  Result := stringReplace(Result, ')', '', [rfReplaceAll]);
  Result := stringReplace(Result, '.', '', [rfReplaceAll]);
  Result := stringReplace(Result, '.', '', [rfReplaceAll]);
  Result := stringReplace(Result, '/', '', [rfReplaceAll]);
  Result := stringReplace(Result, '-', '', [rfReplaceAll]);
  Result := stringReplace(Result, ' ', '', [rfReplaceAll]);
End;


procedure MaskPhone(comp : TUniEdit);
var
  Lc_Text: string;
begin
  with comp do Begin
    Lc_Text := Text;
    Lc_Text := unMaskField(Lc_Text);
    if (Copy(Lc_Text,1,4) = '0800')OR (Copy(Lc_Text,1,4) = '0300') then
    Begin
      //0800-41-1910
      MaxLength := 13;
      case Length(Lc_Text) of
        5..6:Text := Copy(Lc_Text,1,4) + '-' + Copy(Lc_Text,5,2);
        7..10:Text := Copy(Lc_Text,1,4) + '-' + Copy(Lc_Text,5,2) + '-' + Copy(Lc_Text,7,4);
        11:Text := Copy(Lc_Text,1,4) + '-' + Copy(Lc_Text,5,3) + '-' + Copy(Lc_Text,8,4);
      else
        Text := Lc_Text;
      end;
    end else Begin
        MaxLength := 15;
      case Length(Lc_Text) of
        5..8:   Begin
                  case Length(Lc_Text) of
                    5:Text := Copy(Lc_Text,1,4) + '-' + Copy(Lc_Text,5,1);
                    6:Text := Copy(Lc_Text,1,4) + '-' + Copy(Lc_Text,5,2);
                    7:Text := Copy(Lc_Text,1,4) + '-' + Copy(Lc_Text,5,3);
                    8:Text := Copy(Lc_Text,1,4) + '-' + Copy(Lc_Text,5,4);
                  end;
                end;
        9:      Begin
                  Text := Copy(Lc_Text,1,5) + '-' + Copy(Lc_Text,6,4);
                end;
        10..11: Begin
                  case Length(Lc_Text) of
                    10:Text := '(' + Copy(Lc_Text,1,2) + ') ' + Copy(Lc_Text,3,4) + '-' + Copy(Lc_Text,7,4);
                    11:Text := '(' + Copy(Lc_Text,1,2) + ') ' + Copy(Lc_Text,3,5) + '-' + Copy(Lc_Text,8,4);
                  end;
               end;
      end;
    end;
  End;
end;

procedure MaskCPF(comp : TUniEdit);
var
  Lc_Text: string;
Begin
  with comp do
  Begin
    Lc_Text := Text;
    Lc_Text := unMaskField(Lc_Text);
    if ( Length(Lc_Text) > 0 ) then
    Begin
      case Length(Lc_Text) of
        4:Text := Copy(Lc_Text,1,3) + '.' + Copy(Lc_Text,4,1);
        7:Text := Copy(Lc_Text,1,3) + '.' + Copy(Lc_Text,4,3)+ '.' + Copy(Lc_Text,7,1);
        11:Text := Copy(Lc_Text,1,3) + '.' + Copy(Lc_Text,4,3) + '.' + Copy(Lc_Text,7,3)+ '-' + Copy(Lc_Text,10,2);
        12..14 :Text := Copy(Lc_Text,1,3) + '.' + Copy(Lc_Text,4,3) + '.' + Copy(Lc_Text,7,3)+ '-' + Copy(Lc_Text,10,2);
     end;
    End;
  End;
End;

procedure MaskCNPJ(comp : TUniEdit);
var
  Lc_Text: string;
Begin
  with comp do
  Begin
    Lc_Text := Text;
    Lc_Text := unMaskField(Lc_Text);
    if ( Length(Lc_Text) > 0 ) then
    Begin
      case Length(Lc_Text) of
        3: Text := Copy(Lc_Text,1,2) + '.' + Copy(Lc_Text,3,1);
        6: Text := Copy(Lc_Text,1,2) + '.' + Copy(Lc_Text,3,3) + '.' + Copy(Lc_Text,6,1);
        9: Text := Copy(Lc_Text,1,2) + '.' + Copy(Lc_Text,3,3) + '.' + Copy(Lc_Text,6,3)+ '/'+ Copy(Lc_Text,9,4);
        14:Text := Copy(Lc_Text,1,2) + '.' + Copy(Lc_Text,3,3) + '.' + Copy(Lc_Text,6,3)+ '/'+ Copy(Lc_Text,9,4)+ '-'+  Copy(Lc_Text,13,2);
      end;
    End;
  End;
End;

procedure MaskCep(comp : TUniEdit);
var
  Lc_Text: string;
Begin
  with comp do //81770090
  Begin
    Lc_Text := Text;
    Lc_Text := unMaskField(Lc_Text);
    case Length(Lc_Text) of
//      3:Text := Copy(Lc_Text,1,2) + '.' + Copy(Lc_Text,3,1);
      6..8:Text := Copy(Lc_Text,1,2) + '.' + Copy(Lc_Text,3,3)+ '-' + Copy(Lc_Text,6,3);
    end;
  End;
End;

procedure MaskDate(Comp : TUniDateTimePicker);
var
  Lc_Text: string;
begin
  with Comp do
  Begin
    Lc_Text := Text;
    Lc_Text := unMaskField(Lc_Text);
    case Length(Lc_Text) of
      1..2: Text := Copy(Lc_Text,1,2) + '/';
      3..4: Text := Copy(Lc_Text,1,2) + '/' + Copy(Lc_Text,3,2);
      5..8: Text := Copy(Lc_Text,1,2) + '/' + Copy(Lc_Text,3,2) + '/' + Copy(Lc_Text,5,4);
    end;
  End;
end;

function tamStringpxl(s: TUniLabel):integer;
var
  c: TBitmap;
  f: TFont;
begin
  {uma forma de calcular o tamanho de um texto na janela se o canvas não atualiza via ajax }
  c := TBitmap.Create;
  f := TFont.Create;
  Result := 8 * Length(s.Caption);
  f.Size := s.Font.Size;
  f.Style := s.Font.Style;
  try
    c.Canvas.Font.Assign(f);
    Result := Round( c.Canvas.TextWidth(s.Caption));
    Result := Trunc( Result + (Result * 0.5));
  finally
    c.Free;
  end;
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


function  ValidDocFiscal(doc:String):Boolean;
Var
  Lc_Doc : String;
Begin
  Result := True;
  Lc_Doc := TRIM(unMaskField(Doc));
  if ( Length(Lc_Doc) = 11 ) then
  begin
    if not (CalculoCpf(Lc_Doc)) then
    begin
      MensageAlert(['A T E N Ç Ã O!.',
                    '',
                    'Número de C.P.F. Inválido.',
                    'Verifique e tente novamente.']);
       Result := False;
       exit;
    end;
  end
  else
  begin
    if not (CalculoCnpj(Lc_Doc)) then
    begin
      MensageAlert(['A T E N Ç Ã O!.',
                    '',
                    'Número de C.N.P.J. Inválido.',
                    'Verifique e tente novamente.']);
      Result := False;
      exit;
    end;
  end;
End;

function  ValidInscEstadual(Numero,Estado:String): Boolean;
Var
  Lc_Val_Insc_Est:TACBrValidador;
Begin
  Result := True;
  if (Trim(Numero) <> '') then
  Begin
    Lc_Val_Insc_Est := TACBrValidador.Create(nil);
    Lc_Val_Insc_Est.TipoDocto := docInscEst;
    Lc_Val_Insc_Est.IgnorarChar := './-';
    Lc_Val_Insc_Est.Documento := Numero;
    Lc_Val_Insc_Est.Complemento := Estado;
    if not Lc_Val_Insc_Est.Validar then
    Begin
      Result := false;
    end;
    FreeAndNil(Lc_Val_Insc_Est);
  end;
end;

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
  Result := concat(IntToStr(YearOf(Data)) , '-' , IntToStr(MonthOf(Data)) , '-' + IntToStr(DayOf(data)));
end;

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

function  LocalizaComponentePorNome(Fc_Parent : TComponent; Pc_Alvo:TClass;Pc_Nome:String;Pc_tamanho:Integer):TComponent;
Var
  Lc_I : Integer;
Begin
  Result := Nil;
  for Lc_I := 0 to Fc_Parent.ComponentCount - 1 do
  begin
    if (Fc_Parent.Components[Lc_I].ClassType = Pc_Alvo) then
    begin
      if (Fc_Parent.Components[Lc_I].Name = Pc_Nome) then
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

