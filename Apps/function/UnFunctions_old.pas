unit UnFunctions;

interface

uses
  SysUtils,System.Classes, System.StrUtils,System.Math,
  FireDAC.Comp.Client,
  System.UITypes,System.IniFiles,System.Types,
  System.Variants,System.DateUtils,
  FMX.Edit,FMX.DialogService,tblCrashlytics, REST.Json, FMX.WebBrowser;

type
  TMsgPadrao = (mpAlerta, mpErro, mpConfirmacao, mpInformacao);
  TMsgEscape = (bEscape,bNormal);

    procedure ShowMessage(const TheMessage:String);
    Function GetPathExe:String;
    Function GetConfig(Sessao,CHave:String):String;
    procedure SetConfig(Sessao, CHave, Valor:String);
    Function unMaskField(Text:String):String;
    procedure MaskCep(comp : TEdit);
    procedure MaskCNPJ(comp : TEdit);
    procedure MaskCPF(comp : TEdit);
    procedure MaskPhone(comp : TEdit);
    procedure MaskPrazo(inst:integer;comp : TEdit);
    function CalculoCpf(xCPF: string): Boolean;
    function CalculoCnpj(xCGC: string): Boolean;
    function StrTran(Entra: string ; Search: string ; Replace : string): string;
    function StrZero(Num : Real ; Zeros,Deci: integer): string;
    Function ConverteData(Data:TDateTime) : String;
    function JsonMinify(const S: string): string;

    function RemoveCaracterInformado(Str: String; Caracteres: Array of String): String;
    procedure GeralogCrashlytics(Origem,msg:String);

    function getParameter(pBusca:String):TStringList;
    procedure WriteStrToStream(const Stream: TStream; Value: String);
    function ACBrStrToAnsi( const AString: String): String;
    function PosLast(const SubStr, S: String ): Integer;
    function GetURLBasePath(const URL: String): String;
    function IsAbsoluteURL(const URL: String): Boolean;
    function XmlEhUTF8(const AXML: String): Boolean;
    function RetornarConteudoEntre(const Frase, Inicio, Fim: String; IncluiInicioFim: Boolean = False): string;
    function FuncParseText( const Texto : String; const Decode : Boolean = True;
   const IsUTF8: Boolean = True ) : String;
    function FastStringReplace(const S, OldPattern, NewPattern: string; Flags: TReplaceFlags): string;
    function ACBrStr( const AString : String ) : String ;
    function DecodeToString( const ABinaryString : String; const StrIsUTF8: Boolean ) : String ;
    function UTF8ToNativeString(const AUTF8String : String ) : String;
    function AnsiToNativeString(const AString : String ) : String;
    function AjustaLinhas(const Texto: String; Colunas: Integer ;
         NumMaxLinhas: Integer = 0; PadLinhas: Boolean = False): String;
    function LenghtNativeString(const AString: String): Integer;
   function PadRight(const AString : String; const nLen : Integer; const Caracter : Char) : String ;
   function Space(Tamanho: Integer): string;
   function StripHTML(const AHTMLString: String): String;
   procedure AcharProximaTag(const AString: String;
          const PosIni: Integer; var ATag: String; var PosTag: Integer);
  procedure RemoveEmptyLines(AStringList : TStringList) ;
  function LerCampo(Texto: TStringList; NomeCampo: String ): String;
  function CharIsNum(const C: Char): Boolean;
  function OnlyNumber(const AValue: String): String;
  function RemoverEspacosDuplos(const AString: String): String;
const
  EOL = concat(Char(10),Char(13));

implementation
uses MainModule, uDataCM;

procedure ShowMessage(const TheMessage:String);
begin
  TDialogService.MessageDialog(TheMessage, TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOk], TMsgDlgBtn.mbOk, 0, nil);
end;

