unit fm_tax_icms_nr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniGUIClasses, uniEdit,
  uniGUIBaseClasses, uniLabel, uniButton, uniBitBtn, uniSpeedButton, base_frame_list,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniPanel;

type
  TFmTaxIcmsNr = class(TBaseFrameList)
    procedure sb_registerClick(Sender: TObject);
    procedure sb_searchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listar;
  end;

var
  FmTaxIcmsNr: TFmTaxIcmsNr;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TFmTaxIcmsNr }

procedure TFmTaxIcmsNr.listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' Select distinct TxI.id, TxI.description ',
              ' from tb_tax_icms_nr TxI ',
              ' where id is not null',
              ' order by TxI.id '
            ));

    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
end;


procedure TFmTaxIcmsNr.sb_registerClick(Sender: TObject);
begin
  openCadTaxIcmsNr(0,DBLCB_Lista);
end;

procedure TFmTaxIcmsNr.sb_searchClick(Sender: TObject);
begin
  openSeaTaxIcmsNr(DBLCB_Lista);
end;

end.
