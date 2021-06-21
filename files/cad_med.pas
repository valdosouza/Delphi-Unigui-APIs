unit cad_med;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel;

type
  TBaseRegistry1 = class(TBaseRegistry)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BaseRegistry1: TBaseRegistry1;

implementation

{$R *.dfm}

end.
