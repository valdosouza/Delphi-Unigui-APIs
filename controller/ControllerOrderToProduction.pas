unit ControllerOrderToProduction;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderToProduction,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      Datasnap.DBClient, Data.DB, System.Generics.Collections, ControllerMerchandise,
      ControllerOrderItem,tblOrderItem, ControllerOrderHasProduction  ;

Type
  TControllerOrderToProduction = Class(TBaseController)

    procedure clear;
  private

  public
    Registro      : TOrderJobToProduction;
    OrderHasProduction : TControllerOrderHasProduction;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function insert:boolean;
    function save:boolean;

  End;

implementation


{ TControllerOrderToBuy }

procedure TControllerOrderToProduction.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderToProduction.Create(AOwner: TComponent);
begin
  inherited;
  Registro      := TOrderJobToProduction.create;
  OrderHasProduction := TControllerOrderHasProduction.Create(self);
end;

destructor TControllerOrderToProduction.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerOrderToProduction.insert: boolean;
begin
  Try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(registro,'id',Registro.Estabelecimento);
    insertObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

function TControllerOrderToProduction.save: boolean;
begin
  Try
    saveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;
end.
