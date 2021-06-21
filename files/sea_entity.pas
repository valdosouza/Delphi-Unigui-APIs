unit sea_entity;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniDateTimePicker,
  uniCheckBox, uniEdit, uniLabel, UnFunctions,FireDAC.Stan.Param, uniPageControl,
  Vcl.Menus, uniMainMenu;

type
  TSeaEntity = class(TBaseSearch)
    cds_searchid: TAutoIncField;
    cds_searchname_company: TStringField;
    cds_searchemail: TStringField;
    E_note: TUniEdit;
    E_Reason: TUniEdit;
    E_Fantasy: TUniEdit;
    ChBx_Active: TUniCheckBox;
    E_Code: TUniEdit;
    E_Neighborhood: TUniEdit;
    E_Region: TUniEdit;
    E_State: TUniEdit;
    E_Phone: TUniEdit;
    E_Email: TUniEdit;
    E_City: TUniEdit;
    pnl_param_row_1: TUniPanel;
    pnl_data: TUniPanel;
    ChBx_Periodo: TUniCheckBox;
    pnl_data_campos: TUniPanel;
    DTP_Date_Initial: TUniDateTimePicker;
    DTP_Date_End: TUniDateTimePicker;
    pnl_param_row_2: TUniPanel;
    pnl_param_row_3: TUniPanel;
    procedure ChBx_PeriodoClick(Sender: TObject);
  private
    { Private declarations }
  protected
    groupmailingID : String;
    procedure FormatScreen;Override;
    procedure InitVariable;Override;

    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;
    procedure GroupBySql;Override;

    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure Search;Override;
    procedure SetRegister;Override;
  public
  end;

var
  SeaEntity: TSeaEntity;

implementation

{$R *.dfm}

uses MainModule;

{ TSeaEntity }

procedure TSeaEntity.ChBx_PeriodoClick(Sender: TObject);
begin
  DTP_Date_Initial.Enabled := ChBx_Periodo.Checked;
  DTP_Date_End.Enabled := ChBx_Periodo.Checked;
end;

procedure TSeaEntity.FormatScreen;
begin
  inherited;
  //
end;

procedure TSeaEntity.GetView;
begin
  inherited;
  //
end;

procedure TSeaEntity.GroupBySql;
begin
  inherited;
  //
end;

procedure TSeaEntity.InitVariable;
begin
  inherited;
  ChBx_Active.Checked := True;
  ChBx_Periodo.Checked:= False;
  DTP_Date_Initial.DateTime := Date - 30;
  DTP_Date_Initial.DateTime := Date;
  //Define grupo de email sera lista na pesquisa
  groupmailingID := '1';//Principal
end;

