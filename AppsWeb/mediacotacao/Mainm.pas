unit Mainm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,intCity,
  uniGUIClasses, uniGUImClasses, uniGUIRegClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  unimCarousel, uniGUIBaseClasses, uniButton, unimButton, unimPanel, uniImage,
  unimImage, uniLabel, unimLabel, uniPanel, uniHTMLFrame, unimHTMLFrame,
  uniBitBtn, unimBitBtn, ctrl_mob_step_advertise, uniPageControl, unimTabPanel,
  unimToggle, uniBasicGrid, uniDBGrid, unimDBListGrid, unimDBGrid, Data.DB,
  Datasnap.DBClient, uniEdit, uniMultiItem, unimList, unimDBList, unimEdit,
  unimFieldSet, unimScrollBox, unimDBToggle, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.StorageBin, img_view,tblOrder,
  prm_rep_budg_advertise, uReportCM, REST.Json, reportBudgetAdvertise,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components, ACBrBase, ACBrMail,
  System.IniFiles, uniMemo, unimMemo, uniURLFrame, unimURLFrame;

type
  TMainmForm = class(TUnimForm)
    UnimImage2: TUnimImage;
    htm_message: TUnimHTMLFrame;
    tab_main: TUnimTabPanel;
    tbs_01: TUnimTabSheet;
    tbs_02: TUnimTabSheet;
    tbs_00: TUnimTabSheet;
    pnl_00_button: TUnimPanel;
    pnl_01_button: TUnimPanel;
    btn_1_next: TUnimButton;
    btn_0_next: TUnimButton;
    btn_0_prior: TUnimButton;
    tbs_03: TUnimTabSheet;
    pnl_cities_button: TUnimPanel;
    btn_3_next: TUnimButton;
    btn_3_prior: TUnimButton;
    ds_city: TDataSource;
    htm_Top: TUnimHTMLFrame;
    E_Search_City: TUnimEdit;
    tbs_04: TUnimTabSheet;
    Dbg_City: TUnimDBGrid;
    cds_city: TFDMemTable;
    cds_cityid: TIntegerField;
    cds_cityname: TStringField;
    cds_citychecked: TStringField;
    cds_citychbxValue: TStringField;
    dbg_format_imp: TUnimDBGrid;
    cds_formats_imp: TFDMemTable;
    ds_formats_imp: TDataSource;
    cds_formats_impid: TIntegerField;
    cds_formats_impdescription: TStringField;
    btn_4_next: TUnimButton;
    btn_4_prior: TUnimButton;
    tbs_05: TUnimTabSheet;
    dbg_format_imp_chosen: TUnimDBGrid;
    btn_5_next: TUnimButton;
    btn_5_prior: TUnimButton;
    tbs_06: TUnimTabSheet;
    dbg_format_web: TUnimDBGrid;
    btn_6_next: TUnimButton;
    btn_6_prior: TUnimButton;
    tbs_07: TUnimTabSheet;
    dbg_format_web_chosen_day: TUnimDBGrid;
    btn_7_next: TUnimButton;
    btn_7_prior: TUnimButton;
    cds_formats_impchecked: TStringField;
    cds_formats_impchbxValue: TStringField;
    cds_formats_impimage: TStringField;
    cds_formats_impinsertion: TStringField;
    cds_formats_impbtn_insertion: TStringField;
    cds_formats_web: TFDMemTable;
    ds_formats_web: TDataSource;
    cds_formats_webid: TIntegerField;
    cds_formats_webdescription: TStringField;
    cds_formats_webchecked: TStringField;
    cds_formats_webchbxValue: TStringField;
    cds_formats_webimage: TStringField;
    tbs_08: TUnimTabSheet;
    cds_formats_webday: TStringField;
    cds_formats_webbtn_day: TStringField;
    cds_formats_imppath_file: TStringField;
    tbs_09: TUnimTabSheet;
    btn_8_final: TUnimButton;
    dbg_format_web_chosen_pvw: TUnimDBGrid;
    btn_8_next: TUnimButton;
    btn_8_prior: TUnimButton;
    cds_formats_webpage_view: TIntegerField;
    cds_formats_websld_page_view: TStringField;
    cds_formats_webpath_file: TStringField;
    html_final: TUnimHTMLFrame;
    E_email: TUnimEdit;
    Id_Mail: TACBrMail;
    tbs_10: TUnimTabSheet;
    Html_Reset_operation: TUnimHTMLFrame;
    sb_reset: TUnimButton;
    UnimHTMLFrame1: TUnimHTMLFrame;
    pnl_02_body: TUnimPanel;
    tog_Impresso: TUnimToggle;
    tog_online: TUnimToggle;
    UnimLabel1: TUnimLabel;
    pnl_02_body_message: TUnimPanel;
    Sb_View: TUnimButton;
    tbs_11: TUnimTabSheet;
    pdf_doc: TUnimPDFFrame;
    Sb_Reset_2: TUnimButton;
    pnl_01_body: TUnimPanel;
    pnl_02_button: TUnimPanel;
    btn_02_next: TUnimButton;
    btn_02_prior: TUnimButton;
    pnl_tittle_city: TUnimPanel;
    pnl_Tittle_Formats_imp: TUnimPanel;
    pnl_Tittle_Formats_chosen_imp: TUnimPanel;
    pnl_Tittle_Formats_chosen_imp_1: TUnimPanel;
    pnl_Tittle_Formats_chosen_imp_2: TUnimPanel;
    pnl_Tittle_Formats_web: TUnimPanel;
    pnl_Tittle_Formats_chosen_web: TUnimPanel;
    pnl_Tittle_Formats_chosen_web_1: TUnimPanel;
    pnl_Tittle_Formats_chosen_web_2: TUnimPanel;
    pnl_Tittle_page_views: TUnimPanel;
    pnl_Tittle_page_views_1: TUnimPanel;
    pnl_Tittle_page_views_2: TUnimPanel;
    pnl_Tittle_page_views_icone: TUnimPanel;
   procedure UnimFormCreate(Sender: TObject);
    procedure btn_1_nextClick(Sender: TObject);
    procedure btn_0_nextClick(Sender: TObject);
    procedure btn_0_priorClick(Sender: TObject);
    procedure btn_3_priorClick(Sender: TObject);
    procedure Dbg_CityClickHold(Sender: TObject);
    procedure E_Search_CityChange(Sender: TObject);
    procedure Dbg_CityAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
    procedure Dbg_CityDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TunimDBGridColumn; Attribs: TUniCellAttribs);
    procedure btn_3_nextClick(Sender: TObject);
    procedure dbg_format_impDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TunimDBGridColumn; Attribs: TUniCellAttribs);
    procedure dbg_format_impAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
    procedure btn_4_priorClick(Sender: TObject);
    procedure btn_4_nextClick(Sender: TObject);
    procedure dbg_format_imp_chosenDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TunimDBGridColumn; Attribs: TUniCellAttribs);
    procedure UnimFormReady(Sender: TObject);
    procedure btn_5_priorClick(Sender: TObject);
    procedure btn_5_nextClick(Sender: TObject);
    procedure dbg_format_webDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TunimDBGridColumn; Attribs: TUniCellAttribs);
    procedure dbg_format_webAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
    procedure dbg_format_imp_chosenAjaxEvent(Sender: TComponent;
      EventName: string; Params: TUniStrings);
    procedure dbg_format_web_chosen_dayAjaxEvent(Sender: TComponent;
      EventName: string; Params: TUniStrings);
    procedure dbg_format_web_chosen_dayDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TunimDBGridColumn; Attribs: TUniCellAttribs);
    procedure btn_6_priorClick(Sender: TObject);
    procedure btn_6_nextClick(Sender: TObject);
    procedure btn_7_priorClick(Sender: TObject);
    procedure btn_7_nextClick(Sender: TObject);
    procedure btn_8_priorClick(Sender: TObject);
    procedure dbg_format_web_chosen_pvwAjaxEvent(Sender: TComponent;
      EventName: string; Params: TUniStrings);
    procedure btn_8_nextClick(Sender: TObject);
    procedure dbg_format_web_chosen_pvwDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TunimDBGridColumn; Attribs: TUniCellAttribs);
    procedure btn_8_finalClick(Sender: TObject);
    procedure sb_resetClick(Sender: TObject);
    procedure Sb_ViewClick(Sender: TObject);
    procedure btn_02_nextClick(Sender: TObject);
    procedure btn_02_priorClick(Sender: TObject);
  private
    { Private declarations }

    procedure SetCssButton(T: TComponent);

    procedure createtoggleCity(Sender: TField; var Text: string;   DisplayText: Boolean);

    procedure createtoggleFormatsImp(Sender: TField; var Text: string;   DisplayText: Boolean);
    procedure createbuttonFormatsImp(Sender: TField; var Text: string;   DisplayText: Boolean);
    procedure createSpinnerFormatsChosenImp(Sender: TField; var Text: string;   DisplayText: Boolean);

    procedure createtoggleFormatsWeb(Sender: TField; var Text: string;   DisplayText: Boolean);
    procedure createbuttonFormatsWeb(Sender: TField; var Text: string;   DisplayText: Boolean);
    procedure createSpinnerFormatsChosenWebDay(Sender: TField; var Text: string;   DisplayText: Boolean);
    procedure createSpinnerFormatsChosenWebPvw(Sender: TField; var Text: string;   DisplayText: Boolean);

    procedure HtmlMessage(Msg:String);
    procedure StepMessage;
    procedure PassoPosMensagem;
    procedure FinalHtmlMessage;
    procedure ResetHtmlMessage;

    procedure ShowListCity;

    function  OpenLisFormatsImp:Boolean;
    procedure ShowLisFormatsImp;
    procedure ShowLisFormatsChosenImp;

    function  OpenListFormatsWeb:Boolean;
    procedure ShowLisFormatsWeb;
    procedure ShowLisFormatsChosenWebDay;
    procedure ShowLisFormatsChosenWebPVw;

    procedure ShowFinalProcess;

    //Validações
    function ValidateCitiesChosen:Boolean;
    function ValidateFormatsImpChosen:Boolean;
    function ValidateFormatImpInsertionChosen:Boolean;

    function ValidateFormatsWebChosen:Boolean;
    function ValidateFormatWebChosenDay:Boolean;
    function ValidateFormatWebChosenPvw:Boolean;

    function validateimageImp:Boolean;
    function validateimageweb:Boolean;

    procedure SaveOrder;
    procedure SaveAdvertise;
    procedure SaveAdvertiseImp;
    procedure SaveAdvertiseWeb;

    function EnviaEmail(destinatario,anexo:String):Boolean;
    procedure configs;
  protected
    procedure InitVariable;
  public
    { Public declarations }
  end;

