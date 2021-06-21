unit sea_rest_menu_beverage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, sea_rest_menu, Data.DB, Vcl.Menus,
  uniMainMenu, Datasnap.Provider, Datasnap.DBClient, uniButton, uniBitBtn,
  uniSpeedButton, uniBasicGrid, uniDBGrid, uniCheckBox, uniGUIClasses, uniEdit,
  uniPageControl, uniGUIBaseClasses, uniPanel, uniFileUpload, ControllerStock,
  uniGUITypes, Winapi.ShellAPI;

type
  TSeaRestMenuBeverage = class(TSeaRestMenu)
    FileRestGroupHasMeasure: TUniFileUpload;
    Mnu_Img_Measure: TUniPopupMenu;
    popResBeverageInsertImagem: TUniMenuItem;
    popResBeverageDeleteImagem: TUniMenuItem;
    cds_measuremenuId: TIntegerField;
    cds_measuredescription: TStringField;
    cds_measuremeasureId: TIntegerField;
    cds_measuremeasure: TStringField;
    cds_measureproduct: TIntegerField;
    cds_measureprice_tag: TFMTBCDField;
    cds_measurelink_url: TStringField;
    cds_measuretb_institution_id: TIntegerField;
    cds_measureactive: TStringField;
    procedure FileRestGroupHasMeasureCompleted(Sender: TObject;
      AStream: TFileStream);
    procedure dbg_measureMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbg_measureDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure popResBeverageInsertImagemClick(Sender: TObject);
    procedure popResBeverageDeleteImagemClick(Sender: TObject);
  private
    { Private declarations }
    Stock : TControllerStock;
    function ValidateSaveImageMeasure:Boolean;
    procedure SaveImageMeasure(url:String);
    procedure DeleteImageMeasure;
    function validateImageMeasure:Boolean;
    procedure updateStockImage;
    procedure createImagemMeasure(Sender: TField; var Text: string;   DisplayText: Boolean);
    procedure ActiveDesactiveProduct;
  protected
    procedure InitVariable;Override;

    function  validaSearchMeasure:Boolean;Override;
    procedure searchMeasure;Override;
    procedure fillGridMeasure;Override;
  public
    { Public declarations }
  end;

var
  SeaRestMenuBeverage: TSeaRestMenuBeverage;

implementation

{$R *.dfm}

uses MainModule,unMessages, msg_form,UnFunctions;

{ TSeaRestMenu1 }

procedure TSeaRestMenuBeverage.ActiveDesactiveProduct;
Var
  LcMessage:String;
begin


end;

procedure TSeaRestMenuBeverage.createImagemMeasure(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if trim(cds_measure.FieldByName('link_url').AsString) <>'' then
    Text := concat('<img src="', cds_measure.FieldByName('link_url').AsString,'"  width="30" height="30">')
  else
    Text := concat('<img src="http://www.gestaowebsetes.com.br/images/no-image.png"  width="30" height="30">');
end;

procedure TSeaRestMenuBeverage.dbg_measureDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  if (Column.FieldName = 'link_url') then
    Column.Field.OnGetText := createImagemMeasure;
end;

procedure TSeaRestMenuBeverage.dbg_measureMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then
  begin
    Mnu_Img_Measure.Popup(X, Y, dbg_measure);
  end;
end;

procedure TSeaRestMenuBeverage.DeleteImageMeasure;
begin
  cds_measure.Edit;
  cds_measurelink_url.AsString := '';
  cds_measure.post;
  updateStockImage;
end;

procedure TSeaRestMenuBeverage.FileRestGroupHasMeasureCompleted(Sender: TObject;
  AStream: TFileStream);
var
  DestFolder : string;
  LcNewFile : String;
  LcPath : String;
  LcUrl : String;
 SecDesc     : PSECURITY_DESCRIPTOR;
begin
  try
    Self.showMask('Salvando Imagem...');
    //carregar o anexo propriamente dito
    UMM.GInstitution.getRepository(True,'tb_stock');
    LcNewFile := concat(cds_measuretb_institution_id.asString,'_',
                        cds_measureproduct.AsString,'_',
                        cds_measuremeasureId.AsString,'.jpg');

    CopyFile(PChar(AStream.FileName), PChar(LcNewFile), False);

    LcPath := concat(UMM.GInstitution.PathPublico);
    //ForceDirectories(LcPath);
    RenameFile(LcNewFile,concat(LcPath,LcNewFile));
    LcUrl := UMM.GInstitution.URL;

    //WinExec(PAnsiChar(concat('per_tb_stock_',UMM.GInstitution.Registro.Codigo.ToString,'.bat')),SW_HIDE);
    WinExec('permissao.bat',SW_HIDE);
  finally
    self.HideMask;
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Imagem Carregada com Sucesso.']);
    SaveImageMeasure(concat(LcUrl,LcNewFile));
  end;

end;

procedure TSeaRestMenuBeverage.fillGridMeasure;
begin
  pnl_measure.Title := concat('Dados do Produto ', cds_search.FieldByName('menu').AsString);
  with UMM.Qr_Crud do
  Begin
    if not cds_measure.Active then cds_measure.CreateDataSet;
    cds_measure.EmptyDataSet;
    First;
    while not eof do
    Begin
      cds_measure.Append;
      cds_measuremenuId.AsInteger            := FieldByName('menuId').AsInteger;
      cds_measuredescription.AsString        := FieldByName('description').AsString;
      cds_measuremeasureId.AsInteger         := FieldByName('measureId').AsInteger;
      cds_measuremeasure.AsString            := FieldByName('measure').AsString;
      cds_measureproduct.AsInteger           := FieldByName('product').AsInteger;
      cds_measureprice_tag.AsFloat           := FieldByName('price_tag').AsFloat;
      cds_measurelink_url.AsString           := FieldByName('link_url').AsString;
      cds_measuretb_institution_id.AsInteger := FieldByName('tb_institution_id').AsInteger;
      cds_measure.Post;
      next;
    End;
  End;
end;

procedure TSeaRestMenuBeverage.InitVariable;
begin
  inherited;
  RestGroup.Registro.Descricao := 'BEBIDA';
  RestGroup.getByDescription;
  Stock := TControllerStock.create(Self);
end;

procedure TSeaRestMenuBeverage.popResBeverageDeleteImagemClick(Sender: TObject);
begin
  if validateImageMeasure then
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
        self.DeleteImageMeasure;
      End;
    end
    );
  End;
