unit objKickback;

interface

uses System.SysUtils,  ObjBase, tblkickback, System.Generics.Collections;

Type

  TObjKickback = Class (TObjBase)
  private
    FComissao: TKickback;
    procedure setFComissao(const Value: TKickback);

  public
      constructor Create;override;
      destructor Destroy;override;
      property Comissao : TKickback read FComissao write setFComissao;
  End;

implementation

{ TObjKickback }

constructor TObjKickback.Create;
begin
  inherited;
  FComissao := TKickback.Create;
end;

destructor TObjKickback.Destroy;
begin
  {$IFDEF WIN32}
    FComissao.DisposeOf;
    inherited;

  {$ENDIF }
end;

procedure TObjKickback.setFComissao(const Value: TKickback);
begin
  FComissao := Value;
end;

end.
