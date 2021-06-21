unit un_qrp_bud_advertise;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, QuickRpt, QRCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ControllerInstitution,
  prm_rep_budg_advertise, Vcl.Imaging.jpeg, ControllerBudgAdvertise;

type
  TQrpBudAdvertise = class(TForm)
    RL_Imp: TQuickRep;
    DetailImp: TQRBand;
    Qr_Imp: TFDQuery;
    Qr_Impname: TStringField;
    Qr_Impunit_value: TBCDField;
    Qr_Impformats: TStringField;
    Qr_Impmeasure: TStringField;
    Qr_Impnr_columns: TIntegerField;
    Qr_Impsize_columns: TIntegerField;
    Qr_Imponline_price: TBCDField;
    Qr_Impinsertion: TIntegerField;
    Qr_Web: TFDQuery;
    Qr_Webname: TStringField;
    Qr_Weblink: TStringField;
    Qr_Webformats: TStringField;
    Qr_Webdays: TIntegerField;
    Qr_Webpage_views: TIntegerField;
    Qr_Webunit_value: TBCDField;
    Composicao: TQRCompositeReport;
    RL_Web: TQuickRep;
    GrupoImp: TQRGroup;
    QRLabel2: TQRLabel;
    GrupoWEb: TQRGroup;
    DetailWeb: TQRBand;
    RL_Cabecalho: TQuickRep;
    Tittle: TQRBand;
    Img_Logo: TQRImage;
    Qr_Cabecalho: TFDQuery;
    ChildBand1: TQRChildBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    E_Imp_Cidade: TQRLabel;
    E_Imp_Veiculo: TQRLabel;
    E_Imp_Tiragem: TQRLabel;
    E_Imp_cm_col: TQRLabel;
    E_Imp_formato: TQRLabel;
    E_Imp_medida: TQRLabel;
    E_Imp_col: TQRLabel;
    E_Imp_alt: TQRLabel;
    E_Imp_unitario: TQRLabel;
    E_Imp_insercao: TQRLabel;
    E_Imp_total: TQRLabel;
    ChildBand2: TQRChildBand;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel1: TQRLabel;
    E_web_cidade: TQRLabel;
    E_web_portal: TQRLabel;
    E_web_Formato: TQRLabel;
    E_web_inicio: TQRLabel;
    E_web_fim: TQRLabel;
    E_web_dias: TQRLabel;
    E_web_contratado: TQRLabel;
    E_web_media_dia: TQRLabel;
    E_web_cpm: TQRLabel;
    E_web_total: TQRLabel;
    E_Imp_Sequencia: TQRLabel;
    E_Web_Sequencia: TQRLabel;
    E_Number: TQRLabel;
    e_Data: TQRLabel;
    ImpSumario: TQRBand;
    QRLabel26: TQRLabel;
    E_Imp_valor_total: TQRLabel;
    QRLabel27: TQRLabel;
    E_imp_subtotal_Tiragem: TQRLabel;
    WebSumario: TQRBand;
    QRLabel28: TQRLabel;
    E_web_valor_total: TQRLabel;
    QRLabel30: TQRLabel;
    E_web_pageviews: TQRLabel;
    RL_Sumario: TQuickRep;
    Sumario: TQRBand;
    QRLabel29: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    E_Imp_Investimento: TQRLabel;
    E_Imp_Audiencia: TQRLabel;
    QRLabel33: TQRLabel;
    E_web_Investimento: TQRLabel;
    E_web_Audiencia: TQRLabel;
    QRLabel38: TQRLabel;
    E_total_Investimento: TQRLabel;
    E_total_audiencia: TQRLabel;
    QRLabel41: TQRLabel;
    QRImage1: TQRImage;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel39: TQRLabel;
    Qr_ImpCityID: TIntegerField;
    Qr_ImpbroadcasterID: TIntegerField;
    Qr_Impnick_trade: TStringField;
    procedure DetailImpBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure DetailWebBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ComposicaoAddReports(Sender: TObject);
    procedure RL_CabecalhoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure RL_ImpBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure RL_WebBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure SumarioBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure WebSumarioBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ImpSumarioBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    Zebra : Boolean;
    Sequencia : Integer;
    Tiragem : Integer;
    PageViews : Integer;
    ImpSubtotal : Real;
    WebSubtotal : Real;
    Advertise : TControllerBudgAdvertise;
    FPArametro: TPrmRepBudgAdvertise;
    procedure setFPArametro(const Value: TPrmRepBudgAdvertise);

    procedure SelectCabecalho;

    procedure SelectImp;
    procedure SelectWeb;

    procedure cabecalho;
    procedure Search;
    { Private declarations }
  public
    { Public declarations }
    FEstabelecimento: TControllerInstitution;
    property PArametro : TPrmRepBudgAdvertise read FPArametro write setFPArametro;

    procedure execute;
  end;

