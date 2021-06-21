unit uReportCM;

interface

uses
  System.SysUtils, System.Classes, uReportCC, IPPeerClient, Datasnap.DSClientRest,
  uReportFinancialCC;

type
  TReportCM = class(TDataModule)
    DSRestReport: TDSRestConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    FInstanceOwner: Boolean;
    FSMClient: TSMRestReport;
    FSMFinancialClient: TSMFinancialClient;
    function GetSMClient: TSMRestReport;
    function GetSMFinancialClient: TSMFinancialClient;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property SMClient: TSMRestReport read GetSMClient write FSMClient;
    property SMFinancialClient: TSMFinancialClient read GetSMFinancialClient write FSMFinancialClient;
end;

var
  ReportCM: TReportCM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

constructor TReportCM.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

procedure TReportCM.DataModuleCreate(Sender: TObject);
begin
  DSRestReport.Host := 'localhost';
end;

destructor TReportCM.Destroy;
begin
  FSMClient.Free;
  inherited;
end;

function TReportCM.GetSMClient: TSMRestReport;
begin
  if FSMClient = nil then
    FSMClient:= TSMRestReport.Create(DSRestReport, FInstanceOwner);
  Result := FSMClient;
end;

function TReportCM.GetSMFinancialClient: TSMFinancialClient;
begin
  Result := FSMFinancialClient;
end;

end.

