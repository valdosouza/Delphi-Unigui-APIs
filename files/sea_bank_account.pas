unit sea_bank_account;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniPanel, uniEdit,
  uniLabel, uniGroupBox, Datasnap.Provider, Data.DB, Datasnap.DBClient,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid,
  uniGUIBaseClasses, Fm_Bank, uniPageControl, Vcl.Menus, uniMainMenu,
  uniCheckBox;

type
  TSeaBankAccount = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchnumber: TStringField;
    cds_searchagency: TStringField;
    cds_searchbank: TStringField;
    E_Agency: TUniEdit;
    E_Number: TUniEdit;
    Ctn_Bank: TUniContainerPanel;
    pnl_parameter_row_1: TUniPanel;
    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;
    procedure FormatScreen;Override;


    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;
  private
    { Private declarations }
    procedure ShowBank;

  public
    { Public declarations }
    FrBank : TFmBank;

  end;

var
  SeaBankAccount: TSeaBankAccount;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TSeaBankAccount }

procedure TSeaBankAccount.FormatScreen;
begin
  inherited;
  ShowBank;
end;

procedure TSeaBankAccount.GetView;
begin
  openCadBankAccount(cds_searchid.AsInteger,nil);
end;

procedure TSeaBankAccount.InnerJoinSql;
begin
  InnerJoinTxt := concat(
                   ' inner join tb_bank b ',
                   ' on (b.id = bc.tb_bank_id) ',
                   ' inner join tb_entity enb ',
                   ' on (b.id = enb.id) '
                  );
end;

procedure TSeaBankAccount.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by enb.name_company ';
end;

procedure TSeaBankAccount.SelectSql;
begin
  SelectTxt := ' Select distinct bc.id, bc.number, bc.agency, enb.name_company bank  '+
               ' from tb_bank_account bc ';
end;

procedure TSeaBankAccount.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if (FrBank.DBLCB_Lista.KeyValue <> null) then
      ParamByName('b_id').AsInteger := FrBank.DBLCB_Lista.KeyValue;

    if E_Number.Text <> '' then
      ParamByName('number').AsString := E_number.Text  ;

    if E_Agency.Text <> '' then
      ParamByName('agency').AsString :=  E_Agency.Text  ;

  End;
end;

procedure TSeaBankAccount.SetRegister;
begin
  openCadBankAccount(0,nil);
end;

procedure TSeaBankAccount.ShowBank;
begin
  FrBank := TFmBank.Create(Self);
  FrBank.Parent := Ctn_Bank;
  FrBank.Align := alClient;
  FrBank.Listar;
  FrBank.Show;
end;

procedure TSeaBankAccount.WhereSql;
begin
 inherited;
  WhereTxt := ' where bc.tb_institution_id =:tb_institution_id ';

  if FrBank.DBLCB_Lista.KeyValue <> null then
    WhereTxt := WhereTxt + ' and (b.id =:b_id)';

  if E_Agency.Text <> '' then
    WhereTxt := WhereTxt + ' and (bc.agency =:agency)';

  if E_Number.Text <> ''  then
    WhereTxt := WhereTxt + ' and (bc.number =:number)';


end;

end.