var
  QrpBudAdvertise: TQrpBudAdvertise;

implementation

{$R *.dfm}

uses MainModule, UnFunctions;

procedure TQrpBudAdvertise.cabecalho;
Var
  Lc_Aux: String;
  sLogo : string;
begin
  Advertise.Registro.Estabelecimento := PArametro.Estabelecimento;
  Advertise.Registro.Codigo          := PArametro.Codigo;
  Advertise.getByKey;


  E_Number.Caption := concat(Advertise.Registro.Numero.ToString,'/',Copy(DateToStr(Advertise.Ordem.Registro.Data),7,4));
  e_Data.Caption := DateToStr(Advertise.Ordem.Registro.Data);
  {
  with FEstabelecimento do
  Begin
    sLogo := concat(PathPublico,'logo.jpg');
    if FileExists(sLogo) then
      Img_Logo.Picture.LoadFromFile(sLogo);
    Lb_Emp_Nome.Caption := Fiscal.Registro.ApelidoFantasia;
    Lb_Emp_Doc.Caption :=  concat(
                                'C.N.P.J: ', MaskDocFiscal( Fiscal.Juridica.Registro.CNPJ),
                                ' -  I.E.: ', Fiscal.Juridica.Registro.InscricaoEstadual);
    IF (trim( Fiscal.Endereco.Registro.Complemento) = '') then
    Begin
      Lc_Aux := concat(
                Fiscal.Endereco.Registro.Logradouro , ', ',
                Fiscal.Endereco.Registro.NumeroPredial , ' - ' ,
                Fiscal.Endereco.Registro.Bairro , ' - ' ,
                MaskCep(Fiscal.Endereco.Registro.Cep) , ' - ' ,
                Fiscal.Endereco.Cidade.Registro.Nome , ' - ' ,
                Fiscal.Endereco.Estado.Registro.Abreviatura
             );
    end
    else
    Begin
      Lc_Aux := concat(
                Fiscal.Endereco.Registro.Logradouro , ', ',
                Fiscal.Endereco.Registro.NumeroPredial , ' - ' ,
                Fiscal.Endereco.Registro.Complemento , ' - ' ,
                Fiscal.Endereco.Registro.Bairro , ' - ' ,
                MaskCep(Fiscal.Endereco.Registro.Cep) , ' - ' ,
                Fiscal.Endereco.Cidade.Registro.Nome , ' - ' ,
                Fiscal.Endereco.Estado.Registro.Abreviatura
                );
    end;
    Lb_Emp_End.Caption := Lc_Aux;
    Lc_Aux :='';
    Fiscal.Telefone.Registro.Codigo := Registro.Codigo;
    Fiscal.Telefone.Registro.Tipo := 'Fone';
    Fiscal.Telefone.getByKey;
    if Fiscal.Telefone.exist then
    Begin
      Lc_Aux := MaskFone(Fiscal.Telefone.Registro.Numero);
    End
    else
    BEgin
      Fiscal.Telefone.Registro.Codigo := Registro.Codigo;
      Fiscal.Telefone.Registro.Tipo := 'Fax';
      Fiscal.Telefone.getByKey;
      if (Trim(Lc_Aux) <> '') and Fiscal.Telefone.exist then
      BEgin
        Lc_Aux := Lc_Aux + ' / ' + MaskFone(Fiscal.Telefone.Registro.Numero);
      End
      else
      Begin
        Fiscal.Telefone.Registro.Codigo := Registro.Codigo;
        Fiscal.Telefone.Registro.Tipo := 'Celular';
        Fiscal.Telefone.getByKey;
        if Fiscal.Telefone.exist then
          Lc_Aux := MaskFone(Fiscal.Telefone.Registro.Numero);
      End;
    End;

    Lb_Emp_Fones.Caption  := concat( 'Fones: '  , Lc_Aux );
    Lb_Emp_www.Caption    := concat( 'Site: '   , Fiscal.MidiaSocial.Registro.Link);
    Lb_Emp_email.Caption  := concat( 'e-mail: ' , Fiscal.Email.Registro.Email );
  END;
  }
