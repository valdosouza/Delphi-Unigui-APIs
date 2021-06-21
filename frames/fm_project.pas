unit fm_project;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_frame_List, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, uniGUIClasses, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniLabel, uniPanel;

type
  TFmProject = class(TBaseFrameList)
    cds_searchid: TIntegerField;
    cds_searchdescription: TStringField;
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listar;
  end;

var
  FmProject: TFmProject;

implementation

{$R *.dfm}
uses openForms, MainModule;

procedure TFmProject.listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' Select p.id, p.description ',
              ' from tb_project p ',
              ' where p.tb_institution_id =:tb_institution_id',
              ' order by p.description '
            ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmProject.Sb_RegisterClick(Sender: TObject);
begin
  openCadProject(0,DBLCB_Lista)
end;

procedure TFmProject.Sb_SearchClick(Sender: TObject);
begin
  openSeaProject(DBLCB_Lista)
end;

end.
