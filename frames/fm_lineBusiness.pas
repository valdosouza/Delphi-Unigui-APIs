unit fm_lineBusiness;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniEdit, uniGUIBaseClasses, uniLabel, base_frame_list,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, uniMultiItem, uniComboBox,FireDAC.Stan.Param,
  uniDBComboBox, uniDBLookupComboBox, uniPanel;

type
  TfmLineBusiness = class(TBaseFrameList)
    procedure sb_registerClick(Sender: TObject);
    procedure sb_searchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Listar;
  end;

var
  fmLineBusiness: TfmLineBusiness;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TfmLineBusiness }

procedure TfmLineBusiness.Listar;
begin
with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' Select distinct id, description ',
              ' from tb_linebusiness l ',
              '  inner join tb_institution_has_linebusiness i ',
              '  on (l.id = i.tb_linebusiness_id)  ',
              'where i.tb_institution_id =:tb_institution_id ',
              'order by l.description '
            ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TfmLineBusiness.sb_registerClick(Sender: TObject);
begin
  openCadLineBusiness(0,DBLCB_Lista);
end;

procedure TfmLineBusiness.sb_searchClick(Sender: TObject);
begin
  openSeaLineBusiness(DBLCB_Lista);
end;

end.