end;

procedure TQrpBudAdvertise.ComposicaoAddReports(Sender: TObject);
begin
  Composicao.reports.Add(RL_Cabecalho);
  if Qr_Imp.RecordCount > 0 then
    Composicao.reports.Add(RL_Imp);
  if Qr_Web.RecordCount > 0 then
    Composicao.reports.Add(RL_Web);
  Composicao.reports.Add(RL_Sumario);
end;

procedure TQrpBudAdvertise.DetailImpBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
  Lc_valor : Real;
  Lc_tiragem :Integer;
begin
  if Qr_Imp.RecordCount > 0 then
  Begin
    if Zebra then
    Begin
      Zebra := False;
      DetailImp.Color := clWhite;
    End
    else
    Begin
      DetailImp.Color := cl3DLight;
      Zebra := True;
    End;
    Sequencia := Sequencia +1;
    E_Imp_Sequencia.Caption := sequencia.ToString;
    E_Imp_Cidade.Caption    := Qr_Impname.AsString;
    E_Imp_Veiculo.Caption   := Qr_Impnick_trade.AsString;
    Advertise.Veiculo.Cobertura.Registro.Cidade := Qr_ImpCityID.AsInteger;
    Advertise.Veiculo.Cobertura.Registro.Veiculo := Qr_ImpbroadcasterID.AsInteger;
    Lc_Tiragem := Advertise.Veiculo.Cobertura.getTiragem;
    E_Imp_Tiragem.Caption := FloatToStrF(Lc_tiragem,ffNumber,10,0);
    Tiragem := Tiragem + Lc_tiragem;
    Lc_valor := Qr_Imponline_price.AsFloat / ( Qr_Impnr_columns.AsInteger * Qr_Impsize_columns.AsInteger );
    E_Imp_cm_col.Caption    := concat('R$ ', FloatToStrF(Lc_valor,ffNumber,10,2));
    E_Imp_Formato.Caption   := Qr_Impformats.AsString;
    E_Imp_medida.Caption    := Qr_Impmeasure.AsString;
    E_Imp_col.Caption       := Qr_Impnr_columns.AsString;
    E_Imp_alt.Caption       := Qr_Impsize_columns.AsString;
    E_Imp_unitario.Caption  := concat('R$ ', FloatToStrF(Qr_Imponline_price.AsFloat,ffNumber,10,2));
    E_Imp_insercao.Caption  := Qr_Impinsertion.AsString;
    E_Imp_total.Caption     := concat('R$ ', FloatToStrF(Qr_Imponline_price.AsFloat * Qr_Impinsertion.AsInteger,ffNumber,10,2));
    ImpSubtotal := ImpSubtotal + (Qr_Imponline_price.AsFloat * Qr_Impinsertion.AsInteger);
  End;
end;



procedure TQrpBudAdvertise.execute;
begin
  Search;
  RL_Cabecalho.Prepare;
  RL_Imp.Prepare;
  RL_Web.Prepare;
  Composicao.Prepare;
end;

procedure TQrpBudAdvertise.FormCreate(Sender: TObject);
begin
  Qr_Imp.Active := False;
  Qr_Imp.Connection := GetConnection;

  Qr_Web.Active := False;
  Qr_Web.Connection := GetConnection;

  FEstabelecimento := TControllerInstitution.Create(self);
  Advertise := TControllerBudgAdvertise.Create(self);
end;

