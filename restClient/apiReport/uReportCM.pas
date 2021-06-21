unit uReportCM;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSClientRest, uReportMediaCC,
  uReportFinancialCC,uReportGeneralCC;

type
  TReportCM = class(TDataModule)
    DSRC_Report: TDSRestConnection;
  private
    FInstanceOwner: Boolean;
    FSMMediaClient: TSMMediaClient;
    FSMFinancialClient: TSMFinancialClient;
    FSMGeneralClient: TSMGeneralClient;
    function GetSMMediaClient: TSMMediaClient;
    function GetSMFinancialClient: TSMFinancialClient;
    function GetSMGeneralClient: TSMGeneralClient;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property SMMediaClient: TSMMediaClient read GetSMMediaClient write FSMMediaClient;
    property SMFinancialClient: TSMFinancialClient read GetSMFinancialClient write FSMFinancialClient;
    property SMGeneralClient: TSMGeneralClient read GetSMGeneralClient write FSMGeneralClient;


end;

var
  ClientModule1: TReportCM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

constructor TReportCM.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TReportCM.Destroy;
begin
  FSMMediaClient.Free;
  FSMFinancialClient.Free;
  FSMGeneralClient.Free;
  inherited;
end;

function TReportCM.GetSMMediaClient: TSMMediaClient;
begin
  if FSMMediaClient = nil then
    FSMMediaClient:= TSMMediaClient.Create(DSRC_Report, FInstanceOwner);
  Result := FSMMediaClient;
end;
function TReportCM.GetSMFinancialClient: TSMFinancialClient;
begin
  if FSMFinancialClient = nil then
    FSMFinancialClient:= TSMFinancialClient.Create(DSRC_Report, FInstanceOwner);
  Result := FSMFinancialClient;
end;
function TReportCM.GetSMGeneralClient: TSMGeneralClient;
begin
  if FSMGeneralClient = nil then
    FSMGeneralClient:= TSMGeneralClient.Create(DSRC_Report, FInstanceOwner);
  Result := FSMGeneralClient;
end;
end.
