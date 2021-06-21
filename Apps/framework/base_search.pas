unit base_search;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  base_form, FMX.Layouts, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.Controls.Presentation, Data.DB,
  Datasnap.DBClient, FMX.Edit, FMX.TreeView, FMX.DateTimeCtrls, FMX.ScrollBox,
  FMX.Memo, FMX.ListBox, FMX.TabControl, FMX.Gestures, System.Actions,
  FMX.ActnList, FMX.Objects, FMX.Effects, System.ImageList, FMX.ImgList, FMX.Ani;

type
  TBaseSearch = class(TBaseForm)
    GestureManager1: TGestureManager;
    ActionList: TActionList;
    ChangeTabSearch: TChangeTabAction;
    ChangeTabParametro: TChangeTabAction;
    TabControl: TTabControl;
    tbs_search: TTabItem;
    tbs_parametro: TTabItem;
    Layout1: TLayout;
    Rc_Param_top: TRectangle;
    Layout2: TLayout;
    Label1: TLabel;
    Sb_Apply: TSpeedButton;
    ShadowEffect2: TShadowEffect;
    procedure E_buscaChange(Sender: TObject);
    procedure E_buscaChangeTracking(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Sb_filterClick(Sender: TObject);
    procedure Sb_ApplyClick(Sender: TObject);
  private
    { Private declarations }
  protected
    Page : Integer;
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure setImages;Override;
    procedure FormatScreen;Override;
    procedure openCad;Virtual;

    procedure getHead;Virtual;
    procedure getItem(AItem: TListViewItem);Virtual;
    procedure getlist(par:String);virtual;

  public
    { Public declarations }
  end;

var
  BaseSearch: TBaseSearch;

implementation
{TBaseSearch}

uses MainModule, UnFunctions;
{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TBaseSearch.E_buscaChange(Sender: TObject);
begin
  inherited;
  getlist('');
end;

procedure TBaseSearch.E_buscaChangeTracking(Sender: TObject);
begin
  inherited;
  getlist('');
end;

procedure TBaseSearch.FormatScreen;
begin
  inherited;
  //Será implementado nos herdeiros
end;

procedure TBaseSearch.FormCreate(Sender: TObject);
begin
  inherited;
  InitVariable;
  setImages;
  FormatScreen; //- estou ativando apos a criação do form
  SetVariable;
end;

procedure TBaseSearch.getHead;
begin
  //Será implementado nos herdeiros
end;

procedure TBaseSearch.getItem(AItem: TListViewItem);
begin

  //Será implementado nos herdeiros
end;



procedure TBaseSearch.getlist(par: String);
begin
  //lsv_Search.Items.Clear;
  getHead;
  if Self.Page <= 0 then
    Self.Page := 1
  else
    Self.Page := Self.Page + 1;
end;

procedure TBaseSearch.InitVariable;
begin
  inherited;
  TabControl.TabPosition := TTabPosition.None;
  TabControl.ActiveTab := tbs_search;
end;



procedure TBaseSearch.openCad;
begin
  //Será implementado nos herdeiros
end;

procedure TBaseSearch.Sb_ApplyClick(Sender: TObject);
begin
  inherited;
  ChangeTabSearch.ExecuteTarget(Self);
end;

procedure TBaseSearch.Sb_filterClick(Sender: TObject);
begin
  inherited;
  ChangeTabParametro.ExecuteTarget(Self);
end;

procedure TBaseSearch.setImages;
begin
  inherited;
end;

procedure TBaseSearch.SetVariable;
begin
  inherited;
  getlist('');
end;

end.



