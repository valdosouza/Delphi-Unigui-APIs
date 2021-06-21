unit fm_provider;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniEdit, uniGUIBaseClasses, uniLabel, base_frame_list,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, uniMultiItem, uniComboBox,  FireDAC.Stan.Param,
  uniDBComboBox, uniDBLookupComboBox, uniPanel;

type
  TFmProvider = class(TBaseFrameList)
    procedure sb_searchClick(Sender: TObject);
    procedure sb_registerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listar;
  end;

var
  FmProvider: TFmProvider;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TFmBaseFrame1 }

procedure TFmProvider.listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' Select en.id, en.name_company, en.nick_trade ',
              ' From tb_entity en ',
              ' inner join tb_provider p ',
              ' on (p.id = en.id) ',
              ' where p.tb_institution_id =:tb_institution_id ',
              ' order by en.name_company '
            ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmProvider.sb_registerClick(Sender: TObject);
begin
  openCadProvider(0,DBLCB_Lista);
end;

procedure TFmProvider.sb_searchClick(Sender: TObject);
begin
  openSeaProvider(DBLCB_Lista);
end;

end.
