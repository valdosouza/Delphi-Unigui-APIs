unit usplash;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, base_form,
  FMX.Objects, FMX.Layouts, System.ImageList, FMX.ImgList, FMX.StdCtrls,
  FMX.Ani, FMX.Controls.Presentation, System.Actions, FMX.ActnList,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView;
type
  Tsplash = class(TBaseForm)
    Image1: TImage;
    Timer: TTimer;
    procedure TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Paint(Sender: TObject; Canvas: TCanvas;
      const ARect: TRectF);
  private
    { Private declarations }
    FInitialized : Boolean;


  protected
    procedure InitVariable;override;

  public
    { Public declarations }
  end;

var
  splash: Tsplash;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

uses MainModule, UnFunctions;


//uses MainModule, UnFunctions, uMain, uLogin;


procedure Tsplash.FormCreate(Sender: TObject);
begin
  Timer.Enabled := False;
  Timer.Interval := 2000;
  InitVariable;
end;

procedure Tsplash.Image1Paint(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
begin
  Timer.Enabled := not FInitialized;
end;



procedure Tsplash.InitVariable;
begin
  if ( GetConfigINI('MOBILE','LOGADO') = 'S' ) then
  Begin
    if (GetConfigINI('MOBILE','TRUST') = 'S' ) then
    Begin
      GbNameUser    := GetConfigINI('MOBILE','NAMEUSER');
      GbUser        := StrToIntDef(GetConfigINI('MOBILE','GBUSER'),0);
      UMM.GInstitution.Registro.Codigo := StrToIntDef(GetConfigINI('MOBILE','GBINSTITUTION'),0);
      GbSalesMan    := StrToIntDef(GetConfigINI('MOBILE','VENDEDOR'),0);
      GbTerminal    := StrToIntDef(GetConfigINI('MOBILE','GBTERMINAL'),0);
    End;
  End;
end;

procedure Tsplash.TimerTimer(Sender: TObject);
begin
  Timer.Enabled := True;
  if not FInitialized then
  Begin
    FInitialized := True;
    if GbUser > 0 then
      LoadMainForm
    else
      LoadLoginForm;
  End;
end;

end.
