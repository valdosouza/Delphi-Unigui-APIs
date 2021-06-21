unit GenericDao;

interface

Uses
  Db, Rtti, CAtribEntity, TypInfo, SysUtils,System.Classes, System.StrUtils,
  FireDAC.Comp.Client;

type
  TGenericDAO = class(TComponent)
    private
      class function GetTableName<T: class>(Obj: T): String;
      class function GetValues<T: class>(Obj: T;Prop: TRttiProperty):String;
      class procedure SetValues<T: class>(Obj: T;Prop: TRttiProperty;Qry:TFDQuery;Field:String);
    public
      class function _Select<T: class>(Obj: T; Fields:String):String;
      class function _Insert<T: class>(Obj: T):String;
      class function _Update<T: class>(Obj: T):String;
      class function _Delete<T: class>(Obj: T):String;
      class function _Clear<T: class>(Obj: T):String;
      class procedure _assign<T: class>(Source, Dest: T);
      class function _getNextByField<T: class>(Obj: T;Field:String;Intitution:Integer):String;
      class function _getLastInsert<T: class>(Obj: T):String;
      class procedure _get<T: class>(Qry:TFDQuery;Obj: T);
      class Procedure _geralog(acesso : string);
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
            Result := formatdatetime('yyyy-mm-dd', Prop.GetValue(TObject(Obj)).AsExtended);
          End;
        End
        else
        Begin
          if (Prop.PropertyType.ToString = 'TDateTime') then
          Begin
            if ( Prop.GetValue(TObject(Obj)).AsExtended > 0) then
            Begin
              Result := formatdatetime('yyyy-mm-dd hh:nn:ss', Prop.GetValue(TObject(Obj)).AsExtended);
            End;
          End
          else
          Begin
            if (Prop.PropertyType.ToString = 'TTime') then
            Begin
              if ( Prop.GetValue(TObject(Obj)).AsExtended > 0) then
              Begin
                Result := formatdatetime('hh:nn:ss', Prop.GetValue(TObject(Obj)).AsExtended);
              End;
            End
            else
            Begin
              Result := FloatToStr(Prop.GetValue(TObject(Obj)).AsExtended) ;
              Result := ReplaceStr(Result,',','.');
            End;
          End;
        End;
      End;
    else
      raise Exception.Create('Tipo Não suportado = Não é possivel converter');
  end;
  result := QuotedStr(Result);
End;

class procedure TGenericDAO.SetValues<T>(Obj: T; Prop: TRttiProperty;
  Qry: TFDQuery;Field:String);
Var
  lc_Data, Lc_Hora,Lc_Dia, Lc_Mes, Lc_Ano : String;
Begin
  case Prop.GetValue(TObject(Obj)).Kind of
    tkWChar, tkLString,
    tkWString, tkString,
    tkChar, tkUString:
      Begin
        prop.SetValue(TObject(Obj), Qry.FieldByName(Field).AsString);
      end;
    tkInteger, tkInt64:
      Begin
        prop.SetValue(TObject(Obj), Qry.FieldByName(Field).AsInteger);
      end;
    tkFloat:
      Begin
        if (Prop.PropertyType.ToString = 'TDate') then
        Begin
          prop.SetValue(TObject(Obj), Qry.FieldByName(Field).AsDateTime);
        End
        else
        Begin
          if (Prop.PropertyType.ToString = 'TDateTime') then
          Begin
            prop.SetValue(TObject(Obj), Qry.FieldByName(Field).AsDateTime);
          End
          else
          Begin
            if (Prop.PropertyType.ToString = 'TTime') then
            Begin
              prop.SetValue(TObject(Obj), Qry.FieldByName(Field).AsDateTime);
            End
            else
              prop.SetValue(TObject(Obj), Qry.FieldByName(Field).AsFloat);
          End;
        End;
      End;
    else
      raise Exception.Create('Tipo Não suportado = Não é possivel converter');
  end;
end;

