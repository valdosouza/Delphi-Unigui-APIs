unit cad_called;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  Data.DB, Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniGUIClasses, uniPanel,controllerIteration;

type
  TCadCalled = class(TBaseRegistry)
  private
    { Private declarations }
  public
    { Public declarations }
    Iteration : TcontrollerIteration;
    NumeroAtendimento : Integer;

  end;

var
  CadCalled: TCadCalled;

implementation

{$R *.dfm}

end.
