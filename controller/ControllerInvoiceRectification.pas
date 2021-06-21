unit ControllerInvoiceRectification;

interface
uses System.Classes, System.SysUtils,BaseController,ObjInvoiceRectification,
      tblInvoiceRectification,  FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerInvoiceRectification= Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TInvoiceRectification;
    Obj: TObjInvoiceRectification;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
  End;

implementation

{ unit ControllerInvoiceRectification}

procedure TControllerInvoiceRectification.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerInvoiceRectification.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TInvoiceRectification.Create;
  Obj := TObjInvoiceRectification.create;
end;

destructor TControllerInvoiceRectification.Destroy;
begin
  Obj.Destroy;
  Registro.dispoSeOf;
  inherited;
end;

function TControllerInvoiceRectification.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
