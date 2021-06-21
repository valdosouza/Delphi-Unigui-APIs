
unit tas_nf;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_form, uniGUIBaseClasses,
  uniGUIClasses, uniPanel, uniEdit, uniLabel, uniBasicGrid, uniDBGrid,
  uniButton, uniBitBtn, uniSpeedButton, uniPageControl, uniGroupBox, base_registry,
  Vcl.Menus, uniMainMenu, Data.DB, Datasnap.DBClient;

type
  TTasNf = class(TBaseRegistry)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TasNf: TTasNf;

implementation

{$R *.dfm}

end.
