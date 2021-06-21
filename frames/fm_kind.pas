unit fm_kind;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_frame_List, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, uniGUIClasses, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniLabel, sea_kind, uniPanel;

type
  TFmkind = class(TBaseFrameList)
    cds_searchid: TIntegerField;
    cds_searchdescription: TStringField;
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listar;
  end;

var
  Fmkind: TFmkind;

implementation

{$R *.dfm}
uses openForms, MainModule;

{ TFmkind }

procedure TFmkind.listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' Select k.id, k.description, k.detail ',
              ' from tb_kind k ',
              ' where k.tb_institution_id =:tb_institution_id',
              ' order by k.description '
            ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmkind.Sb_RegisterClick(Sender: TObject);
begin

  openCadKind(0,DBLCB_Lista)


end;

procedure TFmkind.Sb_SearchClick(Sender: TObject);
begin
  openSeaKind(DBLCB_Lista)
end;

end.
