unit fm_discharge_icms;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniEdit, uniGUIBaseClasses, uniLabel, base_frame_list,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniPanel;

type
  TFmDischargeIcms = class(TBaseFrameList)
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listar;
  end;

var
  FmDischargeIcms: TFmDischargeIcms;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TFmDischargeIcms }

procedure TFmDischargeIcms.listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' Select distinct dgi.id, dgi.description ',
              ' from tb_discharge_icms  dgi ',
              ' where id is not null',
              ' order by dgi.id '
            ));

    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
end;


procedure TFmDischargeIcms.Sb_RegisterClick(Sender: TObject);
begin
  openCadDischargeIcms(0,DBLCB_Lista)
end;

procedure TFmDischargeIcms.Sb_SearchClick(Sender: TObject);
begin
  openSeaDischargeIcms(DBLCB_Lista)
end;

end.
