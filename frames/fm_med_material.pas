unit fm_med_material;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,FireDAC.Stan.Param,
  uniSpeedButton, uniGUIClasses, uniEdit, uniGUIBaseClasses, uniLabel, base_frame_list,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniPanel;
type
  TFmMedMaterial = class(TBaseFrameList)
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Listar;
  end;

var
  FmMedMaterial: TFmMedMaterial;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TFmBaseFrame1 }

procedure TFmMedMaterial.Listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' Select distinct mm.id, mm.description, mm.destiny ',
              ' from tb_med_material mm ',
              ' where mm.tb_institution_id =:tb_institution_id ',
              ' order by mm.description '
            ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmMedMaterial.Sb_RegisterClick(Sender: TObject);
begin
   openCadMedMaterial(0,DBLCB_Lista)
end;

procedure TFmMedMaterial.Sb_SearchClick(Sender: TObject);
begin
   openSeaMedMaterial(DBLCB_Lista);
end;

end.
