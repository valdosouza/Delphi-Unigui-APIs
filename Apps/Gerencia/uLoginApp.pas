unit uLoginApp;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.ImageList, FMX.ImgList, FMX.StdCtrls, FMX.Edit, FMX.Objects,
  FMX.Controls.Presentation, FMX.Ani, FMX.Layouts, uLogin;

type
  TLoginApp = class(TLogin)
  private
    { Private declarations }
  protected
    function posAuthentication:boolean;Override;
  public
    { Public declarations }
  end;

var
  LoginApp: TLoginApp;

implementation

{$R *.fmx}

{ TLoginApp }

function TLoginApp.posAuthentication: boolean;
begin
  Result := True;
end;

end.
