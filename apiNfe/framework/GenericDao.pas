unit GenericDao;

interface

Uses Db, Rtti, CAtribEntity, TypInfo, SysUtils,System.Classes, System.StrUtils ;

type
  TGenericDAO = class(TComponent)
    private

      class function GetValues<T: class>(Obj: T;Prop: TRttiProperty):String;
    public //procedimentos para o crud
      class function GetTableName<T: class>(Obj: T): String;
      class function Select<T: class>(Obj: T; Fields:String):String;
      class function Insert<T: class>(Obj: T):String;
      class function Update<T: class>(Obj: T):String;
      class function Delete<T: class>(Obj: T):String;
      class function Clear<T: class>(Obj: T):String;
  end;

implementation

class function TGenericDAO.GetTableName<T>(Obj: T): String;
var
  Contexto: TRttiContext;
  TypObj: TRttiType;
  Atributo: TCustomAttribute;
  strTable: String;
begin
  Contexto := TRttiContext.Create;
  TypObj := Contexto.GetType(TObject(Obj).ClassInfo);
  for Atributo in TypObj.GetAttributes do
  begin
    if Atributo is TableName then
      Exit(TableName(Atributo).Name);
  end;
end;



class function TGenericDAO.GetValues<T>(Obj: T;Prop: TRttiProperty):String;
Var
  lc_Data, Lc_Hora,Lc_Dia, Lc_Mes, Lc_Ano : String;
Begin
  Result := '';
  case Prop.GetValue(TObject(Obj)).Kind of
    tkWChar, tkLString,
    tkWString, tkString,
    tkChar, tkUString:
      Begin
        Result := Prop.GetValue(TObject(Obj)).AsString;
      end;
    tkInteger, tkInt64:
      Begin
        Result := IntToStr( Prop.GetValue(TObject(Obj)).AsInteger) ;
      end;
    tkFloat:
      Begin
        if (Prop.PropertyType.ToString = 'TDate') then
        Begin
          if ( Prop.GetValue(TObject(Obj)).AsExtended > 0) then
          Begin
            Result := DateToStr(Prop.GetValue(TObject(Obj)).AsExtended);
            //Converte o formato de data  01/01/2016 => 2015-04-14
            Lc_Dia := Copy(Result,1,2);
            Lc_Mes := Copy(Result,4,2);
            Lc_Ano := Copy(Result,7,4);
            Result := Lc_Ano + '-' + Lc_Mes + '-' + Lc_Dia;
          End;
        End
        else
        Begin
          if (Prop.PropertyType.ToString = 'TDateTime') then
          Begin
            if ( Prop.GetValue(TObject(Obj)).AsExtended > 0) then
            Begin
              Result := DateTimeToStr(Prop.GetValue(TObject(Obj)).AsExtended);
              //Converte o formato de data  14/04/2016 21:53:54 => 2016-04-14 20:43:42
              lc_Data := Copy(Result,1,10);
              Lc_Hora := Copy(Result,12,8);
              Lc_Dia := Copy(lc_Data,1,2);
              Lc_Mes := Copy(lc_Data,4,2);
              Lc_Ano := Copy(lc_Data,7,4);
              Lc_Data := Lc_Ano + '-' + Lc_Mes + '-' + Lc_Dia;

              Result := Lc_Data + ' ' + Lc_Hora;
            End;
          End
          else
          Begin
            Result := FloatToStr(Prop.GetValue(TObject(Obj)).AsExtended) ;
            Result := ReplaceStr(Result,',','.');
          End;
        End;
      End;
    else
      raise
        Exception.Create('Tipo Não suportado = Não é possivel converter');
  end;
  result := QuotedStr(Result);
End;

class function TGenericDAO.Select<T>(Obj: T; Fields:String):String;
Var
  Contexto: TRttiContext;
  TypObj: TRttiType;
  Prop: TRttiProperty;
  Atributo: TCustomAttribute;
  strSelect : String;
  strFields :String;
  strWhere : String;
  strKeyField, strKeyValue : String;
  Lc_IndKey : Integer;
Begin
  strSelect := 'Select ';
  strFields := '';
  strWhere := ' Where ';
  strKeyField := '';
  strKeyValue := '';
  Lc_IndKey := 0;
  Contexto := TRttiContext.Create;
  TypObj := Contexto.GetType(TObject(Obj).ClassInfo);
  for Prop in TypObj.GetProperties do
  begin
    for Atributo in Prop.GetAttributes do
    begin
      if (not Prop.GetValue(TObject(Obj)).IsEmpty) then
      Begin
        if Atributo is KeyField then
        Begin
          strKeyField := FieldName(Atributo).Name;
          strKeyValue := TGenericDAO.GetValues(Obj,Prop);
          if ( Lc_IndKey = 0 ) then
            strWhere := strWhere + '( ' + strKeyField + ' = ' + strKeyValue + ' )'
          else
            strWhere := strWhere + ' AND ( ' + strKeyField + ' = ' + strKeyValue + ' )';
          inc(Lc_IndKey);
        End
        else
        Begin
          if (Trim(Fields) = '') then
          Begin
            if Atributo is FieldName then
            begin
              strFields := strFields + FieldName(Atributo).Name + ',';
            End;
          End;
        End;
      end;
    end;
  end;
  if (Trim(Fields) = '') then
    strFields := Copy(strFields, 1, Length(strFields) - 1)
  else
    strFields := Fields;
  strSelect := strSelect + strFields + ' from ' + GetTableName(Obj);
  strSelect := strSelect + strWhere ;
  Result := strSelect;
End;

