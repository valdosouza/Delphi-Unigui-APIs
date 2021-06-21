unit ControllerOrderHasPurchase;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderHasPurchase,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerOrderHasPurchase = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TOrderHasPurchase;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function insert:boolean;
    function update:boolean;
    function save:boolean;

  End;

implementation


{ TControllerOrderHasPurchase }

procedure TControllerOrderHasPurchase.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderHasPurchase.Create(AOwner: TComponent);
begin
  inherited;
Registro := TOrderHasPurchase.Create;
end;

destructor TControllerOrderHasPurchase.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerOrderHasPurchase.insert: boolean;
begin
  Try
    insertObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

function TControllerOrderHasPurchase.save: boolean;
begin
  Try
    saveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerOrderHasPurchase.update: boolean;
begin
  Try
    Result := UpdateObj(Registro);
  Except
    Result := False;
  End;

end;

end.
