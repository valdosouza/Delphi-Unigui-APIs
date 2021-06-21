unit sea_med_material;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses, FireDAC.Stan.Param,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel,UniLabel,UniEdit,UniComboBox,
  uniMultiItem, UniDBLookupComboBox, uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaMedMaterial = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchdescription: TStringField;
    cds_searchdestiny: TIntegerField;
    label1: TUniLabel;
    E_Codigo: TUniEdit;
    label2: TUniLabel;
    E_Description: TUniEdit;
    Cb_destiny: TUniComboBox;
    UniLabel1: TUniLabel;
    procedure SelectSql;Override;
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
  SeaMedMaterial: TSeaMedMaterial;

implementation

{$R *.dfm}

uses MainModule,openForms;

{ TSeaMedMaterial }

procedure TSeaMedMaterial.GetView;
begin
  openCadMedMaterial(cds_searchid.AsInteger,nil);
end;

procedure TSeaMedMaterial.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by mm.description ';
end;

procedure TSeaMedMaterial.SelectSql;
begin
  SelectTxt := ' Select distinct mm.id, mm.description, mm.destiny'+
               ' from tb_med_material mm ';
end;

procedure TSeaMedMaterial.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if E_Codigo.Text <> '' then
      ParamByName('id').AsString := E_Codigo.Text;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;

     if Cb_Destiny.Text <> '' then
      ParamByName('destiny').AsInteger := Cb_Destiny.ItemIndex;

   end;
end;

procedure TSeaMedMaterial.SetRegister;
begin
  openCadMedMaterial(0,nil);
end;

procedure TSeaMedMaterial.WhereSql;
begin
  inherited;
  WhereTxt := ' where mm.tb_institution_id =:tb_institution_id ';


  if E_Codigo.Text <> '' then
    WhereTxt := WhereTxt + ' and (mm.id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (mm.description like :description)';

  if Cb_Destiny.Text <> '' then
    WhereTxt := WhereTxt + ' and (mm.destiny =:destiny)';


end;


end.
