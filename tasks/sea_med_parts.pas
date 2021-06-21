unit sea_med_parts;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniCheckBox,unmessages,
  uniDateTimePicker, Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton,
  uniBitBtn, uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid,UnFunctions,
  uniPageControl, uniGUIBaseClasses, uniPanel, uniEdit, uniLabel, MainModule,
  Vcl.Menus, uniMainMenu,prm_print_media_parts,REST.Json,prm_rep_order;

type
  TSeaMedParts = class(TBaseSearch)
    DTP_Date_End: TUniDateTimePicker;
    DTP_Date_Initial: TUniDateTimePicker;
    ChBx_Periodo: TUniCheckBox;
    UniLabel7: TUniLabel;
    E_bd_name_company: TUniEdit;
    cds_searchdt_insertion: TDateField;
    cds_searchbroadcaster: TStringField;
    cds_searchadvetiser: TStringField;
    cds_searchtittle: TStringField;
    cds_searchdescription: TStringField;
    cds_searchparts_format: TStringField;
    cds_searchid: TIntegerField;
    ImprimirVisualizaoPeas1: TUniMenuItem;
    ImprmirPI1: TUniMenuItem;
    procedure ImprmirPI1Click(Sender: TObject);
    procedure ImprimirVisualizaoPeas1Click(Sender: TObject);
  private
    { Private declarations }
    procedure printOrder;
    procedure printViewParts;
  Protected
    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;

    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;

  public
    { Public declarations }
  end;

var
  SeaMedParts: TSeaMedParts;

implementation

{$R *.dfm}

uses openForms, uReportCM, openReports;

{ TSeaMedParts }

procedure TSeaMedParts.GetView;
Var
  lcodigo : TuniEdit;
begin
  lcodigo := TuniEdit.Create(Self);
  lcodigo.Tag := cds_searchid.AsInteger;
  openCadOrderPi(lcodigo);
end;

procedure TSeaMedParts.ImprimirVisualizaoPeas1Click(Sender: TObject);
begin
  if validateGetView then
  printViewParts;

end;

procedure TSeaMedParts.ImprmirPI1Click(Sender: TObject);
begin
  if validateGetView then
    printOrder
end;

procedure TSeaMedParts.InnerJoinSql;
begin
  inherited;
  InnerJoinTxt := concat(
    'inner join tb_med_parts mp                              ',
    'on(mp.id =  mdi.tb_med_parts_id)                        ',
    '	and (mp.tb_institution_id = mdi.tb_institution_id )    ',
    '    and (mp.tb_order_id = mdi.tb_order_id )             ',

    'inner join tb_med_parts_jr jr                           ',
    'on(mp.id =  jr.id)                                      ',
    '	and (mp.tb_institution_id = jr.tb_institution_id)      ',
    '    and (mp.tb_order_id = jr.tb_order_id )              ',

    'inner join tb_order_pi orp                              ',
    'on (orp.id = mp.tb_order_id)                            ',
    '	and (orp.tb_institution_id = mp.tb_institution_id)     ',

    'inner join tb_entity brd                                ',
    'on (brd.id = orp.tb_broadcaster_id)                     ',

    'inner join tb_entity adv                                ',
    'on (adv.id = orp.tb_advertiser_id)                      ',

    'inner join tb_med_price_list_jr mpl                     ',
    'on (mpl.id = mp.tb_med_price_list_id)                   ',
    '  and (mpl.tb_institution_id = mp.tb_institution_id)    ',

    'inner join tb_med_pos_prog mpp                         ',
    'on (mpp.id = mpl.tb_med_pos_prog_id)                    ',
    '  and (mpp.tb_institution_id = mp.tb_institution_id)    '

    );

end;

procedure TSeaMedParts.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by mdi.dt_insertion asc ';
end;

procedure TSeaMedParts.printOrder;
Var
  LcPar: TPrmRepOrder;
  LcCM : TReportCM;
  LcJSon : string;
