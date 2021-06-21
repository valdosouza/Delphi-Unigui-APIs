unit sea_bank_charge_slip;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniPanel, uniGroupBox,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses, fm_bank,
  uniPageControl, Vcl.Menus, uniMainMenu, uniEdit, uniCheckBox;

type
  TSeaBankChargeSlip = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchbank: TStringField;
    cds_searchagency: TStringField;
    cds_searchnumber: TStringField;
    cds_searchaccount: TStringField;
    cds_searchdescription: TStringField;
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
  SeaBankChargeSlip: TSeaBankChargeSlip;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TSeaBankChargeSlip }

procedure TSeaBankChargeSlip.FormatScreen;
begin
  inherited;
  ShowBank;
end;

procedure TSeaBankChargeSlip.GetView;
begin
  openCadBankChargeSlip(cds_searchid.AsInteger,nil);
end;

procedure TSeaBankChargeSlip.InnerJoinSql;
begin
  InnerJoinTxt := concat(
                   ' inner join tb_bank_account bc ',
                   ' on (bc.id = bcs.tb_bank_account_id) ',
                   ' inner join tb_bank ba ',
                   ' on (ba.id = bc.tb_bank_id) ',
                   ' inner join tb_entity en ',
                   ' on (ba.id = en.id) ',
                   ' inner join tb_bank_charge_ticket bct ',
                   ' on (bct.id = bcs.tb_bank_charge_ticket_id) '
                   );
end;

procedure TSeaBankChargeSlip.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by en.name_company ';
end;

procedure TSeaBankChargeSlip.SelectSql;
begin
  SelectTxt := concat(
               ' Select distinct bcs.id, en.name_company bank, bc.agency, bc.number,',
               ' bct.number account, bct.description',
               ' from tb_bank_charge_slip bcs '
               );
end;

procedure TSeaBankChargeSlip.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if (FrBank.DBLCB_Lista.KeyValue <> null) then
      ParamByName('b_id').AsInteger := FrBank.DBLCB_Lista.KeyValue;
  End;
end;

procedure TSeaBankChargeSlip.SetRegister;
begin
 openCadBankChargeSlip(0,nil);
end;

procedure TSeaBankChargeSlip.ShowBank;
begin
  FrBank := TFmBank.Create(Self);
//  FrBank.Parent := Ctn_Bank;
  FrBank.Align := alClient;
  FrBank.Listar;
  FrBank.Show;
end;

procedure TSeaBankChargeSlip.WhereSql;
begin
  inherited;
  WhereTxt := ' where bcs.tb_institution_id =:tb_institution_id ';

  if FrBank.DBLCB_Lista.KeyValue <> null then
    WhereTxt := WhereTxt + ' and (ba.id =:b_id)';
end;

end.
