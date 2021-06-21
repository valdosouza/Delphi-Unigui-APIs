unit sea_user;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniCheckBox, uniEdit,
  uniLabel, Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses,FireDAC.Stan.Param,
  uniPanel,MainModule, uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaUser = class(TBaseSearch)
    cds_searchname_company: TStringField;
    cds_searchemail: TStringField;
    cds_searchid: TIntegerField;
    L_Name: TUniLabel;
    E_Name_Company: TUniEdit;
    L_Email: TUniLabel;
    E_email: TUniEdit;
    chbx_cadAtivo: TUniCheckBox;

    procedure E_Name_CompanyChange(Sender: TObject);
    procedure UniFormShow(Sender: TObject);

  private
    { Private declarations }
  protected
    procedure InitVariable; Override;

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
  SeaUser: TSeaUser;

implementation

{$R *.dfm}

uses openForms;

{ TSeaUser }

procedure TSeaUser.E_Name_CompanyChange(Sender: TObject);
begin
  inherited;
     //
end;

procedure TSeaUser.GetView;
Var
  lcodigo : TuniEdit;
begin
  lcodigo := TuniEdit.Create(Self);
  lcodigo.Tag := cds_searchid.AsInteger;
  openCadUser(lcodigo,Self.InstitutionID);
end;

procedure TSeaUser.InitVariable;
begin
  PInterface := 13;
  inherited;
end;

procedure TSeaUser.InnerJoinSql;
begin

  InnerJoinTxt := Concat(
                        'inner join tb_entity en ',
                        'on (u.id = en.id ) ',
                        'inner join tb_entity_has_mailing ehm ',
                        'on (ehm.tb_entity_id = en.id) and (ehm.tb_mailing_group_id = 2) ',
                        'inner join tb_mailing ma ',
                        'on (ehm.tb_mailing_id = ma.id ) ',
                        'inner join tb_institution_has_user i ',
                        'on (u.id = i.tb_user_id) ');

end;

procedure TSeaUser.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by en.name_company ';
end;

procedure TSeaUser.SelectSql;
begin
  inherited;
   SelectTxt := ' Select distinct u.id, en.name_company, ma.email '+
               ' from tb_user u ';
end;

procedure TSeaUser.SetParameters;
begin
  inherited;
    with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := Self.InstitutionID;

    if E_Name_Company.Text <> '' then
      ParamByName('name_company').AsString := '%' + E_Name_Company.Text + '%';

    if E_Email.Text <> '' then
      ParamByName('email').AsString := '%' + E_Email.Text + '%' ;

    if chbx_cadAtivo.Checked then
      ParamByName('active').AsString := 'S'
    else
      ParamByName('active').AsString := 'N';

  end;
end;


procedure TSeaUser.SetRegister;
begin
  openCadUser(nil,Self.InstitutionID);
 end;

procedure TSeaUser.UniFormShow(Sender: TObject);
begin
  inherited;
  chbx_cadAtivo.Checked := True;
end;

procedure TSeaUser.WhereSql;
begin
  inherited;
  WhereTxt := ' where i.tb_institution_id =:tb_institution_id ';

  WhereTxt := WhereTxt + ' and (i.active =:active) ';

  if E_Name_Company.Text <> '' then
    WhereTxt := WhereTxt + ' and (en.name_company like :name_company)';

  if E_email.Text <> '' then
    WhereTxt := WhereTxt + ' and (ma.email like :email)';
end;

end.
