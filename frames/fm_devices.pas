unit fm_devices;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_frame_List, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, uniGUIClasses, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniLabel, uniPanel;

type
  TFmDEvices = class(TBaseFrameList)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Listar(User:Integer);
  end;

var
  FmDEvices: TFmDEvices;

implementation

{$R *.dfm}

uses MainModule;

{ TFmDEvices }

procedure TFmDEvices.Listar(User: Integer);
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              'Select * ',
              'from tb_devices d ',
              'where (d.tb_institution_id =:institution_id)',
              ' and  ( (d.tb_user_id = 0) or (d.tb_user_id is null) or (d.tb_user_id =:user_id) ) ',
              'order by d.description '
            ));
    parambyname('institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    parambyname('user_id').AsInteger := User;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := False;
  cds_search.Active := True;
end;

end.
