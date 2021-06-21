unit base_search;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_form, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses,
  uniPanel, Data.DB, Datasnap.DBClient,  Datasnap.Provider, MainModule,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniPageControl, uniImageList, Vcl.Menus, uniMainMenu, uniLabel, uniCheckBox,
  uniEdit;

type
  TBaseSearch = class(TBaseForm)
    Pnl_Fundo: TUniPanel;
    Pnl_Botoes: TUniPanel;
    Sb_Close: TUniSpeedButton;
    Sb_View: TUniSpeedButton;
    Sb_Search: TUniSpeedButton;
    Sb_Register: TUniSpeedButton;
    ds_search: TDataSource;
    cds_search: TClientDataSet;
    DSP: TDataSetProvider;
    pc_search: TUniPageControl;
    tbs_search: TUniTabSheet;
    dbg_Search: TUniDBGrid;
    tbs_param: TUniTabSheet;
    pnl_param: TUniPanel;
    pnl_config: TUniPanel;
    chbx_limit_result: TUniCheckBox;
    E_Limit: TUniEdit;
    procedure Sb_CloseClick(Sender: TObject);
    procedure Sb_ViewClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
    procedure Sb_RegisterClick(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbg_SearchDblClick(Sender: TObject);
    procedure pc_searchChange(Sender: TObject);
    procedure chbx_limit_resultChange(Sender: TObject);
    procedure dbg_SearchColumnSort(Column: TUniDBGridColumn;
      Direction: Boolean);

  private

  protected
    fIdxStr : String;

    SelectTxt : String;
    InnerJoinTxt : String;
    WhereTxt : String;

    SelectTxt_1 : String;
    InnerJoinTxt_1 : String;
    WhereTxt_1 : String;

    SelectTxt_2 : String;
    InnerJoinTxt_2 : String;
    WhereTxt_2 : String;

    SelectTxt_3 : String;
    InnerJoinTxt_3 : String;
    WhereTxt_3 : String;

    OrderByTxt : String;
    GroupByTxt : String;
    procedure setSortable;Virtual;
    procedure FormatScreen;Override;
    procedure InitVariable;Override;
    procedure setPrivilege;Override;
    procedure SetVariable;Override;
    procedure EditionControl;Virtual;

    procedure SelectSql;Virtual;
    procedure InnerJoinSql;Virtual;
    procedure WhereSql;Virtual;
    procedure OrderBySql;Virtual;
    procedure GroupBySql;Virtual;
    procedure SetParameters;Virtual;
    function validateGetView:Boolean;Virtual;
    procedure GetView;Virtual;
    procedure Search;Virtual;
    procedure SetRegister;Virtual;
    procedure returnRegister;Virtual;

  public


  end;

var
  BaseSearch: TBaseSearch;

implementation

{$R *.dfm}

uses
  Main
  ,unMessages
  ,msg_form;

procedure TBaseSearch.chbx_limit_resultChange(Sender: TObject);
begin
  inherited;
  if TUniCheckBox(sender).Checked then
    E_Limit.Text := '50'
  else
    E_Limit.Text := '0';
  E_Limit.ReadOnly := not TUniCheckBox(sender).Checked
end;

procedure TBaseSearch.dbg_SearchColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
begin
  SortClientDataSetByField(cds_search,Column.FieldName, Direction);
end;

procedure TBaseSearch.dbg_SearchDblClick(Sender: TObject);
begin
  if validateGetView then
    GetView;
end;

procedure TBaseSearch.EditionControl;
begin
  Sb_Register.Enabled := PInsert;
end;

procedure TBaseSearch.FormatScreen;
begin
  inherited;
  buttonIcon(Sb_Register,'insert.bmp');
  buttonIcon(Sb_Search,'search.bmp');
  buttonIcon(Sb_View,'viewer.bmp');
  buttonIcon(Sb_Close,'close.bmp');
  pc_search.ActivePage := tbs_param;
  Sb_Search.Enabled := pc_search.ActivePageIndex = 0;
  Sb_View.Enabled := pc_search.ActivePageIndex = 1;

end;

procedure TBaseSearch.GetView;
begin
  //será implementada nas descendencias
end;

procedure TBaseSearch.Search;
begin
  Try
    cds_search.Active := False;
    with UMM.Qr_Crud do
    Begin
      Active := False;
      sql.Clear;

      SelectTxt           := '';
      InnerJoinTxt        := '';
      WhereTxt            := '';

      SelectTxt_1         := '';
      InnerJoinTxt_1      := '';
      WhereTxt_1          := '';

      SelectTxt_2         := '';
      InnerJoinTxt_2      := '';
      WhereTxt_2          := '';

      SelectTxt_3         := '';
      InnerJoinTxt_3      := '';
      WhereTxt_3          := '';

      OrderByTxt := '';

      SelectSql;
      InnerJoinSql;
      WhereSql;

      if Trim(SelectTxt) <> '' then
      Begin
        SQL.Add(SelectTxt);
        SQL.Add(InnerJoinTxt);
        SQL.Add(WhereTxt);
      End;

      if Trim(SelectTxt_1) <> '' then
      Begin
        if SelectTxt <> '' then
          SQL.Add(' Union ');
        SQL.Add(SelectTxt_1);
        SQL.Add(InnerJoinTxt_1);
        SQL.Add(WhereTxt_1);
      End;

      if Trim(SelectTxt_2) <> '' then
      Begin
        if SelectTxt_1 <> '' then
          SQL.Add(' Union ');
        SQL.Add(SelectTxt_2);
        SQL.Add(InnerJoinTxt_2);
        SQL.Add(WhereTxt_2);
      End;

      if Trim(SelectTxt_3) <> '' then
      Begin
        if SelectTxt_2 <> '' then
          SQL.Add(' Union ');
        SQL.Add(SelectTxt_3);
        SQL.Add(InnerJoinTxt_3);
        SQL.Add(WhereTxt_3);
      End;

      GroupBySql;
      OrderBySql;
      SQL.Add(GroupByTxt);
      SQL.Add(OrderByTxt);

      if (chbx_limit_result.Checked) and ( StrToIntDef(E_Limit.Text,0)>0 ) then
          SQL.Add(concat(' limit 0, ',E_Limit.Text));
      SetParameters;
      Prepare;
      Active := True;
      FetchAll;
    End;
  Finally
    cds_search.Active := True;
    Umm.Qr_Crud.close;
  End;
end;

procedure TBaseSearch.SelectSql;
begin
  //será implementada nas descendencias
end;

procedure TBaseSearch.SetParameters;
begin
  //será implementada nas descendencias
end;

procedure TBaseSearch.setPrivilege;
begin
  PInsert := UMM.GInstitution.User.getPrivilege('INSERIR');
end;

procedure TBaseSearch.SetRegister;
begin
  //será implementada nas descendencias
end;

procedure TBaseSearch.setSortable;
Var
  I:Integer;
begin
  for I := 0 to dbg_Search.Columns.Count -1 do
    dbg_Search.Columns[I].Sortable := TRue;


end;

procedure TBaseSearch.SetVariable;
begin
  inherited;
  EditionControl;
  DSP.DataSet := UMM.Qr_Crud;
  cds_search.Close;

end;


procedure TBaseSearch.UniFormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    Sb_RegisterClick(Sender);
  if Key =  vk_f7 then
    Sb_SearchClick(Sender);
  if Key =  vk_f8 then
    Sb_ViewClick(Sender);
  if Key = vk_escape then
    Sb_CloseClick(Sender);
end;

function TBaseSearch.validateGetView: Boolean;
begin
  Result := True;
  if not cds_search.Active then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Nenhuma busca foi efetuada.',
                  'Clique em buscar e tente novamente']);
    Result := False;
    exit;
  end;

  if cds_search.RecordCount = 0 then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há registros para visualizar.',
                  'Verifique e tente novamente']);
    Result := False;
    exit;
  end;
