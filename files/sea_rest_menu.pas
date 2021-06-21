unit sea_rest_menu;

interface

uses


  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, uniBasicGrid, uniDBGrid,
  uniEdit, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses, uniLabel,
  uniGUIBaseClasses, uniPanel, Data.DB, Datasnap.DBClient, Datasnap.Provider,
  TblMedPriceListJR,  fm_med_pos_prog,ControllerMedPriceListJR,
  uniDBEdit, Vcl.Menus, uniMainMenu, base_form,         ControllerRestGRoup,
  uniFileUpload, uniGUITypes, base_search, uniCheckBox, uniPageControl,
  ControllerRestMenu;


type
  TSeaRestMenu = class(TBaseSearch)
    pnl_param_row_01: TUniPanel;
    E_Subgrupo: TUniEdit;
    E_Description: TUniEdit;
    chbx_Ativo: TUniCheckBox;
    tbs_group_attribute: TUniTabSheet;
    pnl_Attribute_group: TUniPanel;
    dbg_attribute_Group: TUniDBGrid;
    tbs_group_measure: TUniTabSheet;
    tbs_group_observation: TUniTabSheet;
    tbs_group_optional: TUniTabSheet;
    pnl_attribute_itens: TUniPanel;
    dbg_attribute_itens: TUniDBGrid;
    pnl_group_attribute_bottom: TUniPanel;
    Sb_Insert_attributes: TUniSpeedButton;
    Sb_Change_attributes: TUniSpeedButton;
    Sb_Delet_attributes: TUniSpeedButton;
    cds_attribute_group: TClientDataSet;
    ds_attribute_group: TDataSource;
    cds_attribute_itens: TClientDataSet;
    ds_attribute_itens: TDataSource;
    cds_attribute_itensid: TIntegerField;
    cds_attribute_itenstb_rest_group_id: TIntegerField;
    cds_attribute_itenstb_institution_id: TIntegerField;
    cds_attribute_itenskind: TStringField;
    cds_attribute_itensdescription: TStringField;
    cds_attribute_itensprice_tag: TBCDField;
    cds_attribute_itenscreated_at: TDateTimeField;
    cds_attribute_itensupdated_at: TDateTimeField;
    UniPanel2: TUniPanel;
    Sb_Insert_measure: TUniSpeedButton;
    Sb_Change_measure: TUniSpeedButton;
    Sb_Delet_measure: TUniSpeedButton;
    pnl_measure: TUniPanel;
    dbg_measure: TUniDBGrid;
    pnl_observation: TUniPanel;
    dbg_observation: TUniDBGrid;
    pnl_optional: TUniPanel;
    dbg_optional: TUniDBGrid;
    cds_measure: TClientDataSet;
    ds_measure: TDataSource;
    cds_observation: TClientDataSet;
    ds_observation: TDataSource;
    cds_optional: TClientDataSet;
    ds_optional: TDataSource;
    cds_optionaltb_institution_id: TIntegerField;
    cds_optionaltb_rest_group_id: TIntegerField;
    cds_optionaltb_product_id: TIntegerField;
    cds_optionalquantity: TBCDField;
    cds_optionalprice_tag: TBCDField;
    cds_optionaldescription: TStringField;
    cds_observationid: TIntegerField;
    cds_observationtb_institution_id: TIntegerField;
    cds_observationtb_rest_group_id: TIntegerField;
    cds_observationdescription: TStringField;
    cds_observationcreated_at: TDateTimeField;
    cds_observationupdated_at: TDateTimeField;
    cds_searchid: TIntegerField;
    cds_searchtb_institution_id: TIntegerField;
    cds_searchmenu: TStringField;
    cds_searchtb_rest_subgroup_id: TIntegerField;
    cds_searchtb_rest_group_id: TIntegerField;
    cds_searchsubgrupo: TStringField;
    FileRestMenu: TUniFileUpload;
    Mnu_Img_Rest: TUniPopupMenu;
    popResMenuInsertImagem: TUniMenuItem;
    popResMenuDeleteImagem: TUniMenuItem;
    cds_searchimg: TStringField;
    cds_searchlink_url: TStringField;
    cds_searchactive: TStringField;
    procedure pc_searchChange(Sender: TObject);
    procedure cds_attribute_groupAfterScroll(DataSet: TDataSet);
    procedure popResMenuInsertImagemClick(Sender: TObject);
    procedure popResMenuDeleteImagemClick(Sender: TObject);
    procedure dbg_SearchMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FileRestMenuCompleted(Sender: TObject; AStream: TFileStream);
    procedure dbg_SearchDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);

  private
    { Private declarations }
    RestMEnu : TControllerRestMenu;
    procedure updateRestMenu;

    function ValidateSaveImageMenu:Boolean;
    procedure SaveImageMenu(url:String);
    procedure DeleteImageMenu;
    function validateImageMenu:Boolean;
    procedure createImagemMenu(Sender: TField; var Text: string;   DisplayText: Boolean);
  protected
    RestGroup : TControllerRestGRoup;
    procedure InitVariable;Override;
    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;
    procedure GroupBySql;Override;
    procedure SetParameters;Override;

    procedure setImages;Override;

    procedure searchAttributeGroup;
    procedure searchAttributeItems;
    procedure filtroAttributeItems;

    function  validaSearchMeasure:Boolean;Virtual;
    procedure searchMeasure;Virtual;
    procedure fillGridMeasure;Virtual;
    procedure searchObservation;Virtual;
    procedure searchOptional;Virtual;
    procedure searchIngredient;Virtual;


  public
    { Public declarations }

  end;

