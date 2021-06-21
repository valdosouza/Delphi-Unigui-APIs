unit fm_tax_pis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniLabel, uniGUIBaseClasses, uniGUIClasses, uniEdit, base_frame_list,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniPanel;

type
  TFmTaxPis = class(TBaseFrameList)
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listar;
  end;

var
  FmTaxPis: TFmTaxPis;

implementation
uses openForms, MainModule;

{$R *.dfm}

{ TFmBaseFrame2 }

procedure TFmTaxPis.listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' Select distinct tps.id, tps.description ',
              ' from tb_tax_pis tps ',
              ' where id is not null ',
              ' order by tps.id '
            ));

    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
end;

procedure TFmTaxPis.Sb_RegisterClick(Sender: TObject);
begin
  begin
  openCadTaxPis(0,DBLCB_Lista)
end;
end;

procedure TFmTaxPis.Sb_SearchClick(Sender: TObject);
begin
  openSeaTaxPis(DBLCB_Lista);
end;

end.
