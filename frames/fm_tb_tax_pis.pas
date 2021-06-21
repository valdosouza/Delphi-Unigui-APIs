unit fm_tb_tax_pis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniLabel, uniGUIBaseClasses, uniGUIClasses, uniEdit, base_frame_list,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniPanel;

type
  TFmTbTaxPis = class(TBaseFrameList)
    procedure setImages;Override;
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listar;
  end;

var
  FmTbTaxPis: TFmTbTaxPis;

implementation
uses openForms, MainModule;

{$R *.dfm}

{ TFmBaseFrame2 }

procedure TFmTbTaxPis.listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' Select distinct tps.id, tps.description, tps.group_tax ',
              ' from tb_tax_pis tps ',
              ' where id is not null',
              ' order by tps.description '
            ));
    ParamByName('tb_institution_id').AsInteger := GbInstitution;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
end;

procedure TFmTbTaxPis.Sb_RegisterClick(Sender: TObject);
begin
  begin
  openCadTaxPis(DBLCB_Lista)
end;
end;

procedure TFmTbTaxPis.Sb_SearchClick(Sender: TObject);
begin
 openSeaTbTaxPis(DBLCB_Lista);
end;

procedure TFmTbTaxPis.setImages;
begin
  inherited;
  buttonIcon(Sb_Search,'miniSearch.bmp');
end;

end.
