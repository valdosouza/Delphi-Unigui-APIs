unit objPaymentTypes;


interface

uses System.SysUtils,System.Generics.Collections, ObjBase,tblPaymentTypes;

Type

  TObjPaymentTypes = Class(TobjBase)
  private
    FForma: TPaymentTypes;
    FDisponivelApp: String;
    procedure SetFForma(const Value: TPaymentTypes);
    procedure setFDisponivelApp(const Value: String);
  public
    constructor Create;Override;
    destructor Destroy;Override;

    property Forma : TPaymentTypes read FForma write SetFForma;
    property DisponivelApp :String read FDisponivelApp write setFDisponivelApp;
  End;


implementation

{ TObjPaymentTypes }

constructor TObjPaymentTypes.Create;
begin
  inherited;
  FForma := TPaymentTypes.Create
end;

destructor TObjPaymentTypes.Destroy;
begin
  {$IFDEF WIN32}
  FForma.DisposeOf;
  {$ENDIF }

end;

procedure TObjPaymentTypes.setFDisponivelApp(const Value: String);
begin
  FDisponivelApp := Value;
end;

procedure TObjPaymentTypes.SetFForma(const Value: TPaymentTypes);
begin
  FForma := Value;
end;

end.
