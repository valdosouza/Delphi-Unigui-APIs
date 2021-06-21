unit sea_invoice_merchandise;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniGroupBox, uniEdit,
  uniLabel, uniDateTimePicker, uniCheckBox, uniRadioGroup, fm_SalesMan, fm_cfop, tas_nf_55,
  uniPageControl, Vcl.Menus, uniMainMenu,unFunctions;

type
  TSeaInvoiceMerchandise = class(TBaseSearch)
    E_Name_Company: TUniEdit;
    E_UF: TUniEdit;
    E_city: TUniEdit;
    E_fone: TUniEdit;
    E_Client_id: TUniEdit;
    E_neighborhood: TUniEdit;
    E_Region: TUniEdit;
    E_Obervation: TUniEdit;
    ctn_Cfop: TUniContainerPanel;
    pnl_row_1: TUniPanel;
    pnl_data: TUniPanel;
    chbx_periodo: TUniCheckBox;
    E_Nr_Invoice: TUniEdit;
    E_Nr_Order: TUniEdit;
    pnl_data_campos: TUniPanel;
    DTP_Date_Initial: TUniDateTimePicker;
    DTP_Date_End: TUniDateTimePicker;
    E_Nr_Invoice_serie: TUniEdit;
    pnl_row_2: TUniPanel;
    pnl_row_3: TUniPanel;
    Ctn_salesMan: TUniContainerPanel;
    pnl_row_4: TUniPanel;
    UniGroupBox1: TUniGroupBox;
    chbx_Vendas: TUniCheckBox;
    chbx_Compras: TUniCheckBox;
    chbx_Ajustes: TUniCheckBox;
    Rg_Tipo_Operacao: TUniRadioGroup;
    Rg_Sit_Nfe: TUniRadioGroup;
    cds_searchid: TIntegerField;
    cds_searchnr_order: TIntegerField;
    cds_searchnr_invoice: TStringField;
    cds_searchdt_emission: TDateField;
    cds_searchkind_emis: TStringField;
    cds_searchname_company: TStringField;
    cds_searchvalue: TBCDField;
    cds_searchmodel: TStringField;
    cds_searchsalesman_id: TIntegerField;
    cds_searchsalesman_name: TStringField;
    cds_searchterminal: TIntegerField;
    cds_searchkind_order: TStringField;

    procedure chbx_periodoClick(Sender: TObject);
    procedure chbx_VendasChange(Sender: TObject);
    procedure chbx_ComprasChange(Sender: TObject);
    procedure chbx_AjustesChange(Sender: TObject);
  private
    { Private declarations }
    procedure trataTipoOperacao;
    procedure ShowSalesMan;
    procedure ShowCFOP;

    procedure SelectSql_Venda;
    procedure SelectSql_Compra;
    procedure SelectSql_Ajuste_Entrada;
    procedure SelectSql_Ajuste_Saida;

    procedure InnerJoinSql_Venda;
    procedure InnerJoinSql_Compra;
    procedure InnerJoinSql_Ajuste_Entrada;
    procedure InnerJoinSql_Ajuste_Saida;

    function  WhereSql_general:String;
    procedure WhereSql_Venda;
    procedure WhereSql_Compra;
    procedure WhereSql_Ajuste_Entrada;
    procedure WhereSql_Ajuste_Saida;

    procedure InnerJoinSql_Endereco(Sql : String);
    procedure InnerJoinSql_CFOP(Sql : String);

  protected
    procedure InitVariable;Override;
    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;
    procedure FormatScreen;Override;

    procedure SetParameters;Override;
    procedure GetView;Override;

  public
    { Public declarations }
    FrCFOP      : TFmCFOP;
    FrSalesMan  : TFmSalesman;

  end;

var
  SeaInvoiceMerchandise: TSeaInvoiceMerchandise;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TSeaInvoiceMerchandise }

procedure TSeaInvoiceMerchandise.chbx_AjustesChange(Sender: TObject);
begin
  trataTipoOperacao;
end;

procedure TSeaInvoiceMerchandise.chbx_ComprasChange(Sender: TObject);
begin
  trataTipoOperacao;
end;

procedure TSeaInvoiceMerchandise.chbx_periodoClick(Sender: TObject);
begin
//
end;

procedure TSeaInvoiceMerchandise.chbx_VendasChange(Sender: TObject);
begin
  trataTipoOperacao;
end;

procedure TSeaInvoiceMerchandise.FormatScreen;
begin
  inherited;
  ShowSalesMan;
  ShowCFOP;
end;

procedure TSeaInvoiceMerchandise.GetView;
var
  Form : TTasNf55;
begin
  if Form = nil then
    Form := TTasNf55.Create(UniApplication);
  Form.CodigoRegistro   := cds_searchid.AsInteger;
  Form.Terminal         := cds_searchterminal.AsInteger;
  Form.Vendedor         := cds_searchsalesman_id.AsInteger;
  Form.TipoOrdem        := cds_searchkind_order.AsInteger;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
