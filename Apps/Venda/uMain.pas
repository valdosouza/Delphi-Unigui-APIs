unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  container_form, FMX.ListBox, FMX.Layouts, FMX.MultiView,System.IniFiles,
  FMX.Controls.Presentation, FMX.Objects, IdCookieManager, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Fmx.DialogService,
   UnFunctions, sea_customer, sea_product, sea_order_sale, System.ImageList,
  FMX.ImgList, tas_config, IdIntercept, IdLogBase, IdLogEvent,tblCrashlytics,
  {$IFDEF ANDROID}
  FMX.Helpers.Android,
  FMX.Platform.Android,
 {$ENDIF ANDROID}
   REST.Json,System.Json,cad_user, ctrl_mob_customer, sea_order_consignment,
  fm_sea_product,ctrl_mob_salesman_has_stock, ctrl_mob_stock_list, FMX.Ani,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView;



type
  TMain = class(TContainerForm)
    MnuHome: TListBoxItem;
    MnuOrder: TListBoxItem;
    MnuCustomer: TListBoxItem;
    MnuProduct: TListBoxItem;
    MnuCashier: TListBoxItem;
    MnuSync: TListBoxItem;
    MnuClose: TListBoxItem;
    MnuConfig: TListBoxItem;
    MnuConsigna: TListBoxItem;
    MnuKickBack: TListBoxItem;
    procedure MnuOrderClick(Sender: TObject);
    procedure MnuCustomerClick(Sender: TObject);
    procedure MnuProductClick(Sender: TObject);
    procedure MnuCashierClick(Sender: TObject);
    procedure MnuSyncClick(Sender: TObject);
    procedure MnuConfigClick(Sender: TObject);
    procedure MnuConsignaClick(Sender: TObject);
    procedure MnuKickBackClick(Sender: TObject);
    procedure MnuHomeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MnuCloseClick(Sender: TObject);
  private
    { Private declarations }
    function validaAbertura : Boolean;
     procedure ExceptionHandler( Sender : TObject; E : Exception );
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

uses MainModule, openForms, tas_order_sale,   tas_home,
  tas_sincronize, sea_cashier, uDataCM, sea_kickback;
{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TMain.CloseApp;
begin
  SetConfigINI('MOBILE','LOGADO','N');
  UMM.GInstitution.clear;
  GbUser :=0;
  Self.close;
end;

procedure TMain.ExceptionHandler(Sender: TObject; E: Exception);
begin
  GeralogCrashlytics(TComponent(Sender).Name,e.ToString);
end;

procedure TMain.FormatScreen;
begin
  ClearForm;
  Lb_NameUSer.Text := GbNameUser;
end;

procedure TMain.FormCreate(Sender: TObject);
begin
  SetVariable;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  FormOpen(TtasHome);
end;

procedure TMain.InitVariable;
begin
  hideProcess;
  GbVersion := StrToIntDef(GetConfigINI('MOBILE','VERSION'),0);
  if ( GbVersion = 0 ) then
  Begin
    GbVersion := 1;
    SetConfigINI('MOBILE','VERSION',IntToStr(GbVersion));
  End;
end;

procedure TMain.MnuOrderClick(Sender: TObject);
begin
  if validaAbertura  then
    FormOpen(TSeaOrderSale)
end;

procedure TMain.MnuCustomerClick(Sender: TObject);
begin
  if validaAbertura then
    FormOpen(TSeaCustomer)
end;

procedure TMain.MnuHomeClick(Sender: TObject);
begin
  FormOpen(TtasHome);
end;

procedure TMain.MnuKickBackClick(Sender: TObject);
begin
  FormOpen(TSeaKickback);
end;

procedure TMain.MnuProductClick(Sender: TObject);
begin
  if validaAbertura then
    FormOpen(TSeaProduct)
end;

procedure TMain.MnuCashierClick(Sender: TObject);
begin
  FormOpen(TSeaCashier);
end;

procedure TMain.MnuCloseClick(Sender: TObject);
begin
  CloseApp;
end;

procedure TMain.MnuSyncClick(Sender: TObject);
var
  i: Integer;
  ActiveForm: TForm;
begin
  FormOpen(TTasSincronize);
  {
  try
    for i := LayoutContainer.ControlsCount - 1 downto 0 do
      LayoutContainer.RemoveObject(LayoutContainer.Controls[i]);
    ActiveForm := nil;
    Application.CreateForm(TTasSincronize, ActiveForm );
    FActiveForm.Parent := Self;
    LayoutContainer.AddObject(TLayout(ActiveForm.FindComponent('LayoutMain')));
  Finally
    MultiViewMain.HideMaster;
  End;
  }
end;

procedure TMain.MnuConfigClick(Sender: TObject);
begin
  OpenConfig(0,self);
end;


procedure TMain.MnuConsignaClick(Sender: TObject);
begin
  if validaAbertura  then
    FormOpen(TSeaOrderConsignment)
end;

procedure TMain.setImages;
begin
  inherited;

end;

procedure TMain.SetVariable;
begin
  setInstitution(UMM.GInstitution.Registro.Codigo);
  SetMainStock;
end;

function TMain.validaAbertura: Boolean;
begin
  REsult := True;
  if not ( GetConfigINI('MOBILE','SYNCRONIA') = 'S') then
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
