unit fm_freight_mode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_frame_List, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, uniGUIClasses, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniLabel, uniPanel;

type
  TfmFreightMode = class(TBaseFrameList)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listar;
  end;

var
  fmFreightMode: TfmFreightMode;

implementation

{$R *.dfm}

uses MainModule;

{ TfmFreightMode }

procedure TfmFreightMode.listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' SELECT fm.id, fm.description ',
              ' FROM tb_freight_mode fm ',
              ' WHERE fm.id is not null ',
              ' ORDER BY fm.id '
            ));
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
end;

end.