function MainmForm: TMainmForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, unMessages, msg_alert,
  define_page_views,UnitConstantes,ClasseUtil , ServerModule;

function MainmForm: TMainmForm;
begin
  Result := TMainmForm(UMM.GetFormInstance(TMainmForm));
end;

{ TMainmForm }

function TMainmForm.EnviaEmail(destinatario, anexo: String): Boolean;
begin
  UMM.GInstitution.User.Registro.Codigo := 1;
  UMM.GInstitution.User.getAllbyKey;
  with Id_Mail, UMM.GInstitution.User do
  Begin
    Try
      Host      := EnviaEmail.Registro.SMtp;
      Port      := EnviaEmail.Registro.Porta;
      SetSSL    := (EnviaEmail.Registro.RequerSSL = 'S');
      SetTLS    := (EnviaEmail.Registro.RequerAutenticacao = 'S');
      From      := Mailing.Registro.Email;
      FromName  := Entity.Name;
      Username  := Mailing.Registro.Email;
      Password  := EnviaEmail.Registro.Senha;

      AddAddress(destinatario,destinatario);
      //Assunto
      Subject := 'Cotação do Plano de Mídia';
      IsHTML := True; // define que a mensagem é html
      Body.Append(concat(
                    '<html>',
                    '<head>',
                    '  <meta content="text/html; charset=ISO-8859-1"',
                    ' http-equiv="content-type">',
                    '</head>',
                    '<body>',
                    'Ol&aacute;,<br>',
                    '<br>',
                    ' Segue em anexo a cotação do plano de mídia.',
                    '<br>',
                    '</body>',
                    '</html>'
      ));
      AddAttachment( anexo );
      Id_Mail.Send();
    except
      on E : Exception do
        ShowMessage(E.ClassName+' Erro , com Mensagem : '+E.Message);
    end;
  End;
end;

procedure TMainmForm.E_Search_CityChange(Sender: TObject);
begin
  if Length(trim(E_Search_City.Text)) >0 then
  Begin

    cds_city.Filter :='UPPER(name) Like ' +UpperCase(QuotedStr('%' + E_Search_City.Text + '%'));

    cds_city.Filtered := True;
  End
  else
  Begin
    cds_city.Filter :='';
    cds_city.Filtered := False;
  End;
end;

procedure TMainmForm.FinalHtmlMessage;
begin
  html_final.HTML.Clear;
  html_final.HTML.add(concat(
            '<style>',
            '.message {',
            '  height: 45vh;',
            '    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);',
            '  margin-top   : 10px;',
            '  margin-bottom: 10px;',
            '  margin-left  :25px;',
            '  margin-right :25px;',
            '  border: 3px solid #b4b4b4;',
            '  border-radius: 10px;',
            '}',
            '.container {',
            '  height: 100px;',
            '  position: relative;',
            '  padding:15px',
            '}',
            '.vertical-center {',
            '  position: absolute;',
            '  top: 10%;',
            '  text-align: center; ',
            '}',
            'input{',
            '  display: block;',
            '}',
            '.left{',
            '  float: left;',
            '}',
            '</style>',
            '<div class="message">',
            '  <div class="container">',
            '    <div class="vertical-center">',
            '      <h2 text->Simulação gerada! Clique em finalizar para baixar o PDF , ou informe seu e-mail para receber o plano. </h2>',
            '    </div>',
            '  </div>',
            '</div>'
  ));

end;

procedure TMainmForm.HtmlMessage(Msg: String);
begin
  htm_message.HTML.Clear;
  htm_message.HTML.add(concat(
          '<style> ',
          '.message { ',
          '  height: 50vh; ',
          '    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); ',
          '  margin-top   : 10px; ',
          '  margin-bottom: 25px; ',
          '  margin-left  :25px; ',
          '  margin-right :25px; ',
          '  border: 3px solid #b4b4b4; ',
          '  border-radius: 10px; ',
          '  Text-Align:Center; ',
          '} ',
          '.container { ',
          '  height: 100px; ',
          '  position: relative; ',
          '  padding:20px ',
          '} ',
          '.vertical-center { ',
          '  position: absolute; ',
          '  top: 50%; ',
          '  left: 5%; ',
          '  right :5% ',
          '} ',
          '</style> ',
          '<div class="message"> ',
          '  <div class="container"> ',
          '      <div class="vertical-center"> ',
          '      <h2>',Msg ,'</h2> ',
          '      </div> ',
          '  </div> ',
          '</div> '
  ));
end;

procedure TMainmForm.InitVariable;
Var
  I: Integer;
