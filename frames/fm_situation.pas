unit fm_situation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,FireDAC.Stan.Param,
  uniSpeedButton, uniGUIClasses, uniEdit, uniGUIBaseClasses, uniLabel, base_frame_list,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniPanel;

type
  TFmSituation = class(TBaseFrameList)
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listar;
  end;

var
  FmSituation: TFmSituation;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TFmSituation }

procedure TFmSituation.listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' Select s.id, s.description, s.modulo ',
              ' from tb_situation s ',
              ' where s.tb_institution_id =:tb_institution_id',
              ' order by s.description '
            ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmSituation.Sb_RegisterClick(Sender: TObject);
begin

  openCadSituation(0,DBLCB_Lista)


end;

procedure TFmSituation.Sb_SearchClick(Sender: TObject);
begin
  openSeaSituation(DBLCB_Lista)

end;

end.