end;

procedure TSeaRestMenuBeverage.popResBeverageInsertImagemClick(Sender: TObject);
begin
 if validateImageMeasure then
  begin
    FileRestGroupHasMeasure.TargetFolder := 'c:\Temp\';
    FileRestGroupHasMeasure.Execute;
  end;
end;

procedure TSeaRestMenuBeverage.SaveImageMeasure(url: String);
begin
  cds_measure.Edit;
  cds_measurelink_url.AsString := url;
  cds_measure.Post;
  updateStockImage;
end;

procedure TSeaRestMenuBeverage.searchMeasure;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              'select  r.id menuId, r.description, me.id measureId, ',
              'me.description measure, pc.tb_product_id product,  ',
              ' pc.price_tag, st.link_url, st.tb_institution_id,pd.active  ',
              'from tb_rest_menu r ',
              '  inner join tb_rest_menu_has_product rmhp ',
              '  on (rmhp.tb_rest_menu_id = r.id) ',
              '    and (rmhp.tb_institution_id = r.tb_institution_id) ',
              '  inner join tb_stock st ',
              '  on (st.tb_merchandise_id = rmhp.tb_product_id) ',
              '    and (st.tb_institution_id = rmhp.tb_institution_id) ',
              '    inner join tb_product pd ',
              '    on (st.tb_merchandise_id = pd.id) ',
              '      and (st.tb_institution_id = pd.tb_institution_id) ',
              '  inner join tb_measure me ',
              '  on (me.id = st.tb_measure_id) ',
              '  inner join tb_price pc ',
              '  on (pc.tb_product_id = st.tb_merchandise_id) ',
              '  and (pc.tb_institution_id = st.tb_institution_id) ',
              'where r.description =:menu ',
              'and r.tb_institution_id =:tb_institution_id ',
              'AND pd.active = ''S'' ',
              'and pc.tb_price_list_id = 1 '
    ));

    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.Registro.Codigo;
    ParamByName('menu').AsString := cds_search.FieldByName('menu').AsString;
    Active := True;
  End;
end;

procedure TSeaRestMenuBeverage.updateStockImage;
begin
  Stock.Registro.Estabelecimento := cds_measuretb_institution_id.AsInteger;
  Stock.Registro.Mercadoria      := cds_measureproduct.AsInteger;
  Stock.Registro.linkUrl         := cds_measurelink_url.AsString;
  Stock.UpdateImage;
end;

function TSeaRestMenuBeverage.validaSearchMeasure: Boolean;
begin
  REsult := true;
  cds_measure.Active := False;
  pnl_measure.Title := 'Nenhum produto selecionado';
  //Pesquisa pela cds_search para depois abrir o cds_measure
  if not cds_search.Active then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Nenhuma pesquisa efetuada.',
                  'Verifique e tente novamente']);
    pc_search.ActivePage := tbs_param;
    pc_searchChange(Self);
    Result := False;
    exit;

  End;

  if cds_search.RecordCount = 0 then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Nenhum produto encontrado.',
                  'Verifique e tente novamente']);
    pc_search.ActivePage := tbs_param;
    pc_searchChange(Self);
    Result := False;
    exit;

  End;

end;

function TSeaRestMenuBeverage.validateImageMeasure: Boolean;
begin
  Result := True;
  if cds_measure.RecordCount = 0 then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'É necessário reigstrar um  item antes ',
                  'de registrar uma imagem.']);
    Result := False;
    exit;
  End;

end;

function TSeaRestMenuBeverage.ValidateSaveImageMeasure: Boolean;
begin
  Result := True;
  if not cds_measure.Active then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Nenhum item encontrado ',
                  'Verifique antes de continuar.']);
    Result := False;
    exit;
  End;

  if cds_measure.RecordCount = 0 then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'É necessário registrar um produto antes ',
                  'de registrar uma imagem.']);
    Result := False;
    exit;
  End;

end;

end.
