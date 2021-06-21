unit lista_combo_state;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  base_lista_combo, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, System.ImageList, FMX.ImgList, FMX.ListView,
  FMX.Edit, FMX.Objects, FMX.Controls.Presentation, FMX.Ani, FMX.Layouts,
  ctrl_mob_state, FMX.Effects;

type
  TListaComboState = class(TBaseListaCombo)
  private
    { Private declarations }
  protected
    procedure InitVariable;Override;
    procedure SetVariable;Override;

    procedure getItem(AItem: TListViewItem);Override;
    procedure getlist;Override;
    procedure filllist;Override;

  public
    { Public declarations }
    Obj : TCtrlMobState;
  end;

var
  ListaComboState: TListaComboState;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

{ TListaComboState }

procedure TListaComboState.filllist;
Var
  I : Integer;
  LcLVI : TListViewItem;
begin
  //Desabilita o Botão
  Try
    lsv_search.BeginUpdate;
    for I := 0 to ( Obj.Lista.Count - 1) do
    Begin
      LcLVI := lsv_Search.Items.Add;
      LcLVI.Text := Obj.Lista[I].Codigo.ToString;
      LcLVI.Data['description'] := concat( Obj.Lista[I].Nome,' - ',Obj.Lista[I].Abreviatura) ;
    End;
  Finally
    lsv_Search.EndUpdate;
  End;
end;

procedure TListaComboState.getItem(AItem: TListViewItem);
Var
  LcLVI : TListViewItem;
begin
  LcLVI := lsv_Search.Items[AItem.Index];
  Obj.Registro.Codigo := StrToInt(AItem.Text);
  Obj.getByKey;
end;

procedure TListaComboState.getlist;
begin
  inherited;
  Obj.orderby := ' name ';
  Obj.Registro.Nome := E_busca.Text;
  Obj.getList;
end;

procedure TListaComboState.InitVariable;
begin
  inherited;
  Obj := TCtrlMobState.Create(Self);
end;

procedure TListaComboState.SetVariable;
begin
  inherited;

end;

end.


