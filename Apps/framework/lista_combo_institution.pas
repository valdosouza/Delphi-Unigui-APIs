unit lista_combo_institution;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  base_lista_combo, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, System.ImageList, FMX.ImgList, FMX.ListView,
  FMX.Edit, FMX.Effects, FMX.Objects, FMX.Controls.Presentation, FMX.Ani,
  FMX.Layouts, UnFunctions,TypesListCollection;

type
  TListaComboInstitution = class(TBaseListaCombo)
  private
    { Private declarations }
  protected
    procedure getItem(AItem: TListViewItem);Override;
    procedure getlist;Override;
    procedure filllist;

  public
    { Public declarations }
  end;

var
  ListaComboInstitution: TListaComboInstitution;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

uses MainModule;

{ TListaComboInstitution }

procedure TListaComboInstitution.filllist;
Var
  I : Integer;
  LcLVI : TListViewItem;
begin
  try
    lsv_Search.BeginUpdate;
    for I := 0 to ( UMM.GInstitution.ListSpl.Count - 1) do
    Begin
      LcLVI := lsv_Search.Items.Add;
      LcLVI.Text := UMM.GInstitution.ListSpl[I].Codigo.ToString;
      LcLVI.Data['description'] := UMM.GInstitution.ListSpl[I].ApelidoFantasia ;
    End;
  Finally
    lsv_Search.EndUpdate;
  End;
end;

procedure TListaComboInstitution.getItem(AItem: TListViewItem);
Var
  LcLVI : TListViewItem;
begin
  LcLVI := lsv_Search.Items[AItem.Index];
  setInstitution( StrToIntDef(AItem.Text,0));
  setConfigINI('MOBILE','GBINSTITUTION',AItem.Text);
end;

procedure TListaComboInstitution.getlist;
begin
  inherited;
  UMM.GInstitution.getListSpl(getParameter(E_Busca.Text));
  FillList;
end;


end.
