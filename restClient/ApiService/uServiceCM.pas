unit uServiceCM;

interface

uses
  System.SysUtils, System.Classes, uServicesCC, Datasnap.DSClientRest;

type
  TServiceCM = class(TDataModule)
    DSRC_Service: TDSRestConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    FInstanceOwner: Boolean;
    FSMServicesClient: TSMServicesClient;
    function GetSMServicesClient: TSMServicesClient;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property SMServicesClient: TSMServicesClient read GetSMServicesClient write FSMServicesClient;

end;

var
  ServiceCM: TServiceCM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

constructor TServiceCM.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

procedure TServiceCM.DataModuleCreate(Sender: TObject);
begin
  DSRC_Service.Host := '177.70.22.118';
//  DSRC_Data.Host := 'localhost';
//  DSRC_Data.Host := '192.168.100.24';

end;

destructor TServiceCM.Destroy;
begin
  FSMServicesClient.Free;
  inherited;
end;

function TServiceCM.GetSMServicesClient: TSMServicesClient;
begin
  if FSMServicesClient = nil then
    FSMServicesClient:= TSMServicesClient.Create(DSRC_Service, FInstanceOwner);
  Result := FSMServicesClient;
end;

end.
