unit container_form;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  base_form, FMX.ListBox, FMX.Layouts, FMX.MultiView, FMX.Controls.Presentation,
  FMX.Objects, IdCookieManager, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, System.ImageList, FMX.ImgList;

type
  TContainerForm = class(TBaseForm)
    ToolBar: TToolBar;
    btn_main: TButton;
    MultiViewMain: TMultiView;
    ListBoxMenu: TListBox;
    ListBoxHeader1: TListBoxHeader;
    Lb_Menu: TLabel;
    LayoutContainer: TLayout;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    FActiveForm: TForm;
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure setImages;Override;
    procedure FormatScreen;Override;
  public
    { Public declarations }
    procedure ClearForm;
    procedure FormOpen(aForm: TComponentClass);
  end;

var
  ContainerForm: TContainerForm;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

{ TContainerForm }

procedure TContainerForm.ClearForm;
var
  i: Integer;
begin
  for i := LayoutContainer.ControlsCount - 1 downto 0 do
    LayoutContainer.RemoveObject(LayoutContainer.Controls[i]);

  {$IFDEF ANDROID}
  FActiveForm.DisposeOf;
  {$ENDIF ANDROID}

  {$IFNDEF ANDROID}
  FActiveForm := nil
  {$ENDIF ANDROID}


end;

procedure TContainerForm.FormatScreen;
begin

end;

procedure TContainerForm.FormCreate(Sender: TObject);
begin
  inherited;
  InitVariable;
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

procedure TContainerForm.FormShow(Sender: TObject);
begin
  setImages;
  FormatScreen; //- estou ativando apos a criação do form
  SetVariable;
end;

procedure TContainerForm.InitVariable;
begin
  inherited;
end;

procedure TContainerForm.setImages;
begin

end;

procedure TContainerForm.SetVariable;
begin
  inherited;
end;

end.