procedure MessageDlgYesNo(const TheMessage:String);
begin
  { Show a multiple-button alert that triggers different code blocks according to
    your input }
  TDialogService.MessageDialog(TheMessage, System.UITypes.TMsgDlgType.mtInformation,
    [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo ],
    System.UITypes.TMsgDlgBtn.mbNo, 0,
      // Use an anonymous method to make sure the acknowledgment appears as expected.
      procedure(const AResult: TModalResult)
      begin
        case AResult of
        { Detect which button was pushed and show a different message }
        mrYES:
          ShowMessage('You chose Yes');
        mrNo:
          ShowMessage('You chose No');
        mrCancel:
          ShowMessage('You chose Cancel');
      end;
    end);
end;

Function  GetPathExe:String;
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

end;

function GetConfig(Sessao,CHave:String):String;
var
  ArquivoIni: TIniFile;
begin
  Result := '';
  try
    ArquivoIni := TIniFile.Create(concat(GetPathExe,'/','cfgcomanda.ini'));
    Result     :=  ArquivoIni.ReadString(Sessao , CHave,'');
  finally
    ArquivoIni.Free;
  end;
end;

procedure SetConfig(Sessao,CHave, Valor:String);
var
  ArquivoIni: TIniFile;
begin
  try
    ArquivoIni := TIniFile.Create(concat(GetPathExe,'/','cfgcomanda.ini'));
    ArquivoIni.WriteString(Sessao, CHave, Valor);
  finally
    ArquivoIni.Free;
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

procedure MaskCep(comp : TEdit);
var
  Lc_Text: string;
Begin
  with comp do //81770090
  Begin
    Lc_Text := Text;
    Lc_Text := unMaskField(Lc_Text);
    case Length(Lc_Text) of
      3:Text := Copy(Lc_Text,1,2) + '.' + Copy(Lc_Text,3,1);
      6..8:Text := Copy(Lc_Text,1,2) + '.' + Copy(Lc_Text,3,3)+ '-' + Copy(Lc_Text,6,3);
    end;
    SelStart := Length(Text);
  End;
End;

procedure MaskCNPJ(comp : TEdit);
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
    SelStart := Length(Text);
  End;
End;

procedure MaskCPF(comp : TEdit);
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
    SelStart := Length(Text);
  End;
End;

procedure MaskPhone(comp : TEdit);
var
  Lc_Text: string;
begin
    Lc_Text := TEdit(comp).Text;
    Lc_Text := stringReplace(Lc_Text, '-', '', []);
    Lc_Text := stringReplace(Lc_Text, '-', '', []);
    Lc_Text := stringReplace(Lc_Text, '(', '', []);
    Lc_Text := stringReplace(Lc_Text, ')', '', []);
    Lc_Text := stringReplace(Lc_Text, ' ', '', []);
    if (Copy(Lc_Text,1,4) = '0800')OR (Copy(Lc_Text,1,4) = '0300') then
    Begin//0800-41-1910
      TEdit(comp).MaxLength := 13;
      case Length(Lc_Text) of
        5..6:TEdit(comp).Text := Copy(Lc_Text,1,4) + '-' + Copy(Lc_Text,5,2);
        7..10:TEdit(comp).Text := Copy(Lc_Text,1,4) + '-' + Copy(Lc_Text,5,2) + '-' + Copy(Lc_Text,7,4);
        11:TEdit(comp).Text := Copy(Lc_Text,1,4) + '-' + Copy(Lc_Text,5,3) + '-' + Copy(Lc_Text,8,4);
      else
        TEdit(comp).Text := Lc_Text;
      end;
    end
    else
    Begin
      TEdit(comp).MaxLength := 15;
      case Length(Lc_Text) of
        5..8:   Begin
                  case Length(Lc_Text) of
                    5:TEdit(comp).Text := Copy(Lc_Text,1,4) + '-' + Copy(Lc_Text,5,1);
                    6:TEdit(comp).Text := Copy(Lc_Text,1,4) + '-' + Copy(Lc_Text,5,2);
                    7:TEdit(comp).Text := Copy(Lc_Text,1,4) + '-' + Copy(Lc_Text,5,3);
                    8:TEdit(comp).Text := Copy(Lc_Text,1,4) + '-' + Copy(Lc_Text,5,4);
                  end;
                end;
        9:      Begin
                  TEdit(comp).Text := Copy(Lc_Text,1,5) + '-' + Copy(Lc_Text,6,4);
                end;
        10..11: Begin
                  case Length(Lc_Text) of
                    10:TEdit(comp).Text := '(' + Copy(Lc_Text,1,2) + ') ' + Copy(Lc_Text,3,4) + '-' + Copy(Lc_Text,7,4);
                    11:TEdit(comp).Text := '(' + Copy(Lc_Text,1,2) + ') ' + Copy(Lc_Text,3,5) + '-' + Copy(Lc_Text,8,4);
                  end;
               end;
      end;
    end;
    TEdit(comp).SelStart := Length(TEdit(comp).Text);
