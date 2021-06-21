unit tas_home_app;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  tas_home, System.ImageList, FMX.ImgList, FMX.Effects, FMX.Objects,
  FMX.Controls.Presentation, FMX.Ani, FMX.Layouts;

type
  TTasHomeApp = class(TTasHome)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TasHomeApp: TTasHomeApp;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

end.
