unit sea_bank_charge_kind;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniEdit, uniLabel, fm_bank,
  uniPageControl, Vcl.Menus, uniMainMenu, uniCheckBox;

type
  TSeaBankChargeKind = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchabbreviation: TStringField;
    cds_searchdescription: TStringField;
    pnl_param_row_1: TUniPanel;
    E_Id: TUniEdit;
    E_Abbreviation: TUniEdit;
    E_Description: TUniEdit;
    pnl_param_row_2: TUniPanel;
    procedure SelectSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;

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
  SeaBankChargeKind: TSeaBankChargeKind;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TSeaBankChargeKind }

procedure TSeaBankChargeKind.GetView;
begin
 openCadBankChargeKind (cds_searchid.AsInteger,
                        cds_searchid.AsInteger
                        ,nil);
end;

procedure TSeaBankChargeKind.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by bck.description ';
end;

procedure TSeaBankChargeKind.SelectSql;
begin
  SelectTxt := concat(
               ' Select *  ',
               ' from tb_bank_charge_kind bck '
               );
end;

procedure TSeaBankChargeKind.SetParameters;
begin
   with UMM.Qr_Crud do
  Begin
    if E_ID.Text <> '' then
      ParamByName('id').AsString := E_ID.Text  ;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_description.Text + '%' ;

    if E_Abbreviation.Text <> '' then
      ParamByName('abbreviation').AsString := E_Abbreviation.Text  ;

  End;
end;

procedure TSeaBankChargeKind.SetRegister;
begin
  openCadBankChargeKind(0,cds_searchid.AsInteger, nil);
end;

procedure TSeaBankChargeKind.ShowBank;
begin
  FrBank := TFmBank.Create(Self);
//  FrBank.Parent := Ctn_Bank;
  FrBank.Align := alClient;
  FrBank.Listar;
  FrBank.Show;
end;

procedure TSeaBankChargeKind.WhereSql;
begin
   inherited;
  WhereTxt :=  ' where ( bck.id is not null ) ';

  if E_ID.Text <> ''  then
    WhereTxt := WhereTxt + ' and (bck.id =:id)';

  if E_Description.Text <> ''  then
    WhereTxt := WhereTxt + ' and (bck.description like :description)';

  if E_Abbreviation.Text <> ''  then
    WhereTxt := WhereTxt + ' and (bck.abbreviation =:abbreviation)';
end;

end.