end;

procedure TSeaInvoiceMerchandise.InitVariable;
begin
  DTP_Date_Initial.DateTime := Date - 30;
  DTP_Date_End.DateTime := Date;
end;

procedure TSeaInvoiceMerchandise.InnerJoinSql;
begin
  inherited;
  if chbx_Vendas.Checked then
    InnerJoinSql_Venda;

  if chbx_Compras.Checked then
    InnerJoinSql_Compra;

  if chbx_Ajustes.Checked and (Rg_Tipo_Operacao.ItemIndex <> 1) then
    InnerJoinSql_Ajuste_Entrada;

  if chbx_Ajustes.Checked and (Rg_Tipo_Operacao.ItemIndex <> 0) then
    InnerJoinSql_Ajuste_Saida;


end;


procedure TSeaInvoiceMerchandise.InnerJoinSql_Ajuste_Entrada;
begin
  InnerJoinTxt_2 := concat(
                    ' INNER JOIN tb_entity ent ',
                    ' ON (ent.id = inv.issuer)  ',
                    ' INNER JOIN tb_order ord  ',
                    ' ON (ord.id = inv.id) and (ord.tb_institution_id = inv.tb_institution_id) ',
                    ' INNER JOIN tb_order_stock_adjust adj ',
                    ' on (adj.id = inv.id) and (adj.tb_institution_id = inv.tb_institution_id) '
                 );

end;

procedure TSeaInvoiceMerchandise.InnerJoinSql_Ajuste_Saida;
begin
  InnerJoinTxt_3 := concat(
                    ' INNER JOIN tb_entity ent ',
                    ' ON (ent.id = inv.tb_entity_id )  ',
                    ' INNER JOIN tb_order ord  ',
                    ' ON (ord.id = inv.id) and (ord.tb_institution_id = inv.tb_institution_id) ',
                    ' INNER JOIN tb_order_stock_adjust adj ',
                    ' on (adj.id = inv.id) and (adj.tb_institution_id = inv.tb_institution_id) '
                 );

end;

procedure TSeaInvoiceMerchandise.InnerJoinSql_CFOP(Sql: String);
begin
 if (FrCFOP.DBLCB_Lista.Text <> '') then
    sql :=  concat(
              Sql,
              'INNER JOIN tb_cfop cf  ',
               'ON ( cf.id = inv.tb_cfop_id)'
              );
end;

procedure TSeaInvoiceMerchandise.InnerJoinSql_Compra;
begin
  InnerJoinTxt_1 := concat(
                    ' INNER JOIN tb_entity ent ',
                    ' ON (ent.id = inv.issuer)  ',
                    ' INNER JOIN tb_order ord  ',
                    ' ON (ord.id = inv.id) and (ord.tb_institution_id = inv.tb_institution_id) ',
                    ' INNER JOIN tb_order_purchase pur ',
                    ' on (pur.id = inv.id) and (pur.tb_institution_id = inv.tb_institution_id) '
                 );


end;

procedure TSeaInvoiceMerchandise.InnerJoinSql_Endereco(Sql: String);
begin
  if (E_neighborhood.Text <> '')  or (E_Region.Text <> '') or (E_fone.Text <> '') and (not (E_UF.Text <> '') or (E_city.Text <> '')) then
  Begin
    Sql :=  concat(
                Sql,
               '  INNER JOIN tb_address ad ',
               '  ON (ad.id =  ent.id) '
              )
  end
  else
  Begin
    if (E_UF.Text <> '') or (E_city.Text <> '') then
      Sql :=   concat(
                  Sql,
                 '  INNER JOIN tb_address',
                 '  ON (ad.id = ent.id)',
                 '  INNER JOIN tb_state st',
                 '  ON ( st.id = ad.tb_state_id)',
                 '  INNER JOIN tb_city ct',
                 '  ON (ct.id = ad.tb_city_id)'
      )
  end;
end;

procedure TSeaInvoiceMerchandise.InnerJoinSql_Venda;
begin
  InnerJoinTxt := concat(
                    ' INNER JOIN tb_entity ent ',
                    ' ON (ent.id = inv.tb_entity_id)  ',
                    ' INNER JOIN tb_order ord  ',
                    ' ON (ord.id = inv.id) and (ord.tb_institution_id = inv.tb_institution_id) ',
                    ' INNER JOIN tb_order_sale osl ',
                    ' on (osl.id = inv.id) and (osl.tb_institution_id = inv.tb_institution_id) ',
                    ' INNER JOIN tb_entity sal ',
                    ' on (sal.id = osl.tb_salesman_id) '
                 );
end;