class function TGenericDAO.Insert<T>(Obj: T):String;
var
  Contexto: TRttiContext;
  TypObj: TRttiType;
  Prop: TRttiProperty;
  strInsert, strFields,strParams, strValues: String;
  Atributo: TCustomAttribute;
  Lc_Value : String;
begin
  strInsert := '';
  strParams := '';
  strInsert := 'INSERT INTO ' + GetTableName(Obj);
  Contexto := TRttiContext.Create;
  TypObj := Contexto.GetType(TObject(Obj).ClassInfo);

  for Prop in TypObj.GetProperties do
  begin
    for Atributo in Prop.GetAttributes do
    begin
      if Atributo is FieldName then
      begin
        //Monta o sql com campos preenchidos
        Lc_Value := TGenericDAO.GetValues(Obj,Prop);
        if (Trim(Lc_Value) <> '''''') then
        Begin
          strFields := strFields + FieldName(Atributo).Name  + ',';
          strParams := strParams + Lc_Value + ',';
        End;
      end;
    end;
  end;
  strFields := Copy(strFields, 1, Length(strFields) - 1);
  strParams := Copy(strParams, 1, Length(strParams) - 1);
  strInsert := strInsert + ' ( ' + strFields + ' ) VALUES ( ' + strParams + ' )';
  Result := strInsert;
end;


class function TGenericDAO.Update<T>(Obj: T):String;
var
  Contexto: TRttiContext;
  TypObj: TRttiType;
  Prop: TRttiProperty;
  strUpdate, strWhere: String;
  strKeyField, strKeyValue : String;
  Lc_IndKey : Integer; //vai controlar o numero de indices para incluir os os "AND"
  strFields, strParams : String;
  Atributo: TCustomAttribute;
  I:Integer;
  Lc_Value : String;
begin
  strUpdate := 'UPDATE ' + GetTableName(Obj) + ' SET ';
  strWhere := ' Where ';
  Contexto := TRttiContext.Create;
  TypObj := Contexto.GetType(TObject(Obj).ClassInfo);
  Lc_IndKey := 0;
  for Prop in TypObj.GetProperties do
  begin
    for Atributo in Prop.GetAttributes do
    begin
      if (not Prop.GetValue(TObject(Obj)).IsEmpty) then
      Begin
        if Atributo is KeyField then
        Begin
          strKeyField := FieldName(Atributo).Name;
          strKeyValue := TGenericDAO.GetValues(Obj,Prop);
          if ( Lc_IndKey = 0 ) then
            strWhere := strWhere + '( ' + strKeyField + ' = ' + strKeyValue + ' )'
          else
            strWhere := strWhere + ' AND ( ' + strKeyField + ' = ' + strKeyValue + ' )';
          inc(Lc_IndKey);
        End
        else
        Begin
          if Atributo is FieldName then
          begin
            Lc_Value := TGenericDAO.GetValues(Obj,Prop);
            if (Trim(Lc_Value) <> '''''') then
            Begin
              strFields := FieldName(Atributo).Name;
              strParams := Lc_Value;
              strUpdate := strUpdate + strFields + ' = ' + strParams + ',';
            End
            else
            Begin
              //Quando é branco enviaar null
              strFields := FieldName(Atributo).Name;
              strParams := Lc_Value;
              strUpdate := strUpdate + strFields + ' = null ,';

            End;
          End
        End;
      end;
    end;
  end;
  strUpdate := Copy(strUpdate, 1, Length(strUpdate) - 1);
  strUpdate := strUpdate + strWhere;
  Result := strUpdate;
end;

class function TGenericDAO.Delete<T>(Obj: T):String;
var
  Contexto: TRttiContext;
  TypObj: TRttiType;
  Prop: TRttiProperty;
  strDelete, strWhere: String;
  strKeyField, strKeyValue : String;
  Lc_IndKey : Integer; //vai controlar o numero de indices para incluir os os "AND"
  strFields, strParams : String;
  Atributo: TCustomAttribute;
  I:Integer;
begin
  strDelete := 'DELETE FROM ' + GetTableName(Obj) ;
  strWhere := ' Where ';
  Contexto := TRttiContext.Create;
  TypObj := Contexto.GetType(TObject(Obj).ClassInfo);
  Lc_IndKey := 0;
  for Prop in TypObj.GetProperties do
  begin
    for Atributo in Prop.GetAttributes do
    begin
      if (not Prop.GetValue(TObject(Obj)).IsEmpty) then
      Begin
        if Atributo is KeyField then
        Begin
          strKeyField := FieldName(Atributo).Name;
          strKeyValue := TGenericDAO.GetValues(Obj,Prop);
          if ( Lc_IndKey = 0 ) then
            strWhere := strWhere + '( ' + strKeyField + ' = ' + strKeyValue + ' )'
          else
            strWhere := strWhere + ' AND ( ' + strKeyField + ' = ' + strKeyValue + ' )';
          inc(Lc_IndKey);
        End
      end;
    end;
  end;
  strDelete := strDelete + strWhere;
  Result := strDelete;
end;

class function TGenericDAO.Clear<T>(Obj: T):String;
var
  Contexto: TRttiContext;
  TypObj: TRttiType;
  Prop: TRttiProperty;
  Atributo: TCustomAttribute;
  Lc_Value : TValue;
begin
  Contexto := TRttiContext.Create;
  TypObj := Contexto.GetType(TObject(Obj).ClassInfo);
  Lc_Value.Empty;
  for Prop in TypObj.GetProperties do
  begin
    for Atributo in Prop.GetAttributes do
    begin
      if Atributo is FieldName then
        Prop.SetValue(TObject(Obj),Lc_Value);
    end;
  end;
end;

end.


