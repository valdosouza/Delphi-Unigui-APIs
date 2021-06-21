unit objStockStatement;

interface

uses System.SysUtils,tblStockStatement,ObjBase ;

Type
  TObjStockStatement = Class(TObjBase)
  private
    FMovimento: TStockStatement;
    procedure setFMovimento(const Value: TStockStatement);

  public
      constructor Create;
      destructor Destroy;
      property Movimento : TStockStatement read FMovimento write setFMovimento;
  End;

implementation

constructor TObjStockStatement.Create;
begin
  FMovimento := TStockStatement.create;
end;

destructor TObjStockStatement.Destroy;
begin
  {$IFDEF WIN32}
  FReeAndNil( FMovimento );
  {$ENDIF }

end;


procedure TobjStockStatement.setFMovimento(const Value: TStockStatement);
begin
  FMovimento := Value;
end;

end.
