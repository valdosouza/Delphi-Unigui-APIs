program RouterClient;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {Form1},
  tblEntity in '..\model\tblEntity.pas',
  MainModule in 'MainModule.pas' {Form2},
  GenericEntity in '..\framework\GenericEntity.pas',
  CAtribEntity in '..\framework\CAtribEntity.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