procedure TQrpBudAdvertise.ImpSumarioBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  E_imp_subtotal_Tiragem.Caption := FloatToStrF(Tiragem,ffNumber,10,0);
  E_imp_valor_total.Caption := concat('R$ ', FloatToStrF(impSubtotal,ffNumber,10,2));
end;

procedure TQrpBudAdvertise.RL_CabecalhoBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  cabecalho;
end;

procedure TQrpBudAdvertise.RL_ImpBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
Var
  I : Integer;
begin
  Zebra := true;
  for I := Qr_Imp.RecordCount + 1 downto 1 do
  Begin
    if Zebra then
      Zebra := FAlse
    else
      Zebra := True;
  End;
  Sequencia := 0;
  ImpSubtotal := 0;
  Tiragem := 0;
end;

procedure TQrpBudAdvertise.RL_WebBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
Var
  I:Integer;
Begin
  Zebra := true;
  for I := Qr_Imp.RecordCount + 1 downto 1 do
  Begin
    if Zebra then
      Zebra := FAlse
    else
      Zebra := True;
  End;

  Sequencia := 0;
  PageViews := 0;
  WebSubtotal := 0;
end;

procedure TQrpBudAdvertise.DetailWebBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
  Lc_valor : Real;
begin
  if Qr_Web.RecordCount > 0 then
  Begin
    if Zebra then
    Begin
      Zebra := False;
      DetailWeb.Color := clWhite;
    End
    else
    Begin
      Zebra := True;
      DetailWeb.Color := cl3DLight;
    End;
    Sequencia := Sequencia +1;
    E_Web_Sequencia.Caption := sequencia.ToString;
    E_web_cidade.Caption     := Qr_Webname.AsString;
    E_web_portal.Caption     := Qr_Weblink.AsString;
    E_web_Formato.Caption     := Qr_Webformats.AsString;
    E_web_inicio.Caption     := DateToStr(Date);
    E_web_fim.Caption        := DateToStr(Date + Qr_Webdays.AsInteger);
    E_web_dias.Caption       := Qr_Webdays.AsString;
    E_web_contratado.Caption := FloatToStrF( Qr_Webpage_views.AsInteger * Qr_Webdays.AsInteger, ffNumber,10,0);
    E_web_media_dia.Caption  := FloatToStrF( Qr_Webpage_views.AsInteger, ffNumber,10,0);
    E_web_cpm.Caption        := concat('R$ ', FloatToStrF( Qr_Webunit_value.AsFloat,ffNumber,10,2));
    Lc_valor := (Qr_Webunit_value.AsFloat * (Qr_Webpage_views.AsInteger * Qr_Webdays.AsInteger))/1000;
    E_web_total.Caption      := concat('R$ ', FloatToStrF( Lc_valor,ffNumber,10,2));
    WebSubtotal := WebSubtotal + Lc_valor;
    PageViews := PageViews + ( Qr_Webpage_views.AsInteger * Qr_Webdays.AsInteger )
  End;
end;

procedure TQrpBudAdvertise.Search;
begin
  SelectCabecalho;
  SelectImp;
  SelectWeb;
end;

procedure TQrpBudAdvertise.SelectCabecalho;
begin
//  FEstabelecimento.getAllByKey;
  Qr_Cabecalho.Active := FAlse;;
  Qr_Cabecalho.Connection := GetConnection;
  Qr_Cabecalho.ParamByName('id').AsInteger := FEstabelecimento.Registro.Codigo;
  Qr_Cabecalho.Active := True;
  Qr_Cabecalho.FetchAll;
end;

