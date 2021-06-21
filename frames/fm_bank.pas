unit fm_bank;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_frame_List, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, uniGUIClasses, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniLabel, uniPanel;

type
  TFmBank = class(TBaseFrameList)
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listar;
  end;

var
  FmBank: TFmBank;

implementation

{$R *.dfm}

uses openForms, MainModule;

procedure TFmBank.listar;
begin
 with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              'Select distinct b.id ,b.number, en.name_company ',
              'from tb_bank b ',
              '  inner join tb_institution_has_bank i ',
              '  on (b.id = i.tb_bank_id) ',
              '  inner join tb_entity en ',
              '  on (en.id = b.id) ',
              'where i.tb_institution_id =:tb_institution_id ',
              'order by en.name_company '
            ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmBank.Sb_RegisterClick(Sender: TObject);
begin
  openCadBank(0,DBLCB_Lista);
end;

procedure TFmBank.Sb_SearchClick(Sender: TObject);
begin
  openSeaBank(DBLCB_Lista);
end;

end.