procedure TSeaEntity.InnerJoinSql;
begin

  if ( E_Neighborhood.Text <> '' ) or ( E_Region.Text <> '' ) or
      ( E_State.Text <> '' ) or (E_City.Text <> '' ) then
  Begin
    InnerJoinTxt := InnerJoinTxt +
                    ' inner join tb_address ad on (ad.id = en.id) ';
  End;

  if E_State.Text <> ''  then
  Begin
    InnerJoinTxt := InnerJoinTxt +
                    ' inner join tb_state st on (st.id = ad.tb_state_id) ';
  End;

  if E_City.Text <> ''  then
  Begin
    InnerJoinTxt := InnerJoinTxt +
                    ' inner join tb_city cy on (cy.id = ad.tb_city_id) ';
  End;

  if E_Email.Text <> ''  then
  Begin
    InnerJoinTxt :=
      Concat(InnerJoinTxt,
             ' inner join tb_entity_has_mailing ehm ',
             ' on (ehm.tb_entity_id = en.id) and (ehm.tb_mailing_group_id = ',groupmailingID,') ',
             ' inner join tb_mailing ma on (ehm.tb_mailing_id = ma.id ) ');
  End
  else
  Begin
    InnerJoinTxt :=
      Concat(InnerJoinTxt,
             ' left outer join tb_entity_has_mailing ehm ',
             ' on (ehm.tb_entity_id = en.id) and (ehm.tb_mailing_group_id = ',groupmailingID,') ',
             ' left outer join tb_mailing ma on (ehm.tb_mailing_id = ma.id ) ');
  End;

  if E_Phone.Text <> ''  then
  Begin
    InnerJoinTxt :=
      InnerJoinTxt + ' inner join tb_phone ph on (ph.id = en.id) ';

  End;

  //union======================================================================

  if ( E_Neighborhood.Text <> '' ) or ( E_Region.Text <> '' ) or
     ( E_State.Text <> '' ) or ( E_City.Text <> '' ) then
  Begin
    InnerJoinTxt_1 :=
      InnerJoinTxt_1 +
      ' inner join tb_address ad on (ad.id = en.id) ';
  End;

  if E_State.Text <> ''  then
  Begin
    InnerJoinTxt_1 :=
      InnerJoinTxt_1 +
      ' inner join tb_state st on (st.id = ad.tb_state_id) ';
  End;

  if E_City.Text <> ''  then
  Begin
    InnerJoinTxt_1 :=
      InnerJoinTxt_1 +
        ' inner join tb_city cy on (cy.id = ad.tb_city_id) ';
  End;

  if E_Email.Text <> ''  then
  Begin
    InnerJoinTxt_1 := Concat(InnerJoinTxt_1,
                           ' inner join tb_entity_has_mailing ehm ',
                           ' on (ehm.tb_entity_id = en.id) and (ehm.tb_mailing_group_id = ',groupmailingID,') ',
                           ' inner join tb_mailing ma ',
                           ' on (ehm.tb_mailing_id = ma.id ) ');
  End
  else
  Begin
    InnerJoinTxt_1 := Concat(InnerJoinTxt_1,
                           ' left outer join tb_entity_has_mailing ehm ',
                           ' on (ehm.tb_entity_id = en.id) and (ehm.tb_mailing_group_id = ',groupmailingID,') ',
                           ' left outer join tb_mailing ma ',
                           ' on (ehm.tb_mailing_id = ma.id ) ');
  End;

  if E_Phone.Text <> ''  then
  Begin
    InnerJoinTxt_1 := InnerJoinTxt_1 +
                     ' inner join tb_phone ph '+
                     ' on (ph.id = en.id) ';
  End;

end;

procedure TSeaEntity.Search;
begin
  inherited;
end;

procedure TSeaEntity.SelectSql;
begin
  SelectTxt :=      'SELECT en.id, en.name_company, en.nick_trade, ma.email '+
                    'FROM tb_entity en ';

  SelectTxt_1 := 'SELECT en.id, en.name_company, en.nick_trade, ma.email  '+
                    'FROM tb_entity en ';
end;

procedure TSeaEntity.SetParameters;
Begin
  with UMM.Qr_Crud do
  Begin
    if ChBx_Periodo.Checked then
    Begin
      ParamByName('dataini').AsString := ConverteData( DTP_Date_Initial.DateTime );
      ParamByName('datafim').AsString := ConverteData( DTP_Date_End.DateTime );
    end;
    if (E_Code.Text  <> '') then
      ParamByName('code_entity').AsInteger := StrToIntDef( E_Code.Text,0 );
    if (E_Reason.Text  <> '') then
      ParamByName('name_company').AsString := '%' + Copy(E_Reason.Text,1,98) + '%';
    if (E_Fantasy.Text  <> '') then
      ParamByName('nick_trade').AsString := '%' + Copy(E_Fantasy.Text,1,98) + '%';
    if (E_Neighborhood.Text  <> '') then
      ParamByName('neighborhood').AsString := '%' + (E_Neighborhood.Text) + '%';
    if (E_Region.Text  <> '') then
      ParamByName('region').AsString := '%' + (E_Region.Text) + '%';
    if (E_State.Text  <> '') then
      ParamByName('state').AsString := (E_State.Text) ;
    if (E_City.Text  <> '') then
      ParamByName('city').AsString := '%' + (E_City.Text) + '%';
    if (E_Email.Text  <> '') then
      ParamByName('email').AsString := '%' + (E_Email.Text) + '%';
    if (E_Phone.Text  <> '') then
      ParamByName('number').AsString := '%' + RemoveCaracterInformado(E_Phone.Text, ['(',')',' ','-','-']);
    if (E_note.Text  <> '') then
      ParamByName('note').AsString := '%' + (E_note.Text) + '%';
    end;