var
  SeaRestMenu: TSeaRestMenu;



implementation

{$R *.dfm}

uses MainModule,unMessages, msg_form,UnFunctions, Winapi.ShellAPI;

{ TSeaRestMenu }

procedure TSeaRestMenu.cds_attribute_groupAfterScroll(DataSet: TDataSet);
begin
  inherited;
  filtroAttributeItems;
end;

procedure TSeaRestMenu.createImagemMenu(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if trim(cds_search.FieldByName('link_url').AsString) <>'' then
    Text := concat('<img src="', cds_search.FieldByName('link_url').AsString,'"  width="30" height="30">')
  else
    Text := concat('<img src="http://www.gestaowebsetes.com.br/images/no-image.png"  width="30" height="30">');



end;

procedure TSeaRestMenu.dbg_SearchDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if (Column.FieldName = 'link_url') then
    Column.Field.OnGetText := createImagemMenu;

end;

procedure TSeaRestMenu.dbg_SearchMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then
  begin
    Mnu_Img_Rest.Popup(X, Y, dbg_Search);
  end;
end;

procedure TSeaRestMenu.DeleteImageMenu;
begin
  cds_search.Edit;
  cds_searchlink_url.AsString := '';
  cds_search.post;
  updateRestMenu;
end;

procedure TSeaRestMenu.popResMenuDeleteImagemClick(Sender: TObject);
begin
  if validateImageMenu then
  Begin
    MensageYesNo(['C O N F I R M A Ç Ã O!',
                  '',
                  'Deseja realmente excluir está imagem?',
                  'clique em SIM para confirmar.'],mpAlerta);
    FormMsg.ShowModal(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if (Sender as TMsgForm).BotaoEscolhido > 0 then
      Begin
        self.DeleteImageMenu;
      End;
    end
    );
  End;
end;

procedure TSeaRestMenu.fillGridMeasure;
begin

end;

procedure TSeaRestMenu.filtroAttributeItems;
begin
  cds_attribute_itens.Filtered := False;
  cds_attribute_itens.Filter := concat('kind =',QuotedStr(cds_attribute_group.FieldByName('kind').AsString ) );
  cds_attribute_itens.Filtered := True;
end;

procedure TSeaRestMenu.GroupBySql;
begin
  inherited;

end;

procedure TSeaRestMenu.InitVariable;
begin
  inherited;
  RestMEnu := TControllerRestMenu.Create(Self);
  RestGroup := TControllerRestGRoup.Create(Self);
  chbx_Ativo.Checked := True;
end;

procedure TSeaRestMenu.InnerJoinSql;
begin
  inherited;
  InnerJoinTxt := Concat(
                    '   inner join tb_rest_group rg ',
                    '    on (rg.id = rm.tb_rest_group_id) ',
                    '    and  (rg.tb_institution_id = rm.tb_institution_id) ',
                    'inner join tb_rest_subgroup rs ',
                    'on (rs.id = rm.tb_rest_subgroup_id) ',
                    '   and  (rs.tb_institution_id = rm.tb_institution_id) '
  );

end;

procedure TSeaRestMenu.popResMenuInsertImagemClick(Sender: TObject);
begin
  if validateImageMenu then
  begin
    FileRestMenu.TargetFolder := 'c:\Temp\';
    FileRestMenu.Execute;
  end;
end;

procedure TSeaRestMenu.OrderBySql;
begin
  inherited;

end;

procedure TSeaRestMenu.pc_searchChange(Sender: TObject);
begin
  inherited;
  Sb_Register.Enabled := pc_search.ActivePageIndex <= 1;
  case pc_search.ActivePageIndex  of
    2:BEgin
        searchAttributeGroup;
        searchAttributeItems;
      End;
    3:BEgin
        if validaSearchMeasure then
        BEgin
          try
            Self.showMask('Buscando Produtos Vinculado...');
            searchMeasure;
            fillGridMeasure;
          finally
            self.HideMask;
          end;
        End;
      End;
    4:BEgin
        searchObservation;
    End;
    5:BEgin
        searchOptional;
      End;
    6:BEgin
        searchIngredient;
      End;
  end;
end;

procedure TSeaRestMenu.SaveImageMenu(url:String);
Begin
  //carregar o anexo propriamente dito
  cds_search.Edit;
  cds_searchlink_url.AsString := Url;
  cds_search.Post;
  updateRestMenu;
end;

procedure TSeaRestMenu.searchAttributeGroup;
begin
  cds_attribute_group.Active := False;
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              'select DISTINCT kind ',
              'from tb_rest_group_has_attribute ',
              'where tb_institution_id =:tb_institution_id ',
              'and tb_rest_group_id =:tb_rest_group_id '
    ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.Registro.Codigo;
    ParamByName('tb_rest_group_id').AsInteger := RestGroup.Registro.Codigo;
    Active := True;

  End;
  cds_attribute_group.Active := True;
  UMM.Qr_Crud.Close;
end;

procedure TSeaRestMenu.searchAttributeItems;
begin
  cds_attribute_itens.Active := False;
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              'select * ',
              'from tb_rest_group_has_attribute ',
              'where tb_institution_id =:tb_institution_id ',
              'and tb_rest_group_id =:tb_rest_group_id '
    ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.Registro.Codigo;
    ParamByName('tb_rest_group_id').AsInteger := RestGroup.Registro.Codigo;
    Active := True;

  End;
  cds_attribute_itens.Active := True;
  UMM.Qr_Crud.Close;
end;

procedure TSeaRestMenu.searchIngredient;
begin

end;

procedure TSeaRestMenu.searchMeasure;
begin

end;

procedure TSeaRestMenu.searchObservation;
begin
  cds_observation.Active := False;
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              'SELECT * ',
              'FROM tb_rest_group_has_observation ',
              'where tb_institution_id =:tb_institution_id ',
              'and tb_rest_group_id =:tb_rest_group_id '
    ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.Registro.Codigo;
    ParamByName('tb_rest_group_id').AsInteger := RestGroup.Registro.Codigo;
    Active := True;
  End;
  cds_observation.Active := True;
  UMM.Qr_Crud.Close;

end;

procedure TSeaRestMenu.searchOptional;
begin
  cds_optional.Active := False;
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              'SELECT rgho.tb_institution_id, rgho.tb_rest_group_id, ',
              'rgho.tb_product_id, rgho.quantity, rgho.price_tag, pr.description ',
              'FROM tb_rest_group_has_optional  rgho ',
              '   inner join tb_product pr ',
              '   on (rgho.tb_product_id = pr.id) ',
              '   and (pr.tb_institution_id = rgho.tb_institution_id) ',
              '   inner join tb_rest_group rg ',
              '   on (rgho.tb_rest_group_id = rg.id) ',
              '   and (rg.tb_institution_id = rgho.tb_institution_id) ',
              'where rg.description =''PIZZA'' ' +
              ' AND (rg.tb_institution_id =:tb_institution_id ) '
    ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.Registro.Codigo;
    Active := True;

  End;
  cds_optional.Active := True;
  UMM.Qr_Crud.Close;

end;

procedure TSeaRestMenu.SelectSql;
begin
  inherited;
  SelectTxt := Concat(
                'select rm.id, rm.tb_institution_id,rm.description menu,',
                'rm.tb_rest_subgroup_id,rm.tb_rest_group_id, ',
                'rs.description subgrupo, rm.link_url, rm.active  ',
                'from tb_rest_menu rm '
  );

end;

procedure TSeaRestMenu.setImages;
begin
  inherited;
  buttonIcon(Sb_Insert_attributes,'mini_insert.bmp');
  buttonIcon(Sb_Change_attributes,'mini_change.bmp');
  buttonIcon(Sb_Delet_attributes,'mini_delete.bmp');
end;

procedure TSeaRestMenu.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    ParamByName('group_desc').AsString := RestGroup.Registro.Descricao;

  if E_Subgrupo.Text <> '' then
      ParamByName('subgrupo').AsString := '%' + E_Subgrupo.Text + '%' ;

  if E_Description.Text <> '' then
      ParamByName('menu').AsString := '%' + E_Description.Text + '%' ;
  end;

end;

procedure TSeaRestMenu.FileRestMenuCompleted(Sender: TObject;
  AStream: TFileStream);
var
  DestFolder : string;
  LcNewFile : String;
begin
  try
   Self.showMask('Salvando Imagem...');
    //carregar o anexo propriamente dito
    UMM.GInstitution.getRepository(True,'tb_rest_menu');
    LcNewFile := concat(cds_searchtb_institution_id.asString,'_',
                      cds_searchid.AsString,'.jpg');

    CopyFile(PChar(AStream.FileName), PChar(LcNewFile), False);

    //ForceDirectories(LcPath);
    RenameFile(LcNewFile,concat(UMM.GInstitution.PathPublico,LcNewFile));
    WinExec('permissao.bat',SW_HIDE);
  finally
    self.HideMask;
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Imagem Carregada com Sucesso.']);
    SaveImageMenu(concat(UMM.GInstitution.URL,LcNewFile));
  end;
end;

procedure TSeaRestMenu.updateRestMenu;
begin
  RestMEnu.Registro.Codigo          := cds_searchid.AsInteger;
  RestMEnu.Registro.Estabelecimento := cds_searchtb_institution_id.AsInteger;
  RestMEnu.Registro.Description     := cds_searchmenu.AsString;
  RestMEnu.Registro.Grupo           := cds_searchtb_rest_group_id.AsInteger;
  RestMEnu.Registro.SubGrupo        := cds_searchtb_rest_subgroup_id.AsInteger;
  RestMEnu.Registro.linkUrl         := cds_searchlink_url.AsString;
  RestMEnu.Registro.Ativo           := cds_searchactive.AsString;
  RestMEnu.update;
  RestMEnu.UpdateImage;
end;

function TSeaRestMenu.validaSearchMeasure: Boolean;
begin
  REsult := True;
end;

function TSeaRestMenu.validateImageMenu: Boolean;
begin
  Result := True;
  if cds_search.RecordCount = 0 then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'É necessário reigstrar um  item antes ',
                  'de registrar uma imagem.']);
    Result := False;
    exit;
  End;

end;

function TSeaRestMenu.ValidateSaveImageMenu: Boolean;
begin
  Result := True;
  if not cds_search.Active then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Nenhum item encontrado ',
                  'Verifique antes de continuar.']);
    Result := False;
    exit;
  End;

  if cds_search.RecordCount = 0 then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'É necessário registrar um  menu antes ',
                  'de registrar uma imagem.']);
    Result := False;
    exit;
  End;

end;

procedure TSeaRestMenu.WhereSql;
begin
  inherited;
  WhereTxt := concat(
                ' where rm.tb_institution_id =:tb_institution_id ',
                ' and ( rg.description =:group_desc) '

  );
  if chbx_Ativo.Checked then
    WhereTxt := WhereTxt + ' and (rm.active = ''S'' )'
  else
    WhereTxt := WhereTxt + ' and (rm.active = ''N'' )';

  if E_Subgrupo.Text <> '' then
    WhereTxt := WhereTxt + ' and (rs.description like :subgrupo)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (rm.description like :menu)';

end;

end.
