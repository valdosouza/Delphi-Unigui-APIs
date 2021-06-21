unit fm_brand;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniLabel, uniGUIBaseClasses, uniGUIClasses, uniEdit, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, uniMultiItem, uniComboBox,FireDAC.Stan.Param,
  uniDBComboBox, uniDBLookupComboBox, base_frame_list, uniPanel;

type
  TFmBrand = class(TBaseFrameList)
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listar;
  end;

var
  FmBrand: TFmBrand;

implementation

{$R *.dfm}

uses openForms, MainModule;

procedure TFmBrand.listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              'Select distinct b.id, b.description ',
              'from tb_brand b ',
              '  inner join tb_institution_has_brand i ',
              'on (b.id = i.tb_brand_id) ',
              'where i.tb_institution_id =:tb_institution_id ',
              'order by b.description '
            ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmBrand.Sb_RegisterClick(Sender: TObject);
begin
  openCadBrand(0,DBLCB_Lista);
end;

procedure TFmBrand.Sb_SearchClick(Sender: TObject);
begin
 openSeaBrand(DBLCB_Lista);
end;

end.
