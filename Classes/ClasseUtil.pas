unit ClasseUtil;

interface

uses
  IniFiles, DB, SysUtils, DBConsts, DateUtils, System.Types,
   System.StrUtils, UnitConstantes;


type
  TConsisteInscricaoEstadual = function (const Insc, UF: String): Integer; stdcall;

type
  TUtil = class
  private
  public
    class procedure VerificarCamposRequeridos(Dataset: TDataset);
    class function  ContemNoArray(const Value: string; Strings: array of string): Boolean;
    class procedure GravaIni(sArqIni, sSecao, sVariavel, sTexto: string);

    class function  LerAnoOperacional: string;
    Class function  LeIni(sArqIni, sSecao: string; sVariavel: String): Variant;
    Class function  LeIniInteger(sArqIni, sSecao: string; sVariavel: String): integer;
    Class function  LeIniBoolean(sArqIni, sSecao: string; sVariavel: String): boolean;
    class Function  LeIniDate(sArqIni: string; sSecao: string; sVariavel: string): TDateTime;


  end;

implementation

uses
  IdHTTPHeaderInfo
  ;

{ TUtil }




class function TUtil.ContemNoArray(const Value: string;
  Strings: array of string): Boolean;
var I: Integer;
begin
  Result := True;
  for I := Low(Strings) to High(Strings) do
    if Strings[i] = Value then
      Exit;
  Result := False;
end;



class procedure TUtil.GravaIni(sArqIni, sSecao, sVariavel, sTexto: string);
var
  ArqIni: TIniFile;
begin
  ArqIni := TIniFile.Create(ExtractFilePath(ParamStr(0))+sArqIni);
  try
    ArqIni.WriteString(sSecao, sVariavel, sTexto);
  finally
    ArqIni.Free;
  end;
end;




class function TUtil.LeIniInteger(sArqIni, sSecao: string; sVariavel: String): integer;
var
  ArqIni: TIniFile;
  vntgr : integer;
begin
  vntgr := 0;
  ArqIni := TIniFile.Create(ExtractFilePath(ParamStr(0))+sArqIni);
  try
     Result := ArqIni.ReadInteger(sSecao, sVariavel, vntgr);
  finally
    ArqIni.Free;
  end;
end;

class function TUtil.LerAnoOperacional: string;
begin
  Result := Format('%d%s%d', [YearOf(Date) - 1, FormatSettings.DateSeparator, YearOf(Date)]);
end;

class function TUtil.LeIniBoolean(sArqIni, sSecao: string; sVariavel: String): boolean;
var
  ArqIni: TIniFile;
  vbln : boolean;
begin
  vbln := False;
  ArqIni := TIniFile.Create(ExtractFilePath(ParamStr(0))+sArqIni);
  try
     Result := ArqIni.ReadBool(sSecao , sVariavel, vbln);
  finally
    ArqIni.Free;
  end;
end;

class function TUtil.LeIniDate(sArqIni, sSecao, sVariavel: string): TDateTime;
var
  ArqIni: tIniFile;
  sDate: TDateTime;
begin
  sDate := now();
   ArqIni := tIniFile.Create(ExtractFilePath(ParamStr(0))+sArqIni);
   Try
      Result := ArqIni.ReadDateTime(sSecao, sVariavel, sDate);
   Finally
      ArqIni.Free;
   end;
end;

class Function TUtil.LeIni(sArqIni, sSecao: string; sVariavel: String): Variant;
var
  ArqIni: TIniFile;
  sString : string;
begin
  ArqIni := TIniFile.Create(ExtractFilePath(ParamStr(0))+sArqIni);
  try
     Result := ArqIni.ReadString(sSecao , sVariavel, sString);
  finally
    ArqIni.Free;
  end;
end;

//Verificar os campos requeridos do dataset
class procedure TUtil.VerificarCamposRequeridos(Dataset: TDataset);
var
  I: Integer;
begin
  for I := 0 to DataSet.FieldCount - 1 do begin
    if not (DataSet.Fields.Fields[I] is TDataSetField) then begin
      if (Trim(DataSet.Fields.Fields[I].AsString) = '') and
       (Trim(DataSet.Fields.Fields[I].AsString) <> '0') and
        DataSet.Fields.Fields[I].Required then begin
        DataSet.Fields.Fields[I].FocusControl;
        raise Exception.Create(Format(SFieldRequired, [DataSet.Fields.Fields[I].DisplayLabel]));
      end;
    end;
  end;
end;


end.
