unit ControllerProvisionalReceiptService;


interface
uses System.Classes, System.SysUtils,BaseController,
      tblProvisionalReceiptService, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerProvisionalReceiptService= Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TProvisionalReceiptService;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
  End;

implementation

{ TControllerProvisionalReceiptService }

procedure TControllerProvisionalReceiptService.clear;
begin
  clearObj(Registro);
end;

constructor TControllerProvisionalReceiptService.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TProvisionalReceiptService.Create;
end;

destructor TControllerProvisionalReceiptService.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;

function TControllerProvisionalReceiptService.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := True;
  finally
    Result := False;
  end;
end;

end.
