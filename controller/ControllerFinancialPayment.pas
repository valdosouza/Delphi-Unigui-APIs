unit ControllerFinancialPayment;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblFinancialPayment, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerFinancialPayment= Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TFinancialPayment;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function delete:Boolean;
    function getByKey:Boolean;

  End;

implementation

{ ControllerFinancialPayment }

procedure TControllerFinancialPayment.clear;
begin
  clearObj(Registro);
end;

constructor TControllerFinancialPayment.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TFinancialPayment.Create;
  end;

function TControllerFinancialPayment.delete: Boolean;
begin
  try
    deleteObj(Registro);
    Result := True;
  except
    REsult := False;
  end;
end;

destructor TControllerFinancialPayment.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerFinancialPayment.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerFinancialPayment.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.