begin
  configs;
  for I := 0 to tab_main.PageCount -1 do
    tab_main.Pages[I].Visible := FAlse;
  tab_main.ActivePage := tbs_01;
end;

function TMainmForm.OpenLisFormatsImp:Boolean;
Var
  I:Integer;
  Lc_Cities : String;
begin
  Lc_Cities := '';
  cds_city.First;
  while not cds_city.Eof do
  Begin
    if cds_citychbxValue.AsString = 'S' then
    Begin
      if Lc_Cities = '' then
        Lc_Cities := cds_cityid.AsString
      else
        Lc_Cities := concat(Lc_Cities,',',cds_cityid.AsString);
    End;
    cds_city.Next;
  End;
  with UMM.Advertise.Advertise.Veiculo do
  Begin
    TabelaJR.Registro.Estabelecimento := UMm.GInstitution.Registro.Codigo;
    TabelaJR.getListIntFormatsByCity(Lc_Cities);
    Result := ( TabelaJR.ListaIntMedFormats.Count >0 );
  End;
end;

function TMainmForm.OpenListFormatsWeb: Boolean;
Var
  Lc_Cities : String;
begin
  Lc_Cities := '';
  cds_city.First;
  while not cds_city.Eof do
  Begin
    if cds_citychbxValue.AsString = 'S' then
    Begin
      if Lc_Cities = '' then
        Lc_Cities := cds_cityid.AsString
      else
        Lc_Cities := concat(Lc_Cities,',',cds_cityid.AsString);
    End;
    cds_city.Next;
  End;

  with UMM.Advertise.Advertise.Veiculo do
  Begin
    TabelaOl.Registro.Estabelecimento := UMm.GInstitution.Registro.Codigo;
    TabelaOl.getListIntFormatsByCity(Lc_Cities);
    Result := ( TabelaOl.ListaIntMedFormats.Count > 0 );
  End;
end;

procedure TMainmForm.PassoPosMensagem;
begin
  if (UMM.Advertise.Passo = 5) and (UMM.Advertise.Escolha = 'I')  then
    UMM.Advertise.passo := 9
  else
  if (UMM.Advertise.passo = 3) and (UMM.Advertise.Escolha = 'O')  then
    UMM.Advertise.passo := 6
  else
    UMM.Advertise.passo := UMM.Advertise.passo + 1;

  case UMM.Advertise.passo of
    3:Begin
        ShowListCity;
    End;
    4:Begin
        if OpenLisFormatsImp then
        Begin
          ShowLisFormatsImp;
        End
        else
        Begin
          UMM.Advertise.Escolha := 'O';
          UMM.Advertise.passo := 5;
          PassoPosMensagem;
        End;
    End;
    5:Begin
        ShowLisFormatsChosenImp;
    End;
    6:Begin
        if OpenListFormatsWeb then
        Begin
          ShowLisFormatsWeb;
        End
        else
        Begin
          UMM.Advertise.Escolha := 'I';
          UMM.Advertise.passo := 9;
          PassoPosMensagem;
        End;
    End;
    7:Begin
        ShowLisFormatsChosenWebDay;
    End;
    8:Begin
        ShowLisFormatsChosenWebPvw;
    End;
    9:Begin
        ShowFinalProcess;
    End;
  end;
  tab_main.ActivePageIndex := UMM.Advertise.passo;
end;

procedure TMainmForm.ResetHtmlMessage;
begin
  Html_Reset_operation.HTML.Clear;
  Html_Reset_operation.HTML.Add(concat(
     '  <style> ',
     ' .message { ',
     '   height: 57vh; ',
     '     box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); ',
     '   margin-bottom: 23px; ',
     '   margin-left  :20px; ',
     '   margin-right :20px; ',
     '   border: 3px solid #b4b4b4; ',
     '   border-radius: 10px; ',
     ' } ',
     ' .divTable{ ',
     '   display: table; ',
     ' } ',
     ' .divTableRow { ',
     '   display: table-row; ',
     ' } ',
     ' .divTableCell { ',
     '   display: table-cell; ',
     '     font-size:14px; ',
     '     float:left; ',
     '     text-align: center; ',
     ' } ',
     ' .divTableCell_2 { ',
     '   display: table-cell; ',
     '     font-size:18px; ',
     '     float:left; ',
     '     margin-top: 20px; ',
     '     text-align: center; ',
     ' } ',
     ' </style> ',
     ' <div class="message"> ',
     '         <div class="divTable"> ',
     '             <div class="divTableRow"> ',
     '         <div class="divTableCell"  > ',
     '                     <h2 > ',
     '                     Caso deseje alterar ou refazer a simulação , clique em reiniciar.Estamos a disposição para ajustes e dúvidas , nos canais abaixo </h2> ',
     '                 </div> ',
     '             </div> ',
     '       <div class="divTableRow"> ',
     '         <div class="divTableCell"> ',
     '                     <img src="http://www.gestaowebsetes.com.br/images/brands/log_whatsApp.jpg" width="60" height="60"> ',
     '                 </div> ',
     '                 <div class="divTableCell_2" > ',
     '                     (41) 9-8405-2344 ',
     '                 </div> ',
     '             </div> ',
     '             <div class="divTableRow"> ',
     '                 <div class="divTableCell"> ',
     '                     <img src="http://www.gestaowebsetes.com.br/images/brands/logo_gmail.png" width="55" height="55"> ',
     '                 </div> ',
     '         <div class="divTableCell_2" > ',
     '            ricardo@adipr.com.br ',
     '         </div> ',
     '       </div> ',
     '     </div> ',
     ' </div> '
  ));
end;

procedure TMainmForm.SaveAdvertise;
begin
  with UMM.Advertise.Advertise do
  BEgin
    Registro.Codigo          := Ordem.Registro.Codigo;
    Registro.Estabelecimento := Ordem.Registro.Estabelecimento;
    Registro.Numero          := 0;
    Registro.email           := E_email.Text;
  End;
  UMM.Advertise.Advertise.insert;
end;

procedure TMainmForm.SaveAdvertiseImp;
Var
  I:Integer;
begin
  with UMM.Advertise.Advertise do
  Begin
    cds_formats_imp.Filter := ' (chbxValue = ''S'')';
    cds_formats_imp.Filtered := True;

    cds_city.Filter := ' (chbxValue) = ''S'' ';
    cds_city.Filtered := True;
    cds_city.First;
    while not cds_city.Eof do
    Begin
      cds_formats_imp.First;
      while not cds_formats_imp.Eof do
      Begin
        Veiculo.TabelaJR.Registro.Estabelecimento := Registro.Estabelecimento;
        Veiculo.TabelaJR.getListByFoormatCity( cds_formats_impdescription.AsString, cds_cityid.AsInteger);
        for I := 0 to Veiculo.TabelaJR.Lista.count-1 do
        Begin
           imp.Registro.Codigo          := 0;
           imp.Registro.Estabelecimento := Registro.Estabelecimento;
           imp.Registro.Anuncio         := Registro.Codigo;
           imp.Registro.Cidade          := cds_cityid.AsInteger;
           imp.Registro.Veiculo         := Veiculo.TabelaJR.Lista[I].Veiculo;
           imp.Registro.Formato         := Veiculo.TabelaJR.Lista[I].Formato;
           imp.Registro.TabelaPreco     := Veiculo.TabelaJR.Lista[I].Codigo;
           imp.Registro.Insercao        := cds_formats_impinsertion.AsInteger;
           imp.Registro.ValorUnitario   := Veiculo.TabelaJR.Lista[I].OnlinePreco;
           imp.insert;
        End;
        cds_formats_imp.Next;
      End;
      cds_city.next;
    End;
  End;
end;

procedure TMainmForm.SaveAdvertiseWeb;
Var
  I:Integer;
