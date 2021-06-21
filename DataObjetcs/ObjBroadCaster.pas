unit ObjBroadCaster;

interface

uses objEntityFiscal, tblAdvertiser, tblBroadcaster, objBase;

Type

  TObjBroadCaster = Class(TObjBase)
  private
    FVeiculoCom: TBroadcaster;
    FFiscal: TObjEntityFiscal;
    procedure setFFiscal(const Value: TObjEntityFiscal);
    procedure setFVeiculoCom(const Value: TBroadcaster);



  public
      constructor Create;
      destructor Destroy;
      property VeiculoCom : TBroadcaster read FVeiculoCom write setFVeiculoCom;
      property Fiscal : TObjEntityFiscal read FFiscal write setFFiscal;
  End;


implementation

{ TObjBroadCaster }

constructor TObjBroadCaster.Create;
begin
  FVeiculoCom := TBroadcaster.Create;
  Fiscal := TObjEntityFiscal.Create;
end;

destructor TObjBroadCaster.Destroy;
begin
  FVeiculoCom.DisposeOf;
  Fiscal.DisposeOf;
end;

procedure TObjBroadCaster.setFFiscal(const Value: TObjEntityFiscal);
begin
  FFiscal := Value;
end;

procedure TObjBroadCaster.setFVeiculoCom(const Value: TBroadcaster);
begin
  FVeiculoCom := Value;
end;

end.
