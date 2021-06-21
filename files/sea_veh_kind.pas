unit sea_veh_kind;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniEdit, uniLabel,
  uniPageControl;

type
  TSeaVehKind = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchdescription: TStringField;
    label1: TUniLabel;
    E_Codigo: TUniEdit;
    label2: TUniLabel;
    E_Description: TUniEdit;

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
  SeaVehKind: TSeaVehKind;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TSeaVehicleKind }

procedure TSeaVehKind.GetView;
Var
  lcodigo : TUniEdit;
begin
  lcodigo := TUniEdit.Create(Self);
  lcodigo.Tag := cds_searchid.AsInteger;
  openCadVehicleKind(lcodigo);
end;

procedure TSeaVehKind.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by vk.description ';
end;

procedure TSeaVehKind.SelectSql;
begin
  SelectTxt :=  Concat('  SELECT  vk.id, vk.description ',
                       '  FROM tb_vehicle_kind vk  '
                       );
end;

procedure TSeaVehKind.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    if E_Codigo.Text <> '' then
      ParamByName('id').AsString := E_Codigo.Text;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;
  end;
end;

procedure TSeaVehKind.SetRegister;
begin
  inherited;
  openCadVehicleKind(nil);
end;

procedure TSeaVehKind.WhereSql;
begin
  inherited;
  WhereTxt := ' where vk.id is not null ';

  if E_Codigo.Text <> '' then
    WhereTxt := WhereTxt + ' and (vk.id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (vk.description like :description)';
end;

end.