begin
  try
    Self.showMask('Aguarde Processamento');
    UniSession.Synchronize();
    LcPar := TPrmRepOrder.Create;
    LcPar.Estabelecimento := UMM.GInstitution.registro.Codigo;
    LcPar.Usuario := UMM.GInstitution.User.Registro.codigo;
    LcPar.Resultado := false;
    LcPar.Codigo := cds_searchid.AsInteger;
    LcPar.URL := '';//'http://www.gestaowebsetes.com.br/institution/07742094000113/2/pedidocompra.pdf';
    LcJSon := TJson.ObjectToJsonString(LcPar);
    LcCM := TReportCM.Create(Self);
    LcJSon := LcCM.SMMediaClient.GetOrderPI(LcJSon);
    UniSession.Synchronize;
    LcPar := TJson.JsonToObject<TPrmRepOrder>(LcJson);
    if LcPar.Resultado then
    begin
      openReportViewer('Pedido de Inserção',LcPar.url);
      UniSession.Synchronize;
    end
    else
    Begin
      MensageAlert(['A T E N Ç Ã O!.',
                   '',
                      'Campo Nome não informado.',
                      'Preencha o campo para continuar']);
    End;
  finally
    self.HideMask;
    FreeAndNil(lcPar);
    FreeAndNil(LcCM);
  end;

end;

procedure TSeaMedParts.printViewParts;
Var
  LcPar: TPrmPrintMediaParts;
  LcCM : TReportCM;
  LcJSon : string;
begin
  try
    ShowMask('Aguarde Processamento do relatório...');
    LcPar := TPrmPrintMediaParts.Create;
    LcPar.Estabelecimento := UMM.GInstitution.registro.Codigo;
    LcPar.Usuario := UMM.GInstitution.User.Registro.codigo;
    LcPar.Resultado := false;
    LcPar.Periodo := ChBx_Periodo.Checked;
    LcPar.DataInicial := DTP_Date_Initial.DateTime;
    LcPar.DataFinal   := DTP_Date_End.DateTime;
    LcPar.VeiculoCom  := E_bd_name_company.Text;
    LcPar.URL := '';//'http://www.gestaowebsetes.com.br/institution/07742094000113/2/pedidocompra.pdf';

    LcJSon := TJson.ObjectToJsonString(LcPar);
    LcCM := TReportCM.Create(Self);
    LcJSon := LcCM.SMMediaClient.GetVisualizacaoPecas(LcJSon);
    UniSession.Synchronize;
    LcPar := TJson.JsonToObject<TPrmPrintMediaParts>(LcJson);
    UniSession.Synchronize;
    if LcPar.Resultado then
    begin
      openReportViewer('Visualização de Peças',LcPar.url);
      UniSession.Synchronize;
    end
    else
    Begin
      MensageAlert(['A T E N Ç Ã O!.',
                   '',
                      'Campo não informado.',
                      'Preencha o campo para continuar']);
    End;
  finally
    HideMask;
    FreeAndNil(LcCM);
  end;


end;

procedure TSeaMedParts.SelectSql;
begin
  inherited;
  SelectTxt := concat(
    ' SELECT  orp.id,mdi.dt_insertion, brd.nick_trade broadcaster,                ',
    'adv.nick_trade advetiser, mp.tittle,mpp.description  ,                ',
    'concat(jr.nr_column , ''COL X '' , jr.nr_height , ''cm'') as parts_format ',
    'from tb_med_insert_date mdi                                           '
    );

end;

procedure TSeaMedParts.SetParameters;
begin
  inherited;
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if ChBx_Periodo.Checked then
    BEgin
      ParamByName('dataini').AsString := ConverteData( DTP_Date_Initial.DateTime );
      ParamByName('datafim').AsString := ConverteData( DTP_Date_End.DateTime );
    End;

   if E_bd_name_company.Text <> '' then
      ParamByName('name_company').AsString := '%' + E_bd_name_company.Text + '%'  ;
  end;
end;

procedure TSeaMedParts.SetRegister;
begin
  inherited;
  openCadOrderPi(nil);
end;

procedure TSeaMedParts.WhereSql;
begin
  inherited;
  WhereTxt := 'where mdi.tb_institution_id =:tb_institution_id ';

  if ChBx_Periodo.Checked then
  BEgin
      WhereTxt := concat(
                      WhereTxt,
                      ' and (mdi.dt_insertion between :dataini and :datafim) '
                  );
  End;

  if E_bd_name_company.Text <> '' then
    WhereTxt := concat(
                      WhereTxt +
                      ' and (enbd.nick_trade like :nick_trade) '
                );

end;

end.
