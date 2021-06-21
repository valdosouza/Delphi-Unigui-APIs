unit sea_country;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniCheckBox, uniEdit,
  uniLabel, Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses,FireDAC.Stan.Param,
  uniPanel,MainModule, UniDBLookupComboBox, uniPageControl;

type
  TSeaCountry = class(TBaseSearch)
    cds_searchid: TAutoIncField;
    cds_searchname: TStringField;
    E_Country: TUniEdit;
    L_NameCompany: TUniLabel;
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
  SeaCountry: TSeaCountry;

implementation

{$R *.dfm}

uses openForms;

{ TSeaCountry }

procedure TSeaCountry.GetView;
begin
  openCadCountry(cds_searchid.AsInteger,nil);
end;

procedure TSeaCountry.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by c.name ';
end;

procedure TSeaCountry.SelectSql;
begin
  inherited;
  SelectTxt := ' Select distinct id, name '+
               ' from tb_country c ';
end;

procedure TSeaCountry.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    if E_Country.Text <> '' then
      ParamByName('country').AsString := '%' + E_Country.Text + '%';

    end;

end;

procedure TSeaCountry.SetRegister;
begin
   openCadCountry(0,nil);
end;

procedure TSeaCountry.WhereSql;
begin
  inherited;
   WhereTxt := ' where ( c.id is not null ) ';

  if E_Country.Text <> '' then
    WhereTxt := WhereTxt + ' and (c.name like :country)';

  end;

end.