begin
  with UMM.Advertise.Advertise do
  Begin
    cds_formats_web.Filter := ' (chbxValue = ''S'')';
    cds_formats_web.Filtered := True;

    cds_city.Filter := ' (chbxValue) = ''S'' ';
    cds_city.Filtered := True;
    cds_city.First;
    while not cds_city.Eof do
    Begin
      cds_formats_web.First;
      while not cds_formats_web.Eof do
      Begin
        Veiculo.TabelaOL.Registro.Estabelecimento := Registro.Estabelecimento;
        Veiculo.TabelaOL.getListByFoormatCity( cds_formats_webdescription.AsString, cds_cityid.AsInteger);
        for I := 0 to Veiculo.TabelaOL.Lista.count-1 do
        Begin
           web.Registro.Codigo          := 0;
           web.Registro.Estabelecimento := Registro.Estabelecimento;
           web.Registro.Anuncio         := Registro.Codigo;
           web.Registro.Cidade          := cds_cityid.AsInteger;
           web.Registro.Veiculo         := Veiculo.TabelaOL.Lista[I].Veiculo;
           web.Registro.Formato         := Veiculo.TabelaOL.Lista[I].Formato;
           web.Registro.TabelaPreco     := Veiculo.TabelaOL.Lista[I].Codigo;
           web.Registro.Dias            := cds_formats_webday.AsInteger;
           web.Registro.PageViews       := cds_formats_webpage_view.AsInteger;
           web.Registro.ValorUnitario   := Veiculo.TabelaOL.Lista[I].OnlinePreco;
           web.insert;
        End;
        cds_formats_Web.Next;
      End;
      cds_city.next;
    End;
  End;
end;

procedure TMainmForm.SaveOrder;
begin
  with UMM.Advertise.Advertise.Ordem do
  BEgin
    Registro.Codigo          := 0;
    Registro.Estabelecimento := Umm.GInstitution.Registro.Codigo;
    Registro.Terminal        := 0;
    Registro.Data            := Date;
    Registro.Observacao      := '';
    Registro.Origem          := 'W';
    Registro.Status          := 'N';
    Registro.SendoUsado      := '';
    Registro.Usuario         := Umm.GInstitution.Registro.Codigo;
  End;
  UMM.Advertise.Advertise.Ordem.insert;
end;

procedure TMainmForm.sb_resetClick(Sender: TObject);
begin
  UniApplication.Restart;
end;

procedure TMainmForm.Sb_ViewClick(Sender: TObject);
begin
  tab_main.ActivePage := tbs_11;
  pdf_doc.Show;
end;

procedure TMainmForm.ShowFinalProcess;
begin
  try
    Self.showMask('Aguarde Processamento');
    UniSession.Synchronize();
    FinalHtmlMessage;
    SaveOrder;
    SaveAdvertise;
    if (UMM.Advertise.Escolha = 'I') or (UMM.Advertise.Escolha = 'A') then
      SaveAdvertiseImp;
    if (UMM.Advertise.Escolha = 'O') or (UMM.Advertise.Escolha = 'A') then
      SaveAdvertiseWEb;

  finally
    self.HideMask;
  end;

end;

procedure TMainmForm.ShowLisFormatsChosenImp;
begin
   cds_formats_imp.Filter := ' (chbxValue = ''S'')';
   cds_formats_imp.Filtered := True;
end;

procedure TMainmForm.ShowLisFormatsChosenWebDay;
begin
  cds_formats_web.Filter := ' (chbxValue = ''S'')';
  cds_formats_web.Filtered := True;
end;

procedure TMainmForm.ShowLisFormatsChosenWebPVw;
begin
  cds_formats_web.Filter := ' (chbxValue = ''S'')';
  cds_formats_web.Filtered := True;
end;

procedure TMainmForm.ShowLisFormatsImp;
Var
  I:Integer;
begin
  cds_formats_imp.Active := False;
  cds_formats_imp.CreateDataSet;
  cds_formats_imp.Filtered := False;
  cds_formats_imp.LogChanges := False;
  cds_formats_imp.EmptyDataSet;
  with UMM.Advertise.Advertise.Veiculo.TabelaJR do
  Begin
    for I := 0 to ListaIntMedFormats.Count-1 do
    BEgin
      cds_formats_imp.Append;
      cds_formats_imp.FieldByName('id').AsInteger           := I + 1;
      cds_formats_imp.FieldByName('description').AsString   := ListaIntMedFormats[I].Descricao;
      cds_formats_imp.FieldByName('chbxValue').AsString     := ListaIntMedFormats[I].Selecao;
      cds_formats_imp.FieldByName('image').AsString         := '';
      cds_formats_imp.FieldByName('insertion').AsString     := '1';
      cds_formats_imp.FieldByName('btn_insertion').AsString := '';
      cds_formats_imp.FieldByName('path_file').AsString     := ListaIntMedFormats[I].LinkImagem;
      cds_formats_imp.Post;
    End;
  End;
  cds_formats_imp.LogChanges := True;
end;

procedure TMainmForm.ShowLisFormatsWeb;
Var
  I:Integer;
begin
  cds_formats_web.Active := False;
  cds_formats_web.CreateDataSet;
  cds_formats_web.Filtered := False;
  cds_formats_web.LogChanges := False;
  cds_formats_web.EmptyDataSet;
  with UMM.Advertise.Advertise.Veiculo.TabelaOl do
  Begin
    for I := 0 to ListaIntMedFormats.Count-1 do
    BEgin
      cds_formats_web.Append;
      cds_formats_web.FieldByName('id').AsInteger         := I + 1;
      cds_formats_web.FieldByName('description').AsString := ListaIntMedFormats[I].Descricao;
      cds_formats_web.FieldByName('chbxValue').AsString   := ListaIntMedFormats[I].Selecao;
      cds_formats_web.FieldByName('image').AsString       := '';
      cds_formats_web.FieldByName('day').AsString         := '1';
      cds_formats_web.FieldByName('btn_day').AsString     := '';
      cds_formats_web.FieldByName('path_file').AsString   := ListaIntMedFormats[I].LinkImagem;
      cds_formats_web.Post;
    End;
  End;
  cds_formats_web.LogChanges := True;
end;

procedure TMainmForm.ShowListCity;
Var
  I:Integer;
begin
  cds_city.Active := False;
  cds_city.CreateDataSet;
  cds_city.LogChanges := False;
  cds_city.EmptyDataSet;
  with UMM.Advertise.Advertise.Veiculo.Cobertura do
  Begin
    getListIntCity(UMM.Advertise.Escolha);
    for I := 0 to ListaIntCity.Count-1 do
    BEgin
      cds_city.Append;
      cds_city.FieldByName('id').AsInteger      := ListaIntCity[I].Codigo;
      cds_city.FieldByName('name').AsString     := ListaIntCity[I].Nome;
      cds_city.FieldByName('chbxValue').AsString  := ListaIntCity[I].Selecao;
      cds_city.Post;
    End;
  End;
  cds_city.LogChanges := True;
end;

