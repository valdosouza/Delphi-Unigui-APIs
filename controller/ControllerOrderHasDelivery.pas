unit ControllerOrderHasDelivery;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderHasDelivery,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerOrderHasDelivery = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TOrderHasDelivery;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function insert:boolean;
    function update:boolean;
    function save:boolean;
    function delete:boolean;
  End;

implementation


{ TControllerOrderHasDelivery }

procedure TControllerOrderHasDelivery.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderHasDelivery.Create(AOwner: TComponent);
begin
  inherited;
Registro := TOrderHasDelivery.Create;
end;

function TControllerOrderHasDelivery.delete: boolean;
begin
  deleteObj(Registro)
end;

destructor TControllerOrderHasDelivery.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerOrderHasDelivery.insert: boolean;
begin
  Try
    insertObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

function TControllerOrderHasDelivery.save: boolean;
begin
  Try
    saveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerOrderHasDelivery.update: boolean;
begin
  Try
    Result := UpdateObj(Registro);
  Except
    Result := False;
  End;

end;

end.
