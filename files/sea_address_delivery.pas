unit sea_address_delivery;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses, FireDAC.Stan.Param,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniEdit, uniLabel,
  uniPageControl;



type
  TSeaAddressDelivery = class(TBaseSearch)
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
    label2: TUniLabel;
    E_Description: TUniEdit;


  procedure SelectSql;Override;
  procedure InnerJoinSql;Override;
  procedure WhereSql;Override;
  procedure OrderBySql;Override;

  procedure SetParameters;Override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SeaAddressDelivery: TSeaAddressDelivery;

implementation

{$R *.dfm}

uses MainModule;

{ TBaseSearch1 }


procedure TSeaAddressDelivery.InnerJoinSql;
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

procedure TSeaAddressDelivery.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by ent.name_company ';
end;

procedure TSeaAddressDelivery.SelectSql;
begin
  SelectTxt := Concat(' SELECT adr.id, adr.street, co.name, st.name, ci.name, ent.name_company,  adr.nmbr, adr.complement, adr.neighborhood, adr.region, adr.kind, adr.zip_code  ',
               ' FROM tb_address adr '
                      )
end;

procedure TSeaAddressDelivery.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin

    if E_Description.Text <> '' then
      ParamByName('name_company').AsString := '%' + E_Description.Text + '%' ;
  end;
end;

procedure TSeaAddressDelivery.WhereSql;
begin
  inherited;
  WhereTxt := ' where adr.id is not null ';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (ent.name_company like :name_company)';
end;

end.
