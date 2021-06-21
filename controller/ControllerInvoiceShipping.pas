unit ControllerInvoiceShipping;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblInvoiceShipping, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerInvoiceShipping = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TInvoiceShipping;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function delete:boolean;
    function getByKey:boolean;

  End;

implementation

{ ControllerInvoiceShipping}

procedure TControllerInvoiceShipping.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerInvoiceShipping.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TInvoiceShipping.Create
end;

function TControllerInvoiceShipping.delete: boolean;
begin
  deleteobj(Registro)
end;

destructor TControllerInvoiceShipping.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;

function TControllerInvoiceShipping.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerInvoiceShipping.getByKey: boolean;
begin
  _getByKey(Registro);
end;

end.

