unit das_sale;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_form, uniChart, uniGUIBaseClasses,
  uniGUIClasses, uniPanel, Vcl.Menus, uniMainMenu, Data.DB, Datasnap.DBClient;

type
  TDasSale = class(TBaseForm)
    UniChart1: TUniChart;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DasSale: TDasSale;

implementation

{$R *.dfm}

end.
