unit fm_tax_icms_sn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniEdit, uniGUIBaseClasses, uniLabel, base_frame_list,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniPanel;

type
  TFmTaxIcmsSn = class(TBaseFrameList)
    procedure sb_registerClick(Sender: TObject);
    procedure sb_searchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listar;
  end;

var
  FmTaxIcmsSn: TFmTaxIcmsSn;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TFmTaxIcmsSn }

procedure TFmTaxIcmsSn.listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' Select distinct tis.id, tis.description ',
              ' from tb_tax_icms_sn tis ',
              ' where id is not null',
              ' order by tis.id '
            ));

    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
end;

procedure TFmTaxIcmsSn.sb_registerClick(Sender: TObject);
begin
  openCadTaxIcmsSn(0,DBLCB_Lista);
end;

procedure TFmTaxIcmsSn.sb_searchClick(Sender: TObject);
begin
  openSeaTaxIcmsSn(DBLCB_Lista);
end;

end.
