unit UnFunctions;

interface

uses
  SysUtils,System.Classes, System.StrUtils,
  FireDAC.Comp.Client,zLib,
  System.UITypes,System.IniFiles,System.Types,
  System.Variants,System.DateUtils,
  FMX.Edit,FMX.DialogService,tblCrashlytics, REST.Json,
  ctrl_mob_config;

type
  TMsgPadrao = (mpAlerta, mpErro, mpConfirmacao, mpInformacao);
  TMsgEscape = (bEscape,bNormal);

    procedure ShowMessage(const TheMessage:String);


    Function GetConfigTBL(Oper: char; Field,content: string):String;




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
    Function GetPathExe:String;
    procedure GeralogCrashlytics(Origem,msg:String);
    procedure Geraloglocal(Origem,msg:String);

    function getParameter(pBusca:String):TStringList;



  function ZCompressString(aText: string; aCompressionLevel: TZCompressionLevel): string;
  function ZDecompressString(aText: string): string;

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


Function GetConfigTBL(Oper: char; Field,content: string):String;
Var
  LcConfig : TCtrlMobConfig;
begin
  Try
    LcConfig :=  TCtrlMobConfig.Create(nil);
    with LcConfig do
    Begin
      Registro.Campo := Field;
      Registro.Conteudo := content;
      Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
      if Oper = 'G' then
      Begin
        save;
      End
      else
      Begin
        getbyKey;
        if not exist then save;
      End;
      Result := Registro.Conteudo;
    End;
  Finally
    LcConfig.DisposeOf;
  End;
End;



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

function GetPathExe: String;
Var
  LcTam : Integer;
  LcAux : String;
begin
  {$IFDEF ANDROID}// if the operative system is Android
    Result := GetHomePath;
    LcTam := Length(Result);
    LcAux := Copy(REsult,LcTam,1);
    if (LcAux <> '/') then
      REsult := concat(REsult,'/');
  {$ENDIF ANDROID}
  {$IFNDEF ANDROID}
    REsult  :=  ExtractFilePath(ParamStr(0));
    LcTam := Length(Result);
    LcAux := Copy(REsult,LcTam,1);
    if (LcAux <> '\') then
      REsult := concat(REsult,'\');
  {$ENDIF ANDROID}
end;

procedure GeralogCrashlytics(Origem,msg:String);
Var
  LcCrash : TCrashlytics;
  LcJson : String;
begin
 Try
    Try
      LcCrash := TCrashlytics.Create;
      LcCrash.Estabelecimento := UMM.GInstitution.Registro.Codigo;
      LcCrash.Usuario         := gbUser;
      LcCrash.Origem          := origem;
      LcCrash.Mensagem        := msg;
      LcCrash.RegistroCriado  := Now;
      LcCrash.RegistroAlterado  := Now;
      LcJson := TJson.ObjectToJsonString(LcCrash);
      DataCM.SMServicesClient.setCrashlytics(LcJson);
    except
      on E: exception do
        Geraloglocal(Origem,msg);
    End;
  Finally

  End;
end;

procedure Geraloglocal(Origem,msg:String);
var
  Lc_File: TextFile;
  Lc_PathFileName : String;
  Lc_DateTime : String;
begin
  {$IFDEF WIN32}
  Try
    Lc_PathFileName := concat(ExtractFilePath(GetPathExe) , 'log\log_data',msg,'.txt');
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
  {$ENDIF }
End;

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
    Result := '';//EncodeBase64 ( Result );
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
  aText := '';//DecodeBase64( aText );
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

