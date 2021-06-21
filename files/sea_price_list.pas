unit sea_price_list;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses, FireDAC.Stan.Param,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel,UniEdit,UniLabel,
  uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaPriceList = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchdescription: TStringField;
    E_Codigo: TUniEdit;
    E_Description: TUniEdit;
    label1: TUniLabel;
    label2: TUniLabel;
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
  SeaPriceList: TSeaPriceList;

implementation

{$R *.dfm}

uses MainModule,openforms;

{ TSeaPriceList }

procedure TSeaPriceList.GetView;
begin
  openCadPriceList(cds_searchid.AsInteger,nil);
end;

procedure TSeaPriceList.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by pl.description ';
end;

procedure TSeaPriceList.SelectSql;
begin
  SelectTxt := ' Select distinct pl.id, pl.description'+
               ' from tb_price_list pl ';
end;

procedure TSeaPriceList.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if E_Codigo.Text <> '' then
      ParamByName('id').AsString := E_Codigo.Text;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;

  end;
end;

procedure TSeaPriceList.SetRegister;
begin
  openCadPriceList(0,nil);
end;

procedure TSeaPriceList.WhereSql;
begin
  inherited;
  WhereTxt := ' where pl.tb_institution_id =:tb_institution_id ';


  if E_Codigo.Text <> '' then
    WhereTxt := WhereTxt + ' and (pl.id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (pl.description like :description)';

end;

end.
