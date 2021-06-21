unit un_frx_bud_advertise;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, un_frx_base_report_list,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, frxClass, frxExportPDF, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxDBSet, prm_rep_budg_advertise;

type
  TFrxBudAdvertise = class(TFrxBaseReportList)
    frxReport: TfrxReport;
  private
    FPArametro: TPrmRepBudgAdvertise;
    procedure setFPArametro(const Value: TPrmRepBudgAdvertise);
    procedure feedCsdClient;

    { Private declarations }
  protected
    procedure InitVariable; Override;
    procedure SetVariable; Override;
    procedure setImages; Override;
    procedure ClearFields; Override;
    // Operações com Sql
    procedure SelectImp;
    procedure SelectWeb;
    procedure ExecSqlImp;
    procedure SetParametersImp;
    procedure SetParametersWeb;
    procedure ExecSqlWeb;
  public
    { Public declarations }
    procedure execute;Override;
   property PArametro : TPrmRepBudgAdvertise read FPArametro write setFPArametro;
  end;

var
  FrxBudAdvertise: TFrxBudAdvertise;

implementation

{$R *.dfm}

uses MainModule;

{ TFrxBudAdvertise }

procedure TFrxBudAdvertise.ClearFields;
begin
  inherited;

end;

procedure TFrxBudAdvertise.ExecSqlImp;
begin
  with Qry do
  Begin
    Active := False;
    Connection := getConnection;
    sql.Clear;
    SelectTxt           := '';
    SelectImp;
    SQL.Add(SelectTxt);
    SetParametersImp;
    Prepare;
    Active := True;
    FetchAll;
  End;
end;

procedure TFrxBudAdvertise.ExecSqlWeb;
begin
  with Qry do
  Begin
    Active := False;
    Connection := getConnection;
    sql.Clear;

    SelectTxt           := '';
    SelectWeb;
    SQL.Add(SelectTxt);
    SetParametersWeb;
    Prepare;
    Active := True;
    FetchAll;
  End;
end;

procedure TFrxBudAdvertise.execute;
Var
  LcExport : TfrxCustomExportFilter;
begin
  ExecSqlImp;
  frxReport.LoadFromFile('D:\Bin\gestaoweb\Report\un_frx_bud_advertise_imp.fr3');
  frxReport.PrepareReport;
  {
  ExecSqlWeb;
  frxReport.LoadFromFile('D:\Bin\gestaoweb\Report\un_frx_bud_advertise_web.fr3');
  frxReport.PrepareReport(False);
  }
  LcExport := TfrxCustomExportFilter(frxPDF);
  LcExport.ShowDialog := FAlse;
  LcExport.FileName := PArametro.Publico;
  frxReport.Export( LcExport );

end;

procedure TFrxBudAdvertise.feedCsdClient;
begin

end;

procedure TFrxBudAdvertise.InitVariable;
begin
  inherited;

end;



procedure TFrxBudAdvertise.SelectImp;
begin
  SelectTxt := concat(
          ' select c.name, e.name_company ,bai.unit_value ,  ',
          'bai.formats, pjr.measure, pjr.nr_columns, pjr.size_columns, ',
          'pjr.online_price, bai.insertion ',
          'from tb_budg_advertise_imp bai ',
          'inner join tb_med_price_list_jr pjr ',
          'on (bai.tb_med_price_list_jr_id = pjr.id) ',
          '  and (bai.tb_institution_id = pjr.tb_institution_id) ',
          '  and (bai.tb_broadcaster_id = pjr.tb_broadcaster_id) ',
          'inner join tb_broadcaster b ',
          'on (bai.tb_broadcaster_id = b.id) ',
          'inner join tb_entity e ',
          'on (e.id = b.id) ',
          'inner join tb_address adr ',
          'on (adr.id = b.id) ',
          'inner join tb_city c ',
          'on (c.id =adr.tb_city_id) ',
          'where pjr.online_price >0  '
    );

end;


procedure TFrxBudAdvertise.SelectWeb;
begin
  SelectTxt := concat(
          'select c.name,  sm.link ,baw.formats, baw.days, baw.page_views, ',
          'baw.unit_value ',
          'from tb_budg_advertise_web baw ',
          'inner join tb_med_price_list_ol pol ',
          'on (baw.tb_med_price_list_ol_id = pol.id) ',
          '  and (baw.tb_institution_id = pol.tb_institution_id) ',
          '    and (baw.tb_broadcaster_id = pol.tb_broadcaster_id) ',
          '  inner join tb_broadcaster b ',
          '  on (baw.tb_broadcaster_id = b.id) ',
          '  inner join tb_entity e ',
          '  on (e.id = b.id) ',
          '  inner join tb_address adr ',
          '  on (adr.id = b.id) ',
          '  inner join tb_city c ',
          '  on (c.id =adr.tb_city_id) ',
          '  left outer join tb_social_media sm ',
          '  on (sm.id = e.id)  and (sm.kind = ''wwww'') ',
          'where pol.online_price >0 '
  );
end;

procedure TFrxBudAdvertise.setFPArametro(const Value: TPrmRepBudgAdvertise);
begin
  FPArametro := Value;
end;

procedure TFrxBudAdvertise.setImages;
begin
  inherited;

end;


procedure TFrxBudAdvertise.SetParametersImp;
begin

end;

procedure TFrxBudAdvertise.SetParametersWeb;
begin

end;

procedure TFrxBudAdvertise.SetVariable;
begin
  inherited;

end;

end.
