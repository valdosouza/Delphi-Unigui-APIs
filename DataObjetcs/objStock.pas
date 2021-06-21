unit objStock;

interface

uses System.SysUtils,tblStock, tblPackage, tblMeasure, tblColor,ObjBase;

Type
  TObjStock = Class(TObjBase)
  private
    FCor: TColor;
    FEstoque: TStock;
    FEmbalagem: TPackage;
    FMedida: TMeasure;
    procedure setFCor(const Value: TColor);
    procedure setFEmbalagem(const Value: TPackage);
    procedure setFEstoque(const Value: TStock);
    procedure setFMedida(const Value: TMeasure);

  public
      constructor Create;
      destructor Destroy;
      property Estoque : TStock read FEstoque write setFEstoque;
      property Embalagem : TPackage read FEmbalagem write setFEmbalagem;
      property Medida : TMeasure read FMedida write setFMedida;
      property Cor : TColor read FCor write setFCor;
  End;

implementation

{ TObjStock }

constructor TObjStock.Create;
begin
  FEstoque := TStock.create;
  FEmbalagem := TPackage.create;
  FMedida := TMeasure.create;
  FCor := TColor.create;
end;

destructor TObjStock.Destroy;
begin
  {$IFDEF WIN32}
  FEstoque.DisposeOf;
  FEmbalagem.DisposeOf;
  FMedida.DisposeOf;
  FCor.DisposeOf;

  {$ENDIF }
end;

procedure TObjStock.setFCor(const Value: TColor);
begin
  FCor := Value;
end;

procedure TObjStock.setFEmbalagem(const Value: TPackage);
begin
  FEmbalagem := Value;
end;

procedure TObjStock.setFEstoque(const Value: TStock);
begin
  FEstoque := Value;
end;

procedure TObjStock.setFMedida(const Value: TMeasure);
begin
  FMedida := Value;
end;

end.
