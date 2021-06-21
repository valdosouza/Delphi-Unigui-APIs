unit fm_merchandise;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,FireDAC.Stan.Param,
  uniSpeedButton, uniGUIClasses, uniEdit, uniGUIBaseClasses, uniLabel, base_frame_list,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniPanel;

type
  TFmMerchandise = class(TBaseFrameList)
    cds_searchid: TIntegerField;
    cds_searchdescription: TStringField;
    procedure sb_searchClick(Sender: TObject);
    procedure sb_registerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listar;
  end;

var
  FmMerchandise: TFmMerchandise;

implementation

{$R *.dfm}

uses openForms, MainModule;

procedure TFmMerchandise.listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' select  pr.id, pr.description ',
              ' from tb_product pr ',
              ' inner join tb_merchandise m',
              ' on ( m.id = pr.id )',
              ' where ( pr.tb_institution_id = :tb_institution_id ) ',
              ' order by pr.description '
            ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmMerchandise.sb_registerClick(Sender: TObject);
begin
  inherited;
  openCadMerchandise(0,DBLCB_Lista)
end;

procedure TFmMerchandise.sb_searchClick(Sender: TObject);
begin
  inherited;
  openSeaMerchandise(DBLCB_Lista)
end;

end.
