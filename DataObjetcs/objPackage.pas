unit objPackage;


interface

uses System.SysUtils,System.Generics.Collections, ObjBase,tblPackage;

Type

  TObjPackage = Class(TobjBase)
  private
    FEmbalagem: TPackage;
    procedure SetFEmbalagem(const Value: TPackage);

  public
    constructor Create;Override;
    destructor Destroy;Override;

    property Embalagem : TPackage read FEmbalagem write SetFEmbalagem;
  End;

implementation

{ TObjPackage }

constructor TObjPackage.Create;
begin
  inherited;
  FEmbalagem := TPackage.Create;
end;

destructor TObjPackage.Destroy;
begin
  {$IFDEF WIN32}
  FEmbalagem.DisposeOf;
  {$ENDIF }

end;

procedure TObjPackage.SetFEmbalagem(const Value: TPackage);
begin
  FEmbalagem := Value;
end;

end.
