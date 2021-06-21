unit sea_bank;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, UniLabel, UniCheckBox, UniEdit,
  uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaBank = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchname_company: TStringField;
    cds_searchnumber: TStringField;
    pnl_row_1: TUniPanel;
    E_Id: TUniEdit;
    E_Number: TUniEdit;
    E_Name_Company: TUniEdit;
    pnl_row_2: TUniPanel;
    chbx_cad_active: TUniCheckBox;
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
  SeaBank: TSeaBank;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TSeaBank }

procedure TSeaBank.GetView;
begin
  inherited;
  openCadBank(cds_searchid.AsInteger,nil);
end;

procedure TSeaBank.InnerJoinSql;
begin
  InnerJoinTxt := concat(
                  '  inner join tb_institution_has_bank i '+
                  '  on (b.id = i.tb_bank_id)  ',
                  '  inner join tb_entity en '+
                  '  on (en.id = b.id) '
                  );

end;

procedure TSeaBank.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by en.name_company ';
end;

procedure TSeaBank.SelectSql;
begin
  SelectTxt := ' Select distinct b.id, b.number, en.name_company '+
               ' from tb_bank b ';
end;

procedure TSeaBank.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if E_ID.Text <> '' then
      ParamByName('id').AsString := E_ID.Text;

    if E_Number.Text <> '' then
      ParamByName('number').AsString := '%' + E_Number.Text + '%';

    if E_Name_Company.Text <> '' then
      ParamByName('name_company').AsString := '%' + E_Name_Company.Text + '%' ;

    if chbx_cad_active.Checked then
      ParamByName('active').AsString := 'S'
    else
      ParamByName('active').AsString := 'N';
  end;

end;

procedure TSeaBank.SetRegister;
begin
  openCadBank(0,nil);
end;

procedure TSeaBank.WhereSql;
begin
  inherited;
  WhereTxt := ' where i.tb_institution_id =:tb_institution_id ';

  WhereTxt := WhereTxt + ' and (i.active =:active) ';

  if E_ID.Text <> '' then
    WhereTxt := WhereTxt + ' and (b.id =:id)';

  if E_Number.Text <> ''  then
    WhereTxt := WhereTxt + ' and (b.number like :number)';

  if E_Name_Company.Text <> '' then
    WhereTxt := WhereTxt + ' and (en.name_company like :name_company)';


end;

end.
