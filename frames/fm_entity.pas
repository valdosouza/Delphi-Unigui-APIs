unit fm_entity;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,FireDAC.Stan.Param,
  uniSpeedButton, uniGUIClasses, uniEdit, uniGUIBaseClasses, uniLabel,base_frame_list,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniPanel;

type
  TFmEntity = class(TBaseFrameList)
    procedure sb_searchClick(Sender: TObject);
    procedure sb_registerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Listar;
  end;

var
  FmEntity: TFmEntity;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TFmBaseFrame2 }

procedure TFmEntity.Listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' SELECT en.id, en.name_company, en.nick_trade  ',
              ' FROM tb_entity en ',
              '     inner join tb_institution_has_entity ihe ',
              '     on (en.id = ihe.tb_entity_id) ',
              ' WHERE (ihe.tb_institution_id =:tb_institution_id ) ',
              ' order by en.name_company '
            ));
            ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmEntity.sb_registerClick(Sender: TObject);
begin
  //
end;

procedure TFmEntity.sb_searchClick(Sender: TObject);
begin
 openSeaEntity(DBLCB_Lista);
end;

end.
