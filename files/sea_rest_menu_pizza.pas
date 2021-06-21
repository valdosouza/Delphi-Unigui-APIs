unit sea_rest_menu_pizza;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, sea_rest_menu, Vcl.Menus, uniMainMenu,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,
  uniSpeedButton, uniBasicGrid, uniDBGrid, uniCheckBox, uniGUIClasses, uniEdit,
  uniPageControl, uniGUIBaseClasses, uniPanel, uniFileUpload, ControllerRestGRoupHasMeasure;

type
  TSeaRestMenuPizza = class(TSeaRestMenu)
    UniSpeedButton1: TUniSpeedButton;
    UniTabSheet1: TUniTabSheet;
    pnl_Ingredient: TUniPanel;
    dbg_Ingredients: TUniDBGrid;
    cds_Ingredients: TClientDataSet;
    ds_Ingredients: TDataSource;
    cds_Ingredientstb_rest_menu_id: TIntegerField;
    cds_Ingredientstb_product_id: TIntegerField;
    cds_Ingredientsdescription: TStringField;
    cds_Ingredientsquantity: TBCDField;
    procedure UniSpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateFlavorParts;
  protected
    procedure InitVariable;Override;
    procedure searchMeasure;Override;
    procedure searchIngredient;Override;
  public

  end;

var
  SeaRestMenuPizza: TSeaRestMenuPizza;

implementation

{$R *.dfm}

uses MainModule;

{ TSeaRestMenu1 }



{ TSeaRestMenu1 }

procedure TSeaRestMenuPizza.InitVariable;
begin
  inherited;
  RestGroup.Registro.Descricao := 'PIZZA';
  RestGroup.getByDescription;
end;

procedure TSeaRestMenuPizza.searchIngredient;
begin
  pnl_Ingredient.Title := concaT('Lista de Ingredientes: ',cds_searchmenu.AsString);
  cds_Ingredients.Active := False;
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
                'SELECT rmhi.tb_rest_menu_id, rmhi.tb_product_id, pd.description, rmhi.quantity ',
                'FROM tb_rest_menu_has_ingredient rmhi ',
                '  inner join tb_product pd ',
                '  on (pd.id = rmhi.tb_product_id) ',
                '  and (pd.tb_institution_id = rmhi.tb_institution_id) ',
                'where rmhi.tb_institution_id =:tb_institution_id ',
                'and rmhi.tb_rest_menu_id =:tb_rest_menu_id ',
                'order by pd.description '
    ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.Registro.Codigo;
    ParamByName('tb_rest_menu_id').AsInteger := cds_searchid.AsInteger;
    Active := True;

  End;
  cds_Ingredients.Active := True;
  UMM.Qr_Crud.Close;

end;

procedure TSeaRestMenuPizza.searchMeasure;
begin
  cds_measure.Active := False;
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              'SELECT rgm.tb_institution_id,rgm.tb_rest_group_id,  ',
              'rgm.tb_measure_id, rgm.parts, me.description,rgm.slices ',
              'FROM tb_rest_group_has_measure rgm ',
              '   inner join tb_measure me ',
              '   on (me.id = rgm.tb_measure_id) ',
              '  inner join tb_rest_group rg ',
              '  on (rg.id = rgm.tb_rest_group_id) ',
              '  and  (rg.tb_institution_id = rgm.tb_institution_id) ',
              'where rgm.tb_institution_id =:tb_institution_id ',
              'and ( rg.description =:group_desc) '
    ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.Registro.Codigo;
    ParamByName('group_desc').AsString := RestGroup.Registro.Descricao;
    Active := True;

  End;
  cds_measure.Active := True;
  UMM.Qr_Crud.Close;
end;

procedure TSeaRestMenuPizza.UniSpeedButton1Click(Sender: TObject);
begin
  UpdateFlavorParts;

end;

procedure TSeaRestMenuPizza.UpdateFlavorParts;
Var
  LcCtr : TControllerRestGroupHasMeasure;
begin
  try
    LcCtr := TControllerRestGroupHasMeasure.Create(nil);
    cds_measure.first;
    while not cds_measure.Eof do
    BEgin
      LcCtr.Registro.Estabelecimento := cds_measure.FieldByName('tb_institution_id').AsInteger;
      LcCtr.Registro.Grupo           := cds_measure.FieldByName('tb_rest_group_id').AsInteger;
      LcCtr.Registro.Medida          := cds_measure.FieldByName('tb_measure_id').AsInteger;
      LcCtr.Registro.PartesSabores   := cds_measure.FieldByName('parts').AsInteger;
      LcCtr.Registro.Fatias          := cds_measure.FieldByName('slices').AsInteger;
      LcCtr.update;
      cds_measure.Next;
    End;
  finally
    cds_measure.first;
    LcCtr.DisposeOf;
  end;

end;

end.
