unit ctn_config;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  container_form, FMX.ListBox, FMX.Layouts, FMX.MultiView, FMX.Objects,
  FMX.Controls.Presentation, tas_sincronize;

type
  TCtnConfig = class(TContainerForm)
    MnuClose: TListBoxItem;
    procedure MnuCloseClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure InitVariable;Override;
  public
    { Public declarations }
  end;

var
  CtnConfig: TCtnConfig;

implementation

{$R *.fmx}


uses MainModule;

procedure TCtnConfig.InitVariable;
begin
end;

procedure TCtnConfig.MnuCloseClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

end.
