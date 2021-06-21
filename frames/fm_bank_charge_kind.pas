unit fm_bank_charge_kind;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_frame_List, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, uniGUIClasses, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniLabel, uniPanel;

type
  TFmBankChargeKind = class(TBaseFrameList)
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure listar;
  end;

var
  FmBankChargeKind: TFmBankChargeKind;

implementation

{$R *.dfm}

uses openForms, MainModule;

procedure TFmBankChargeKind.listar;
begin
 with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
               ' Select distinct bck.id, bck.abbreviation, bck.description,  ',
               ' enb.name_company bank, enb.id bank_id ',
               ' from tb_bank_charge_kind bck ',
               ' inner join tb_bank b ',
               ' on (b.id = bck.tb_bank_id) ',
               ' inner join tb_entity enb ',
               ' on (b.id = enb.id) ',
               ' WHERE ( bck.id is not null ) ',
               ' order by bck.description '
            ));
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmBankChargeKind.Sb_RegisterClick(Sender: TObject);
begin
 //openCadBankChargeKind(0,DBLCB_Lista );
end;

procedure TFmBankChargeKind.Sb_SearchClick(Sender: TObject);
begin
 //openSeaBankChargeKind(DBLCB_Lista );
end;

end.
