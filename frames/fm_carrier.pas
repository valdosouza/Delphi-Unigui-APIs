unit fm_carrier;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniEdit, uniGUIBaseClasses, uniLabel, base_frame_list,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniPanel;

type
  TFmCarrier = class(TBaseFrameList)
    procedure sb_searchClick(Sender: TObject);
    procedure sb_registerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Listar;
  end;

var
  FmCarrier: TFmCarrier;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TFmCarrier }

procedure TFmCarrier.Listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' Select en.id, en.name_company, en.nick_trade ',
              ' From tb_entity en ',
              ' inner join tb_carrier c ',
              ' on (c.id = en.id) ',
              ' Where (c.tb_institution_id =:tb_institution_id )',
              ' Order By name_company '
            ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmCarrier.sb_registerClick(Sender: TObject);
begin
  openCadCarrier(0,DBLCB_Lista);
end;

procedure TFmCarrier.sb_searchClick(Sender: TObject);
begin
  openSeaCarrier(DBLCB_Lista);
end;

end.
