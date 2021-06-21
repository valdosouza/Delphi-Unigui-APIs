unit sea_veh_brand_model;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniEdit, uniLabel,
  uniPageControl;

type
  TSeaVehBrandModel = class(TBaseSearch)
    cds_searchdescriptionVb: TStringField;
    cds_searchdescriptionModel: TStringField;
    cds_searchid: TIntegerField;
    label2: TUniLabel;
    E_Marca: TUniEdit;
    UniLabel1: TUniLabel;
    E_model: TUniEdit;
    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
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
  SeaVehBrandModel: TSeaVehBrandModel;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TSeaVehicleBrandModel }

procedure TSeaVehBrandModel.GetView;
Var
  lcodigo : TUniEdit;
begin
  lcodigo := TUniEdit.Create(Self);
  lcodigo.Tag := cds_searchid.AsInteger;
  openCadVehicleBrandModel(lcodigo)
end;

procedure TSeaVehBrandModel.InnerJoinSql;
begin
InnerJoinTxt := concat( ' LEFT OUTER JOIN tb_vehicle_model vm ',
                        ' ON vm.tb_vehicle_brand_id = vb.id '
                        );
end;

procedure TSeaVehBrandModel.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by vb.description ';
end;

procedure TSeaVehBrandModel.SelectSql;
begin
  SelectTxt :=  Concat('  SELECT vb.id ,vb.description descriptionVb, vm.description descriptionModel ',
                       '  FROM tb_vehicle_brand vb '
                       );
end;

procedure TSeaVehBrandModel.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    if E_Marca.Text <> '' then
      ParamByName('brand').AsString :=  '%' + E_Marca.Text + '%';

    if E_model.Text <> '' then
      ParamByName('model').AsString := '%' + E_model.Text + '%' ;
  end;
end;

procedure TSeaVehBrandModel.SetRegister;
begin
  inherited;
  openCadVehicleBrandModel(nil)
end;

procedure TSeaVehBrandModel.WhereSql;
begin
  inherited;
  WhereTxt := ' where vb.id is not null ';

  if E_Marca.Text <> '' then
    WhereTxt := WhereTxt + ' and (vb.description like :brand)';

  if E_model.Text <> '' then
    WhereTxt := WhereTxt + ' and (vm.description like :model)';
end;

end.