class function TGenericDAO._Select<T>(Obj: T; Fields:String):String;
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
  try
    strSelect := 'Select ';
    strFields := '';
    strWhere := ' Where ';
    strKeyField := '';
    strKeyValue := '';
    Lc_IndKey := 0;
    Contexto := TRttiContext.Create;
    TypObj := Contexto.GetType(TObject(Obj).ClassInfo);
    for Prop in TypObj.GetProperties do begin
      for Atributo in Prop.GetAttributes do begin
        if (not Prop.GetValue(TObject(Obj)).IsEmpty) then Begin
          if Atributo is KeyField then Begin
            strKeyField := FieldName(Atributo).Name;
            strKeyValue := TGenericDAO.GetValues(Obj,Prop);
            if ( Lc_IndKey = 0 ) then
              strWhere := strWhere + '( ' + strKeyField + ' = ' + strKeyValue + ' )'
            else
              strWhere := strWhere + ' AND ( ' + strKeyField + ' = ' + strKeyValue + ' )';
            inc(Lc_IndKey);
          End else Begin
            if (Trim(Fields) = '') then Begin
              if Atributo is FieldName then
                strFields := strFields + FieldName(Atributo).Name + ',';
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
  Except on E: Exception do
    _geralog(concat('GenericDao - Select ',E.Message));
  end;
End;

class function TGenericDAO._Insert<T>(Obj: T):String;
var
  Contexto: TRttiContext;
  TypObj: TRttiType;
  Prop: TRttiProperty;
  strInsert, strFields,strParams, strValues: String;
  Atributo: TCustomAttribute;
  Lc_Value : String;
begin
  Try
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
          if (Trim(Lc_Value) <> '''''') and
              (FieldName(Atributo).Name <> 'created_at') and
              (FieldName(Atributo).Name <> 'updated_at') then
          Begin
            strFields := strFields + FieldName(Atributo).Name  + ',';
            strParams := strParams + Lc_Value + ',';
          End;
          if (FieldName(Atributo).Name = 'created_at') then
          Begin
             strFields := strFields + FieldName(Atributo).Name  + ',';
             strParams := strParams + ''''+formatdatetime('yyyy-mm-dd hh:nn:ss', Now)+'''' + ','
          End;
          if (FieldName(Atributo).Name = 'updated_at')  then
          Begin
             strFields := strFields + FieldName(Atributo).Name  + ',';
             strParams := strParams + ''''+formatdatetime('yyyy-mm-dd hh:nn:ss', Now)+'''' + ','
          End;

        end;
      end;
    end;
    strFields := Copy(strFields, 1, Length(strFields) - 1);
    strParams := Copy(strParams, 1, Length(strParams) - 1);
    strInsert := strInsert + ' ( ' + strFields + ' ) VALUES ( ' + strParams + ' );';
    REsult := strInsert;
  Except on E: Exception do
    _geralog(concat('GenericDao - Insert - ',E.Message));
  end;

end;



class function TGenericDAO._Update<T>(Obj: T):String;
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
  Try
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
              if (Trim(Lc_Value) <> '''''') or
                 (FieldName(Atributo).Name = 'updated_at') then
              Begin
                strFields := FieldName(Atributo).Name;
                if (FieldName(Atributo).Name = 'updated_at') then
                  strParams := ''''+ formatdatetime('yyyy-mm-dd hh:nn:ss', Now)+''''
                else
                  strParams := Lc_Value;
                strUpdate := strUpdate + strFields + ' = ' + strParams + ',';
              End
              else
              Begin
                //Quando é branco enviaar null
                if not (FieldName(Atributo).Name = 'created_at') then
                Begin
                  strFields := FieldName(Atributo).Name;
                  strParams := Lc_Value;
                  strUpdate := strUpdate + strFields + ' = null ,';
                End;
              End;
            End
          End;
        end;
      end;
    end;
    strUpdate := Copy(strUpdate, 1, Length(strUpdate) - 1);
    strUpdate := concat(strUpdate, strWhere,';');
    Result := strUpdate;
  Except on E: Exception do
    _geralog(concat('GenericDao - Update - ',E.Message));
  end;
end;


