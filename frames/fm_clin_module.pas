unit fm_clin_module;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_frame_List, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, uniGUIClasses, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniPanel;

type
  TFmClinModule = class(TBaseFrameList)
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Listar;
  end;

var
  FmClinModule: TFmClinModule;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TFmClinModule }

procedure TFmClinModule.Listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' Select c.id, c.description ',
              ' From tb_clin_module c ',
              ' Where (c.tb_institution_id =:tb_institution_id )',
              ' Order By c.description '
            ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmClinModule.Sb_RegisterClick(Sender: TObject);
begin
  openCadClinModule(0,DBLCB_Lista)
end;

procedure TFmClinModule.Sb_SearchClick(Sender: TObject);
begin
  openSeaClinModule(DBLCB_Lista)
end;

end.
