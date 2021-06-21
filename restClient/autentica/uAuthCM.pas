unit uAuthCM;

interface

uses
  System.SysUtils, System.Classes, uAuthCC, Datasnap.DSClientRest, IPPeerClient,
  IniFiles;

type
  TAuthCM = class(TDataModule)
    DSRestAuth: TDSRestConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    FInstanceOwner: Boolean;
    FSMClient: TSMClient;
    function GetSMClient: TSMClient;

    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property SMClient: TSMClient read GetSMClient write FSMClient;
end;

var
  AuthCM: TAuthCM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}


{$R *.dfm}

constructor TAuthCM.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

procedure TAuthCM.DataModuleCreate(Sender: TObject);
Begin
  DSRestAuth.Host := 'localhost';
  DSRestAuth.Port := 224


end;

destructor TAuthCM.Destroy;
begin
  if Assigned(FSMClient) then
    FSMClient.DisposeOf;
  inherited;
end;

function TAuthCM.GetSMClient: TSMClient;
begin
  if FSMClient = nil then
    FSMClient:= TSMClient.Create(DSRestAuth, FInstanceOwner);
  Result := FSMClient;

end;

end.
