unit sea_bank_historic;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniPanel, uniEdit,
  uniLabel, Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses, fm_bank,
  uniPageControl, Vcl.Menus, uniMainMenu, uniCheckBox;

type
  TSeaBankHistoric = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchdescription: TStringField;
    cds_searchbank_id: TIntegerField;
    cds_searchbank: TStringField;
    pnl_row_1: TUniPanel;
    E_ID: TUniEdit;
    E_Description: TUniEdit;
    Ctn_Bank: TUniContainerPanel;
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
  SeaBankHistoric: TSeaBankHistoric;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TSeaBankHistoric }

procedure TSeaBankHistoric.FormatScreen;
begin
 inherited;
 ShowBank;
end;

procedure TSeaBankHistoric.GetView;
begin
  inherited;
  openCadBankHistoric(cds_searchid.AsInteger,
                      cds_searchbank_id.AsInteger,
                      nil);
end;

procedure TSeaBankHistoric.InnerJoinSql;
begin
  InnerJoinTxt := concat(
                   ' inner join tb_bank b '+
                   ' on (b.id = bh.tb_bank_id) ',
                   ' inner join tb_entity enb ',
                   ' on (b.id = enb.id) '
                   );
end;

procedure TSeaBankHistoric.OrderBySql;
begin
 inherited;
  OrderByTxt := 'order by bh.description ';
end;

procedure TSeaBankHistoric.SelectSql;
begin
 SelectTxt := ' Select distinct bh.id, bh.description, enb.id bank_id, enb.name_company bank  '+
               ' from tb_bank_historic bh ';
end;

procedure TSeaBankHistoric.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if E_ID.Text <> '' then
      ParamByName('id').AsString := E_ID.Text  ;

    if (FrBank.DBLCB_Lista.KeyValue <> null) then
      ParamByName('b_id').AsInteger := FrBank.DBLCB_Lista.KeyValue;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := E_description.Text  ;

  End;
end;

procedure TSeaBankHistoric.SetRegister;
begin
   openCadBankHistoric(0,cds_searchbank_id.AsInteger,
                       nil);
end;

procedure TSeaBankHistoric.ShowBank;
begin
  FrBank := TFmBank.Create(Self);
  FrBank.Parent := Ctn_Bank;
  FrBank.Align := alClient;
  FrBank.Listar;
  FrBank.Show;
end;

procedure TSeaBankHistoric.WhereSql;
begin
 inherited;
  WhereTxt := ' where  bh.tb_institution_id =:tb_institution_id ';

  if FrBank.DBLCB_Lista.KeyValue <> null then
    WhereTxt := WhereTxt + ' and (b.id =:b_id)';

  if E_ID.Text <> '' then
    WhereTxt := WhereTxt + ' and (bh.id =:id)';

  if E_Description.Text <> ''  then
    WhereTxt := WhereTxt + ' and (bh.description =:description)';
end;

end.