procedure TMainmForm.StepMessage;
begin
  //Aqui é a mensagem de conclusão do passo anterior e
  //Instruções para o próximo passo
  case UMM.Advertise.Passo of
    2:Begin
        HtmlMessage(concat('OK , agora escolha a(s) cidade(s) que deseja anunciar. '
       ));
    End;
    3:Begin
        HtmlMessage(concat('Perfeito , já temos a(s) cidade(s)! Agora escolha o(s) ',
                           'formato(s) do seu anúncio. '
        ));
    End;
    4:Begin
        HtmlMessage(concat('Legal , agora vamos definir quantas inserções ',
                           'deseja publicar para cada formato. '
        ));
    End;
    5:Begin
        if UMM.Advertise.escolha = 'I' then
        Begin
          HtmlMessage(concat('Pronto, já temos tudo que precisamos ',
                             'para montar seu plano!' ));
        End
        else
        Begin
          HtmlMessage(concat('Para a campanha web , selecione o formato de banner.' ));
        End;
    End;
    6:Begin
        HtmlMessage(concat('Ok , agora defina quantos dias deseja simular a exibição do banner.' ));
    End;
    7:Begin
        HtmlMessage(concat('Só mais um pouco... Quantos pageviews desejar simular por dia? ' ));
    End;
    8:Begin
        HtmlMessage(concat('Pronto! Já temos todas as informações para simular.' ));
    End;
  end;
end;

procedure TMainmForm.btn_1_nextClick(Sender: TObject);
begin
  UMM.Advertise.passo := 2;
  tab_main.ActivePageIndex := UMM.Advertise.passo;
end;

procedure TMainmForm.btn_02_nextClick(Sender: TObject);
begin
  if (not tog_Impresso.Toggled) and (not tog_online.Toggled) then
  Begin
    tog_Impresso.Toggled := True;
    tog_online.Toggled   := True;
  End;

  if tog_Impresso.Toggled then
    UMM.Advertise.Escolha := 'I';
  if tog_online.Toggled then
    UMM.Advertise.Escolha := 'O';
  if tog_Impresso.Toggled and tog_online.Toggled then
    UMM.Advertise.Escolha := 'A';
  tab_main.ActivePageIndex := 0;
  StepMessage;
end;

procedure TMainmForm.btn_02_priorClick(Sender: TObject);
begin
  UMM.Advertise.Passo := UMM.Advertise.passo - 1;
  tab_main.ActivePageIndex := UMM.Advertise.passo;
end;

procedure TMainmForm.btn_0_nextClick(Sender: TObject);
begin
  PassoPosMensagem;
end;

procedure TMainmForm.btn_0_priorClick(Sender: TObject);
begin
  tab_main.ActivePageIndex := UMM.Advertise.passo;
end;

procedure TMainmForm.btn_3_nextClick(Sender: TObject);
begin
  if ValidateCitiesChosen then
  Begin
    tab_main.ActivePageIndex := 0;
    StepMessage;
  End;
end;

procedure TMainmForm.btn_3_priorClick(Sender: TObject);
begin
  UMM.Advertise.passo := UMM.Advertise.passo - 1;
  tab_main.ActivePageIndex := UMM.Advertise.passo;
end;

procedure TMainmForm.btn_4_nextClick(Sender: TObject);
begin
  if ValidateFormatsImpChosen then
  Begin
    tab_main.ActivePageIndex := 0;
    StepMessage;
  End;
end;

procedure TMainmForm.btn_4_priorClick(Sender: TObject);
begin
  UMM.Advertise.passo := UMM.Advertise.passo - 1;
  cds_formats_imp.Filtered := False;
  tab_main.ActivePageIndex := UMM.Advertise.passo;
end;

procedure TMainmForm.btn_5_nextClick(Sender: TObject);
begin
  if ValidateFormatImpInsertionChosen then
  Begin
    tab_main.ActivePageIndex := 0;
    StepMessage;
  End;
end;

procedure TMainmForm.btn_5_priorClick(Sender: TObject);
begin
  UMM.Advertise.passo := UMM.Advertise.passo - 1;
  cds_formats_imp.Filtered := False;
  tab_main.ActivePageIndex := UMM.Advertise.passo;
end;

procedure TMainmForm.btn_6_nextClick(Sender: TObject);
begin
  if ValidateFormatsWebChosen then
  Begin
    tab_main.ActivePageIndex := 0;
    StepMessage;
  End;
end;

procedure TMainmForm.btn_6_priorClick(Sender: TObject);
begin
  UMM.Advertise.passo := UMM.Advertise.passo - 1;
  tab_main.ActivePageIndex := UMM.Advertise.passo;
end;

procedure TMainmForm.btn_7_nextClick(Sender: TObject);
begin
  if ValidateFormatWebChosenDay then
  Begin
    tab_main.ActivePageIndex := 0;
    StepMessage;
  End;
end;

procedure TMainmForm.btn_7_priorClick(Sender: TObject);
begin
  UMM.Advertise.passo := UMM.Advertise.passo - 1;
  cds_formats_web.Filtered := False;
  tab_main.ActivePageIndex := UMM.Advertise.passo;
end;

procedure TMainmForm.dbg_format_impAjaxEvent(Sender: TComponent; EventName: string;
  Params: TUniStrings);
Var
  Form : TImgView;
begin
  if EventName = 'format_imp' then
  begin
    with TUnimDBGrid(Sender).DataSource.DataSet do
    Begin
      if Params.Values['valchbx'] <> '' then
      Begin
        if (Params.Values['valchbx'] <> fieldByName('chbxValue').asString) then
        Begin
          Edit;
          if fieldByName('chbxValue').asString = 'N' then
            fieldByName('chbxValue').asString := 'S'
          else
            fieldByName('chbxValue').asString := 'N';
          post;
        End;
      End;
      if Params.Values['param0'] <> '' then
      Begin
        if validateimageImp then
        Begin
          Form := TImgView.create(UniApplication);
          Form.img_view.Url := self.cds_formats_imppath_file.AsString;
          Form.ShowModal(
            Procedure(Sender: TComponent; AResult:Integer)
            begin
              Form := nil;
            end
          );
        End
      End;
    End;
  end;

end;

procedure TMainmForm.dbg_format_impDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TunimDBGridColumn; Attribs: TUniCellAttribs);
begin
  if (Column.FieldName = 'checked') then
    Column.Field.OnGetText :=createtoggleFormatsImp;
  if (Column.FieldName = 'image') then
    Column.Field.OnGetText :=createbuttonFormatsImp;

end;

procedure TMainmForm.dbg_format_imp_chosenAjaxEvent(Sender: TComponent;
  EventName: string; Params: TUniStrings);
begin
  if EventName = 'format_imp_chosen' then
  begin
    with TUnimDBGrid(Sender).DataSource.DataSet do
    Begin
      if Params.Values['quant_imp'] <> '' then
      Begin
        if (Params.Values['quant_imp'] <> fieldByName('insertion').asString) then
        Begin
          Edit;
          fieldByName('insertion').asString := Params.Values['quant_imp'];
          post;
        End;
      End;
    End;
  end;
end;

procedure TMainmForm.dbg_format_imp_chosenDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TunimDBGridColumn; Attribs: TUniCellAttribs);
begin
  if (Column.FieldName = 'btn_insertion') then
    Column.Field.OnGetText :=createSpinnerFormatsChosenImp;
end;

procedure TMainmForm.dbg_format_webAjaxEvent(Sender: TComponent;
  EventName: string; Params: TUniStrings);
Var
  Form : TImgView;
begin
  if EventName = 'format_web' then
  begin
    with TUnimDBGrid(Sender).DataSource.DataSet do
    Begin
      if Params.Values['valchbx'] <> '' then
      Begin
        if (Params.Values['valchbx'] <> fieldByName('chbxValue').asString) then
        Begin
          Edit;
          if fieldByName('chbxValue').asString = 'N' then
            fieldByName('chbxValue').asString := 'S'
          else
            fieldByName('chbxValue').asString := 'N';
          post;
        End;
      End;
      if Params.Values['param0'] <> '' then
      Begin
        if validateimageWeb then
        Begin
          Form := TImgView.create(UniApplication);
          Form.img_view.Url := self.cds_formats_webpath_file.AsString;
          Form.ShowModal(
            Procedure(Sender: TComponent; AResult:Integer)
            begin
              Form := nil;
            end
          );
        End
      End;
    End;
  end;