end;

procedure TBaseSearch.GroupBySql;
begin
  //
end;

procedure TBaseSearch.InitVariable;
begin
  inherited;
  setSortable;
end;

procedure TBaseSearch.InnerJoinSql;
begin
  //
end;

procedure TBaseSearch.OrderBySql;
begin
  //
end;

procedure TBaseSearch.pc_searchChange(Sender: TObject);
begin
  inherited;
  Sb_Search.Enabled := pc_search.ActivePageIndex = 0;
  Sb_View.Enabled := pc_search.ActivePageIndex = 1;
end;

procedure TBaseSearch.returnRegister;
begin
  //
end;


procedure TBaseSearch.WhereSql;
begin
  //
end;

procedure TBaseSearch.Sb_CloseClick(Sender: TObject);
begin
  {$IFDEF UzaaWeb}
    MainForm.unpgcntrlRibbon.Enabled := True;
  {$ENDIF}
  Close;
end;

procedure TBaseSearch.Sb_RegisterClick(Sender: TObject);
begin
  SetRegister;
end;

procedure TBaseSearch.Sb_SearchClick(Sender: TObject);
begin
  try
    Self.showMask('Aguarde Processamento');
    UniSession.Synchronize();
    Search;
    pc_search.ActivePage := tbs_search;
    pc_searchChange(pc_search);
  finally
    self.HideMask;
  end;

end;

procedure TBaseSearch.Sb_ViewClick(Sender: TObject);
begin
  if validateGetView then
    GetView;
end;



end.

