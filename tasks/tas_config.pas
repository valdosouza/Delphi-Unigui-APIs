unit tas_config;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_form, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniGUIClasses, uniPanel, Vcl.Menus,
  uniMainMenu, Data.DB, Datasnap.DBClient;

type
  TTasConfig = class(TBaseForm)
    pnl_botton: TUniPanel;
    SB_Apply: TUniSpeedButton;
    SB_Ok: TUniSpeedButton;
    SB_Cancel: TUniSpeedButton;
    pnl_body: TUniPanel;
    procedure SB_OkClick(Sender: TObject);
    procedure SB_CancelClick(Sender: TObject);
    procedure SB_ApplyClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);

  private
    { Private declarations }
  protected
    procedure Save;Virtual;
    procedure ShowData;Virtual;
    function ValidateSave: Boolean;Virtual;
  public
    { Public declarations }
  end;

var
  TasConfig: TTasConfig;

implementation

{$R *.dfm}

{ TTasConfig }

procedure TTasConfig.Save;
begin

end;

procedure TTasConfig.SB_CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TTasConfig.SB_ApplyClick(Sender: TObject);
begin
  if ValidateSave then
    Save;
end;

procedure TTasConfig.SB_OkClick(Sender: TObject);
begin
  inherited;
  if ValidateSave then
  Begin
    Save;
    Close;
  End;
end;

procedure TTasConfig.ShowData;
begin
//
end;

procedure TTasConfig.UniFormShow(Sender: TObject);
begin
  inherited;
  ShowData;
end;

function TTasConfig.ValidateSave: Boolean;
begin
  Result := True;
end;

end.
