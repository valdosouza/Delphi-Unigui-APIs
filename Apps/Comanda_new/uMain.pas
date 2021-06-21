unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  container_form, FMX.ListBox, FMX.Layouts, FMX.MultiView,System.IniFiles,
  FMX.Controls.Presentation, FMX.Objects, IdCookieManager, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Fmx.DialogService,
   UnFunctions,  System.ImageList,
  FMX.ImgList, tas_config, IdIntercept, IdLogBase, IdLogEvent,tblCrashlytics,
  {$IFDEF ANDROID}
  FMX.Helpers.Android,
 {$ENDIF ANDROID}
   REST.Json,System.Json,sea_command;




type
  TMain = class(TContainerForm)
    Rectangle1: TRectangle;
    Image1: TImage;
    MnuLogin: TListBoxItem;
    MnuOrder: TListBoxItem;
    MnuClose: TListBoxItem;
    MnuConfig: TListBoxItem;
    procedure MnuOrderClick(Sender: TObject);
    procedure MnuCloseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    function validaAbertura : Boolean;
  protected
    procedure InitVariable;override;
    procedure SetVariable;override;
    procedure FormatScreen;override;
    procedure setImages;override;
    procedure CloseApp;
  public
    { Public declarations }

  end;

var
  Main: TMain;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TMain.CloseApp;
begin
  SetConfig('MOBILE','LOGADO','N');
  GbInstitution := 0;
  GbUser :=0;
  Self.close;
end;

procedure TMain.FormatScreen;
begin
  ClearForm;
  MnuLogin.Text := GbNameUser;
end;

procedure TMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if MessageDlg('Deseja sair do Aplicativo?',
                TMsgDlgType.mtConfirmation,[TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo],
                0, TMsgDlgBtn.mbNo) = mrYes  then
  begin
    CanClose := True;
    //lf.Close;
  end
  else
  begin
    CanClose := False;
  end;
end;

procedure TMain.InitVariable;
begin
  inherited;
end;

procedure TMain.MnuOrderClick(Sender: TObject);
begin
  if validaAbertura  then
    FormOpen(TSeaCommand)
end;

procedure TMain.MnuCloseClick(Sender: TObject);
begin
  CloseApp;
end;

procedure TMain.setImages;
begin
  inherited;

end;

procedure TMain.SetVariable;
begin
  inherited;
//  FormOpen(TTasShortCut);
end;

function TMain.validaAbertura: Boolean;
begin
  REsult := True;
 if not ( GetConfig('MOBILE','SYNCRONIA') = 'S') then
 BEgin
  Result := False;
  TDialogService.PreferredMode := TDialogService.TPreferredMode.Platform;
  TDialogService.ShowMessage(
        concat('A T E N Ç Ã O!',
               Char(10),Char(13),Char(10),Char(13),
               'Efetue a primeira sincronia',Char(10),
               'antes de continuar.',
               Char(10),Char(13),
              'Verifique e tente novamente'
              )
        );
 End;
end;

end.
