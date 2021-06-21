unit objImages;

interface

uses System.SysUtils, ObjBase,  tblimages;

Type

  TObjImages = Class(TObjBase)
  private
    FImages: Timages;
    FContent: String;
    procedure setFContent(const Value: String);
    procedure setFImages(const Value: Timages);

  public
    constructor Create;override;
    destructor Destroy; override;
    property Images : Timages read FImages write setFImages;
    property Content : String read FContent write setFContent;
  End;

implementation

{ TObjImages }

constructor TObjImages.Create;
begin
  Inherited;
  FImages := TImages.Create;
end;

destructor TObjImages.Destroy;
begin
  FImages.DisposeOf;
end;

procedure TObjImages.setFContent(const Value: String);
begin
  FContent := Value;
end;

procedure TObjImages.setFImages(const Value: Timages);
begin
  FImages := Value;
end;

end.