End;

procedure MaskPrazo(inst:integer;comp : TEdit);
var
  Lc_Text: string;
  Lc_New_Text : String;
  I:Integer;
  LcParcela : Integer;
begin
  Lc_Text := TEdit(comp).Text;
  Lc_Text := stringReplace(Lc_Text, '-', '', [rfReplaceAll,rfIgnoreCase]);
  Lc_Text := stringReplace(Lc_Text, '(', '', [rfReplaceAll,rfIgnoreCase]);
  Lc_Text := stringReplace(Lc_Text, ')', '', [rfReplaceAll,rfIgnoreCase]);
  Lc_Text := stringReplace(Lc_Text, ' ', '', [rfReplaceAll,rfIgnoreCase]);
  Lc_Text := stringReplace(Lc_Text, '/', '', [rfReplaceAll,rfIgnoreCase]);
  TEdit(comp).MaxLength := (3 * inst) + (inst - 1);
  if (Length(Lc_Text) mod 3) = 0 then
  Begin
    Lc_New_Text := '';
    LcParcela := 0;

    for I := 1 to Length(Lc_Text) do
    BEgin
      if (I mod 3) = 0 then
      Begin
        if Lc_New_Text = '' then
        BEgin
          inc(LcParcela);
          Lc_New_Text := Copy(Lc_Text,LcParcela,3);
        End
        else
        Begin
          inc(LcParcela);
          Lc_New_Text := concat(Lc_New_Text,'/',Copy(Lc_Text,LcParcela,3));
        End;
      End;
    End;

    TEdit(comp).Text := Lc_New_Text;
  End
  else
  Begin
    TEdit(comp).Text := Lc_Text;
  End;

  TEdit(comp).SelStart := Length(TEdit(comp).Text);
End;
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

Function ConverteData(Data:TDateTime) : String;
begin
  Result := concat(IntToStr(YearOf(Data)) , '-' ,
                   StrZero(MonthOf(Data),2,0) , '-',
                   StrZero(DayOf(data),2,0), ' ',
                   TimeToStr(Data)
            );
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
  SL.DisposeOf;
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


procedure GeralogCrashlytics(Origem,msg:String);
Var
  LcCrash : TCrashlytics;
  LcJson : String;
begin
 Try
    LcCrash := TCrashlytics.Create;
    LcCrash.Estabelecimento := GbInstitution;
    LcCrash.Usuario         := gbUser;
    LcCrash.Origem          := origem;
    LcCrash.Mensagem        := msg;
    LcCrash.RegistroCriado  := Now;
    LcCrash.RegistroAlterado  := Now;
    LcJson := TJson.ObjectToJsonString(LcCrash);
    DataCM.SMServicesClient.setCrashlytics(LcJson);
  Finally
    LcCrash.DisposeOf;
  End;

end;

function getParameter(pBusca:String):TStringList;
Var
  Lcpos:Integer;
  LCStr : String;
  LcPalavra : String;
