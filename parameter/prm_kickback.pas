unit prm_kickback;

interface

uses TypesCollection, System.SysUtils, prm_base, tblkickback ;

Type
  TPrmKickback = class(TPrmBase)
  private
    FComissao: TKickback;
    procedure setFcomissao(const Value: TKickback);
  public
    constructor Create;override;
    destructor Destroy;override;
    property Comissao : TKickback read FComissao write setFcomissao;
  end;


implementation

{ TPrmKickback }

constructor TPrmKickback.Create;
begin
  inherited;
  FComissao := TKickback.Create;
  FComissao.RegistroCriado := 0;
  FComissao.RegistroAlterado := 0;

end;

destructor TPrmKickback.Destroy;
begin
  FComissao.DisposeOf;
  inherited;
end;

procedure TPrmKickback.setFcomissao(const Value: TKickback);
begin
  FComissao := Value;
end;

end.
