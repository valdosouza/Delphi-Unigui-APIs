unit fm_color;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniLabel, uniGUIBaseClasses, uniGUIClasses, uniEdit, base_frame_list,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, uniMultiItem, uniComboBox, FireDAC.Stan.Param,
  uniDBComboBox, uniDBLookupComboBox, uniPanel;

type
  TFmColor = class(TBaseFrameList)
    procedure Sb_SearchClick(Sender: TObject);
    procedure Sb_RegisterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Listar;
  end;

var
  FmColor: TFmColor;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TFmBaseFrame1 }

procedure TFmColor.Listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
                  ' Select distinct id, description ',
                  ' from tb_color c ',
                  '  inner join tb_institution_has_color i ',
                  '  on (c.id = i.tb_color_id)  ',
                  'where i.tb_institution_id =:tb_institution_id ',
                  'order by c.description '
              ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmColor.Sb_RegisterClick(Sender: TObject);
begin
  inherited;
  openCadColor(0,DBLCB_Lista)
end;

procedure TFmColor.Sb_SearchClick(Sender: TObject);
begin
  openSeaColors(DBLCB_Lista);
end;

end.
