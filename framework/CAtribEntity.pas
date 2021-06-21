unit CAtribEntity;

interface
  //atributo para determinar o nome da tabela na entidade a ser usada
  type //nome da tabela
    TableName = class(TCustomAttribute)
      private
        FName: String;
      public
        constructor Create(aName: String);
        property Name: String read FName write FName;
  end;

  type //determinar se o campo é um campo chave
    KeyField = class(TCustomAttribute)
      private
        FName: String;
      public
        constructor Create(aName: String);
        property Name: String read FName write
        FName;
  end;

  type //nome do campo na tabela
    FieldName = class(TCustomAttribute)
      private
        FName: String;
      public
        constructor Create(aName: String);
        property Name: String read FName write FName;
  end;

implementation

constructor TableName.Create(aName: String);
begin
  FName := aName
end;

constructor KeyField.Create(aName: String);
begin
  FName := aName;
end;

constructor FieldName.Create(aName: String);
begin
  FName := aName;
end;

end.


