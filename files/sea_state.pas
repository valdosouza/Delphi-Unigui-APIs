unit sea_state;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniEdit, uniLabel,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,  FireDAC.Stan.Param,
  uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses,
  uniPanel,MainModule,uniDBLookupComboBox, uniPageControl;

type
  TSeaState = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchabbreviation: TStringField;
    cds_searchname: TStringField;
    L_Descricao: TUniLabel;
    E_Country: TUniEdit;
    UniLabel1: TUniLabel;
    E_State: TUniEdit;
    procedure InnerJoinSql;Override;
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
  SeaState: TSeaState;

implementation

{$R *.dfm}

uses openForms;

{ TSeaState }

procedure TSeaState.GetView;
Var
  lcodigo : TUniDBLookupComboBox;
begin
  lcodigo := TUniDBLookupComboBox.Create(Self);
  lcodigo.Tag := cds_searchid.AsInteger;
  openCadState(lcodigo);
end;
procedure TSeaState.InnerJoinSql;
begin
  inherited;
  InnerJoinTxt := InnerJoinTxt +
                  ' inner join tb_country c '+
                  ' on (c.id = s.tb_country_id)  ';
end;

procedure TSeaState.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by s.name ';
end;

procedure TSeaState.SelectSql;
begin
  inherited;
  SelectTxt := ' Select distinct s.id, s.abbreviation, s.name '+
               ' from tb_state s ';
end;

procedure TSeaState.SetParameters;
begin
  inherited;
    with UMM.Qr_Crud do
  Begin
    if E_Country.Text <> '' then
      ParamByName('country').AsString := '%' + E_Country.Text + '%';

    if E_State.Text <> '' then
      ParamByName('state').AsString := '%' + E_State.Text + '%' ;

    end;
end;

procedure TSeaState.SetRegister;
begin
  openCadState(nil);
 end;

procedure TSeaState.WhereSql;
begin
  inherited;

  WhereTxt := ' where ( s.id is not null ) ';

  if E_Country.Text <> '' then
    WhereTxt := WhereTxt + ' and (c.name like :country)';

  if E_State.Text <> '' then
    WhereTxt := WhereTxt + ' and (s.name like :state)';
end;

end.
