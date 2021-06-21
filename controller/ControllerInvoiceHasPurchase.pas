unit ControllerInvoiceHasPurchase;

interface

uses System.Classes, System.SysUtils,BaseController,
      tblOrderToDeliver,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      Datasnap.DBClient, Data.DB, System.Generics.Collections, tblInvoiceHasPurchase  ;

Type
  TControllerInvoiceHasPurchase = Class(TBaseController)
    procedure clear;
  private

  public
    Registro    : TInvoiceHasPurchase;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function getByKey:Boolean;
    function Insert:boolean;
  End;

implementation

{TControllerInvoiceHasPurchase }


procedure TControllerInvoiceHasPurchase.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerInvoiceHasPurchase.Create(AOwner: TComponent);
begin
  inherited;
  Registro    := TInvoiceHasPurchase.Create;
end;

destructor TControllerInvoiceHasPurchase.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerInvoiceHasPurchase.Insert: boolean;
begin
  Try
    insertObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerInvoiceHasPurchase.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.
