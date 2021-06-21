unit fm_tax_ipi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniEdit, uniGUIBaseClasses, uniLabel, base_frame_list,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniPanel;

type
  TFmTaxIpi = class(TBaseFrameList)
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listar;
  end;

var
  FmTaxIpi: TFmTaxIpi;

implementation

uses openForms, MainModule;

{$R *.dfm}

{ TFmBaseFrame2 }

procedure TFmTaxIpi.listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' Select distinct ti.id, ti.description ',
              ' from tb_tax_ipi ti ',
              ' where id is not null',
              ' order by ti.id '
            ));

    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
end;


procedure TFmTaxIpi.Sb_RegisterClick(Sender: TObject);
begin
   openCadTaxIpi(0,DBLCB_Lista)
end;

procedure TFmTaxIpi.Sb_SearchClick(Sender: TObject);
begin
   openSeaTaxIpi(DBLCB_Lista);
end;

end.
