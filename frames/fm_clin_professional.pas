unit fm_clin_professional;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_frame_List, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, uniGUIClasses, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniPanel;

type
  TFmClinProfessional = class(TBaseFrameList)
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Listar;
  end;

var
  FmClinProfessional: TFmClinProfessional;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TFmClinProfessional }

procedure TFmClinProfessional.Listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' Select en.id, en.name_company, en.nick_trade ',
              ' From tb_entity en ',
              ' inner join tb_clin_professional p ',
              ' on (p.id = en.id) ',
              ' Where (p.tb_institution_id =:tb_institution_id )',
              ' Order By name_company '
            ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';

end;

procedure TFmClinProfessional.Sb_RegisterClick(Sender: TObject);
begin
  openCadClinProfessional(0,DBLCB_Lista)
end;

procedure TFmClinProfessional.Sb_SearchClick(Sender: TObject);
begin
  openSeaClinProfessional(DBLCB_Lista)
end;

end.
