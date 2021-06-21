unit sea_stock_list;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses, FireDAC.Stan.Param,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniCheckBox, uniEdit,
  uniLabel,UniDBLookupComboBox, uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaStockList = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchdescription: TStringField;
    cds_searchkind: TStringField;
    label1: TUniLabel;
    label2: TUniLabel;
    E_ID_Search: TUniEdit;
    E_Description: TUniEdit;

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
  SeaStockList: TSeaStockList;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TSeaStockList }

procedure TSeaStockList.GetView;
begin
  openCadStockList(cds_searchid.AsInteger,nil);
end;

procedure TSeaStockList.InnerJoinSql;
begin
//
end;

procedure TSeaStockList.OrderBySql;
begin
  inherited;
  OrderByTxt := ' order by sl.description ';
end;

procedure TSeaStockList.SelectSql;
begin
  SelectTxt := ' Select distinct sl.id, sl.description, sl.kind '+
               ' from tb_stock_list sl ';
end;

procedure TSeaStockList.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if E_ID_Search.Text <> '' then
      ParamByName('id').AsString := E_ID_Search.Text;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;

  end;
end;

procedure TSeaStockList.SetRegister;
begin
  openCadStockList(0,nil);
end;

procedure TSeaStockList.WhereSql;
begin
  inherited;
  WhereTxt := ' where sl.tb_institution_id =:tb_institution_id ';


  if E_ID_Search.Text <> '' then
    WhereTxt := WhereTxt + ' and (sl.id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (sl.description like :description)';


end;

end.
