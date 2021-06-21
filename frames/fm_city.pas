unit fm_city;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniLabel, uniGUIBaseClasses, uniGUIClasses, uniEdit, base_frame_list,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniPanel;

type
  TFmCity = class(TBaseFrameList)
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
  public
    procedure Listar(Estado:Integer);
  end;

var
  FmCity: TFmCity;

implementation

{$R *.dfm}

uses openForms, MainModule;

procedure TFmCity.Listar(Estado:Integer);
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              'Select c.id, upper(c.name) name, c.population ',
              'from tb_city c ',
              'where (tb_state_id=:tb_state_id)',
              'order by c.name '
            ));
    parambyname('tb_state_id').AsInteger := Estado;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := False;
  cds_search.Active := True;
end;

procedure TFmCity.Sb_RegisterClick(Sender: TObject);
begin
  openCadCity(0,DBLCB_Lista);
end;

procedure TFmCity.Sb_SearchClick(Sender: TObject);
begin
 openSeaCity(DBLCB_Lista);
end;

end.
