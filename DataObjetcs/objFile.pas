unit objFile;

interface

uses System.SysUtils, ObjBase;

Type

  TObjFile = Class(TObjBase)
  private
    FFileName: String;
    FFolderName: String;
    FContent: String;
    procedure setFContent(const Value: String);
    procedure setFFileName(const Value: String);
    procedure setFFolderName(const Value: String);

  public
    property FileName : String read FFileName write setFFileName;
    property FolderName : String read FFolderName write setFFolderName;
    property Content : String read FContent write setFContent;
  End;

implementation


{ TObjFile }

procedure TObjFile.setFContent(const Value: String);
begin
  FContent := Value;
end;

procedure TObjFile.setFFileName(const Value: String);
begin
  FFileName := Value;
end;

procedure TObjFile.setFFolderName(const Value: String);
begin
  FFolderName := Value;
end;

end.
