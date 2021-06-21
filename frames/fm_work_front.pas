unit fm_work_front;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_frame_List, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, uniGUIClasses, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniLabel, MainModule, uniPanel;

type
  TFmWorkFront = class(TBaseFrameList)
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listar;
  end;

var
  FmWorkFront: TFmWorkFront;

implementation

{$R *.dfm}

uses openForms;

{ TFmWorkFront }

procedure TFmWorkFront.listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              'Select distinct w.id, w.description ',
              'from tb_work_front w ',
              'where w.tb_institution_id =:tb_institution_id ',
              'order by w.description '
            ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';

end;

procedure TFmWorkFront.Sb_RegisterClick(Sender: TObject);
begin
  openCadWorkFront(0,DBLCB_Lista);
end;

procedure TFmWorkFront.Sb_SearchClick(Sender: TObject);
begin
  openSeaWorkFront(DBLCB_Lista);
end;

end.
