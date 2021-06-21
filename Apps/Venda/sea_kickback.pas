unit sea_kickback;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  base_search, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, System.Actions, FMX.ActnList, FMX.TabControl,
  FMX.Gestures, System.ImageList, FMX.ImgList, FMX.Edit, FMX.ListView,
  FMX.Objects, FMX.Controls.Presentation, FMX.Ani, FMX.Layouts,TypesListCollection,
  ctrl_mob_kickback, UnFunctions, FMX.DateTimeCtrls, FMX.Effects;

type
  TSeaKickback = class(TBaseSearch)
    lsv_search: TListView;
        procedure Sb_searchClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure InitVariable;Override;
    procedure FormatScreen;Override;
    procedure openCad;override;
    procedure getHead;override;
    procedure getItem(AItem: TListViewItem);override;
    procedure getList(par:String);override;
    procedure FillList(ListObj : TCollSplKickback);

  public
    { Public declarations }
  end;

var
  SeaKickback: TSeaKickback;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

uses MainModule;

{ TSeaKickback }

procedure TSeaKickback.FillList(ListObj: TCollSplKickback);
Var
  I : Integer;
  LcLVI : TListViewItem;
  LcStrJSon : String;
begin
  //Desabilita o Botão
  Try
    lsv_search.BeginUpdate;

    for I := 0 to ( ListObj.Count - 1) do
    Begin
      LcLVI := lsv_Search.Items.Add;
      LcLVI.Data['Data']          := DateToStr( ListObj[I].Data );
      LcLVI.Data['Venda']         := concat('R$ ', FloatToStrF( ListObj[I].Venda,ffFixed,10,2));
      LcLVI.Data['Comissao']      := concat('R$ ', FloatToStrF( ListObj[I].Comissao,ffFixed,10,2));
      LcLVI.Data['Lb_Historico']  := 'Histórico';
      LcLVI.Data['Historico']   := ListObj[I].Historico;
    End;
  Finally
    lsv_Search.EndUpdate;
  End;


end;

procedure TSeaKickback.FormatScreen;
begin
  inherited;

end;

procedure TSeaKickback.getHead;
Var
  LcLVI : TListViewItem;
begin
  //Cabeçalho
  lsv_Search.Items.Clear;
  LcLVI := lsv_Search.Items.Add;
  LcLVI.Height := 35;
  LcLVI.Text := concat('Data / Venda / Comissão',#13,#10,
                       'Histórico do lançamento'
                );
  LcLVI.Purpose := TListItemPurpose.Header;

end;

procedure TSeaKickback.getItem(AItem: TListViewItem);
begin
  inherited;

end;

procedure TSeaKickback.getList(par: String);
Var
  LcKickback : TCtrlMobKickBack;
begin
  inherited;
  LcKickback := TCtrlMobKickBack.Create(Self);
  LcKickback.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  //LcKickback.getListSpl(getParameter(E_Busca.Text),E_dt_record.Date);
  FillList( LcKickback.CollListaSpl );
end;

procedure TSeaKickback.InitVariable;
begin
  inherited;
  //E_dt_record.Date := Date;
end;

procedure TSeaKickback.openCad;
begin
  inherited;

end;

procedure TSeaKickback.Sb_searchClick(Sender: TObject);
begin
  getlist('');
end;

end.


