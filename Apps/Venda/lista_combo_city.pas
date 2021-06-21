unit lista_combo_city;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  base_lista_combo, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, System.ImageList, FMX.ImgList, FMX.ListView,
  FMX.Edit, FMX.Objects, FMX.Controls.Presentation, FMX.Ani, FMX.Layouts,
  ctrl_mob_city, FMX.Effects;

type
  TListaComboCity = class(TBaseListaCombo)
  private
    { Private declarations }
  protected
    procedure InitVariable;Override;
    procedure getItem(AItem: TListViewItem);Override;
    procedure getlist;Override;
    procedure filllist;Override;

  public
    { Public declarations }
    Obj : TCtrlMobCity;
  end;

var
  ListaComboCity: TListaComboCity;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

{ TBaseListaCombo1 }

procedure TListaComboCity.filllist;
Var
  I : Integer;
  LcLVI : TListViewItem;
begin
  Try
    lsv_search.BeginUpdate;
    for I := 0 to ( Obj.Lista.Count - 1) do
    Begin
      LcLVI := lsv_Search.Items.Add;
      LcLVI.Text := Obj.Lista[I].Codigo.ToString;
      LcLVI.Data['description'] := Obj.Lista[I].Nome ;
    End;
  Finally
    lsv_Search.EndUpdate;
  End;
end;

procedure TListaComboCity.getItem(AItem: TListViewItem);
Var
  LcLVI : TListViewItem;
begin
  LcLVI := lsv_Search.Items[AItem.Index];
  Obj.Registro.Codigo := StrToInt(AItem.Text);
  Obj.getByKey;
end;

procedure TListaComboCity.getlist;
begin
  inherited;
  Obj.orderby := ' name ';
  Obj.Registro.Nome := E_busca.Text;
  Obj.getList;

end;

procedure TListaComboCity.InitVariable;
begin
  inherited;
  Obj := TCtrlMobCity.Create(Self);
end;


end.
