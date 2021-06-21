unit ControllerInvoiceService;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblInvoiceService, tblEntity, FireDAC.Comp.Client,Md5,
      FireDAC.Stan.Param,ControllerInvoice,ControllerOrderItemIssqn ;

Type
  TControllerInvoiceService= Class(TControllerInvoice)
    procedure clear;
  private
    FItemsIssqn : TControllerOrderItemIssqn;

  public
    Registro : TInvoiceService;


    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;

  End;

implementation

{ ControllerInvoiceService}

procedure TControllerInvoiceService.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerInvoiceService.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TInvoiceService.Create
  end;

destructor TControllerInvoiceService.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerInvoiceService.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
