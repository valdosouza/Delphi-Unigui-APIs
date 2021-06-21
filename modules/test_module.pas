unit test_module;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_module, uniGUIBaseClasses,
  uniGUIClasses, uniImageList, uniScrollBox, uniPanel,
  tas_financial_bills_general, uniButton, uniBitBtn, uniGUIApplication,
  sea_clin_module, ControllerBroacasterHasCirculation, MainModule, ControllerEntityFiscal,
  ControllerCity, ControllerRestMenu,ControllerStock;

type
  TTestModule = class(TBaseModule)
    FinanceiroGeral: TUniBitBtn;
    UniBitBtn6: TUniBitBtn;
    UniBitBtn1: TUniBitBtn;
    UniBitBtn2: TUniBitBtn;
    UniBitBtn3: TUniBitBtn;
    UniBitBtn4: TUniBitBtn;
    UniBitBtn5: TUniBitBtn;
    UniBitBtn7: TUniBitBtn;
    UniBitBtn8: TUniBitBtn;
    UniBitBtn9: TUniBitBtn;
    UniBitBtn10: TUniBitBtn;
    UniBitBtn11: TUniBitBtn;
    UniBitBtn12: TUniBitBtn;
    UniBitBtn13: TUniBitBtn;
    procedure UniFrameCreate(Sender: TObject);
    procedure FinanceiroGeralClick(Sender: TObject);
    procedure UniBitBtn6Click(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniBitBtn2Click(Sender: TObject);
    procedure UniBitBtn3Click(Sender: TObject);
    procedure UniBitBtn4Click(Sender: TObject);
    procedure UniBitBtn5Click(Sender: TObject);
    procedure UniBitBtn7Click(Sender: TObject);
    procedure UniBitBtn8Click(Sender: TObject);
    procedure UniBitBtn9Click(Sender: TObject);
    procedure UniBitBtn10Click(Sender: TObject);
    procedure UniBitBtn11Click(Sender: TObject);
    procedure UniBitBtn12Click(Sender: TObject);
    procedure UniBitBtn13Click(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure InitVariable;Override;
  public
    { Public declarations }
  end;

var
  TestModule: TTestModule;

implementation

{$R *.dfm}

uses openForms,UnFunctions;

{ TTestModule }

procedure TTestModule.FinanceiroGeralClick(Sender: TObject);
Var
  Form : TTasFinancialBillsGeneral;
Begin
  Form := TTasFinancialBillsGeneral.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
end;

procedure TTestModule.InitVariable;
begin
  Pnl_Cadastros.Align := alNone;
  Pnl_Tarefas.Align := alNone;
  Pnl_Relatorios.Align := alNone;
  ModuloID := -1;
end;

procedure TTestModule.UniBitBtn10Click(Sender: TObject);
begin
  inherited;
  openSeaRestMenuBeverage(nil);
end;

procedure TTestModule.UniBitBtn11Click(Sender: TObject);
Var
  LcRestMenu : TControllerRestMenu;
  I :Integer;
  Lc_Repo : String;
  LcUrl : String;
  LcNewFile : String;
begin
  try
    UMM.GInstitution.getRepository(True,'tb_rest_menu');
    LcUrl := UMM.GInstitution.URL;
    LcRestMenu := TControllerRestMenu.Create(nil);
    LcRestMenu.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    LcRestMenu.Registro.Grupo := 7;
    LcRestMenu.getlist;
    for I := 0 to LcRestMenu.Lista.Count - 1 do
    Begin
      LcRestMenu.ClonarObj(LcRestMenu.Lista[I],LcRestMenu.Registro);
      LcNewFile := concat(LcRestMenu.Registro.Estabelecimento.ToString,'_',
                          LcRestMenu.Registro.Codigo.ToString,'.jpg');
      LcRestMenu.Registro.linkUrl := concat(LcUrl,LcNewFile);
      LcRestMenu.UpdateImage;
    End;

  finally
    LcRestMenu.DisposeOf;
  end;

end;

procedure TTestModule.UniBitBtn12Click(Sender: TObject);
Var
  LcRestMenu : TControllerRestMenu;
  LcStock : TControllerStock;
  I,J :Integer;
  Lc_Repo : String;
  LcUrl : String;
  LcNewFile : String;
  Lc_Menu : String;
begin
  try
    UMM.GInstitution.getRepository(True,'tb_stock');
    LcUrl := UMM.GInstitution.URL;
    LcStock := TControllerStock.Create(nil);


    LcRestMenu := TControllerRestMenu.Create(nil);
    LcRestMenu.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    LcRestMenu.Registro.Grupo := 3;
    LcRestMenu.getlist;
    for I := 0 to LcRestMenu.Lista.Count - 1 do
    Begin
      try
        LcStock.Parametro.Estoque.Estabelecimento := UMM.GInstitution.Registro.Codigo;
        Lc_Menu := LcRestMenu.Lista[I].Description;
        LcStock.getDeliverylist( Lc_Menu );
        for J := 0 to LcStock.Lista.Count - 1 do
        Begin
          LcStock.ClonarObj(LcStock.Lista[J],LcStock.Registro);
          LcNewFile := concat(LcStock.Registro.Estabelecimento.ToString,'_',
                              LcStock.Registro.Mercadoria.ToString,'_',
                              LcStock.Registro.Medida.ToString,'.jpg');
          LcStock.Registro.linkUrl := concat(LcUrl,LcNewFile);
          LcStock.update;
        End;
      Except
        ShowMessage(Lc_Menu);

      end;
    end;

  finally
    LcRestMenu.DisposeOf;
    LcStock.DisposeOf;
  end;
end;

procedure TTestModule.UniBitBtn13Click(Sender: TObject);
begin
  inherited;
  openCadDEliveryRange(nil);
end;

procedure TTestModule.UniBitBtn1Click(Sender: TObject);
begin
  inherited;
  OpenLSeaLogOperation (nil);
end;

procedure TTestModule.UniBitBtn2Click(Sender: TObject);
begin
  inherited;
  openCadMedPriceListJR(16146);
end;

procedure TTestModule.UniBitBtn3Click(Sender: TObject);
Var
  Lc_Copy : TControllerBroacasterHasCirculation;
  Lc_Fiscal: TControllerEntityFiscal;
  Lc_City : TControllerCity;
  LcID: Integer;
begin
  try
    Lc_Copy := TControllerBroacasterHasCirculation.create(nil);
    Lc_Fiscal:= TControllerEntityFiscal.create(nil);
    Lc_City := TControllerCity.create(nil);
    WITH UMM.Qr_Triagem DO
    begin
      active := True;
      First;
      while not EOF do
      Begin
        LcID := Lc_Fiscal.Juridica.getIDbyCNPJ(unMaskField(FieldByname('TB003_CNPJ').AsString));
        if LcID > 0 then
        Begin
          Lc_Copy.Registro.Veiculo := LcID;
          Lc_City.Registro.IBGE := FieldByname('TB002_CODIGO_IBGE').AsString;
          Lc_City.getByIBGEWithoutLastNumber;
          if Lc_City.exist then
          Begin
            Lc_City.Registro.IBGE         := FieldByname('TB002_CODIGO_IBGE').AsString;
            Lc_City.Registro.Populacao    := UMM.Qr_TriagemTB002_POPULACAO.AsInteger;
            Lc_City.Registro.Densidade    := UMM.Qr_TriagemTB002_DENSIDADE_DEMO.AsFloat;
            Lc_City.Registro.Area         := UMM.Qr_TriagemTB002_AREA.AsFloat;
            Lc_City.update;
            Lc_Copy.Registro.Cidade := Lc_City.Registro.Codigo
          End
          else
          Begin
            Lc_City.Registro.Codigo       := 0;
            Lc_City.Registro.CodigoEstado := 41;
            Lc_City.Registro.IBGE         := FieldByname('TB002_CODIGO_IBGE').AsString;
            Lc_City.Registro.Nome         := UMM.Qr_TriagemTB002_DESCRICAO.AsString;
            Lc_City.Registro.AliquotaISS  := 0;
            Lc_City.Registro.Populacao    := UMM.Qr_TriagemTB002_POPULACAO.AsInteger;
            Lc_City.Registro.Densidade    := UMM.Qr_TriagemTB002_DENSIDADE_DEMO.AsFloat;
            Lc_City.Registro.Area         := UMM.Qr_TriagemTB002_AREA.AsFloat;
            Lc_City.insert;
            Lc_Copy.Registro.Cidade       := Lc_City.Registro.Codigo;
          End;
          Lc_Copy.Registro.Numero := FieldByname('tb012_TIRAGEM').AsInteger;
          Lc_Copy.insert;
        end;
        Next;
      End;
    End;
  finally
    Lc_Copy.disposeof;
  end;
end;

procedure TTestModule.UniBitBtn4Click(Sender: TObject);
begin
  inherited;
  openCadMedPriceListON(16146);
end;

procedure TTestModule.UniBitBtn5Click(Sender: TObject);
begin
  inherited;
  OpenSeaOrderBudgAdvertise(nil);
end;

procedure TTestModule.UniBitBtn6Click(Sender: TObject);
begin
  inherited;
  openSeaBank(nil)
end;

procedure TTestModule.UniBitBtn7Click(Sender: TObject);
begin
  inherited;
  OpenTasOrderBudgAdvertise(nil);
end;

procedure TTestModule.UniBitBtn8Click(Sender: TObject);
begin
  inherited;
OpenTasWhatsAppWEb;
end;

procedure TTestModule.UniBitBtn9Click(Sender: TObject);
begin
  inherited;
  openSeaRestMenuPizza(nil);
end;

procedure TTestModule.UniFrameCreate(Sender: TObject);
begin
  InitVariable;
end;

end.
