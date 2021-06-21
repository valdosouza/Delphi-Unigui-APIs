unit base_list_Registry;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, uniGUIClasses,
  uniBasicGrid, uniDBGrid, Vcl.Menus, uniMainMenu, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniPanel, Data.DB, Datasnap.DBClient;

type
  TBaseListRegistry = class(TBaseRegistry)
    UniPanel1: TUniPanel;
    dbg_list: TUniDBGrid;
    cds_Items: TClientDataSet;
    ds_search: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BaseListRegistry: TBaseListRegistry;

implementation

{$R *.dfm}

end.
