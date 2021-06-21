unit sea_merchandise;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, sea_product, uniMultiItem, uniComboBox,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,FireDAC.Stan.Param,
  uniSpeedButton, uniRadioGroup, uniEdit, uniLabel, uniGUIClasses, uniBasicGrid,
  uniDBGrid, uniGUIBaseClasses, uniPanel,MainModule, UniDBLookupComboBox,
  uniPageControl, Vcl.Menus, uniMainMenu, uniCheckBox;

type
  TSeaMerchandise = class(TSeaProduct)
    L_CodigoBarras: TUniLabel;
    E_CodeBar: TUniEdit;
    L_Marca: TUniLabel;
    E_brand: TUniEdit;
    L_LocalizaçãoEndereço: TUniLabel;
    E_Location: TUniEdit;
    E_Aplication: TUniEdit;
    L_Aplicação: TUniLabel;
    Cb_kind: TUniComboBox;
    L_TipoProduto: TUniLabel;
    procedure SelectSql;Override;
    procedure InnerJoinSQL;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;

    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SeaMerchandise: TSeaMerchandise;

implementation

{$R *.dfm}

uses openForms;

{ TSeaMerchandise }

procedure TSeaMerchandise.GetView;
begin
  openCadMerchandise(cds_search.fieldByName('id').AsInteger,nil);
end;

procedure TSeaMerchandise.InnerJoinSql;
begin
  inherited;
    InnerJoinTxt := concat(
                   ' inner join tb_merchandise m ',
                   ' on ( m.id = pr.id ) and (m.tb_institution_id = pr.tb_institution_id) ',
                   ' inner join tb_stock s  ',
                   ' on (s.tb_merchandise_id = m.id ) and ( s.tb_institution_id = pr.tb_institution_id ) ',
                   ' inner join tb_category c ',
                   ' on (c.id = pr.tb_category_id) ',
                   ' inner join tb_brand b ',
                   ' on (b.id = m.tb_brand_id ) '
                  );

end;

procedure TSeaMerchandise.OrderBySql;
begin
  inherited;
  OrderByTxt := ' order by pr.description ';
end;

procedure TSeaMerchandise.SelectSql;
begin
  SelectTxt := ' select  pr.id, pr.description product , c.description category, m.id_internal '+
               ' from tb_product pr ';
end;

procedure TSeaMerchandise.SetParameters;
begin
  inherited;
  with UMM.Qr_Crud do
  Begin
   if E_CodeBar.Text <> '' then
     ParamByName('codebar').AsString :=  E_CodeBar.Text  ;

    if E_brand.Text <> '' then
      ParamByName('description').AsString := '%' + E_brand.Text + '%' ;

    if E_Location.Text <> '' then
      ParamByName('location').AsString :=  E_Location.Text  ;

    case Cb_kind.ItemIndex of
     1:ParamByName('kind').AsString := 'P';
     2:ParamByName('kind').AsString := 'M';
     3:ParamByName('kind').AsString := 'C';
     4:ParamByName('kind').AsString := 'A';
    end;

    //if E_Aplication.Text <> '' then
   //   ParamByName('aplication').AsAnsiString := '%' + E_Aplication.Text + '%' ;

    end;
end;

procedure TSeaMerchandise.SetRegister;
begin
   openCadMerchandise(0,nil);
end;

procedure TSeaMerchandise.WhereSql;
begin
  inherited;
  WhereTxt := WhereTxt + ' and m.tb_institution_id =:tb_institution_id';

  if E_CodeBar.Text <> '' then
    WhereTxt := WhereTxt + ' and (s.codebar =:codebar)';

  if E_brand.Text <> '' then
    WhereTxt := WhereTxt + ' and (b.description like :description)';

  if E_Location.Text <> '' then
    WhereTxt := WhereTxt + ' and (s.location =:location)';

   if Cb_kind.ItemIndex > 0 then
     WhereTxt := WhereTxt + ' and (m.kind =:kind)';

 //if E_Aplication.Text <> '' then
  //  WhereTxt := WhereTxt + ' and (m.aplication =:aplication)';

end;

end.