end;

procedure TMainmForm.dbg_format_webDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TunimDBGridColumn; Attribs: TUniCellAttribs);
begin
  if (Column.FieldName = 'checked') then
    Column.Field.OnGetText :=createtoggleFormatsWeb;
  if (Column.FieldName = 'image') then
    Column.Field.OnGetText :=createbuttonFormatsWeb;

end;

procedure TMainmForm.dbg_format_web_chosen_dayAjaxEvent(Sender: TComponent;
  EventName: string; Params: TUniStrings);
begin
  if EventName = 'web_chosen_day' then
  begin
    with TUnimDBGrid(Sender).DataSource.DataSet do
    Begin
      if Params.Values['quant_web'] <> '' then
      Begin
        if (Params.Values['quant_web'] <> fieldByName('day').asString) then
        Begin
          Edit;
          fieldByName('day').asString := Params.Values['quant_web'];
          post;
        End;
      End;
    End;
  end;

end;

procedure TMainmForm.dbg_format_web_chosen_dayDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TunimDBGridColumn; Attribs: TUniCellAttribs);
begin
  if (Column.FieldName = 'btn_day') then
    Column.Field.OnGetText :=createSpinnerFormatsChosenwebDay;

end;

procedure TMainmForm.dbg_format_web_chosen_pvwAjaxEvent(Sender: TComponent;
  EventName: string; Params: TUniStrings);
Var
  form : TDefinePageViews;
begin
  if EventName = 'web_chosen_pvw' then
  begin
    with TUnimDBGrid(Sender).DataSource.DataSet do
    Begin
      if Params.Values['param0'] = 'clicked' then
      Begin
        form := TDefinePageViews.Create(UniApplication);
        Form.Sld_Page_Views.Position := 1;
        Form.ShowModal(
          Procedure(Sender: TComponent; AResult:Integer)
          begin
            self.cds_formats_web.Edit;
            self.cds_formats_webpage_view.AsInteger := form.Sld_Page_Views.Position * 1000;
            self.cds_formats_web.Post;
            Form := nil;
          end
        );
      End;
    End;
  end;

end;

procedure TMainmForm.dbg_format_web_chosen_pvwDrawColumnCell(Sender: TObject;
  ACol, ARow: Integer; Column: TunimDBGridColumn; Attribs: TUniCellAttribs);
begin
  if (Column.FieldName = 'sld_page_view') then
    Column.Field.OnGetText :=createSpinnerFormatsChosenWebPvw;

end;

procedure TMainmForm.configs;
var
   ArquivoIni: TIniFile;
   sArqConfig,
   sDriver,
   sDriverBanco,
   sNomeBanco,
   sServer,
   sUsername,
   sPassword,
   sPublic,
   sPrivate,
   sUrl  : String;
begin
  try
    sDriver := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO,'Configuracao','DriverBanco');
    if sDriver = '' then begin
      sDriver := 'MySql';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, 'Configuracao', 'DriverBanco', sDriver);
    end;

    sServer := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'Server');
    if sServer = '' then begin
      sServer := 'localhost';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'Server', sServer);
    end;

    sNomeBanco := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'Database');
    if sNomeBanco = '' then begin
      sNomeBanco := 'gestao_setes';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'Database', sNomeBanco);
    end;

    sUsername := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'User_Name');
    if sUsername = '' then begin
      sUsername := 'gestao_setes';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'User_Name', sUsername);
    end;

    sPassword := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'Password');
    if sPassword = '' then begin
      sPassword := '12345';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'Password', sPassword);
    end;

    sDriverBanco := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'DriverID');
    if sDriverBanco = '' then begin
      sDriverBanco := 'MySql';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'DriverID', sDriverBanco);
    end;

    sPublic := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios','Publico');
    if sPublic = '' then begin
      sPublic := STRNG_CAMINHO_PUBLICO;
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios', 'Publico', sPublic);
    end;

    sPrivate := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios','Privado');
    if sPrivate = '' then begin
      sPrivate := STRNG_CAMINHO_PRIVADO;
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios', 'Privado', sPrivate);
    end;

    sUrl := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios','URL');
    if sUrl = '' then begin
      sUrl := STRNG_CAMINHO_URL;
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios', 'URL', sUrl);
    end;
    UMM.DB.Close;
    UMM.DB.Params.Clear;
    UMM.DB.Params.Add('Server='+sServer);
    UMM.DB.Params.Add('Database='+sNomeBanco);
    UMM.DB.Params.Add('User_Name='+sUsername);
    UMM.DB.Params.Add('Password='+sPassword);
    UMM.DB.Params.Add('DriverID=MySQL');
  finally
    ArquivoIni.Free;
  end;
end;

procedure TMainmForm.createbuttonFormatsImp(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text :=  concat(
              '<button class="btn" onclick="ajaxRequest(MainmForm.dbg_format_imp, ''format_imp'', [ ''param0=clicou'' ]);" ><i color:#008ECC; class="fa fa-newspaper-o"></i></button>'
    );
end;

procedure TMainmForm.createbuttonFormatsWeb(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text :=  concat(
              '<button class="btn" onclick="ajaxRequest(MainmForm.dbg_format_web, ''format_web'', [ ''param0=clicou'' ]);" ><i class="fa fa-newspaper-o" style="font-size:24px;color:#1892d1"></i></button>'
    );

end;

procedure TMainmForm.createSpinnerFormatsChosenImp(Sender: TField;
  var Text: string; DisplayText: Boolean);
var
  Lc_I : String;
  Lc_OnClick_1 : String;
  Lc_OnClick_2 : String;
  Lc_OnClick_3 : String;
begin
  Lc_I := cds_formats_impid.AsString;
  Lc_OnClick_1 := concat('processQtde(quant_imp',Lc_I,'.id,-1)');
  Lc_OnClick_2 := concat('processQtde(quant_imp',Lc_I,'.id,1)');
  Lc_OnClick_3 := concat('ajaxRequest(MainmForm.dbg_format_imp_chosen,''format_imp_chosen'',[''quant_imp=''+document.getElementById(''quant_imp',Lc_I,''').value])');


  Text :=  concat(
    '<div style="float: left; class="row"> ',
    '<button type="button" id="menos_imp',Lc_I ,'" onclick="',Lc_OnClick_1,',',Lc_OnClick_3,'"><i style="font-size:24px;color:#008ECC" class="fa">&#xf056;</i></button> ',
    '<input  type="Text"   id="quant_imp',Lc_I ,'" size="3" value="1" maxlength="5" />',
    '<button type="button" id="mais_imp',Lc_I ,'" onclick="',Lc_OnClick_2,',',Lc_OnClick_3,'"><i style="font-size:24px;color:#008ECC" class="fa">&#xf055;</i></button> ',
    '</div>'
    );

end;

procedure TMainmForm.createSpinnerFormatsChosenWebDay(Sender: TField;
  var Text: string; DisplayText: Boolean);
var
  Lc_I : String;
  Lc_OnClick_1 : String;
  Lc_OnClick_2 : String;
  Lc_OnClick_3 : String;
begin
  Lc_I := cds_formats_webid.AsString;
  Lc_OnClick_1 := concat('processQtde(quant_web',Lc_I,'.id,-1)');
  Lc_OnClick_2 := concat('processQtde(quant_web',Lc_I,'.id,1)');
  Lc_OnClick_3 := concat('ajaxRequest(MainmForm.dbg_format_web_chosen_day,''web_chosen_day'',[''quant_web=''+document.getElementById(''quant_web',Lc_I,''').value])');


  Text :=  concat(
    '<div style="float: left; class="row"> ',
    '<button type="button" id="menos_web',Lc_I ,'" onclick="',Lc_OnClick_1,',',Lc_OnClick_3,'"><i style="font-size:24px;color:#008ECC" class="fa">&#xf056;</i></button> ',
    '<input  type="Text"   id="quant_web',Lc_I ,'" size="3" value="1" maxlength="5" />',
    '<button type="button" id="mais_web',Lc_I ,'" onclick="',Lc_OnClick_2,',',Lc_OnClick_3,'"><i style="font-size:24px;color:#008ECC" class="fa">&#xf055;</i></button> ',
    '</div>'
    );
