unit sea_cashier;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  base_search, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.Controls.Presentation,
  FMX.Layouts, FMX.TabControl, System.Actions, FMX.ActnList, FMX.Gestures,
  FMX.Objects, FMX.Edit, FMX.Effects, FMX.ListBox,TypesListCollection,
  System.ImageList, FMX.ImgList, UnFunctions, FMX.Ani,
  ctrl_mob_financial_statement, FMX.DateTimeCtrls;

type
  TSeaCashier = class(TBaseSearch)
    lsv_search: TListView;
    
    procedure lsv_SearchUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
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
    procedure FillList(ListObj : TCollSplFinancialStatement);


  public
    { Public declarations }
  end;

var
  SeaCashier: TSeaCashier;

implementation
{TSeaCashier}

uses MainModule;
{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

{ TSeaCashier }

procedure TSeaCashier.FillList(ListObj: TCollSplFinancialStatement);
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
      LcLVI.Text              := ListObj[I].Codigo.ToString;
      LcLVI.Data['Data']      := DateToStr( ListObj[I].Data );
      if ListObj[I].ValorCredito > 0 then
        LcLVI.Data['Valor']   := concat('R$ ', FloatToStrF( ListObj[I].ValorCredito,ffFixed,10,2))
      else
        LcLVI.Data['Valor']   := concat('R$ ', FloatToStrF( ListObj[I].ValorDebito,ffFixed,10,2) );
      LcLVI.Data['Lb_Historico']   := 'Histórico';
      LcLVI.Data['E_Historico']   := ListObj[I].Historico;

    End;
  Finally
    lsv_Search.EndUpdate;
  End;

end;

procedure TSeaCashier.FormatScreen;
begin
  inherited;

end;

procedure TSeaCashier.getHead;
Var
  LcLVI : TListViewItem;
begin
  //Cabeçalho
  lsv_Search.Items.Clear;
  LcLVI := lsv_Search.Items.Add;
  LcLVI.Height := 35;
  LcLVI.Text := concat('Data Lançamento / Valor Crédito/Débito',#13,#10,
                       'Histórico do lançamento',#13,#10
                );
  LcLVI.Purpose := TListItemPurpose.Header;

end;

procedure TSeaCashier.getItem(AItem: TListViewItem);
begin
  inherited;

end;

procedure TSeaCashier.getList(par: String);
Var
  LcFinancialStatement : TCtrlMobFinancialStatement;
begin
  inherited;
  LcFinancialStatement := TCtrlMobFinancialStatement.Create(Self);
  LcFinancialStatement.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
//  LcFinancialStatement.getListSpl(getParameter(E_Busca.Text),E_dt_record.Date);
  FillList( LcFinancialStatement.CollListaSpl );
end;

procedure TSeaCashier.InitVariable;
begin
  inherited;
//  E_dt_record.Date := Date;
end;

procedure TSeaCashier.lsv_SearchUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
Var
  item: TListItemText;
begin
  inherited;
  try
    try
     lsv_Search.BeginUpdate;
     item := AItem.Objects.FindObjectT<TListItemText>('Data');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('Valor');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('E_Historico');
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

procedure TSeaCashier.openCad;
begin
  inherited;

end;

procedure TSeaCashier.Sb_searchClick(Sender: TObject);
begin
  getlist('');
end;

end.
