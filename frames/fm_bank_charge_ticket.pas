unit fm_bank_charge_ticket;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_frame_List, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, uniGUIClasses, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniLabel, uniPanel;

type
  TFmBankChargeTicket = class(TBaseFrameList)
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure listar;
  end;

var
  FmBankChargeTicket: TFmBankChargeTicket;

implementation

{$R *.dfm}

uses MainModule, openForms;

procedure TFmBankChargeTicket.listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
               ' Select distinct bct.id, bct.description, bct.number,',
               'bct.emission_by, enb.id bank_id, enb.name_company bank  ',
               ' from tb_bank_charge_ticket bct ',
               ' inner join tb_bank b ',
               ' on (b.id = bct.tb_bank_id) ',
               ' inner join tb_entity enb ',
               ' on (b.id = enb.id) ',
               'WHERE ( bct.id is not null ) ',
               'order by enb.name_company '
            ));
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmBankChargeTicket.Sb_RegisterClick(Sender: TObject);
begin
 //openCadBankChargeTicket(0,DBLCB_Lista );
end;

procedure TFmBankChargeTicket.Sb_SearchClick(Sender: TObject);
begin
 //openSeaBankChargeTicket(DBLCB_Lista );
end;

end.
