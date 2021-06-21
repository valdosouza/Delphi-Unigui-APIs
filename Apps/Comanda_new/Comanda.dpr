program Comanda;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {Form1},
  Network in '..\function\Network.pas',
  UnFunctions in '..\function\UnFunctions.pas',
  tblCrashlytics in '..\..\model\tblCrashlytics.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
