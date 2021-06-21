unit fm_nfe_events;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_frame_List, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, uniGUIClasses, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniLabel, MainModule, uniPanel;

type
  TFmNfeEvents = class(TBaseFrameList)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Listar;
  end;

var
  FmNfeEvents: TFmNfeEvents;

implementation

{$R *.dfm}

{ TFmNfeEvents }

procedure TFmNfeEvents.Listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' Select * ',
              ' from tb_nfe_events ',
              'order by description '
            ));
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

end.
