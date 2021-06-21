unit fm_BaseFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame,uniSpeedButton, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, GenericDao;

type
  TFmBaseFrame = class(TUniFrame)
    procedure buttonIcon(button:TUniSpeedButton;name:String);
    procedure UniFrameCreate(Sender: TObject);
  private
  protected
    procedure setVariable;virtual;
    procedure setImages;Virtual;
    procedure InitVariable;Virtual;
    procedure FormatScreen;Virtual;
    Procedure geralog(acesso : string);
  public

  end;

implementation

uses
  UnitConstantes,
  ClasseUtil
  ;

{$R *.dfm}

procedure TFmBaseFrame.buttonIcon(button: TUniSpeedButton; name: String);
var
  PathArq : string;
begin
  PathArq := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios','Publico');
  PathArq   := concat(PathArq, 'images/btn/',name);
  try
    if FileExists(PathArq) then
      button.Glyph.LoadFromFile(PathArq);
  except
    on E: Exception do
    geralog(e.Message)
  end;
end;


procedure TFmBaseFrame.FormatScreen;
begin
  //
end;

procedure TFmBaseFrame.geralog(acesso: string);
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

procedure TFmBaseFrame.InitVariable;
begin
  //
end;

procedure TFmBaseFrame.setImages;
begin
  //
end;

procedure TFmBaseFrame.setVariable;
begin
  //
end;

procedure TFmBaseFrame.UniFrameCreate(Sender: TObject);
begin
  InitVariable;
  setVariable;
  setImages;
end;

end.
