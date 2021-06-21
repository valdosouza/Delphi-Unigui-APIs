unit fm_bank_account;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_frame_List, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, uniGUIClasses, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniLabel, uniPanel;

type
  TFmBankAccount = class(TBaseFrameList)
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure listar;
  end;

var
  FmBankAccount: TFmBankAccount;

implementation

{$R *.dfm}

uses openForms, MainModule;

procedure TFmBankAccount.listar;
begin
 with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
               ' Select distinct bc.id, bc.number, bc.agency, enb.name_company bank  '+
               ' from tb_bank_account bc ',
               ' inner join tb_bank b ',
               ' on (b.id = bc.tb_bank_id) ',
               ' inner join tb_entity enb ',
               ' on (b.id = enb.id) ',
               ' WHERE (bc.tb_institution_id =:tb_institution_id ) ',
               'order by enb.name_company '
            ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmBankAccount.Sb_RegisterClick(Sender: TObject);
begin
  openCadBankAccount(0,DBLCB_Lista );
end;

procedure TFmBankAccount.Sb_SearchClick(Sender: TObject);
begin
   openSeaBankAccount(DBLCB_Lista );
end;

end.
