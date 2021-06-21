unit fm_deter_base_tax_icms_st;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniEdit, uniGUIBaseClasses, uniLabel, base_frame_list,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniPanel;

type
  TFmDeterBaseTaxIcmsST = class(TBaseFrameList)
    procedure sb_registerClick(Sender: TObject);
    procedure sb_searchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listar;
  end;

var
  FmDeterBaseTaxIcmsST: TFmDeterBaseTaxIcmsST;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TFmDeterBaseTaxIcmsST }

procedure TFmDeterBaseTaxIcmsST.listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' Select distinct dbt.id, dbt.description ',
              ' from tb_deter_base_tax_icms_st dbt ',
              ' where id is not null',
              ' order by dbt.id '
            ));

    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
end;

procedure TFmDeterBaseTaxIcmsST.sb_registerClick(Sender: TObject);
begin
  openCadDeterBaseTaxIcmsST(0,DBLCB_Lista);
end;

procedure TFmDeterBaseTaxIcmsST.sb_searchClick(Sender: TObject);
begin
  openSeaDeterBaseTaxIcmsST(DBLCB_Lista);
end;

end.
