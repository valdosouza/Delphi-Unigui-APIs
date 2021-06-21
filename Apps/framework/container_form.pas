unit container_form;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  base_form, FMX.ListBox, FMX.Layouts, FMX.MultiView, FMX.Controls.Presentation,
  FMX.Objects, IdCookieManager, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, System.ImageList, FMX.ImgList, FMX.Ani,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView;

type
  TContainerForm = class(TBaseForm)
    ToolBar: TToolBar;
    btn_main: TButton;
    MultiViewMain: TMultiView;
    ListBoxMenu: TListBox;
    Lb_Menu: TLabel;
    LayoutContainer: TLayout;
    Image2: TImage;
    MnuHeader: TListBoxItem;
    Rc_MnuHeader: TRectangle;
    Ly_MnuHeader: TLayout;
    img_Perfil: TImage;
    Lb_NameUSer: TLabel;

    procedure Lb_NameUSerClick(Sender: TObject);
  private
    { Private declarations }
  protected
    FActiveForm: TForm;
    FActiveFrame: TFrame;

  public
    { Public declarations }
    procedure ClearForm;
    procedure FormOpen(aForm: TComponentClass);

    //procedure FrameOpen(aframe: TComponentClass);
  end;

var
  ContainerForm: TContainerForm;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

uses MainModule;


{ TContainerForm }

procedure TContainerForm.ClearForm;
var
  i: Integer;
begin
  for i := LayoutContainer.ControlsCount - 1 downto 0 do
    LayoutContainer.RemoveObject(LayoutContainer.Controls[i]);

  {$IFDEF ANDROID}
  //FActiveForm.DisposeOf;
  {$ENDIF ANDROID}

  {$IFNDEF ANDROID}
  //FActiveForm := nil
  {$ENDIF ANDROID}


end;

procedure TContainerForm.FormOpen(aForm: TComponentClass);
begin
  Try
    Try
      if (FActiveForm = nil) or (Assigned(FActiveForm) and
        (FActiveForm.ClassName <> aForm.ClassName)) then
      begin
        ClearForm;
        Application.CreateForm(aForm, FActiveForm);
        FActiveForm.Parent := Self;
        LayoutContainer.AddObject(TLayout(FActiveForm.FindComponent('LayoutMain')));
      end;
    Except
      on E:Exception do
        ClearForm;
    End;
  Finally
    MultiViewMain.HideMaster;
  End;
end;

procedure TContainerForm.Lb_NameUSerClick(Sender: TObject);
begin
  inherited;
  LoadCadUSer(GbUser);
end;



end.