procedure TQrpBudAdvertise.SelectImp;
begin
  Qr_Imp.Active := false;
  Qr_Imp.SQL.Clear;
  Qr_Imp.SQL.Add(concat(
          'select c.id CityID, c.name, e.id broadcasterID, e.nick_trade ,bai.unit_value, ' ,
          'bai.formats, pjr.measure, pjr.nr_columns, pjr.size_columns, ',
          'pjr.online_price, bai.insertion ',
          'from tb_budg_advertise_imp bai ',
          'inner join tb_med_price_list_jr pjr ',
          'on (bai.tb_med_price_list_jr_id = pjr.id) ',
          '  and (bai.tb_institution_id = pjr.tb_institution_id) ',
          '  and (bai.tb_broadcaster_id = pjr.tb_broadcaster_id) ',
          'inner join tb_broadcaster b ',
          'on (bai.tb_broadcaster_id = b.id) ',
          ' and (bai.tb_institution_id = b.tb_institution_id) ',
          'inner join tb_entity e ',
          'on (e.id = b.id) ',
          'inner join tb_address adr ',
          'on (adr.id = b.id) ',
          'inner join tb_city c ',
          'on (c.id =adr.tb_city_id) ',
          'where pjr.online_price >0  ',
          ' and bai.tb_institution_id =:tb_institution_id ',
          ' and bai.tb_budg_advertise_id =:tb_budg_advertise_id '
  ));
  Qr_Imp.ParamByName('tb_institution_id').AsInteger := PArametro.Estabelecimento;
  Qr_Imp.ParamByName('tb_budg_advertise_id').AsInteger := PArametro.Codigo;
  Qr_Imp.Active := True;
  Qr_Imp.FetchAll;

end;

procedure TQrpBudAdvertise.SelectWeb;
begin
  Qr_web.Active := false;
  Qr_web.SQL.Clear;
  Qr_web.SQL.Add(concat(
              'select UPPER(c.name) name,  sm.link ,baw.formats, baw.days, baw.page_views, baw.unit_value ',
              'from tb_budg_advertise_web baw ',
              '  inner join tb_med_price_list_ol pol ',
              '  on (baw.tb_med_price_list_ol_id = pol.id) ',
              '    and (baw.tb_institution_id = pol.tb_institution_id) ',
              '    and (baw.tb_broadcaster_id = pol.tb_broadcaster_id) ',
              '  inner join tb_broadcaster b ',
              '  on (baw.tb_broadcaster_id = b.id) ',
              '     and (baw.tb_institution_id = b.tb_institution_id) ',
              '  inner join tb_entity e ',
              '  on (e.id = b.id) ',
              '  inner join tb_address adr ',
              '  on (adr.id = b.id) ',
              '  inner join tb_city c ',
              '  on (c.id =adr.tb_city_id) ',
              '  left outer join tb_social_media sm ',
              '  on (sm.id = e.id)  and (sm.kind = ''www'') ',
              'where pol.online_price >0 ',
          ' and baw.tb_institution_id =:tb_institution_id ',
          ' and baw.tb_budg_advertise_id =:tb_budg_advertise_id '
  ));
  Qr_web.ParamByName('tb_institution_id').AsInteger := PArametro.Estabelecimento;
  Qr_web.ParamByName('tb_budg_advertise_id').AsInteger := PArametro.Codigo;
  Qr_web.Active := TRue;
  Qr_web.FetchAll;
end;

procedure TQrpBudAdvertise.setFPArametro(const Value: TPrmRepBudgAdvertise);
begin
  FPArametro := Value;
end;


procedure TQrpBudAdvertise.SumarioBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  //A multiplicação por 3 foi descisão do Ricardo - Multiplicar o total da tiragem x 3 para dar a audiencia estimada no impresso
  E_Imp_Audiencia.Caption       := FloatToStrF(Tiragem * 3,ffNumber,10,0);
  E_Imp_Investimento.Caption    := concat('R$ ', FloatToStrF(ImpSubtotal,ffNumber,10,2));
  E_web_Audiencia.Caption       := FloatToStrF( PageViews ,ffNumber,10,0);
  E_web_Investimento.Caption    := concat('R$ ', FloatToStrF(WebSubtotal,ffNumber,10,2));
  E_total_audiencia.Caption     := FloatToStrF( ((Tiragem * 3)+ PageViews) ,ffNumber,10,0);
  E_total_Investimento.Caption  := concat('R$ ', FloatToStrF(ImpSubtotal + WebSubtotal,ffNumber,10,2));
end;

procedure TQrpBudAdvertise.WebSumarioBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  E_web_pageviews.Caption := FloatToStrF( PageViews ,ffNumber,10,0);
  E_web_valor_total.Caption := concat('R$ ', FloatToStrF(webSubtotal,ffNumber,10,2));

end;

end.
