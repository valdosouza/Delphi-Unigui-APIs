unit sea_city;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniEdit, uniLabel,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn, MainModule,
  uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses,FireDAC.Stan.Param,
  uniPanel,UniDBLookupComboBox, uniPageControl;

type
  TSeaCity = class(TBaseSearch)
    cds_searchid: TAutoIncField;
    cds_searchname: TStringField;
    cds_searchabbreviation: TStringField;
    L_Descricao: TUniLabel;
    E_State: TUniEdit;
    L_City: TUniLabel;
    E_City: TUniEdit;
    procedure SelectSql;Override;
    procedure InnerJoinSQl;Override;
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
  SeaCity: TSeaCity;

implementation

{$R *.dfm}

uses openForms;

{ TSeaCity }

procedure TSeaCity.GetView;
begin
  openCadCity(cds_searchid.AsInteger,nil);
end;

procedure TSeaCity.InnerJoinSQl;
begin
  InnerJoinTxt := InnerJoinTxt +
                  '  inner join tb_state s '+
                  '  on (c.tb_state_id = s.id)';
end;

procedure TSeaCity.OrderBySql;
begin
 inherited;
  OrderByTxt := 'order by c.name ';
   end;

procedure TSeaCity.SelectSql;
begin
  SelectTxt := ' Select distinct c.id, c.name, s.abbreviation '+
               ' from tb_city c ';
  end;

procedure TSeaCity.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin

    if E_State.Text <> '' then
      ParamByName('state').AsString := E_State.Text;

    if E_City.Text <> '' then
      ParamByName('city').AsString := '%' + E_City.Text + '%' ;
    end;
end;

procedure TSeaCity.SetRegister;
 Begin
   openCadCity(0,nil);
 End;


procedure TSeaCity.WhereSql;
begin
  inherited;
  WhereTxt := ' where ( c.id is not null ) ';

  if E_State.Text <> '' then
    WhereTxt := WhereTxt + ' and (s.abbreviation =:state)';

  if E_City.Text <> '' then
    WhereTxt := WhereTxt + ' and (c.name like :city)';
end;

end.
