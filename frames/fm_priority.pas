unit fm_priority;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_frame_List, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, uniGUIClasses, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniLabel, uniPanel;

type
  TFmPriority = class(TBaseFrameList)
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
  FmPriority: TFmPriority;

implementation

{$R *.dfm}
uses openForms, MainModule;

procedure TFmPriority.listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' Select pr.id, pr.description ',
              ' from tb_priority pr ',
              ' where pr.tb_institution_id =:tb_institution_id',
              ' order by pr.description '
            ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmPriority.Sb_RegisterClick(Sender: TObject);
begin
  openCadPriority(0,DBLCB_Lista)
end;

procedure TFmPriority.Sb_SearchClick(Sender: TObject);
begin
  openSeaPriority(DBLCB_Lista)
end;

end.
