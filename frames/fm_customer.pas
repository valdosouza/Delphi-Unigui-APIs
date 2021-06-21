unit fm_customer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniEdit, uniGUIBaseClasses, uniLabel, base_frame_list,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, uniMultiItem, uniComboBox,FireDAC.Stan.Param,
  uniDBComboBox, uniDBLookupComboBox, uniPanel;

type
  TFmCustomer = class(TBaseFrameList)
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure Listar;
  end;

var
  FmCustomer: TFmCustomer;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TFmBaseFrame2 }

procedure TFmCustomer.Listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' Select en.id, en.name_company, en.nick_trade ',
              ' From tb_entity en ',
              ' inner join tb_customer c ',
              ' on (c.id = en.id) ',
              ' Where (c.tb_institution_id =:tb_institution_id )',
              ' Order By name_company '
            ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmCustomer.Sb_RegisterClick(Sender: TObject);
begin
  openCadCustomer(0,DBLCB_Lista)
end;

procedure TFmCustomer.Sb_SearchClick(Sender: TObject);
begin
  openSeaCustomer(DBLCB_Lista)
end;

end.