procedure TSeaInvoiceMerchandise.WhereSql_Ajuste_Entrada;
begin
  inherited;
  WhereTxt_2 := ' where inv.tb_institution_id=:tb_institution_id ';

  if chbx_periodo.Checked then
    WhereTxt_2 := WhereTxt_2 + ' and (inv.dt_emission between :dataini and :datafim)';

  if E_Nr_Invoice.text <> '' then
    WhereTxt_2 := concat(WhereTxt_2, ' AND (inv.number =:nr_invoice)') ;

  if E_Nr_Invoice_serie.text <> '' then
    WhereTxt_2 := concat(WhereTxt_2, ' AND (inv.serie =:nr_serie)') ;

  if E_Nr_Order.text <> '' then
    WhereTxt_2 := concat(WhereTxt_2, ' AND (adj.number =:nr_order)') ;

  if rg_Tipo_Operacao.ItemIndex <> 1 then
    WhereTxt_2 := concat( WhereTxt_2,  ' AND (kind_emis LIKE ''E%'') ');


end;

procedure TSeaInvoiceMerchandise.WhereSql_Ajuste_Saida;
begin
  inherited;
  WhereTxt_3 := ' where inv.tb_institution_id=:tb_institution_id ';

  if chbx_periodo.Checked then
    WhereTxt_3 := WhereTxt_3 + ' and (inv.dt_emission between :dataini and :datafim)';

  if E_Nr_Invoice.text <> '' then
    WhereTxt_3 := concat(WhereTxt_3, ' AND (inv.number =:nr_invoice)') ;

  if E_Nr_Invoice_serie.text <> '' then
    WhereTxt_3 := concat(WhereTxt_3, ' AND (inv.serie =:nr_serie)') ;

  if E_Nr_Order.text <> '' then
    WhereTxt_3 := concat(WhereTxt_3, ' AND (adj.number =:nr_order)') ;

  if rg_Tipo_Operacao.ItemIndex <> 0 then
    WhereTxt_3 := concat( WhereTxt_3,  ' AND (kind_emis LIKE ''S%'') ');
end;

procedure TSeaInvoiceMerchandise.WhereSql_Compra;
begin
  inherited;
  WhereTxt_1 := ' where inv.tb_institution_id=:tb_institution_id ';

  if chbx_periodo.Checked then
    WhereTxt_1 := WhereTxt_1 + ' and (inv.dt_emission between :dataini and :datafim)';

  if E_Nr_Invoice.text <> '' then
    WhereTxt_1 := concat(WhereTxt_1, ' AND (inv.number =:nr_invoice)') ;

  if E_Nr_Invoice_serie.text <> '' then
    WhereTxt_1 := concat(WhereTxt_1, ' AND (inv.serie =:nr_serie)') ;

  if E_Nr_Order.text <> '' then
    WhereTxt_1 := concat(WhereTxt_1, ' AND (pur.number =:nr_order)') ;

  WhereTxt_1 := concat( WhereTxt_1,  ' AND (kind_emis LIKE ''E%'') ');

end;

function TSeaInvoiceMerchandise.WhereSql_general: String;
begin
  Result := ' where inv.tb_institution_id=:tb_institution_id ';

  if chbx_periodo.Checked then
    Result := concat(Result , ' and (inv.dt_emission between :dataini and :datafim)');

  if E_Nr_Invoice.text <> '' then
    Result := concat(Result , ' AND (inv.number =:nr_invoice)') ;

  if E_Nr_Invoice_serie.text <> '' then
    Result := concat(Result , ' AND (inv.serie =:nr_serie)') ;

  if E_Nr_Order.text <> '' then
    WhereTxt := concat(WhereTxt, ' AND (osl.number =:nr_order)') ;

  WhereTxt := concat( WhereTxt,  ' AND (kind_emis LIKE ''S%'') ');

end;

procedure TSeaInvoiceMerchandise.WhereSql_Venda;
begin
  inherited;
  WhereTxt := ' where inv.tb_institution_id=:tb_institution_id ';

  if chbx_periodo.Checked then
    WhereTxt := WhereTxt + ' and (inv.dt_emission between :dataini and :datafim)';

  if E_Nr_Invoice.text <> '' then
    WhereTxt := concat(WhereTxt, ' AND (inv.number =:nr_invoice)') ;

  if E_Nr_Invoice_serie.text <> '' then
    WhereTxt := concat(WhereTxt, ' AND (inv.serie =:nr_serie)') ;

  if E_Nr_Order.text <> '' then
    WhereTxt := concat(WhereTxt, ' AND (osl.number =:nr_order)') ;

  WhereTxt := concat( WhereTxt,  ' AND (kind_emis LIKE ''S%'') ');
end;

procedure TSeaInvoiceMerchandise.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by name_company '
end;

