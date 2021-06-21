unit print_companys;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_impressao, uniGroupBox, uniLabel,
  uniGUIClasses, uniMultiItem, uniListBox, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniPanel, fm_state, fm_city,uReportCM, MainModule,
  Main,REST.Json, unMessages, prm_print_companys, openReports, Vcl.Menus,
  uniMainMenu, Data.DB, Datasnap.DBClient;

type
  TPrintCompany = class(TBaseImpressao)
    ctn_state: TUniContainerPanel;
    ctn_city: TUniContainerPanel;
    procedure FormatScreen;Override;
    procedure StateExit(Sender: TObject);
  private
    procedure prtCustomer;
    procedure prtProvider;
    procedure prtCarrier;
  protected

    FrState : TFmState;
    FrCity : TFmCity;
    procedure ShowState;
    procedure ShowCity;
    function validadePrint:Boolean;Override;
    procedure setPrint;Override;
  public
    { Public declarations }
  end;

var
  PrintCompany: TPrintCompany;

implementation

{$R *.dfm}

{ TPrintCompany }

procedure TPrintCompany.FormatScreen;
begin
  ShowState;
  ShowCity;
end;

procedure TPrintCompany.prtCarrier;
Var
  LcPar: TPrmPrintCompanys;
  LcJSon : String;
  LcCM : TReportCM;
begin
  LcPar := TPrmPrintCompanys.Create;
  LcPar.Estabelecimento := GbInstitution;
  LcPar.Usuario := GbUser;
  LcPar.Resultado := false;
  LcPar.URL := '';//'http://www.gestaowebsetes.com.br/institution/07742094000113/2/pedidocompra.pdf';
  MainForm.Hold.BringToFront;
  MainForm.Hold.Visible := True;
  MainForm.Hold.MaskShow('Aguarde Processamento do relatório...',
      procedure(const Mask:Boolean)
      begin
        if Mask then
        begin
          LcJSon := TJson.ObjectToJsonString(LcPar);
          LcCM := TReportCM.Create(Self);
          LcJSon := LcCM.SMGeneralClient.GetCarrrierList(LcJSon);
          LcPar := TJson.JsonToObject<TPrmPrintCompanys>(LcJson);
          if LcPar.Resultado then
          begin
            openReportViewer('Cadastro Transportadora',LcPar.url);
          end
          else
          Begin
            MensageAlert(['A T E N Ç Ã O!.',
                         '',
                            'Campo Nome não informado.',
                            'Preencha o campo para continuar']);
          End;
          self.finishMask;
          FreeAndNil(lcPar);
          FreeAndNil(LcCM);
        end;
      end
  );

end;

procedure TPrintCompany.prtCustomer;
Var
  LcPar: TPrmPrintCompanys;
  LcJSon : String;
  LcCM : TReportCM;
begin
  LcPar := TPrmPrintCompanys.Create;
  LcPar.Estabelecimento := GbInstitution;
  LcPar.Usuario := GbUser;
  LcPar.Resultado := false;
  LcPar.URL := '';//'http://www.gestaowebsetes.com.br/institution/07742094000113/2/pedidocompra.pdf';
  MainForm.Hold.BringToFront;
  MainForm.Hold.Visible := True;
  MainForm.Hold.MaskShow('Aguarde Processamento do relatório...',
      procedure(const Mask:Boolean)
      begin
        if Mask then
        begin
          LcJSon := TJson.ObjectToJsonString(LcPar);
          LcCM := TReportCM.Create(Self);
          LcJSon := LcCM.SMGeneralClient.GetCustomerList(LcJSon);
          LcPar := TJson.JsonToObject<TPrmPrintCompanys>(LcJson);
          if LcPar.Resultado then
          begin
            openReportViewer('Cadastro Cliente',LcPar.url);
          end
          else
          Begin
            MensageAlert(['A T E N Ç Ã O!.',
                         '',
                            'Campo Nome não informado.',
                            'Preencha o campo para continuar']);
          End;
          self.finishMask;
          FreeAndNil(lcPar);
          FreeAndNil(LcCM);
        end;
      end
  );
end;

procedure TPrintCompany.prtProvider;
Var
  LcPar: TPrmPrintCompanys;
  LcJSon : String;
  LcCM : TReportCM;
begin
  LcPar := TPrmPrintCompanys.Create;
  LcPar.Estabelecimento := GbInstitution;
  LcPar.Usuario := GbUser;
  LcPar.Resultado := false;
  LcPar.URL := '';//'http://www.gestaowebsetes.com.br/institution/07742094000113/2/pedidocompra.pdf';
  MainForm.Hold.BringToFront;
  MainForm.Hold.Visible := True;
  MainForm.Hold.MaskShow('Aguarde Processamento do relatório...',
      procedure(const Mask:Boolean)
      begin
        if Mask then
        begin
          LcJSon := TJson.ObjectToJsonString(LcPar);
          LcCM := TReportCM.Create(Self);
          LcJSon := LcCM.SMGeneralClient.GetProvider(LcJSon);
          LcPar := TJson.JsonToObject<TPrmPrintCompanys>(LcJson);
          if LcPar.Resultado then
          begin
            openReportViewer('Cadastro Fornecedor',LcPar.url);
          end
          else
          Begin
            MensageAlert(['A T E N Ç Ã O!.',
                         '',
                            'Campo Nome não informado.',
                            'Preencha o campo para continuar']);
          End;
          self.finishMask;
          FreeAndNil(lcPar);
          FreeAndNil(LcCM);
        end;
      end
  );
end;

procedure TPrintCompany.setPrint;
begin
  case Lbx_reports.ItemIndex of
    0:prtCustomer;
    1:prtProvider;
    2:prtCarrier;
  end;

end;

procedure TPrintCompany.ShowCity;
begin
  FrCity := TFmCity.Create(Self);
  FrCity.Parent := ctn_City;
  FrCity.Align := alClient;
  FrCity.Show;

end;

procedure TPrintCompany.ShowState;
begin
  FrState := TFmState.Create(Self);
  FrState.Parent := ctn_State;
  FrState.Align := alClient;
  FrState.Listar(1058);
  FrState.DBLCB_Lista.OnExit := StateExit;
  FrState.Show;
end;

procedure TPrintCompany.StateExit(Sender: TObject);
begin
  with FrState do
  Begin
    if (DBLCB_Lista.Text <> '') and
       (DBLCB_Lista.KeyValue <> null) then
      FrCity.Listar(DBLCB_Lista.KeyValue)
    else
      FrState.Listar(41);
  End;
end;

function TPrintCompany.validadePrint: Boolean;
begin
  Result := True;
end;

end.
