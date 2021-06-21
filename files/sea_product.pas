unit sea_product;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniDateTimePicker,
  uniCheckBox, uniEdit, uniLabel, Datasnap.Provider, Data.DB, Datasnap.DBClient,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid,FireDAC.Stan.Param,
  uniGUIBaseClasses, uniPanel, uniRadioGroup,MainModule, UniDBLookupComboBox,
  uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaProduct = class(TBaseSearch)
    L_Codigo: TUniLabel;
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
    E_ID_Search: TUniEdit;
    L_CodigoInterno: TUniLabel;
    E_Identifier: TUniEdit;
    L_Categoria: TUniLabel;
    E_Category: TUniEdit;
    Rg_active: TUniRadioGroup;
    Rg_published: TUniRadioGroup;
    procedure InitVariable;Override;
    procedure InnerJoinSql;Override;
    procedure SelectSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;

    procedure SetParameters;Override;
    procedure SetRegister;Override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SeaProduct: TSeaProduct;

implementation

{$R *.dfm}

uses openForms, cad_product;

{ TSeaProduct }

procedure TSeaProduct.InitVariable;
begin
  inherited;
  Rg_published.ItemIndex := 2;
end;

procedure TSeaProduct.InnerJoinSql;
begin
  inherited;
  InnerJoinTxt := concat(
                    InnerJoinTxt,
                    ' inner join tb_institution it ',
                    ' on (it.id = pr.tb_institution_id) ',
                    ' inner join tb_category c ',
                    ' on (c.id = pr.tb_category_id) '
                    );

end;


procedure TSeaProduct.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by pr.description '
end;

procedure TSeaProduct.SelectSql;
begin
  inherited;
  SelectTxt := ' Select distinct pr.id, pr.description '+
               ' from tb_product pr ';
end;

procedure TSeaProduct.SetParameters;
begin
    inherited;
    with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if E_ID_Search.Text <> '' then
      ParamByName('id').AsString := E_ID_Search.Text;

    if E_Identifier.Text <> '' then
      ParamByName('identifier').AsString := E_Identifier.Text;

    if E_Category.Text <> '' then
      ParamByName('category').AsString := '%' + E_Category.Text + '%' ;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;

    case Rg_published.ItemIndex of
     0:ParamByName('published').AsString := 'S';
     1:ParamByName('published').AsString := 'N';
    end;

    case Rg_active.ItemIndex of
     0:ParamByName('active').AsString := 'S';
     1:ParamByName('active').AsString := 'N';
    end;

    end;
end;

procedure TSeaProduct.SetRegister;
var
  Form : TCadProduct;
begin
  if Form = nil then
    Form := TCadProduct.Create(UniApplication);
  Form.CodigoRegistro := 0;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
end;

procedure TSeaProduct.WhereSql;
begin
  inherited;
  WhereTxt := ' where ( pr.tb_institution_id = :tb_institution_id ) ';

  WhereTxt := concat( WhereTxt ,
                      ' and ( c.tb_institution_id = :tb_institution_id ) '
                    );

  if E_ID_Search.Text <> '' then
    WhereTxt := WhereTxt + ' and (pr.id =:id)';

  if E_Identifier.Text <> '' then
    WhereTxt := WhereTxt + ' and (pr.identifier =:identifier)';

  if E_Category.Text <> '' then
    WhereTxt := WhereTxt + ' and (c.description like :category)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (pr.description like :description)';

  if Rg_active.ItemIndex < 2 then
    WhereTxt := WhereTxt + ' and (pr.active =:active)';

  if Rg_published.ItemIndex < 2 then
    WhereTxt := WhereTxt + ' and (pr.published =:published)';

end;

end.
