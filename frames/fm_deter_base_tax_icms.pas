unit fm_deter_base_tax_icms;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniGUIClasses, uniEdit,
  uniGUIBaseClasses, uniLabel, uniButton, uniBitBtn, uniSpeedButton, base_frame_list,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniPanel;

type
  TFmDeterBaseTaxIcms = class(TBaseFrameList)
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listar;
  end;

var
  FmDeterBaseTaxIcms: TFmDeterBaseTaxIcms;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TFmDeterBaseTaxIcms }

procedure TFmDeterBaseTaxIcms.listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' Select distinct dbt.id, dbt.description ',
              ' from tb_deter_base_tax_icms dbt ',
              ' where id is not null',
              ' order by dbt.id '
            ));

    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
end;

procedure TFmDeterBaseTaxIcms.Sb_RegisterClick(Sender: TObject);
begin
  openCadDeterBaseTaxIcms(0,DBLCB_Lista)
end;

procedure TFmDeterBaseTaxIcms.Sb_SearchClick(Sender: TObject);
begin
  openSeaDeterBaseTaxIcms(DBLCB_Lista);
end;

end.
