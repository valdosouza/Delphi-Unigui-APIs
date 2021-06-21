unit uNfeCM;

interface

uses
  System.SysUtils, System.Classes, uNfeCC, IPPeerClient,
  Datasnap.DSClientRest;

type
  TnfeCM = class(TDataModule)
    DSRestNfe: TDSRestConnection;
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
  nfeCM: TnfeCM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

constructor TnfeCM.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TnfeCM.Destroy;
begin
  FSMClient.Free;
  inherited;
end;

function TnfeCM.GetSMClient: TSMClient;
begin
  if FSMClient = nil then
    FSMClient:= TSMClient.Create(DSRestNfe, FInstanceOwner);
  Result := FSMClient;
end;

end.
