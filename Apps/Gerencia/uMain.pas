unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  container_form, FMX.ListBox, FMX.Layouts, FMX.MultiView,System.IniFiles,
  FMX.Controls.Presentation, FMX.Objects, IdCookieManager, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Fmx.DialogService,
   UnFunctions, System.ImageList,
  FMX.ImgList, IdIntercept, IdLogBase, IdLogEvent,tblCrashlytics,
  {$IFDEF ANDROID}
  FMX.Helpers.Android,
 {$ENDIF ANDROID}
   REST.Json,System.Json,cad_user, FMX.Ani, ACBrBase, ACBrValidador;




type
  TMain = class(TContainerForm)
    MnuPutrchase: TListBoxItem;
    MnuSale: TListBoxItem;
    MnuStock: TListBoxItem;
    MnuCashier: TListBoxItem;
    MnuFinancial: TListBoxItem;
    MnuClose: TListBoxItem;
    MnuConfig: TListBoxItem;
    ACBrValidador1: TACBrValidador;
    procedure MnuLoginClick(Sender: TObject);
    procedure MnuCloseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MnuPutrchaseClick(Sender: TObject);
    procedure MnuSaleClick(Sender: TObject);
    procedure MnuStockClick(Sender: TObject);
    procedure MnuFinancialClick(Sender: TObject);
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

uses MainModule, openForms, uDataCM, sea_web_order_sale;
{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TMain.CloseApp;
begin
  SetConfigINI('MOBILE','LOGADO','N');
  UMM.GInstitution.clear;
  GbUser :=0;
  Self.close;
end;

procedure TMain.FormatScreen;
begin
  ClearForm;
  Lb_NameUSer.Text := GbNameUser;
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

procedure TMain.MnuLoginClick(Sender: TObject);
begin
  LoadCadUSer(GbUser);
end;

procedure TMain.MnuPutrchaseClick(Sender: TObject);
begin
  inherited;
  validaAbertura;
end;

procedure TMain.MnuSaleClick(Sender: TObject);
begin
  inherited;
  FormOpen(TSeaWebOrderSale)
end;

procedure TMain.MnuStockClick(Sender: TObject);
begin
  inherited;
  validaAbertura;
end;

procedure TMain.MnuCloseClick(Sender: TObject);
begin
  CloseApp;
end;

procedure TMain.MnuFinancialClick(Sender: TObject);
begin
  inherited;
  validaAbertura;
end;

procedure TMain.setImages;
begin
  inherited;

end;

procedure TMain.SetVariable;
begin
  inherited;

end;

function TMain.validaAbertura: Boolean;
begin
  REsult := True;
  TDialogService.PreferredMode := TDialogService.TPreferredMode.Platform;
  TDialogService.ShowMessage(
        concat('A T E N Ç Ã O!',
               Char(10),Char(13),Char(10),Char(13),
               'Tela em Desenvolvimento.',Char(10),
               'Informe seu interesse para avaliarmos.',
               Char(10),Char(13)
              )
        );
end;

end.
