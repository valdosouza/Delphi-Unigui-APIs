unit fm_med_pos_prog;

interface

uses
 Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,FireDAC.Stan.Param,
  uniSpeedButton, uniGUIClasses, uniEdit, uniGUIBaseClasses, uniLabel, base_frame_list,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniPanel;

type
  TFmMedPosProg = class(TBaseFrameList)
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CodigoVeiculo : Integer;
    procedure listar;
  end;

var
  FmMedPosProg: TFmMedPosProg;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TFmPosition }

procedure TFmMedPosProg.listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.add(concat( 'SELECT mp.id, mp.tb_institution_id, mp.description ',
                    'FROM  tb_med_pos_prog mp ',
                    ' where mp.tb_institution_id =:institution_id '
                    ));
    ParamByName('institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmMedPosProg.Sb_RegisterClick(Sender: TObject);
begin
   openCadMedPosProg(0,DBLCB_Lista)
end;

procedure TFmMedPosProg.Sb_SearchClick(Sender: TObject);
begin
   openSeaMedPosProg(DBLCB_Lista);
end;

end.
