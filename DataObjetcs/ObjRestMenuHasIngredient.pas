unit ObjRestMenuHasIngredient;

interface

uses System.SysUtils, System.Generics.Collections,
     objbase, tblRestMenuHasIngredient;

Type

  TObjRestMenuHasIngredient = Class(TObjBase)
    private
    FMenu: String;
    FIngredientes: TRestMenuHasIngredient;
    FGrupo: Integer;
    procedure setFIngredientes(const Value: TRestMenuHasIngredient);
    procedure setFMenu(const Value: String);
    procedure setFGrupo(const Value: Integer);

    public
    constructor Create;override;
    destructor Destroy;override;
    property Menu : String read FMenu write setFMenu;
    property Grupo: Integer read FGrupo write setFGrupo;
    property Ingredientes : TRestMenuHasIngredient read FIngredientes write setFIngredientes;

  End;

implementation





{ TObjRestMenuHasIngredient }

constructor TObjRestMenuHasIngredient.Create;
begin
  inherited;
  Ingredientes := TRestMenuHasIngredient.Create;
end;

destructor TObjRestMenuHasIngredient.Destroy;
begin
  Ingredientes.DisposeOf;
  inherited;
end;

procedure TObjRestMenuHasIngredient.setFGrupo(const Value: Integer);
begin
  FGrupo := Value;
end;

procedure TObjRestMenuHasIngredient.setFIngredientes(
  const Value: TRestMenuHasIngredient);
begin
  FIngredientes := Value;
end;

procedure TObjRestMenuHasIngredient.setFMenu(const Value: String);
begin
  FMenu := Value;
end;

end.
