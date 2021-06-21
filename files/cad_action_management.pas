unit cad_action_management;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.StdCtrls, Vcl.Menus,
  uniMainMenu, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniGUIClasses, uniPanel;

type
  TCadActionManagement = class(TBaseRegistry)
    Edit1: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadActionManagement: TCadActionManagement;

implementation

{$R *.dfm}

end.
