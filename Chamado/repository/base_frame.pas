unit base_frame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniLabel, uniGUIBaseClasses, uniPanel;

type
  TBaseFrame = class(TUniFrame)
    pnl_Top: TUniPanel;
    Lb_Numero: TUniLabel;
  private
    { Private declarations }

  protected
    procedure setVariable;virtual;
    procedure setImages;Virtual;
    procedure InitVariable;Virtual;
    procedure FormatScreen;Virtual;
    Procedure geralog(acesso : string);
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}



{ TBaseFrame }

procedure TBaseFrame.FormatScreen;
begin
  //
end;

procedure TBaseFrame.geralog(acesso: string);
var
  Arq : TextFile;
  Data : String;
  LcArq : String;
begin
  Data := DateToStr(Now);
  Data := StringReplace(Data,'/','-',[rfReplaceAll]);
  LcArq := Concat(ExtractFilePath(ParamStr(0)),'log\',Data ,'.log');
  AssignFile(Arq, LcArq );
  if not FileExists( LcArq ) then
    Rewrite(arq, LcArq)
  else
    Append(arq);
  Writeln(Arq, concat(DateTimeToStr(Now),' - BaseFRame -  ', acesso));
  Writeln(Arq, '');
  CloseFile(Arq);
end;

procedure TBaseFrame.InitVariable;
begin
  //
end;

procedure TBaseFrame.setImages;
begin
  //
end;

procedure TBaseFrame.setVariable;
begin
  //
end;

end.
