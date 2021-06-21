unit base_lista_combo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  base_form, System.ImageList, FMX.ImgList, FMX.Objects,
  FMX.Controls.Presentation, FMX.Ani, FMX.Layouts, FMX.Edit, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.Effects;

type
  TBaseListaCombo = class(TBaseForm)
    Ly_Result_top: TLayout;
    Rc_result_top: TRectangle;
    Ly_quick_search: TLayout;
    E_busca: TEdit;
    Ly_list_titlle: TLayout;
    Lb_name_tittle: TLabel;
    lsv_Search: TListView;
    ShadowEffect3: TShadowEffect;
    procedure lsv_SearchItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure lsv_SearchUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure E_buscaChangeTracking(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    Page : Integer;
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure setImages;Override;
    procedure FormatScreen;Override;

    procedure getItem(AItem: TListViewItem);Virtual;
    procedure getlist;virtual;
    procedure filllist;virtual;
  public
    { Public declarations }
  end;

var
  BaseListaCombo: TBaseListaCombo;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

{ TBaseListaCombo }

procedure TBaseListaCombo.E_buscaChangeTracking(Sender: TObject);
begin
  getlist;
  filllist;
end;

procedure TBaseListaCombo.filllist;
begin

end;

procedure TBaseListaCombo.FormatScreen;
begin
  inherited;

end;

procedure TBaseListaCombo.FormCreate(Sender: TObject);
begin
  inherited;
  InitVariable;
end;

procedure TBaseListaCombo.FormShow(Sender: TObject);
begin
  SetVariable;
end;

procedure TBaseListaCombo.getItem(AItem: TListViewItem);
begin
end;

procedure TBaseListaCombo.getlist;
begin
  lsv_Search.Items.Clear;
  if Self.Page <= 0 then
    Self.Page := 1
  else
    Self.Page := Self.Page + 1;
end;

procedure TBaseListaCombo.InitVariable;
begin
  inherited;

end;

procedure TBaseListaCombo.lsv_SearchItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  getItem(AItem);
  Close;
end;

procedure TBaseListaCombo.lsv_SearchUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
Var
  item: TListItemText;
begin
  inherited;
  try
    try
     lsv_Search.BeginUpdate;
     item := AItem.Objects.FindObjectT<TListItemText>('description');
     if item <> nil then
        item.Font.Size:= 12;
    except
      on E : Exception do
            ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
  finally
    lsv_Search.EndUpdate;
  end;
end;

procedure TBaseListaCombo.setImages;
begin
  inherited;

end;

procedure TBaseListaCombo.SetVariable;
begin
  inherited;
  Page := 1;
  getlist;
  filllist;
end;

end.