procedure TSeaInvoiceMerchandise.SelectSql;
begin
  if chbx_Vendas.Checked then
    SelectSql_Venda;

  if chbx_Compras.Checked then
    SelectSql_Compra;

  if chbx_Ajustes.Checked and (Rg_Tipo_Operacao.ItemIndex <> 1) then
    SelectSql_Ajuste_Entrada;

  if chbx_Ajustes.Checked and (Rg_Tipo_Operacao.ItemIndex <> 0) then
    SelectSql_Ajuste_Saida;
End;

procedure TSeaInvoiceMerchandise.SelectSql_Ajuste_Entrada;
begin
  SelectTxt_2 := concat(
                  ' SELECT inv.id ,adj.number nr_order ,inv.number nr_invoice, ',
                  ' inv.dt_emission ,inv.kind_emis ,ent.name_company ,inv.value ,',
                  ' inv.model, adj.terminal, 0 salesman_id, ''Sem'' salesman_name, ',
                  ' ''3'' kind_order ',
                  ' FROM tb_invoice inv '
                 );

end;

procedure TSeaInvoiceMerchandise.SelectSql_Ajuste_Saida;
begin
  SelectTxt_3 := concat(
                  ' SELECT inv.id ,adj.number nr_order ,inv.number nr_invoice, ',
                  ' inv.dt_emission ,inv.kind_emis ,ent.name_company ,inv.value ,',
                  'inv.model, adj.terminal, 0 salesman_id, ''Sem'' salesman_name, ',
                  ' ''3'' kind_order ',
                  ' FROM tb_invoice inv '
                 );

end;

procedure TSeaInvoiceMerchandise.SelectSql_Compra;
begin
  SelectTxt_1 := concat(
                  ' SELECT inv.id ,pur.number nr_order ,inv.number nr_invoice,  ',
                  ' inv.dt_emission ,inv.kind_emis ,ent.name_company ,inv.value ,',
                  ' inv.model, pur.terminal, 0 salesman_id, ''Sem'' salesman_name, ',
                  ' ''2'' kind_order ',
                  ' FROM tb_invoice inv '
                 );

end;

procedure TSeaInvoiceMerchandise.SelectSql_Venda;
begin
  SelectTxt := concat(
                  ' SELECT inv.id ,osl.number nr_order ,inv.number nr_invoice,  ',
                  ' inv.dt_emission ,inv.kind_emis ,ent.name_company ,inv.value ,',
                  ' inv.model, osl.terminal, sal.id salesman_id, sal.name_company salesman_name, ',
                  ' ''1'' kind_order ',
                  ' FROM tb_invoice inv '
                 );
end;

procedure TSeaInvoiceMerchandise.SetParameters;
Begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if chbx_periodo.Checked then
    Begin
      ParamByName('dataini').AsString := ConverteData( DTP_Date_Initial.DateTime );
      ParamByName('datafim').AsString := ConverteData( DTP_Date_End.DateTime );
    End;

    if E_Nr_Invoice.text <> '' then
      ParamByName('nr_invoice').AsString := E_Nr_Invoice.text;

    if E_Nr_Invoice_serie.text <> '' then
      ParamByName('nr_serie').AsString := E_Nr_Invoice_serie.text;


    if E_Nr_Order.text <> '' then
      ParamByName('nr_order').AsInteger := StrTOIntDef(E_Nr_Order.text,0)
  End;
end;

procedure TSeaInvoiceMerchandise.ShowCFOP;
begin
  FrCFOP := TFmCFOP.Create(Self);
  FrCFOP.Parent := ctn_Cfop;
  FrCFOP.Align := alClient;
  FrCFOP.listar;
  FrCFOP.Show;
end;

procedure TSeaInvoiceMerchandise.ShowSalesMan;
begin
  FrSalesMan := TFmSalesman.Create(Self);
  FrSalesMan.Parent := ctn_SalesMan;
  FrSalesMan.Align := alClient;
  FrSalesMan.listar;
  FrSalesMan.Show;
end;

procedure TSeaInvoiceMerchandise.trataTipoOperacao;
begin
  if ( ( not chbx_Vendas.Checked ) and ( not chbx_Compras.Checked )and ( not chbx_Ajustes.Checked ) ) then
    chbx_Vendas.Checked := True;
  
end;

procedure TSeaInvoiceMerchandise.WhereSql;
begin
  inherited;
  if chbx_Vendas.Checked then
    WhereSql_Venda;

  if chbx_Compras.Checked then
    WhereSql_Compra;

  if chbx_Ajustes.Checked and (Rg_Tipo_Operacao.ItemIndex <> 1) then
    WhereSql_Ajuste_Entrada;

  if chbx_Ajustes.Checked and (Rg_Tipo_Operacao.ItemIndex <> 0) then
    WhereSql_Ajuste_Saida;

end;

end.