end;

procedure TMainmForm.createSpinnerFormatsChosenWebPvw(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text :=  concat(
        '<button class="btn" onclick="ajaxRequest(MainmForm.dbg_format_web_chosen_pvw, ''web_chosen_pvw'', [ ''param0=clicked'' ]);" ><i color:#008ECC; class="fa fa-cogs" style="font-size:24px;color:#1892d1"></i></button>'
  );
end;

procedure TMainmForm.createtoggleCity(Sender: TField; var Text: string;   DisplayText: Boolean);
Var
  Lc_Check : String;
begin
  Lc_Check := '';
  if cds_citychbxValue.AsString = 'S' then
    Lc_Check := 'checked';

  Text :=  concat(
              '<label class="switch">',
              '  <input id ="id_',cds_cityid.AsString,'" type="checkbox" ',Lc_Check,
              '  onchange="choiceCity(this.value,this.id)" ',
             '  onclick="ajaxRequest(MainmForm.Dbg_City,''City'',[''valchbx=''+document.getElementById(''id_',cds_cityid.AsString,''').value])">',
              '  <span class="slider round"></span>',
              '</label>'
    );
end;

procedure TMainmForm.Dbg_CityDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TunimDBGridColumn; Attribs: TUniCellAttribs);
begin
  if (Column.FieldName = 'checked') then
  Begin
    Column.Field.OnGetText :=createtoggleCity;
  End;
end;

procedure TMainmForm.createtoggleFormatsImp(Sender: TField; var Text: string;
  DisplayText: Boolean);
Var
  Lc_Check : String;
begin
  Lc_Check := '';
  if cds_formats_impchbxValue.AsString = 'S' then
    Lc_Check := 'checked';
  Text :=  concat(
              '<label class="switch">',
              '  <input id ="id_',cds_formats_impid.AsString,'" type="checkbox" ',Lc_Check,
              '  onchange="choiceFormats(this.value,this.id)" ',
             '  onclick="ajaxRequest(MainmForm.dbg_format_imp,''format_imp'',[''valchbx=''+document.getElementById(''id_',cds_formats_impid.AsString,''').value])">',
              '  <span class="slider round"></span>',
              '</label>'
    );

end;

procedure TMainmForm.createtoggleFormatsWeb(Sender: TField; var Text: string;
  DisplayText: Boolean);
Var
  Lc_Check : String;
begin
  Lc_Check := '';
  if cds_formats_webchbxValue.AsString = 'S' then
    Lc_Check := 'checked';

  Text :=  concat(
              '<label class="switch">',
              '  <input id ="id_',cds_formats_webid.AsString,'" type="checkbox" ',Lc_Check,
              '  onchange="choiceFormats(this.value,this.id)" ',
             '  onclick="ajaxRequest(MainmForm.dbg_format_web,''format_web'',[''valchbx=''+document.getElementById(''id_',cds_formats_webid.AsString,''').value])">',
              '  <span class="slider round"></span>',
              '</label>'
    );

end;

procedure TMainmForm.Dbg_CityAjaxEvent(Sender: TComponent; EventName: string;
  Params: TUniStrings);
begin
  if EventName = 'City' then
  begin
    with TUnimDBGrid(Sender).DataSource.DataSet do
    Begin
      if Params.Values['valchbx'] <> '' then
      Begin
        if (Params.Values['valchbx'] <> fieldByName('chbxValue').asString) then
        Begin
          Edit;
          if fieldByName('chbxValue').asString = 'N' then
            fieldByName('chbxValue').asString := 'S'
          else
            fieldByName('chbxValue').asString := 'N';
          post;
        End;
      End;
    End;
  end;

end;

procedure TMainmForm.Dbg_CityClickHold(Sender: TObject);
begin
  cds_city.Edit;
  if cds_city.FieldByName('checked').asString = 'N' then
    cds_city.FieldByName('checked').asString := 'S'
  else
    cds_city.FieldByName('checked').asString := 'N';
  cds_city.post;

  if cds_city.FieldByName('checked').asString = 'N' then
    ShowMessage('Marcado')
  else
    ShowMessage('Desmarcado');

end;

procedure TMainmForm.btn_8_finalClick(Sender: TObject);
Var
  LcPar: TPrmRepBudgAdvertise;
  LcReport : TReportCM;
  LcJSon : string;
begin
  try
    Self.showMask('Aguarde Processamento');
    UniSession.Synchronize();
    LcPar := TPrmRepBudgAdvertise.Create;
    LcPar.Estabelecimento := UMM.GInstitution.registro.Codigo;
    LcPar.Usuario := UMM.GInstitution.User.Registro.codigo;
    LcPar.Resultado := false;
    LcPar.Codigo :=  UMM.Advertise.Advertise.Registro.Codigo;
    LcPar.URL := '';//'http://www.gestaowebsetes.com.br/institution/07742094000113/2/pedidocompra.pdf';
    LcPar.Publico := USM.FilesFolderURL;
    LcJSon := TJson.ObjectToJsonString(LcPar);
    LcReport := TReportCM.Create(nil);
    LcJSon := LcReport.SMMediaClient.GetCotacaoOnline(LcJSon);
    UniSession.Synchronize;
    LcPar := TJson.JsonToObject<TPrmRepBudgAdvertise>(LcJson);
    if LcPar.Resultado then
    begin
      //UniSession.SendFile(LcPar.Publico); - Aqui faz o download, mas deve mudar para pasta publica
      pdf_doc.PdfURL := concat(USM.FilesFolderURL, LcPar.Arquivo);
      if Length(trim(E_email.Text))>0 then
      Begin
        UMM.Advertise.Advertise.Registro.email:= E_email.Text;
        UMM.Advertise.Advertise.update;
        EnviaEmail(E_email.Text,concat(LcPar.Publico));
      End;
    end
    else
    Begin
      MensageAlert(['A T E N Ç Ã O!.',
                   '',
                      'Erro ao Gerar Relatorio.',
                      LcPar.url]);
    End;
  finally
    self.HideMask;
    lcPar.disposeOf;
    LcReport.disposeOf;
    ResetHtmlMessage;
    tab_main.ActivePage := tbs_10;
  end;

end;

procedure TMainmForm.btn_8_nextClick(Sender: TObject);
begin
  if ValidateFormatWebChosenPvw then
  Begin
    tab_main.ActivePageIndex := 0;
    StepMessage;
  End;
end;

procedure TMainmForm.btn_8_priorClick(Sender: TObject);
begin
  UMM.Advertise.passo := UMM.Advertise.passo - 1;
  cds_formats_web.Filtered := False;
  tab_main.ActivePageIndex := UMM.Advertise.passo;

end;

procedure TMainmForm.SetCssButton(T: TComponent);
Var
  I,J:Integer;
begin
  with T do Begin
    for I := 0 to ((ComponentCount)-1) do
    begin
      if (Components[I].ClassName = 'TUnimButton') then
        UniSession.AddJS('$(''#'+TUnimButton(Components[I]).JSId+''').addClass(''button'')');

    end;
  End;
