unit fm_measure;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniLabel, uniGUIBaseClasses, uniGUIClasses, uniEdit, base_frame_list,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, uniMultiItem, uniComboBox, FireDAC.Stan.Param,
  uniDBComboBox, uniDBLookupComboBox, uniPanel;

type
  TFmMeasure = class(TBaseFrameList)
    procedure Sb_SearchClick(Sender: TObject);
    procedure Sb_RegisterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Listar;
  end;

var
  FmMeasure: TFmMeasure;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TFmMeasure }

procedure TFmMeasure.Listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' Select distinct m.id, m.description, m.abbreviation ',
              ' from tb_measure m ',
              ' inner join tb_institution_has_measure i ',
              ' on (m.id = i.tb_measure_id) ',
              ' where i.tb_institution_id =:tb_institution_id',
              ' order by m.description '
            ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmMeasure.Sb_RegisterClick(Sender: TObject);
begin
  inherited;
  openCadMeasure(0,DBLCB_Lista)
end;

procedure TFmMeasure.Sb_SearchClick(Sender: TObject);
begin
  openSeaMeasure(DBLCB_Lista);
end;

end.