begin
  Result := TStringList.create;
  if Length(pBusca)>0 then
  Begin
    LcStr := pBusca;
    while Length(trim(LcStr))>0 do
    Begin
      Lcpos := Pos(' ',LCStr);
      if (Lcpos > 0) then
      Begin
        LcPalavra := Trim(Copy(LCStr,1,Lcpos));
        if Length(LcPalavra) > 0 then
          Result.Add(LcPalavra);
      End
      else
      Begin
        LcPalavra := Trim(LCStr);
        Result.Add(LcPalavra);
        LCStr := '';
      End;
      if Lcpos = 0 then Lcpos := 1;
      Delete(LCStr,1,Lcpos);
    End;
  End;
end;

procedure WriteStrToStream(const Stream: TStream; Value: String);
{$IFDEF CIL}
var
  buf: Array of Byte;
{$ENDIF}
begin
{$IFDEF CIL}
  buf := BytesOf(Value);
  Stream.Write(buf,length(Value));
{$ELSE}
  Stream.Write(PChar(Value)^, Length(Value));
{$ENDIF}
end;

function ACBrStrToAnsi( const AString: String): String;
begin
{$IFDEF UNICODE}
  {$IFDEF FPC}
    Result := UTF8ToCP1252( AString ) ;
  {$ELSE}
    Result := string(String( AString )) ;
  {$ENDIF}
{$ELSE}
  Result := AString
{$ENDIF}
end;

function PosLast(const SubStr, S: String ): Integer;
Var P : Integer ;
begin
  Result := 0 ;
  P := Pos( SubStr, S) ;
  while P <> 0 do
  begin
     Result := P ;
     P := PosEx( String(SubStr), String(S), P+1) ;
  end ;
end ;

function GetURLBasePath(const URL: String): String;
begin
  Result := Copy(URL, 1, PosLast('/',URL) );
end;

function IsAbsoluteURL(const URL: String): Boolean;
const
  protocolos: array[0..2] of string = ('http','https', 'ftp');
var
 i: Integer;
begin
  Result := False;

  //Testa se é um tipo absoluto relativo ao protocolo
  if Pos('//', URL) = 1 then
  begin
    Result := True;
    Exit;
  end;

  //Testa se é um tipo relativo
  if Pos('/', URL) = 1 then
  begin
    Result := False;
    Exit;
  end;

  //Testa se inicia por protocolos...
  for I := 0 to High(protocolos) do
  begin
    if Pos(UpperCase(protocolos[i])+'://', UpperCase(URL)) = 1 then
    begin
      Result := True;
      Break;
    end;
  end;

  if Result then Exit;

  //Começa com "www."
  if Pos('www.', URL) = 1 then
  begin
    Result := True;
    Exit;
  end;
end;
{------------------------------------------------------------------------------
   Retorna True se o XML contêm a TAG de encoding em UTF8, no seu início.
 ------------------------------------------------------------------------------}
function XmlEhUTF8(const AXML: String): Boolean;
var
  XmlStart: String;
  P: Integer;
begin
  XmlStart := LowerCase(LeftStr(AXML, 50));
  P := pos('encoding', XmlStart);
  Result := (P > 0) and (pos('utf-8', XmlStart) > P);
end;

function RetornarConteudoEntre(const Frase, Inicio, Fim: String;
  IncluiInicioFim: Boolean): string;
var
  i: integer;
  s: string;
begin
  result := '';
  i := pos(Inicio, Frase);
  if i = 0 then
    Exit;

  if IncluiInicioFim then
  begin
    s := Copy(Frase, i, maxInt);
    result := Copy(s, 1, pos(Fim, s) + Length(Fim) - 1);
  end
  else
  begin
    s := Copy(Frase, i + length(Inicio), maxInt);
    result := Copy(s, 1, pos(Fim, s) - 1);
  end;
end;

function FuncParseText( const Texto : String; const Decode : Boolean = True;
   const IsUTF8: Boolean = True ) : String;
