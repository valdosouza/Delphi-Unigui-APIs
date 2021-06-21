unit fm_ext_agent;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_frame_List, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, uniGUIClasses, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniLabel, uniPanel;

type
  TFmExtAgent = class(TBaseFrameList)
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Listar;
  end;

var
  FmExtAgent: TFmExtAgent;

implementation

{$R *.dfm}

uses openForms, MainModule;

procedure TFmExtAgent.Listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' Select distinct ea.id, ea.description, ea.class '+
              ' from tb_ext_agent ea ',
              '  inner join tb_institution_has_ext_agent i ',
              ' on (ea.id = i.tb_ext_agent_id) ',
              ' where i.tb_institution_id =:tb_institution_id ',
              ' order by ea.description '
            ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmExtAgent.Sb_RegisterClick(Sender: TObject);
begin
  openCadExtAgent(0,DBLCB_Lista);
end;

procedure TFmExtAgent.Sb_SearchClick(Sender: TObject);
begin
  openSeaExtAgent(DBLCB_Lista);
end;

end.
