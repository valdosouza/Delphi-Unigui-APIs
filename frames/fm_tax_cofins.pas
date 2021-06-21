unit fm_tax_cofins;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniEdit, uniGUIBaseClasses, uniLabel, base_frame_list,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniPanel;

type
  TFmTaxCofins = class(TBaseFrameList)
    procedure sb_registerClick(Sender: TObject);
    procedure sb_searchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listar;
  end;

var
  FmTaxCofins: TFmTaxCofins;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TFmTaxCofins }

procedure TFmTaxCofins.listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' Select distinct tc.id, tc.description ',
              ' from tb_tax_cofins tc ',
              ' where id is not null',
              ' order by tc.id '
            ));

    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
end;

procedure TFmTaxCofins.sb_registerClick(Sender: TObject);
begin
  openCadTaxCofins(0,DBLCB_Lista);
end;

procedure TFmTaxCofins.sb_searchClick(Sender: TObject);
begin
  openSeaTaxCofins(DBLCB_Lista);
end;


end.
