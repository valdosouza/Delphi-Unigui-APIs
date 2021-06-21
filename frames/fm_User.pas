unit fm_User;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_frame_List, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, uniGUIClasses, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniLabel, uniPanel;

type
  TFmUser = class(TBaseFrameList)
    cds_searchid: TIntegerField;
    cds_searchname_company: TStringField;
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listar;
  end;

var
  FmUser: TFmUser;

implementation

{$R *.dfm}
uses openForms, MainModule;

procedure TFmUser.listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
                    'Select distinct u.id, en.name_company  ',
                    'from tb_user u                         ',
                    '  inner join tb_entity en              ',
                    '  on (u.id = en.id )                   ',
                    '  inner join tb_institution_has_user i ',
                    '  on (u.id = i.tb_user_id)             ',
                    'where i.tb_institution_id =:tb_institution_id ',
                    'order by en.name_company               '
            ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmUser.Sb_RegisterClick(Sender: TObject);
begin
  openCadUser(nil,UMM.GInstitution.Registro.Codigo)
end;

procedure TFmUser.Sb_SearchClick(Sender: TObject);
begin
  openSeaUser(UMM.GInstitution.Registro.Codigo)
end;

end.