end;

procedure TSeaEntity.SetRegister;
begin
  inherited;
  //
end;

procedure TSeaEntity.WhereSql;
begin
  WhereTxt := 'WHERE ( en.id > 0 ) ';
  WhereTxt_1 := 'WHERE ( en.id > 0 ) ';

  if ChBx_Periodo.Checked then
  Begin
    WhereTxt := WhereTxt + ' AND ( en.created_at between :dataini and :datafim ) ';
    WhereTxt_1 := WhereTxt_1 + ' AND ( en.created_at between :dataini and :datafim ) ';
  end;

  if (E_Code.Text  <> '') then
  Begin
    WhereTxt := WhereTxt + ' AND en.id =:code_entity ';
    WhereTxt_1 := WhereTxt_1 + ' AND en.id = :code_entity ';
  End;

  if (E_Reason.Text  <> '') then
  Begin
    WhereTxt := WhereTxt + ' and ( en.name_company like :name_company ) ';
    WhereTxt_1 := WhereTxt_1 + ' and ( en.name_company like :name_company ) ';
  End;

  if (E_Fantasy.Text  <> '') then
  Begin
    WhereTxt := WhereTxt + ' and ( en.nick_trade like :nick_trade ) ';
    WhereTxt_1 := WhereTxt_1 + ' and ( en.nick_trade like :nick_trade ) ';
  End;

  if (E_Neighborhood.Text  <> '') then
  Begin
    WhereTxt := WhereTxt + ' and ( ad.neighborhood like :neighborhood ) ';
    WhereTxt_1 := WhereTxt_1 + ' and ( ad.neighborhood like :neighborhood ) ';
  End;

  if (E_Region.Text  <> '') then
  Begin
    WhereTxt := WhereTxt + ' and ( ad.region like :region) ';
    WhereTxt_1 := WhereTxt_1 + ' and ( ad.region like :region ) ';
  End;

  if (E_State.Text  <> '') then
  Begin
    WhereTxt := WhereTxt + ' and ( st.abbreviation = :state) ';
    WhereTxt_1 := WhereTxt_1 + ' and ( st.abbreviation = :state ) ';
  End;

  if (E_City.Text  <> '') then
  Begin
    WhereTxt := WhereTxt + ' and ( cy.name like :city) ';
    WhereTxt_1 := WhereTxt_1 + ' and ( cy.name like :city ) ';
  End;

  if (E_Email.Text  <> '') then
  Begin
    WhereTxt := WhereTxt + ' and ( ma.email like :email) ';
    WhereTxt_1 := WhereTxt_1 + ' and ( ma.email like :email) ';
  End;

  if (E_Phone.Text  <> '') then
  Begin
    WhereTxt := WhereTxt + ' and ( ph.number like :number) ';
    WhereTxt_1 := WhereTxt_1 + ' and ( ph.number like :number) ';
  End;

  if (E_note.Text  <> '') then
  Begin
    WhereTxt := WhereTxt + ' and ( en.note like :note) ';
    WhereTxt_1 := WhereTxt_1 + ' and ( en.note like :note) ';
  End;
end;

procedure TSeaEntity.OrderBySql;
begin
  inherited;
  OrderByTxt := 'Order By name_company ';
end;

end.
