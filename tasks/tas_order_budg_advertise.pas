unit tas_order_budg_advertise;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_form, Vcl.Menus, uniMainMenu,
  Data.DB, Datasnap.DBClient, uniDateTimePicker, uniGUIClasses, uniEdit,
  uniGUIBaseClasses, uniPanel, uniButton, uniBitBtn, uniSpeedButton,prm_rep_budg_advertise,
  uniBasicGrid, uniDBGrid, uniPageControl, FireDAC.Comp.Client, ControllerBudgAdvertiseImp,
  MainModule, Datasnap.Provider, ControllerBudgAdvertise,uReportCM, REST.Json, openReports,
  ControllerBudgAdvertiseWeb;

type
  TTasOrderBudgAdvertise = class(TBaseForm)
    pnl_param_row_4_1: TUniPanel;
    E_Number: TUniEdit;
    E_Email: TUniEdit;
    Pg_Principal: TUniPageControl;
    tbs_imp: TUniTabSheet;
    dbg_Jr: TUniDBGrid;
    Sb_Insert_Parts_Imp: TUniSpeedButton;
    Sb_Change_Parts_imp: TUniSpeedButton;
    Sb_Delet_Parts_imp: TUniSpeedButton;
    tbs_web: TUniTabSheet;
    dbg_rt: TUniDBGrid;
    Sb_Insert_Parts_web: TUniSpeedButton;
    Sb_Change_Parts_web: TUniSpeedButton;
    Sb_Delet_Parts_web: TUniSpeedButton;
    pnl_botao: TUniPanel;
    Sb_Close: TUniSpeedButton;
    Sb_Print: TUniSpeedButton;
    cds_Imp: TClientDataSet;
    ds_Imp: TDataSource;
    cds_Impid: TIntegerField;
    cds_Impnumber: TIntegerField;
    cds_ImpCityID: TIntegerField;
    cds_Impname: TStringField;
    cds_ImpbroadcasterID: TIntegerField;
    cds_Impnick_trade: TStringField;
    cds_Impunit_value: TBCDField;
    cds_Impformats: TStringField;
    cds_Impmeasure: TStringField;
    cds_Impnr_columns: TIntegerField;
    cds_Impsize_columns: TIntegerField;
    cds_Imponline_price: TBCDField;
    cds_Impinsertion: TIntegerField;
    DSP: TDataSetProvider;
    DTP_Date: TUniDateTimePicker;
    cds_Impid_item: TIntegerField;
    cds_web: TClientDataSet;
    ds_web: TDataSource;
    cds_webid: TIntegerField;
    cds_webid_item: TIntegerField;
    cds_webnumber: TIntegerField;
    cds_webname: TStringField;
    cds_weblink: TStringField;
    cds_webformats: TStringField;
    cds_webdays: TIntegerField;
    cds_webpage_views: TIntegerField;
    cds_webunit_value: TBCDField;
    procedure Sb_CloseClick(Sender: TObject);
    procedure Sb_PrintClick(Sender: TObject);
    procedure Sb_Delet_Parts_impClick(Sender: TObject);
    procedure Sb_Delet_Parts_webClick(Sender: TObject);
  private
    { Private declarations }
    procedure SelectImp;
    procedure SelectWeb;
    function validatePrintOrder:Boolean;
    procedure printOrder;
    Procedure DeleteItemImp;
    Procedure DeleteItemWeb;


  protected
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure setImages;Override;
    procedure FormatScreen;Override;
    procedure ShowData;
    procedure ShowNoData;

  public
    { Public declarations }
    advertise : TControllerBudgAdvertise;
    AdvertiseImp:TControllerBudgAdvertiseImp;
    Advertiseweb:TControllerBudgAdvertiseWeb;
  end;

var
  TasOrderBudgAdvertise: TTasOrderBudgAdvertise;

implementation

{$R *.dfm}

uses unmessages, msg_form,UnFunctions;

{ TTasOrderBudgAdvertise }


procedure TTasOrderBudgAdvertise.DeleteItemWeb;
begin
  AdvertiseWeb.registro.Codigo          := cds_Webid_item.AsInteger;
  AdvertiseWeb.registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  AdvertiseWeb.registro.Anuncio         := cds_Webid.AsInteger;
  AdvertiseWeb.delete;
  //REtira do Grade
  cds_Web.Delete;

end;

procedure TTasOrderBudgAdvertise.FormatScreen;
begin
  inherited;
  Pg_Principal.ActivePage := tbs_imp;
end;

procedure TTasOrderBudgAdvertise.InitVariable;
begin
  inherited;
  AdvertiseImp := TControllerBudgAdvertiseImp.Create(Self);
  advertise := TControllerBudgAdvertise.Create(Self);
  AdvertiseWeb := TControllerBudgAdvertiseWeb.Create(Self);

end;