class function TGenericDAO._Delete<T>(Obj: T):String;
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
  Try
    strDelete := 'DELETE FROM ' + GetTableName(Obj) ;
    strWhere := ' Where ';
    Contexto := TRttiContext.Create;
    TypObj := Contexto.GetType(TObject(Obj).ClassInfo);
    Lc_IndKey := 0;
    for Prop in TypObj.GetProperties do begin
      for Atributo in Prop.GetAttributes do begin
        if (not Prop.GetValue(TObject(Obj)).IsEmpty) then Begin
          if Atributo is KeyField then Begin
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
  Except on E: Exception do
    _geralog(concat('GenericDao - Delete - ',E.Message));
  end;

end;

class procedure TGenericDAO._assign<T>(Source, Dest: T);
const
  SKIP_PROP_TYPES = [tkUnknown, tkInterface, tkClass, tkClassRef, tkPointer, tkProcedure];
var
  ctx: TRttiContext;
  rType: TRttiType;
  rProp: TRttiProperty;
  AValue, ASource, ATarget: TValue;
begin
  try
    Assert( Assigned(Source) and Assigned(Dest) , 'Both objects must be assigned');
    ctx := TRttiContext.Create;
    rType := ctx.GetType(Source.ClassInfo);
    ASource := TValue.From<T>(Source);
    ATarget := TValue.From<T>(Dest);

    for rProp in rType.GetProperties do
    begin
      if (rProp.IsReadable) and (rProp.IsWritable) and not (rProp.PropertyType.TypeKind in SKIP_PROP_TYPES) then
      begin
        //when copying visual controls you must skip some properties or you will get some exceptions later
        if SameText(rProp.Name, 'Name') or (SameText(rProp.Name, 'WindowProc')) then
          Continue;
        AValue := rProp.GetValue(ASource.AsObject);
        rProp.SetValue(ATarget.AsObject, AValue);
      end;
    end;
  Except
    on e:Exception do
      ShowException(E,e.ClassInfo);

  end;
end;

class function TGenericDAO._Clear<T>(Obj: T):String;
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

class function TGenericDAO._getNextByField<T>(Obj: T; Field: String;Intitution: Integer): String;
var
  strSelect: String;
begin
  strSelect := concat(
                'SELECT MAX(',Field,') ', Field,
                ' FROM ' + GetTableName(Obj)
                );
  if Intitution > 0 then
    strSelect := concat(strSelect,
                       ' where tb_institution_id = ',
                       IntToStr(Intitution)) ;
  Result := strSelect;
end;


class procedure TGenericDAO._geralog(acesso: string);
var
  Arq : TextFile;
  Data : String;
  LcArq : String;
begin
  {$IFNDEF ANDROID}
  Data := DateToStr(Now);
  Data := StringReplace(Data,'/','-',[rfReplaceAll]);
  LcArq := Concat(ExtractFilePath(ParamStr(0)),'log\',Data ,'.log');
  AssignFile(Arq, LcArq );
  if not FileExists( LcArq ) then
    Rewrite(arq, LcArq)
  else
    Append(arq);
  Writeln(Arq, concat(DateTimeToStr(Now),acesso));
  Writeln(Arq, '');
  CloseFile(Arq);
  {$ENDIF ANDROID}
end;

class function TGenericDAO._getLastInsert<T>(Obj: T):String;
var
  strSelect: String;
begin
  strSelect := 'SELECT MAX(id) id FROM ' + GetTableName(Obj) ;
  Result := strSelect;
end;

class procedure TGenericDAO._get<T>(Qry:TFDQuery;Obj: T);
var
  Contexto: TRttiContext;
  TypObj: TRttiType;
  Prop: TRttiProperty;
  Atributo: TCustomAttribute;
  Lc_Field : String;
begin
  Try
    Contexto := TRttiContext.Create;
    TypObj := Contexto.GetType(TObject(Obj).ClassInfo);
    for Prop in TypObj.GetProperties do
    begin
      for Atributo in Prop.GetAttributes do
      begin
        if Atributo is FieldName then
        begin
          Lc_Field := FieldName(Atributo).Name;
          //Monta o sql com campos preenchidos
          TGenericDAO.SetValues(Obj,Prop,Qry,Lc_Field);
        end;
      end;
    end;
  Except on E: Exception do
    _geralog(concat('GenericDao - get - ',E.Message));
  end;
end;

end.



