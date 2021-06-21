unit sea_adress;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniEdit, uniLabel;

type
  TSeaAdress = class(TBaseSearch)
    label2: TUniLabel;
    E_Description: TUniEdit;
    cds_searchid: TIntegerField;
    cds_searchstreet: TStringField;
    cds_searchname: TStringField;
    cds_searchname_1: TStringField;
    cds_searchname_2: TStringField;
    cds_searchname_company: TStringField;
    cds_searchnmbr: TStringField;
    cds_searchcomplement: TStringField;
    cds_searchneighborhood: TStringField;
    cds_searchregion: TStringField;
    cds_searchkind: TStringField;
    cds_searchzip_code: TStringField;


  procedure SelectSql;Override;
  procedure InnerJoinSql;Override;
  procedure WhereSql;Override;
  procedure OrderBySql;Override;

  procedure SetParameters;Override;
  //procedure GetView;Override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SeaAdress: TSeaAdress;

implementation

{$R *.dfm}

uses MainModule;

{ TBaseSearch1 }


procedure TSeaAdress.InnerJoinSql;
begin
  InnerJoinTxt := Concat(
                  ' INNER JOIN tb_entity ent ',
                  ' on (ent.id = adr.id)  ',
                  ' INNER join tb_country co',
                  ' on (co.id = adr.tb_country_id)',
                  ' inner join tb_state st',
                  ' on (st.id = adr.tb_state_id)',
                  ' inner join tb_city ci ',
                  ' on (ci.id = adr.tb_city_id)'
                         )
end;

procedure TSeaAdress.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by ent.name_company ';
end;

procedure TSeaAdress.SelectSql;
begin
  SelectTxt := Concat(' SELECT adr.id, adr.street, co.name, st.name, ci.name, ent.name_company,  adr.nmbr, adr.complement, adr.neighborhood, adr.region, adr.kind, adr.zip_code  ',
               ' FROM tb_address adr '
                      )
end;

procedure TSeaAdress.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin

    if E_Description.Text <> '' then
      ParamByName('name_company').AsString := '%' + E_Description.Text + '%' ;
  end;
end;

procedure TSeaAdress.WhereSql;
begin
  inherited;
  WhereTxt := ' where adr.id is not null ';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (ent.name_company like :name_company)';
end;

end.
