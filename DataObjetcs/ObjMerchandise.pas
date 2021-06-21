unit ObjMerchandise;

interface

uses System.SysUtils, System.Generics.Collections,
     tblMerchandise,tblProduct, tblStock,objbase;

Type
  TObjMerchandise = Class(TObjBase)
  private
    FProduto: TProduct;
    FEstoque: TStock;
    FMercadoria: TMerchandise;
    FEmbalagem: String;
    FMarca: String;
    FMedida: String;
    FSubGrupo: String;
    FGrupo: String;
    procedure setFEmbalagem(const Value: String);
    procedure setFEstoque(const Value: TStock);
    procedure setFGrupo(const Value: String);
    procedure setFMarca(const Value: String);
    procedure setFMedida(const Value: String);
    procedure setFMercadoria(const Value: TMerchandise);
    procedure setFProduto(const Value: TProduct);
    procedure setFSubGrupo(const Value: String);

  public
    constructor Create;override;
    destructor Destroy;override;
    Property Produto : TProduct read FProduto write setFProduto;
    property Mercadoria : TMerchandise read FMercadoria write setFMercadoria;
    property Estoque : TStock read FEstoque write setFEstoque;
    property Grupo : String read FGrupo write setFGrupo;
    property SubGrupo : String read FSubGrupo write setFSubGrupo;
    property Marca  : String read FMarca write setFMarca;
    property Embalagem  : String read FEmbalagem write setFEmbalagem;
    property Medida  : String read FMedida write setFMedida;
  End;

implementation
{ TObjMerchandise }

constructor TObjMerchandise.Create;
begin
  inherited;
  FProduto := TProduct.Create;
  FMercadoria := TMerchandise.Create;
  FEstoque := TStock.Create;
end;

destructor TObjMerchandise.Destroy;
begin
  {$IFDEF WIN32}
  FProduto.DisposeOf;
  FMercadoria.DisposeOf;
  FEstoque.DisposeOf;
  {$ENDIF }
end;

procedure TObjMerchandise.setFEmbalagem(const Value: String);
begin
  FEmbalagem := Value;
end;

procedure TObjMerchandise.setFEstoque(const Value: TStock);
begin
  FEstoque := Value;
end;

procedure TObjMerchandise.setFGrupo(const Value: String);
begin
  FGrupo := Value;
end;

procedure TObjMerchandise.setFMarca(const Value: String);
begin
  FMarca := Value;
end;

procedure TObjMerchandise.setFMedida(const Value: String);
begin
  FMedida := Value;
end;

procedure TObjMerchandise.setFMercadoria(const Value: TMerchandise);
begin
  FMercadoria := Value;
end;

procedure TObjMerchandise.setFProduto(const Value: TProduct);
begin
  FProduto := Value;
end;

procedure TObjMerchandise.setFSubGrupo(const Value: String);
begin
  FSubGrupo := Value;
end;

end.