var
  AStr: String;

  function InternalStringReplace(const S, OldPatern, NewPattern: String ): String;
  begin
    if pos(OldPatern, S) > 0 then
      Result := FastStringReplace(String(S), String(OldPatern), String(ACBrStr(NewPattern)), [rfReplaceAll])
    else
      Result := S;
  end;

begin
  if Decode then
  begin
    Astr := DecodeToString( Texto, IsUTF8 ) ;

    Astr := InternalStringReplace(AStr, '&amp;'   , '&');
    AStr := InternalStringReplace(AStr, '&lt;'    , '<');
    AStr := InternalStringReplace(AStr, '&gt;'    , '>');
    AStr := InternalStringReplace(AStr, '&quot;'  , '"');
    AStr := InternalStringReplace(AStr, '&#39;'   , #39);
    AStr := InternalStringReplace(AStr, '&aacute;', 'á');
    AStr := InternalStringReplace(AStr, '&Aacute;', 'Á');
    AStr := InternalStringReplace(AStr, '&acirc;' , 'â');
    AStr := InternalStringReplace(AStr, '&Acirc;' , 'Â');
    AStr := InternalStringReplace(AStr, '&atilde;', 'ã');
    AStr := InternalStringReplace(AStr, '&Atilde;', 'Ã');
    AStr := InternalStringReplace(AStr, '&agrave;', 'à');
    AStr := InternalStringReplace(AStr, '&Agrave;', 'À');
    AStr := InternalStringReplace(AStr, '&eacute;', 'é');
    AStr := InternalStringReplace(AStr, '&Eacute;', 'É');
    AStr := InternalStringReplace(AStr, '&ecirc;' , 'ê');
    AStr := InternalStringReplace(AStr, '&Ecirc;' , 'Ê');
    AStr := InternalStringReplace(AStr, '&iacute;', 'í');
    AStr := InternalStringReplace(AStr, '&Iacute;', 'Í');
    AStr := InternalStringReplace(AStr, '&oacute;', 'ó');
    AStr := InternalStringReplace(AStr, '&Oacute;', 'Ó');
    AStr := InternalStringReplace(AStr, '&otilde;', 'õ');
    AStr := InternalStringReplace(AStr, '&Otilde;', 'Õ');
    AStr := InternalStringReplace(AStr, '&ocirc;' , 'ô');
    AStr := InternalStringReplace(AStr, '&Ocirc;' , 'Ô');
    AStr := InternalStringReplace(AStr, '&uacute;', 'ú');
    AStr := InternalStringReplace(AStr, '&Uacute;', 'Ú');
    AStr := InternalStringReplace(AStr, '&uuml;'  , 'ü');
    AStr := InternalStringReplace(AStr, '&Uuml;'  , 'Ü');
    AStr := InternalStringReplace(AStr, '&ccedil;', 'ç');
    AStr := InternalStringReplace(AStr, '&Ccedil;', 'Ç');
    AStr := InternalStringReplace(AStr, '&apos;'  , '''');
  end
  else
  begin
    AStr := string(Texto);
    AStr := StringReplace(AStr, '&', '&amp;' , [rfReplaceAll]);
    AStr := StringReplace(AStr, '<', '&lt;'  , [rfReplaceAll]);
    AStr := StringReplace(AStr, '>', '&gt;'  , [rfReplaceAll]);
    AStr := StringReplace(AStr, '"', '&quot;', [rfReplaceAll]);
    AStr := StringReplace(AStr, #39, '&#39;' , [rfReplaceAll]);
    AStr := StringReplace(AStr, '''','&apos;', [rfReplaceAll]);
  end;

  Result := AStr;
end;

// Much faster StringReplace implementation than RTL StringReplace() (including XE7 implementation)
// In our tests it is at least 20% faster in small strings and up to 500% faster in most cases.
// Some corner cases tests showed that this version can be 100x faster than std StringReplace(), e.g.
// Length(OldPattern) = Length(NewPattern) and huge number of occurrences of OldPattern in the string.
// It also beats TStringBuilder.Replace() in all tested scenarios
function FastStringReplace(const S, OldPattern, NewPattern: string; Flags: TReplaceFlags): string;
const
  Size_of_Char = SizeOf(Char);
var
  Str: string;
  xOldPattern: string;
  i, j: Integer;
  SourceIdx,
  DestIdx,
  p: Integer;
  FindCount: Integer;
  PosArray: array of Integer;
  LenOP, LenNP, ArrLen: Integer;
begin
  if S = '' then begin
    Result := '';
    Exit;
  end;

  if rfIgnoreCase in Flags then begin
    xOldPattern := AnsiUpperCase(OldPattern);
    {$IFDEF FPC_OR_LEGACY24}
    if (CompareStr(xOldPattern,AnsiLowerCase(OldPattern)) = 0) then begin   // if AnsiUpperCase(OldPattern) = AnsiLowerCase(OldPattern) we don't need to use UpperCase() in the whole string
    {$ELSE}
    if SameStr(xOldPattern, AnsiLowerCase(OldPattern)) then begin   // if AnsiUpperCase(OldPattern) = AnsiLowerCase(OldPattern) we don't need to use UpperCase() in the whole string
    {$ENDIF}
      Str := S;
    end else begin
      Str := AnsiUpperCase(S);
    end;
  end else begin
    xOldPattern := OldPattern;
    Str := S;
  end;

  LenOP := Length(OldPattern);
  LenNP := Length(NewPattern);

  i := 1;
  FindCount := 0;
  ArrLen := 0;
  repeat
    //In x64 we call FastPos() directly. In XE3 or below, we call PosEx(). If IDE >= XE3, then call Pos()
    i := {$IFDEF USE_FASTPOS}FastPos{$ELSE}
         {$IFDEF FPC_OR_LEGACY24}PosEx{$ELSE}
         Pos{$ENDIF}
         {$ENDIF}(xOldPattern, Str, i);
    if i = 0 then begin
      Break;
    end;
    Inc(FindCount);
    if ArrLen < FindCount then begin
      if ArrLen = 0 then begin
        ArrLen := 32;
      end else begin
        ArrLen := ArrLen * 2;
      end;
      SetLength(PosArray, ArrLen);   // call SetLength less frequently makes a huge difference when replacing multiple occurrences
    end;
    PosArray[FindCount - 1] := i;
    Inc(i, LenOP);
  until Flags * [rfReplaceAll] = [];

  if FindCount > 0 then begin
    if LenNP = LenOP then begin   // special case where Length(OldPattern) = Length(NewPattern)
      Result := S;                // in this case, we can optimize it even further
      for j := 0 to FindCount - 1 do begin
        DestIdx := PosArray[j];
        if LenNP > 0 then begin
          Move(NewPattern[1], Result[DestIdx], LenNP * Size_of_Char);
        end;
      end;
    end else begin
      SetLength(Result, Length(S) + (LenNP - LenOP) * FindCount);
      SourceIdx := 1;
      DestIdx := 1;
      for j := 0 to FindCount - 1 do begin
        p := PosArray[j] - SourceIdx;
        if p > 0 then begin
          Move(S[SourceIdx], Result[DestIdx], p * Size_of_Char);
          Inc(SourceIdx, p);
          Inc(DestIdx, p);
        end;
        if LenNP > 0 then begin
          Move(NewPattern[1], Result[DestIdx], LenNP * Size_of_Char);
        end;
        Inc(SourceIdx, LenOP);
        Inc(DestIdx, LenNP);
      end;
      p := Length(S) + 1 - SourceIdx;
      if p > 0 then begin
        Move(S[SourceIdx], Result[DestIdx], p * Size_of_Char);
      end;
    end;
  end else begin
    Result := S;
  end;
end;
{-----------------------------------------------------------------------------
  Todos os Fontes do ACBr usam Encoding CP1252, para manter compatibilidade com
  D5 a D2007, Porém D2009 e superiores usam Unicode, e Lazarus 0.9.27 ou superior,
  usam UTF-8. A função abaixo converte a "AString" de ANSI CP1252, para UNICODE
  ou UTF8, de acordo com as diretivas do Compilador
 -----------------------------------------------------------------------------}
function ACBrStr( const AString : String ) : String ;
begin
{$IFDEF UNICODE}
  {$IFDEF FPC}
    Result := CP1252ToUTF8( AString ) ;
  {$ELSE}
    Result := String(AString) ;
  {$ENDIF}
{$ELSE}
  Result := AString
{$ENDIF}
end ;

function DecodeToString(const ABinaryString: String; const StrIsUTF8: Boolean
  ): String;
begin
  if StrIsUTF8 then
    Result := UTF8ToNativeString(ABinaryString)
  else
    Result := AnsiToNativeString(ABinaryString);
end;

function UTF8ToNativeString(const AUTF8String: String): String;
begin
  {$IfDef FPC}
   Result := AUTF8String;  // FPC usa UTF8 de forma nativa
  {$Else}
   {$IfDef UNICODE}
    {$IfDef DELPHI12_UP}  // delphi 2009 em diante
     Result := UTF8ToString(AUTF8String);
    {$Else}
     Result := UTF8Decode(AUTF8String);
    {$EndIf}
   {$Else}
    Result := Utf8ToAnsi(AUTF8String) ;
   {$EndIf}

   if Result = '' then
     Result := AUTF8String;
  {$EndIf}
end;

function AnsiToNativeString(const AString: String): String;
begin
  {$IfDef FPC}
    Result := ACBrAnsiToUTF8(AString);
  {$Else}
    Result := String(AString);
  {$EndIf}
end;

function AjustaLinhas(const Texto: String; Colunas: Integer;
  NumMaxLinhas: Integer; PadLinhas: Boolean): String;
Var
  Count,P,I : Integer ;
  Linha, CurrLineBreak, VTexto : String;
begin
  VTexto := String(Texto);
  { Trocando todos os #13+#10 por #10 }
  CurrLineBreak := sLineBreak ;
  if (CurrLineBreak <> #13+#10) then
     VTexto := StringReplace(VTexto, #13+#10, #10, [rfReplaceAll]) ;

  if (CurrLineBreak <> #10) then
     VTexto := StringReplace(VTexto, CurrLineBreak, #10, [rfReplaceAll]) ;

  { Ajustando a largura das Linhas para o máximo permitido em  "Colunas"
    e limitando em "NumMaxLinhas" o total de Linhas}
  Count  := 0 ;
  Result := '' ;
  while ((Count < NumMaxLinhas) or (NumMaxLinhas = 0)) and
        (Length(VTexto) > 0) do
  begin
     P := pos(#10, VTexto ) ;
     if P > (Colunas + 1) then
        P := Colunas + 1 ;

     if P = 0 then
        P := min( Length( VTexto ), Colunas ) + 1 ;

     // somar 2 quando encontrar uma tag para não quebrar ela
     if (Copy(VTexto, P-1, 1) = '<') or (Copy(VTexto, P-2, 2) = '</') then
        inc(P, 2);

     I := 0 ;
     if copy(VTexto,P,1) = #10 then   // Pula #10 ?
        I := 1 ;

     Linha := copy(VTexto,1,P-1) ;    // Remove #10 (se hover)

//     if PadLinhas then
//        Result := Result + String(PadRight( Linha, Colunas)) + #10
//     else
        Result := Result + String(Linha) + #10 ;

     Inc(Count) ;
     VTexto := copy(VTexto, P+I, Length(VTexto) ) ;
  end ;

  { Permitir impressão de uma linha em branco }
  if Result = '' then
  begin
    if PadLinhas then
      Result := Space(Colunas) + #10
    else
      Result := #10;
  end;
end;

function LenghtNativeString(const AString: String): Integer;
begin
  {$IfDef FPC}
   Result := UTF8Length(AString);
  {$Else}
   Result := Length(AString);
  {$EndIf}
end;

{-----------------------------------------------------------------------------
  Completa <AString> com <Caracter> a direita, até o tamanho <nLen>, Alinhando
  a <AString> a Esquerda. Se <AString> for maior que <nLen>, ela será truncada
 ---------------------------------------------------------------------------- }
function PadRight(const AString : String; const nLen : Integer;
   const Caracter : Char) : String ;
var
  Tam: Integer;
begin
  Tam := LenghtNativeString( AString );
  if Tam < nLen then
    Result := AString + StringOfChar(Caracter, (nLen - Tam))
  else
    Result := LeftStr(AString, nLen);
end ;

function Space(Tamanho: Integer): string;
begin
  Result := StringOfChar(' ', Tamanho);
end;

function StripHTML(const AHTMLString: String): String;
var
  ATag, VHTMLString: String;
  PosTag, LenTag: Integer;
begin
  VHTMLString := AHTMLString;
  ATag   := '';
  PosTag := 0;

  AcharProximaTag( VHTMLString, 1, ATag, PosTag);
  while ATag <> '' do
  begin
    LenTag := Length( ATag );
    Delete(VHTMLString, PosTag, LenTag);

    ATag := '';
    AcharProximaTag( VHTMLString, PosTag, ATag, PosTag );
  end ;
  Result := VHTMLString;
end;

procedure AcharProximaTag(const AString: String;
  const PosIni: Integer; var ATag: String; var PosTag: Integer);
var
   PosTagAux, FimTag, LenTag : Integer ;
begin
  ATag   := '';
  PosTag := PosEx( '<', AString, PosIni);
  if PosTag > 0 then
  begin
    PosTagAux := PosEx( '<', AString, PosTag + 1);  // Verificando se Tag é inválida
    FimTag    := PosEx( '>', AString, PosTag + 1);
    if FimTag = 0 then                             // Tag não fechada ?
    begin
      PosTag := 0;
      exit ;
    end ;

    while (PosTagAux > 0) and (PosTagAux < FimTag) do  // Achou duas aberturas Ex: <<e>
    begin
      PosTag    := PosTagAux;
      PosTagAux := PosEx( '<', AString, PosTag + 1);
    end ;

    LenTag := FimTag - PosTag + 1 ;
    ATag   := LowerCase( copy( AString, PosTag, LenTag ) );
  end ;
end ;

procedure RemoveEmptyLines(AStringList : TStringList) ;
var
  I : Integer ;
begin
  I := 0;
  while I < AStringList.Count do
  begin
    if trim(AStringList[I]) = '' then
      AStringList.Delete(I)
    else
      Inc(I);
  end;
end;

function LerCampo(Texto: TStringList; NomeCampo: String ): String;
var
  i : integer;
  linha: String;
begin
  NomeCampo := ACBrStr(NomeCampo);
  Result := '';
  for i := 0 to Texto.Count-1 do
  begin
    linha := Trim(Texto[i]);
    if linha = NomeCampo then
    begin
      Result := StringReplace(Trim(Texto[i+1]),'&nbsp;',' ',[rfReplaceAll]);
      Texto.Delete(I);
      break;
    end;
  end
end;

function CharIsNum(const C: Char): Boolean;
begin
  Result := CharInSet( C, ['0'..'9'] ) ;
end ;

function OnlyNumber(const AValue: String): String;
Var
  I : Integer ;
  LenValue : Integer;
begin
  Result   := '' ;
  LenValue := Length( AValue ) ;
  For I := 1 to LenValue  do
  begin
     if CharIsNum( AValue[I] ) then
        Result := Result + AValue[I];
  end;
end ;

function RemoverEspacosDuplos(const AString: String): String;
begin
  Result := Trim(AString);
  while Pos('  ', Result) > 0 do
    Result := StringReplace( Result, '  ', ' ', [rfReplaceAll]);
end;

end.

