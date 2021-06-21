unit ControllerInvoiceReturnService;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblInvoiceReturnService, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ObjInvoiceReturnService, ControllerProvisionalReceiptService;

Type
  TControllerInvoiceReturnService= Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TInvoiceReturnService;
    ReciboProvisorio :TControllerProvisionalReceiptService;
    Obj: TObjInvoiceReturnService;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function saveDataObjeto(DObj : TObjInvoiceReturnService):Boolean;
  End;

implementation

{ ControllerInvoiceReturnService}

procedure TControllerInvoiceReturnService.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerInvoiceReturnService.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TInvoiceReturnService.Create;
  ReciboProvisorio := TControllerProvisionalReceiptService.Create(Self);
  Obj :=  TObjInvoiceReturnService.create;
  end;

destructor TControllerInvoiceReturnService.Destroy;
begin
  Obj.Destroy;
  ReciboProvisorio.DisposeOf;
  Registro.dispoSeOf;
  inherited;
end;

function TControllerInvoiceReturnService.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerInvoiceReturnService.saveDataObjeto(
  DObj: TObjInvoiceReturnService): Boolean;
begin
  TRy
    with Obj do
    Begin
      ClonarObj(Retorno,Self.Registro);
      save;

      ClonarObj(ReciboProvisorio,Self.ReciboProvisorio.Registro);
      Self.ReciboProvisorio.save;
    End;
    Result := true;
  except
    Result := False;
  end;
end;

end.