end;

procedure TMainmForm.UnimFormCreate(Sender: TObject);
begin
  InitVariable;
end;

procedure TMainmForm.UnimFormReady(Sender: TObject);
begin

  Dbg_City.JSInterface.JSConfig('width', ['70%'], Dbg_City.Columns[0].JSColumn);
  Dbg_City.JSInterface.JSConfig('width', ['30%'], Dbg_City.Columns[1].JSColumn);

  dbg_format_imp.JSInterface.JSConfig('width', ['60%'], dbg_format_imp.Columns[0].JSColumn);
  dbg_format_imp.JSInterface.JSConfig('width', ['20%'], dbg_format_imp.Columns[1].JSColumn);
  dbg_format_imp.JSInterface.JSConfig('width', ['20%'], dbg_format_imp.Columns[2].JSColumn);

//  pnl_Tittle_Formats_chosen_imp_1.JSInterface.JSConfig('width', ['60%'], pnl_Tittle_Formats_chosen_imp_1.JSName);
//  pnl_Tittle_Formats_chosen_imp_2.JSInterface.JSConfig('width', ['40%'], pnl_Tittle_Formats_chosen_imp_2.JSName);

  dbg_format_imp_chosen.JSInterface.JSConfig('width', ['60%'], dbg_format_imp_chosen.Columns[0].JSColumn);
  dbg_format_imp_chosen.JSInterface.JSConfig('width', ['40%'], dbg_format_imp_chosen.Columns[1].JSColumn);

  dbg_format_web.JSInterface.JSConfig('width', ['60%'], dbg_format_web.Columns[0].JSColumn);
  dbg_format_web.JSInterface.JSConfig('width', ['20%'], dbg_format_web.Columns[1].JSColumn);
  dbg_format_web.JSInterface.JSConfig('width', ['20%'], dbg_format_web.Columns[2].JSColumn);

  dbg_format_web_chosen_day.JSInterface.JSConfig('width', ['60%'], dbg_format_web_chosen_day.Columns[0].JSColumn);
  dbg_format_web_chosen_day.JSInterface.JSConfig('width', ['40%'], dbg_format_web_chosen_day.Columns[1].JSColumn);

  dbg_format_web_chosen_pvw.JSInterface.JSConfig('width', ['50%'], dbg_format_web_chosen_pvw.Columns[0].JSColumn);
  dbg_format_web_chosen_pvw.JSInterface.JSConfig('width', ['25%'], dbg_format_web_chosen_pvw.Columns[1].JSColumn);
  dbg_format_web_chosen_pvw.JSInterface.JSConfig('width', ['25%'], dbg_format_web_chosen_pvw.Columns[2].JSColumn);
end;

function TMainmForm.ValidateCitiesChosen: Boolean;
Var
  I:Integer;
  Lc_Cities : String;
  Lc_Resultado : boolean;
begin
  Lc_Resultado := True;

  Lc_Cities := '';
  cds_city.First;
  while not cds_city.Eof do
  Begin
    if cds_citychbxValue.AsString = 'S' then
    Begin
      if Lc_Cities = '' then
        Lc_Cities := cds_cityid.AsString
      else
        Lc_Cities := concat(Lc_Cities,',',cds_cityid.AsString);
    End;
    cds_city.Next;
  End;
  if Lc_Cities = '' then
  begin
    MensageAlert(['ATENÇÃO!!',
                  'Escolha pelo menos uma cidade ',
                  'para continuar.']);
    Result := False;
    exit;
  End;

end;

function TMainmForm.ValidateFormatImpInsertionChosen: Boolean;
Var
  I:Integer;
  Lc_Insertion : Integer;
begin
  Result := True;
  Lc_Insertion := 0;
  cds_formats_imp.First;
  while not cds_formats_imp.Eof do
  Begin
    Lc_Insertion := cds_formats_impinsertion.AsInteger;
    cds_formats_imp.Next;
  End;
  if ( Lc_Insertion = 0 ) then
  begin
    MensageAlert(['ATENÇÃO!!',
                  'Número de Inserções deve ser ',
                  'maior que zero.']);
    Result := False;
    exit;
  End;

end;

function TMainmForm.ValidateFormatsImpChosen: Boolean;
Var
  I:Integer;
  Lc_Formats : String;
begin
  Result := True;
  Lc_Formats := '';
  cds_formats_imp.First;
  while not cds_formats_imp.Eof do
  Begin
    if cds_formats_impchbxValue.AsString = 'S' then
    Begin
      if Lc_Formats = '' then
        Lc_Formats := cds_formats_impid.AsString
      else
        Lc_Formats := concat(Lc_Formats,',',cds_formats_impid.AsString);
    End;
    cds_formats_imp.Next;
  End;
  if Lc_Formats = '' then
  begin
    MensageAlert(['ATENÇÃO!!',
                  'Escolha pelo menos um formato ',
                  'para continuar.']);
    Result := False;
    exit;
  End;
end;

function TMainmForm.ValidateFormatsWebChosen: Boolean;
Var
  I:Integer;
  Lc_Formats : String;
begin
  Result := True;
  Lc_Formats := '';
  cds_formats_web.First;
  while not cds_formats_web.Eof do
  Begin
    if cds_formats_webchbxValue.AsString = 'S' then
    Begin
      if Lc_Formats = '' then
        Lc_Formats := cds_formats_webid.AsString
      else
        Lc_Formats := concat(Lc_Formats,',',cds_formats_webid.AsString);
    End;
    cds_formats_web.Next;
  End;
  if Lc_Formats = '' then
  begin
    MensageAlert(['ATENÇÃO!!',
                  'Escolha pelo menos um formato ',
                  'para continuar.']);
    Result := False;
    exit;
  End;


end;

function TMainmForm.ValidateFormatWebChosenDay: Boolean;
Var
  I:Integer;
  Lc_Day : Integer;
begin
  Result := True;
  Lc_Day := 0;
  cds_formats_web.First;
  while not cds_formats_web.Eof do
  Begin
    Lc_Day := Lc_Day + cds_formats_webday.AsInteger;
    cds_formats_web.Next;
  End;
  if ( Lc_Day = 0 ) then
  begin
    MensageAlert(['ATENÇÃO!!',
                  'O número de dias deve ',
                  'ser maior que zero.']);
    Result := False;
    exit;
  End;
end;

function TMainmForm.ValidateFormatWebChosenPvw: Boolean;
Var
  I:Integer;
  Lc_Pvw : Integer;
begin
  Result := True;
  Lc_Pvw := 0;
  cds_formats_web.First;
  while not cds_formats_web.Eof do
  Begin
    Lc_Pvw := Lc_Pvw + cds_formats_webpage_view.AsInteger;
    cds_formats_web.Next;
  End;
  if ( Lc_pvw = 0 ) then
  begin
    MensageAlert(['ATENÇÃO!!',
                  'O número de Pageviews deve ',
                  'ser maior que 1.000']);
    Result := False;
    exit;
  End;

end;

function TMainmForm.validateimageImp: Boolean;
begin
  Result := True;
  if ( cds_formats_imppath_file.AsString = '' ) then
  BEgin
    MensageAlert(['ATENÇÃO!!',
                  'Não há imagem para visualizar ']);
    Result := False;
    exit;
  End;
end;

function TMainmForm.validateimageweb:Boolean;
begin
  Result := True;
  if ( cds_formats_webpath_file.AsString = '' ) then
  BEgin
    MensageAlert(['ATENÇÃO!!',
                  'Não há imagem para visualizar ']);
    Result := False;
    exit;
  End;
end;

initialization
  RegisterAppFormClass(TMainmForm);

end.
