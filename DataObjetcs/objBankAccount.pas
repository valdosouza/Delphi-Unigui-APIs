unit objBankAccount;

interface

uses tblBankAccount, ObjBase;

Type

  TObjBankAccount = Class(TObjBase)
  private
    FContaCorrente: TBAnkAccount;
    FNumeroBanco: String;
    procedure setFContaCorrente(const Value: TBAnkAccount);
    procedure setFNumeroBanco(const Value: String);

  public
      constructor Create;override;
      destructor Destroy;override;
      property NumeroBanco  : String read FNumeroBanco write setFNumeroBanco;
      property ContaCorrente : TBAnkAccount read FContaCorrente write setFContaCorrente;
  End;

implementation

{ TObjBankAccount }

constructor TObjBankAccount.Create;
begin
  inherited;
  FContaCorrente := TBAnkAccount.create;
end;

destructor TObjBankAccount.Destroy;
begin
  {$IFDEF WIN32}
  FContaCorrente.DisposeOf;
  {$ENDIF }


end;


procedure TObjBankAccount.setFContaCorrente(const Value: TBAnkAccount);
begin
  FContaCorrente := Value;
end;

procedure TObjBankAccount.setFNumeroBanco(const Value: String);
begin
  FNumeroBanco := Value;
end;

end.
