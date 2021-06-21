unit sea_bank_charge_ticket;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniRadioGroup, uniLabel,
  uniEdit, uniPanel, Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton,
  uniBitBtn, uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid,
  uniGUIBaseClasses, fm_bank, uniPageControl, Vcl.Menus, uniMainMenu,
  uniCheckBox;

type
  TSeaBankChargeTicket = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchdescription: TStringField;
    cds_searchnumber: TStringField;
    cds_searchemission_by: TStringField;
    cds_searchbank: TStringField;
    cds_searchbank_id: TIntegerField;
    Ctn_Bank: TUniContainerPanel;
    E_Description: TUniEdit;
    Rg_Emission_By: TUniRadioGroup;
    E_Number: TUniEdit;
    pnl_param_row_1: TUniPanel;
    pnl_param_row_2: TUniPanel;
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
  SeaBankChargeTicket: TSeaBankChargeTicket;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TSeaBankChargeTicket }

procedure TSeaBankChargeTicket.FormatScreen;
begin
 inherited;
 ShowBank;
end;

procedure TSeaBankChargeTicket.GetView;
begin
 openCadBankChargeTicket(cds_searchid.AsInteger,
                         cds_searchbank_id.AsInteger,
                         cds_searchnumber.AsString,
                         nil);
end;

procedure TSeaBankChargeTicket.InnerJoinSql;
begin
  InnerJoinTxt := concat(
                   ' inner join tb_bank b '+
                   ' on (b.id = bct.tb_bank_id) ',
                   ' inner join tb_entity enb ',
                   ' on (b.id = enb.id) '
                   );
end;

procedure TSeaBankChargeTicket.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by enb.name_company ';
end;

procedure TSeaBankChargeTicket.SelectSql;
begin
  SelectTxt := concat(
               ' Select distinct bct.id, bct.description, bct.number,',
               '  bct.emission_by, enb.id bank_id, enb.name_company bank  ',
               ' from tb_bank_charge_ticket bct '
               );
end;

procedure TSeaBankChargeTicket.SetParameters;
begin
   with UMM.Qr_Crud do
  Begin
    if E_Number.Text <> '' then
      ParamByName('number').AsString := E_Number.Text  ;

    if Rg_Emission_By.ItemIndex  = 0  then
      ParamByName('emission_by').AsString := 'C'
    else
      ParamByName('emission_by').AsString := 'B';

    if (FrBank.DBLCB_Lista.KeyValue <> null) then
      ParamByName('b_id').AsInteger := FrBank.DBLCB_Lista.KeyValue;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := E_description.Text  ;

  End;
end;

procedure TSeaBankChargeTicket.SetRegister;
begin
 openCadBankChargeTicket(0,cds_searchbank_id.AsInteger,
                           cds_searchnumber.AsString,
                            nil);
end;

procedure TSeaBankChargeTicket.ShowBank;
begin
  FrBank := TFmBank.Create(Self);
  FrBank.Parent := Ctn_Bank;
  FrBank.Align := alClient;
  FrBank.Listar;
  FrBank.Show;
end;

procedure TSeaBankChargeTicket.WhereSql;
begin
  inherited;
  WhereTxt :=  ' where ( bct.id is not null ) ';

  if FrBank.DBLCB_Lista.KeyValue <> null then
    WhereTxt := WhereTxt + ' and (b.id =:b_id)';

  if E_Description.Text <> ''  then
    WhereTxt := WhereTxt + ' and (bct.description =:description)';

  if E_Number.Text <> ''  then
    WhereTxt := WhereTxt + ' and (bct.number =:number)';

    WhereTxt := WhereTxt + ' and (bct.emission_by =:emission_by)';


end;

end.
