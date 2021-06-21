unit fm_advertiser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn, FireDAC.Stan.Param,
  uniSpeedButton, uniGUIClasses, uniEdit, uniGUIBaseClasses, uniLabel, base_frame_list,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniPanel;

type
  TFmAdvertiser = class(TBaseFrameList)
    procedure sb_searchClick(Sender: TObject);
    procedure sb_registerClick(Sender: TObject);
  private
    FDataFim: TDate;
    FDataInicio: TDate;
    FPeriodo: Boolean;
    FTipoData: Integer;
    procedure setFDataFim(const Value: TDate);
    procedure setFDataInicio(const Value: TDate);
    procedure setFPeriodo(const Value: Boolean);
    procedure setFTipoData(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }
    property Periodo : Boolean read FPeriodo write setFPeriodo;
    property TipoData : Integer read FTipoData write setFTipoData;
    property DataInicio : TDate read FDataInicio write setFDataInicio;
    property DataFim : TDate read FDataFim write setFDataFim;
    procedure listarSobMovimento;
    procedure listar;
  end;

var
  FmAdvertiser: TFmAdvertiser;

implementation

{$R *.dfm}

uses openForms, MainModule,UnFunctions;

{ TFmAdvertiser }

procedure TFmAdvertiser.listar;
begin
  cds_search.Active := FAlse;
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
               'SELECT en.id, en.name_company, en.nick_trade ',
               'FROM tb_entity en ',
               ' inner join tb_advertiser av ',
               ' on (av.id = en.id) ',
               'WHERE (av.tb_institution_id =:tb_institution_id ) ',
               'order by en.name_company '
            ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;


procedure TFmAdvertiser.listarSobMovimento;
begin
  cds_search.Active := False;
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
                'SELECT distinct en.id, en.name_company, en.nick_trade ',
                'FROM tb_order_pi orp ',
                '  inner join tb_invoice inv ',
                '  on (inv.id = orp.id) ',
                '     and (inv.tb_institution_id = orp.tb_institution_id) ',
                '  INNER JOIN tb_entity en ',
                '  ON (en.id = orp.tb_advertiser_id) ',
                '  INNER JOIN  tb_financial  fn ',
                '  ON (orp.id = fn.tb_order_id) ',
                '      and (orp.tb_institution_id = fn.tb_institution_id) ',

              '  INNER JOIN  tb_financial_bills  fnb ',
              '  ON (fn.tb_order_id = fnb.tb_order_id) ',
              '      and (fn.tb_institution_id = fnb.tb_institution_id) ',
              '      and (fn.terminal = fnb.terminal) ',

              '  left outer join tb_financial_payment fnp ',
              '  ON (fnb.tb_order_id = fnp.tb_order_id) ',
              '      and (fnb.tb_institution_id = fnp.tb_institution_id) ',
              '      and (fnb.terminal = fnp.terminal) ',
                'WHERE (orp.tb_institution_id =:tb_institution_id) '


            ));

    if FPeriodo then
    Begin
      case FTipoData of
        0:sql.Add(' AND ( orp.dt_internal between :dataini and :datafim ) ');
        1:sql.Add(' AND ( orp.dt_expiration between :dataini and :datafim ) ');
        2:sql.Add(' AND ( fnp.dt_payment between :dataini and :datafim ) ');

      end;
    End;
    sql.Add(' order by en.name_company ');


    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if FPeriodo then
    Begin
      ParamByName('dataini').AsString := ConverteData( FDataInicio );
      ParamByName('datafim').AsString := ConverteData( FDataFim );
    End;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';

end;

procedure TFmAdvertiser.sb_registerClick(Sender: TObject);
begin
  openCadAdvertiser(0,DBLCB_Lista );
end;

procedure TFmAdvertiser.sb_searchClick(Sender: TObject);
begin
  openSeaAdvertiser(DBLCB_Lista );
end;

procedure TFmAdvertiser.setFDataFim(const Value: TDate);
begin
  FDataFim := Value;
end;

procedure TFmAdvertiser.setFDataInicio(const Value: TDate);
begin
  FDataInicio := Value;
end;

procedure TFmAdvertiser.setFPeriodo(const Value: Boolean);
begin
  FPeriodo := Value;
end;

procedure TFmAdvertiser.setFTipoData(const Value: Integer);
begin
  FTipoData := Value;
end;

end.
