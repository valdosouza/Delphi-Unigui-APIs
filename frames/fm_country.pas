unit fm_country;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniLabel, uniGUIBaseClasses, uniGUIClasses, uniEdit, base_frame_list,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniPanel;

type
  TFmCountry = class(TBaseFrameList)
    procedure sb_registerClick(Sender: TObject);
    procedure sb_searchClick(Sender: TObject);
  private
  public
    procedure Listar;
  end;

var
  FmCountry: TFmCountry;

implementation

{$R *.dfm}

uses
   openForms
  ,MainModule;

procedure TFmCountry.Listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              'Select c.id, c.name ',
              'from tb_country c ',
              'order by c.name '
            ));
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
end;

procedure TFmCountry.sb_registerClick(Sender: TObject);
begin
  openCadCountry(0,DBLCB_Lista);
end;

procedure TFmCountry.sb_searchClick(Sender: TObject);
begin
  openSeaCountry(DBLCB_Lista);
end;

end.
