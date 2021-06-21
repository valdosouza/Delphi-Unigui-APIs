unit sea_brand;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniCheckBox, uniEdit,
  uniLabel, Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses,
  uniPanel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  UniDBLookupComboBox, uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaBrand = class(TBaseSearch)
    label1: TUniLabel;
    label2: TUniLabel;
    E_Description: TUniEdit;
    E_Codigo: TUniEdit;
    chbx_cadAtivo: TUniCheckBox;
    cds_searchid: TIntegerField;
    cds_searchdescription: TStringField;

  private
    { Private declarations }
  protected
    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;

    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;

  public
    { Public declarations }
  end;

var
  SeaBrand: TSeaBrand;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TSeaBrand }

procedure TSeaBrand.GetView;
begin
  openCadBrand(cds_searchid.AsInteger,nil);
end;

procedure TSeaBrand.InnerJoinSql;
begin
  InnerJoinTxt := '  inner join tb_institution_has_brand i '+
                  '  on (b.id = i.tb_brand_id)  ';
end;

procedure TSeaBrand.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by b.description ';
end;

procedure TSeaBrand.SelectSql;
begin
  SelectTxt := ' Select distinct b.id, b.description '+
               ' from tb_brand b ';
end;

procedure TSeaBrand.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if E_Codigo.Text <> '' then
      ParamByName('id').AsString := E_Codigo.Text;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;

    if chbx_cadAtivo.Checked then
      ParamByName('active').AsString := 'S'
    else
      ParamByName('active').AsString := 'N';
  end;
end;

procedure TSeaBrand.SetRegister;
begin
  openCadBrand(0,nil);
end;

procedure TSeaBrand.WhereSql;
begin
  inherited;
  WhereTxt := ' where i.tb_institution_id =:tb_institution_id ';

  WhereTxt := WhereTxt + ' and (i.active =:active) ';

  if E_Codigo.Text <> '' then
    WhereTxt := WhereTxt + ' and (b.id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (b.description like :description)';
end;

end.
