unit base_search;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  base_form, FMX.Layouts, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.Controls.Presentation, Data.DB,
  Datasnap.DBClient, FMX.Edit, FMX.TreeView, FMX.DateTimeCtrls, FMX.ScrollBox,
  FMX.Memo, FMX.ListBox, FMX.TabControl, FMX.Gestures, System.Actions,
  FMX.ActnList, FMX.Objects, FMX.Effects, System.ImageList, FMX.ImgList;

type
  TBaseSearch = class(TBaseForm)
    GestureManager1: TGestureManager;
    ActionList: TActionList;
    ChangeTabAction1: TChangeTabAction;
    ChangeTabAction2: TChangeTabAction;
    lsv_Search: TListView;
    E_busca: TEdit;
    Lang1: TLang;
    Sb_search: TSpeedButton;
    Ly_list_titlle: TLayout;
    Ly_quick_search: TLayout;
    Lb_name_tittle: TLabel;
    Sb_back: TSpeedButton;
    Ly_Result_top: TLayout;
    Rc_result_top: TRectangle;
    Sb_Insert: TSpeedButton;
    procedure lsv_SearchItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Sb_searchClick(Sender: TObject);
    procedure Sb_backClick(Sender: TObject);
    procedure E_buscaChange(Sender: TObject);
    procedure E_buscaChangeTracking(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    Page : Integer;
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure setImages;Override;
    procedure FormatScreen;Override;
    procedure openCad;Virtual;
    function getParameter:TStringList;Virtual;
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

uses MainModule;

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
  lsv_Search.Items.Clear;
  getHead;
  if Self.Page <= 0 then
    Self.Page := 1
  else
    Self.Page := Self.Page + 1;
end;

function TBaseSearch.getParameter: TStringList;
Var
  Lcpos:Integer;
  LCStr : String;
  LcPalavra : String;
begin
  Result := TStringList.create;
  if Length(E_Busca.Text)>0 then
  Begin
    LcStr := E_Busca.Text;
    while Length(trim(LcStr))>0 do
    Begin
      Lcpos := Pos(' ',LCStr);
      if (Lcpos > 0) then
      Begin
        LcPalavra := Trim(Copy(LCStr,1,Lcpos));
        if Length(LcPalavra) > 0 then
          Result.Add(LcPalavra);
      End
      else
      Begin
        LcPalavra := Trim(LCStr);
        Result.Add(LcPalavra);
        LCStr := '';
      End;
      if Lcpos = 0 then Lcpos := 1;
      Delete(LCStr,1,Lcpos);
    End;
  End;

end;

procedure TBaseSearch.InitVariable;
begin
  inherited;
  Ly_list_titlle.Visible := True;
  Ly_quick_search.Visible := False;

end;

procedure TBaseSearch.lsv_SearchItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  getItem(AItem);
end;

procedure TBaseSearch.openCad;
begin
  //Será implementado nos herdeiros
end;

procedure TBaseSearch.Sb_backClick(Sender: TObject);
begin
  inherited;
  Ly_list_titlle.Visible := True;
  Ly_quick_search.Visible := False;

end;

procedure TBaseSearch.Sb_searchClick(Sender: TObject);
Var
  I :Integer;
begin
  Ly_quick_search.Visible := True;
  Ly_list_titlle.Visible := False;
  E_busca.SetFocus;
  getlist('');
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



