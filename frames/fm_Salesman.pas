unit fm_Salesman;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniEdit, uniGUIBaseClasses, uniLabel, base_frame_list,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox,FireDAC.Stan.Param, uniPanel;

type
  TFmSalesman = class(TBaseFrameList)
    procedure sb_registerClick(Sender: TObject);
    procedure sb_searchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listar;
  end;

var
  FmVendor: TFmSalesman;

implementation

{$R *.dfm}

uses openForms, MainModule;

procedure TFmSalesman.listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' Select en.id, en.name_company, en.nick_trade ',
              ' From tb_entity en ',
              '    inner join tb_salesman s ',
              '     on (s.id = en.id) ',
              ' Where (s.tb_institution_id =:tb_institution_id )  ',
              ' Order By name_company '
            ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmSalesman.sb_registerClick(Sender: TObject);
begin
  openCadSalesman(0,DBLCB_Lista);
end;

procedure TFmSalesman.sb_searchClick(Sender: TObject);
begin
  openSeaSalesman(DBLCB_Lista);
end;

end.
