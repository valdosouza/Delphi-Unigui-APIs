unit sea_check_ctrl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniRadioGroup, uniEdit,
  uniLabel, uniDateTimePicker, uniMultiItem, uniComboBox, uniCheckBox,
  uniGroupBox, fm_customer, uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaCheckCtrl = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchnumber: TStringField;
    cds_searchbank_number: TStringField;
    cds_searchissuer: TStringField;
    cds_searchcheck_value: TBCDField;
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
    procedure ShowCustomer;
  public
    { Public declarations }
    FrCustomer : TFmCustomer;
  end;

var
  SeaCheckCtrl: TSeaCheckCtrl;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TSeaCheckCtrl }

procedure TSeaCheckCtrl.FormatScreen;
begin
  inherited;
  ShowCustomer;
end;

procedure TSeaCheckCtrl.GetView;
begin
  openTasCheckCtrl(cds_searchid.AsInteger);
end;

procedure TSeaCheckCtrl.InnerJoinSql;
begin
  inherited;
  //
end;

procedure TSeaCheckCtrl.OrderBySql;
begin
  inherited;
   //
end;

procedure TSeaCheckCtrl.SelectSql;
begin
  SelectTxt := ' Select distinct cc.id, cc.number,cc.bank_number, cc.issuer, cc.check_value '+
               ' from tb_check_ctrl cc '
end;

procedure TSeaCheckCtrl.SetParameters;
begin
  {
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if E_Number.Text <> '' then
      ParamByName('number').AsString := E_number.Text  ;

    if E_bank_number.Text <> '' then
      ParamByName('bank_number').AsString :=  E_bank_number.Text  ;

    if E_issuer.Text <> '' then
      ParamByName('issuer').AsString := '%' + E_issuer.Text + '%' ;

    if E_check_value.Text <> '' then
      ParamByName('check_value').AsString :=  E_check_value.Text  ;

    if (FrCustomer.DBLCB_Lista.KeyValue <> null) then
      ParamByName('c_id').AsInteger := FrCustomer.DBLCB_Lista.KeyValue;
  End;
  }
end;

procedure TSeaCheckCtrl.SetRegister;
begin
  openTasCheckCtrl(0);
end;

procedure TSeaCheckCtrl.ShowCustomer;
begin
  FrCustomer := TFmCustomer.Create(Self);
//  FrCustomer.Parent := Ctn_Customer;
  FrCustomer.Align := alClient;
  FrCustomer.Listar;
  FrCustomer.Show;
end;

procedure TSeaCheckCtrl.WhereSql;
begin
  inherited;
  {
  WhereTxt := ' where cc.tb_institution_id =:tb_institution_id ';

  if FrCustomer.DBLCB_Lista.KeyValue <> null then
    WhereTxt := WhereTxt + ' and (c.id =:c_id)';

  if E_bank_number.Text <> '' then
    WhereTxt := WhereTxt + ' and (cc.bank_number =:bank_number)';

  if E_Number.Text <> ''  then
    WhereTxt := WhereTxt + ' and (cc.number =:number)';

  if E_issuer.Text <> ''  then
    WhereTxt := WhereTxt + ' and (cc.issuer like :issuer)';

  if E_check_value.Text <> ''  then
    WhereTxt := WhereTxt + ' and (cc.check_value =:check_value)';
    }
end;

end.
