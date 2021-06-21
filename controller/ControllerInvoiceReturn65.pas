unit ControllerInvoiceReturn65;

interface
uses System.Classes, System.SysUtils,BaseController,ObjInvoiceReturn65,
      tblInvoiceReturn65, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerInvoiceReturn65= Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TInvoiceReturn65;
    Obj: TObjInvoiceReturn65;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;

  End;

implementation

{ ControllerInvoiceReturn65 }

procedure TControllerInvoiceReturn65.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerInvoiceReturn65.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TInvoiceReturn65.Create;
  Obj := TObjInvoiceReturn65.create;
end;

destructor TControllerInvoiceReturn65.Destroy;
begin
  Obj.Destroy;
  Registro.DisposeOf;
  inherited;
end;

function TControllerInvoiceReturn65.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


end.

