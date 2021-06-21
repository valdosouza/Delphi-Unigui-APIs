unit fm_observation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniGUIClasses, uniEdit,
  uniGUIBaseClasses, uniLabel, uniButton, uniBitBtn, uniSpeedButton, base_frame_list,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, uniMultiItem, uniComboBox,FireDAC.Stan.Param,
  uniDBComboBox, uniDBLookupComboBox, uniPanel;

type
  TFmObservation = class(TBaseFrameList)
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure listar;
  end;

var
  FmObservation: TFmObservation;

implementation
uses openForms, MainModule;

{$R *.dfm}

{ TFmBaseFrame2 }

procedure TFmObservation.listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' Select obs.id, obs.description ',
              ' from tb_observation obs ',
              ' inner join tb_institution ins ',
              ' on (obs.tb_institution_id = ins.id) ',
              ' where obs.tb_institution_id =:tb_institution_id ',
              ' order by obs.description '
            ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
end;

procedure TFmObservation.Sb_RegisterClick(Sender: TObject);
begin
  openCadObservation(0,DBLCB_Lista);
end;

procedure TFmObservation.Sb_SearchClick(Sender: TObject);
begin
 openSeaObservation(DBLCB_Lista)
end;

end.
