unit ControllerRestMenuHasProduct;

interface

uses
  System.Classes, System.SysUtils, System.Variants, FireDAC.Comp.Client,
  FireDAC.Stan.Param,  tblRestMenuHasProduct,
  tblentitySeq,
  BaseController;

Type
  TControllerRestMenuHasProduct = Class(TBaseController)

  private

  public
    Registro : TRestMenuHasProduct;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function isnert:boolean;
    function update:boolean;
    function Save:boolean;
  End;

implementation


{ TControllerRestMenuHasProduct }

uses ControllerEntity;


constructor TControllerRestMenuHasProduct.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TRestMenuHasProduct.Create;
end;

destructor TControllerRestMenuHasProduct.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;


function TControllerRestMenuHasProduct.isnert: boolean;
begin
  try
    insertObj(Registro);
    REsult := true;
  Except
    REsult := FAlse;
  end;
end;

function TControllerRestMenuHasProduct.Save: boolean;
begin
  try
    saveObj(Registro);
    REsult := true;
  Except
    REsult := FAlse;
  end;
end;

function TControllerRestMenuHasProduct.update: boolean;
begin
  try
    updateObj(Registro);
    REsult := true;
  Except
    REsult := FAlse;
  end;
end;

end.
