unit fm_collaborator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_frame_List, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, uniGUIClasses, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniLabel, uniPanel;

type
  TFmCollaborator = class(TBaseFrameList)
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Listar;
  end;

var
  FmCollaborator: TFmCollaborator;

implementation

{$R *.dfm}

uses MainModule, openForms;

procedure TFmCollaborator.Listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              'SELECT en.id, en.name_company, en.nick_trade ',
               'FROM tb_entity en ',
               ' inner join tb_collaborator c ',
               ' on (c.id = en.id) ',
               'where c.tb_institution_id =:tb_institution_id ',
               'order by en.name_company '
            ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmCollaborator.Sb_RegisterClick(Sender: TObject);
begin
  openCadCollaborator(0,DBLCB_Lista);
end;

procedure TFmCollaborator.Sb_SearchClick(Sender: TObject);
begin
  openSeaCollaborator(DBLCB_Lista);
end;

end.