procedure TTasOrderBudgAdvertise.DeleteItemImp;
begin
  AdvertiseImp.registro.Codigo          := cds_Impid_item.AsInteger;
  AdvertiseImp.registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  AdvertiseImp.registro.Anuncio         := cds_Impid.AsInteger;
  AdvertiseImp.delete;
  //REtira do Grade
  cds_Imp.Delete;

end;

procedure TTasOrderBudgAdvertise.printOrder;
Var
  LcPar: TPrmRepBudgAdvertise;
  LcCM : TReportCM;
  LcJSon : string;
begin
  try
    Self.showMask('Aguarde Processamento');
    UniSession.Synchronize();
    LcPar := TPrmRepBudgAdvertise.Create;
    LcPar.Estabelecimento := UMM.GInstitution.registro.Codigo;
    LcPar.Usuario := UMM.GInstitution.User.Registro.codigo;
    LcPar.Resultado := false;
    LcPar.Codigo := advertise.Registro.Codigo;
    LcPar.URL := '';//'http://www.gestaowebsetes.com.br/institution/07742094000113/2/pedidocompra.pdf';
    LcPar.Local := 'standard';
    LcJSon := TJson.ObjectToJsonString(LcPar);
    LcCM := TReportCM.Create(nil);
    LcJSon := LcCM.SMMediaClient.GetCotacaoOnline(LcJSon);
    UniSession.Synchronize;
    LcPar := TJson.JsonToObject<TPrmRepBudgAdvertise>(LcJson);
    if LcPar.Resultado then
    begin
      openReportViewer('Cotação Online',LcPar.url);
      UniSession.Synchronize;
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
    LcCM.disposeOf;
  end;


end;

procedure TTasOrderBudgAdvertise.Sb_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TTasOrderBudgAdvertise.Sb_Delet_Parts_impClick(Sender: TObject);
begin
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja realmente excluir este registro?',
                'clique em SIM para confirmar.'],mpAlerta);
    FormMsg.ShowModal(
      Procedure(Sender: TComponent; AResult:Integer)
      begin
        if (Sender as TMsgForm).BotaoEscolhido > 0 then
        Begin
          DeleteItemImp;
        End;
      end
    );
end;

procedure TTasOrderBudgAdvertise.Sb_Delet_Parts_webClick(Sender: TObject);
begin
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja realmente excluir este registro?',
                'clique em SIM para confirmar.'],mpAlerta);
    FormMsg.ShowModal(
      Procedure(Sender: TComponent; AResult:Integer)
      begin
        if (Sender as TMsgForm).BotaoEscolhido > 0 then
        Begin
          DeleteItemWeb;
        End;
      end
    );

end;

procedure TTasOrderBudgAdvertise.Sb_PrintClick(Sender: TObject);
begin
  if validatePrintOrder then
    printOrder;
end;

procedure TTasOrderBudgAdvertise.SelectImp;
begin
  AdvertiseImp.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  AdvertiseImp.Registro.Codigo          := CodigoRegistro;
  AdvertiseImp.getIFList(cds_Imp,DSP);
end;

procedure TTasOrderBudgAdvertise.SelectWeb;
begin
  AdvertiseWeb.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  AdvertiseWeb.Registro.Codigo          := CodigoRegistro;
  AdvertiseWeb.getIFList(cds_Web,DSP);

end;

procedure TTasOrderBudgAdvertise.setImages;
begin
  inherited;
  buttonIcon(SB_Print,'print.bmp');
  buttonIcon(Sb_Close,'close.bmp');

  buttonIcon(Sb_Insert_Parts_imp,'mini_insert.bmp');
  buttonIcon(Sb_Change_Parts_imp,'mini_change.bmp');
  buttonIcon(Sb_Delet_Parts_imp,'mini_delete.bmp');
  buttonIcon(Sb_Insert_Parts_web,'mini_insert.bmp');
  buttonIcon(Sb_Change_Parts_web,'mini_change.bmp');
  buttonIcon(Sb_Delet_Parts_web,'mini_delete.bmp');

end;

procedure TTasOrderBudgAdvertise.SetVariable;
begin
  inherited;
  with advertise do
  Begin
    Ordem.Registro.Codigo := CodigoRegistro;
    Ordem.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    Ordem.getByKey;

    Registro.Codigo := CodigoRegistro;
    Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    getByKey;
  End;
  if ( CodigoRegistro > 0 ) then
    ShowData
  else
    ShowNoData;

end;

procedure TTasOrderBudgAdvertise.ShowData;
begin
  DTP_Date.DateTime := advertise.Ordem.Registro.Data;
  E_Number.Text := advertise.Registro.Numero.ToString;
  E_Email.Text := advertise.Registro.email;
  SelectImp;
  SelectWeb;
end;

procedure TTasOrderBudgAdvertise.ShowNoData;
begin
  DTP_Date.DateTime := Date;
  E_Number.Clear;
  E_Email.Clear;
end;

function TTasOrderBudgAdvertise.validatePrintOrder: Boolean;
begin
  Result := True;
//  cds_Imp.RecordCount = 0
end;

end.
