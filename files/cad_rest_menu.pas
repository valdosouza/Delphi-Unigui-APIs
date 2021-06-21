unit cad_rest_menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_form, Vcl.Menus, uniMainMenu,
  Data.DB, Datasnap.DBClient;

type
  TCadRestMenu = class(TBaseForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadRestMenu: TCadRestMenu;

implementation

{$R *.dfm}

end.
