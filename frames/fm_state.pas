unit fm_state;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniLabel, uniGUIBaseClasses, uniGUIClasses, uniEdit,
  base_frame_List, Data.DB, Datasnap.DBClient, Datasnap.Provider, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniPanel;

type
  TFmState = class(TBaseFrameList)
    procedure Sb_RegisterClick(Sender: TObject);
  private
  public
    procedure Listar(pais:Integer);
  end;

var
  FmState: TFmState;

implementation

{$R *.dfm}

uses
  openForms,
  MainModule;



procedure TFmState.Listar(pais:Integer);
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              'Select s.id, upper(s.abbreviation ) abbreviation ',
              'from tb_state s ',
              'where (s.tb_country_id=:tb_country_id)',
              'order by s.abbreviation '
            ));
    if pais = 0 then
      pais := 1058;
    parambyname('tb_country_id').AsInteger := pais;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  cds_search.first;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmState.Sb_RegisterClick(Sender: TObject);
begin
  openCadState(DBLCB_Lista);
end;

end.
