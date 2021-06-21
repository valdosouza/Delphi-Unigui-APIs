unit fm_entity_fiscal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_frame_List, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, uniGUIClasses, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniLabel, uniPanel;

type
  TFmEntityFiscal = class(TBaseFrameList)
    procedure sb_searchClick(Sender: TObject);
    procedure sb_registerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Listar;
  end;

var
  FmEntityFiscal: TFmEntityFiscal;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TFmEntityFiscal }

procedure TFmEntityFiscal.Listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' SELECT en.id, en.name_company, en.nick_trade  ',
              ' FROM tb_entity en ',
              ' inner join tb_institution_has_entity i ',
              ' on (en.id = i.tb_entity_id) ',
              ' WHERE (i.tb_institution_id =:tb_institution_id ) ',
              ' order by en.name_company '
            ));
            ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmEntityFiscal.sb_registerClick(Sender: TObject);
begin
  openSeaEntityFiscal(DBLCB_Lista);
end;

procedure TFmEntityFiscal.sb_searchClick(Sender: TObject);
begin
//
end;

end.
