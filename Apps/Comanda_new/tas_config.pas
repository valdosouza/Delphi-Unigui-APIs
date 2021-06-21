unit tas_config;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  base_registry, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts,
  FMX.Edit, FMX.ListBox, FMX.DialogService, UnFunctions,
  System.ImageList, FMX.ImgList;

type
  TTasConfig = class(TBaseRegistry)
    Ly_device_print: TLayout;
    Lb_device_print: TLabel;
    Cb_device_print: TComboBox;
    Sb_device_test: TSpeedButton;
    Ly_Buttons: TLayout;
  private
    { Private declarations }

  protected
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure ShowData;override;
    function validateSave:Boolean;Override;
    procedure save;Override;

  public
    { Public declarations }
  end;

var
  TasConfig: TTasConfig;

implementation

{$R *.fmx}

uses MainModule;
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TTasConfig.InitVariable;
begin
  inherited;

end;


procedure TTasConfig.save;
begin

end;

procedure TTasConfig.SetVariable;
begin
  UMM.Print.ListarDispositivos( Cb_device_print);
  inherited;;
end;

procedure TTasConfig.ShowData;
begin
end;

function TTasConfig.validateSave: Boolean;
begin
  REsult := True;
end;

end.

