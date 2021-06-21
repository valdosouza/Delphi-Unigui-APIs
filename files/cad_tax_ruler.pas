unit cad_tax_ruler;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniLabel, uniMultiItem, uniComboBox, uniEdit, uniPageControl,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdTime, IdUnixTime,
  uniGroupBox, uniCheckBox, fm_deter_base_tax_icms, fm_deter_base_tax_icms_st, fm_discharge_icms,
  fm_observation, fm_cfop, fm_tax_icms_nr, fm_tax_icms_sn, ControllerTaxRuler,
  unmessages, msg_form, fm_tax_ipi, fm_tax_pis, fm_tax_cofins, fm_State,ControllerInstitution,
  UnFunctions, Data.DB, Datasnap.DBClient ;

type
  TCadTaxRuler = class(TBaseRegistry)
    Ctn_TaxIcmsNr: TUniContainerPanel;
    Ctn_TaxIcmsSn: TUniContainerPanel;
    UniContainerPanel1: TUniContainerPanel;
    L_NameCompany: TUniLabel;
    Cb_Origin: TUniComboBox;
    UniContainerPanel2: TUniContainerPanel;
    Ctn_DischargeIcms: TUniContainerPanel;
    Ctn_DeterBaseTaxIcms: TUniContainerPanel;
    Ctn_DeterBaseTaxIcmsST: TUniContainerPanel;
    UniLabel1: TUniLabel;
    E_Ali_ICMS: TUniEdit;
    E_Red_Aliq: TUniEdit;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    E_Red_Base: TUniEdit;
    pg_tax: TUniPageControl;
    tbs_Ipi: TUniTabSheet;
    UniPanel1: TUniPanel;
    E_aliqu_IPI: TUniEdit;
    UniLabel13: TUniLabel;
    Ctn_IPI: TUniContainerPanel;
    Tbs_pis: TUniTabSheet;
    UniPanel2: TUniPanel;
    Ctn_PIS: TUniContainerPanel;
    UniLabel15: TUniLabel;
    E_Aliq_PIS: TUniEdit;
    tbs_cofins: TUniTabSheet;
    UniPanel3: TUniPanel;
    E_Aliq_conf: TUniEdit;
    Ctn_Cofins: TUniContainerPanel;
    UniLabel14: TUniLabel;
    tbs_outros: TUniTabSheet;
    UniPanel4: TUniPanel;
    UniLabel7: TUniLabel;
    E_Alq_IRPJ: TUniEdit;
    UniLabel8: TUniLabel;
    E_Alq_CSLL: TUniEdit;
    UniLabel9: TUniLabel;
    E_Alq_SIS: TUniEdit;
    UniLabel10: TUniLabel;
    E_Alq_II: TUniEdit;
    l_aliqui_afrmm: TUniLabel;
    E_Alq_ADRMM: TUniEdit;
    UniGroupBox1: TUniGroupBox;
    chbx_Produto_com_ST: TUniCheckBox;
    chbx_Operac: TUniCheckBox;
    chbx_crt: TUniCheckBox;
    chbx_Dif: TUniCheckBox;
    chbx_Sub_Tri: TUniCheckBox;
    chbx_Direcao_Entrada: TUniCheckBox;
    Cb_trans: TUniComboBox;
    UniLabel4: TUniLabel;
    UniLabel6: TUniLabel;
    E_Cod_Class: TUniEdit;
    Ctn_State: TUniContainerPanel;
    chbx_Prop: TUniCheckBox;
    Ctn_Observation: TUniContainerPanel;
    Ctn_CFOP: TUniContainerPanel;

    procedure InitVariable;Override;
    procedure FormatScreen;Override;
    procedure ShowData;Override;
    procedure ShowNoData;Override;
    procedure ClearAllFields;Override;
    procedure EditionControl;Override;
    function  ValidaInsert():boolean;Override;
    procedure Insert;Override;
    function  ValidateSave: boolean;Override;
    procedure Save;Override;
    procedure Delete;Override;
    procedure setVariable; override;
    function  ValidateDelete: boolean;

    procedure ShowTaxIcmsNr;
    procedure ShowTaxIcmsSn;
    Procedure ShowDeterBaseTaxIcms;
    Procedure ShowDeterBaseTaxIcmsST;
    Procedure ShowDischargeIcms;
    Procedure ShowObservation;
    Procedure ShowCFOP;
    Procedure ShowPIS;
    Procedure ShowIPI;
    Procedure ShowCofins;
    procedure ShowState;
    procedure chbx_Direcao_EntradaClick(Sender: TObject);

  private
    Estabelecimento : TControllerInstitution;
    procedure FiltrarCFOP(Sender: TObject);

    { Private declarations }
  public
    { Public declarations }
    FrState               : TFmState;
    FrTaxIcmsNr           : TFmTaxIcmsNr;
    FrTaxIcmsSn           : TFmTaxIcmsSn;
    FrDeterBaseTaxIcms    : TFmDeterBaseTaxIcms;
    FrDeterBaseTaxIcmsST  : TfmDeterBaseTaxIcmsST;
    FrDischargeIcms       : TfmDischargeIcms;
    FrObservation         : TfmObservation;
    FrCFOP                : TfmCFOP;
    FrIPI                 : TfmTaxIPI;
    FrPIS                 : TfmTaxPIS;
    FrCofins              : TFmTaxCofins;

    TaxRuler: TControllerTaxRuler;

  end;

var
  CadTaxRuler: TCadTaxRuler;

implementation

{$R *.dfm}

uses MainModule, DeterBaseTaxIcmsST;

{ TCadTaxRuler }

procedure TCadTaxRuler.FiltrarCFOP(Sender: TObject);
Var
  lcway : String;
begin
  if chbx_Direcao_Entrada.Checked  then
    lcway := 'E'
  else
    lcway := 'S';
  if (FrState.DBLCB_Lista.KeyValue <> null) then
    UMM.FiltrarCFOP(lcway,FrState.DBLCB_Lista.KeyValue,FrCFOP)
  else
    UMM.FiltrarCFOP(lcway,0,FrCFOP)
end;

procedure TCadTaxRuler.chbx_Direcao_EntradaClick(Sender: TObject);
begin
  FiltrarCFOP(Self);
end;

procedure TCadTaxRuler.ClearAllFields;
begin
  inherited;
  TaxRuler.clear;
  if self.Estabelecimento.Fiscal.Juridica.Registro.CRT = '3' then
    ClearFields(FrTaxIcmsNr)
  else
    ClearFields(FrTaxIcmsSn);
  ClearFields(FrDeterBaseTaxIcms);
  ClearFields(FrDeterBaseTaxIcmsST);
  ClearFields(FrDischargeIcms);
  ClearFields(FrObservation);
  ClearFields(FrCFOP);
  ClearFields(FrIPI);
  ClearFields(FrPIS);
  ClearFields(FrCofins);
  ClearFields(FrState);
end;

procedure TCadTaxRuler.Delete;
begin
  inherited;
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja realmente excluir este registro?',
                'clique em SIM para confirmar.'],mpAlerta);
    FormMsg.ShowModal(
      Procedure(Sender: TComponent; AResult:Integer)
      begin
        if (Sender as TMsgForm).BotaoEscolhido > 0 then
        Begin
          TaxRuler.delete;
          //Provider.delete;
          //PaymentType.delete;
          TaxRuler.delete;
          ClearAllFields;
        End;
      end
    );
end;

procedure TCadTaxRuler.EditionControl;
begin
  inherited;
  if self.Estabelecimento.Fiscal.Juridica.Registro.CRT = '3' then
    EditionControler(FrTaxIcmsNr)
  else
    EditionControler(FrTaxIcmsSn);
  EditionControler(FrDeterBaseTaxIcms);
  EditionControler(FrDeterBaseTaxIcmsST);
  EditionControler(FrDischargeIcms);
  EditionControler(FrObservation);
  EditionControler(FrCFOP);
  EditionControler(FrIPI);
  EditionControler(FrPIS);
  EditionControler(FrCofins);
  EditionControler(FrState);
end;

procedure TCadTaxRuler.FormatScreen;
begin
  inherited;
  Estabelecimento.Fiscal.Juridica.Registro.Codigo := UMM.GInstitution.registro.Codigo;
  Estabelecimento.Fiscal.Juridica.getByKey;
  if Estabelecimento.Fiscal.Juridica.Registro.CRT = '3' then
  Begin
    ShowTaxIcmsNr;
    Ctn_TaxIcmsSn.Visible := False;
  End
  else
  Begin
    ShowTaxIcmsSn;
    Ctn_TaxIcmsNr.Visible := False;
  End;
  ShowDeterBaseTaxIcms;
  ShowDeterBaseTaxIcmsST;
  ShowDischargeIcms;
  ShowObservation;
  ShowCFOP;
  ShowPIS;
  ShowIPI;
  ShowCofins;
  ShowState;
end;

procedure TCadTaxRuler.InitVariable;
begin
  inherited;
  TaxRuler := TControllerTaxRuler.Create(self);
  Estabelecimento := TControllerInstitution.Create(self);
end;

procedure TCadTaxRuler.Insert;
begin
  inherited;
  ClearAllFields;
end;

procedure TCadTaxRuler.Save;
 begin
  with TaxRuler.Registro do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Produto := 0;
    CST := '0';
    CSOSN := '0';
    if self.Estabelecimento.Fiscal.Juridica.Registro.CRT = '3' then
      CST := FrTaxIcmsNr.DBLCB_Lista.KeyValue
    else
      CSOSN := FrTaxIcmsSn.DBLCB_Lista.KeyValue;
    Origem := IntToStr(Cb_Origin.ItemIndex);
    DeterminacaoBaseIcms := FrDeterBaseTaxIcms.DBLCB_Lista.KeyValue;
    if chbx_Produto_com_ST.Checked then
      DeterminacaoBaseIcmsSt := FrDeterBaseTaxIcmsST.DBLCB_Lista.KeyValue
    else
      DeterminacaoBaseIcmsSt := '';
    if FrDischargeIcms.DBLCB_Lista.KeyValue <> null then
      Desoneracao := FrDischargeIcms.DBLCB_Lista.KeyValue
    else
      Desoneracao := 0;
    AliquotaICMS := StrToFloatDef( E_Ali_ICMS.Text,0);
    ReducaoAliqICMS := StrToFloatDef( E_Red_Aliq.Text,0);
    ReducaoBaseICMS := StrToFloatDef( E_Red_Base.Text,0);
    if ( FrIPI.DBLCB_Lista.KeyValue <> null) then
      CstIpi := FrIPI.DBLCB_Lista.KeyValue
    else
      CstIpi := '0';
    AliquotaIPI := StrToFloatDef( E_aliqu_IPI.Text,0);
    if (FrPIS.DBLCB_Lista.KeyValue <> null) then
      CstPis := FrPIS.DBLCB_Lista.KeyValue
    else
      CstPis := '0';
    AliquotaPIS := StrToFloatDef( E_aliqu_IPI.Text,0);
    if (FrCofins.DBLCB_Lista.KeyValue <> null) then
      CstCofins := FrCofins.DBLCB_Lista.KeyValue
    else
      CstCofins := '0';
    AliquotaCofins := StrToFloatDef( E_Alq_IRPJ.Text,0);
    AliquotaIRRJ := StrToFloatDef( E_Alq_IRPJ.Text , 0);
    AliquotaCSLL := StrToFloatDef( E_Alq_CSLL.Text , 0);
    AliquotaII :=  StrToFloatDef( E_Alq_II.Text , 0);
    if chbx_Produto_com_ST.Checked then
      ParaIcmsSt := 'S'
    else
      ParaIcmsSt := 'N';
    if chbx_Operac.Checked then
      ParaConsumidor := 'S'
    else
      ParaConsumidor := 'N';
    if chbx_Sub_Tri.Checked then
      SubistitutoTributario := 'S'
    else
      SubistitutoTributario := 'N';
    if FrObservation.DBLCB_Lista.keyValue <> null then
      Observacao := FrObservation.DBLCB_Lista.keyValue
    else
      Observacao := 0;
    Cfop := IntToStr( FrCFOP.DBLCB_Lista.KeyValue );
    if FrState.DBLCB_Lista.KeyValue <> null then
      Estado := FrState.DBLCB_Lista.KeyValue
    else
      Estado := 0;
    TipoTransacao:= IntToStr(Cb_trans.ItemIndex);
    AliquotaAFRMM := StrToFloatDef( E_Alq_ADRMM.Text ,0);
    AliquotaSiscomex := StrToFloatDef( E_Alq_SIS.Text , 0);
    AliquotaPIS      := StrToFloatDef( E_Aliq_PIS.Text, 0);
    AliquotaCofins   := StrToFloatDef( E_Aliq_conf.Text, 0);

    if chbx_crt.Checked then
      CRT := '1'
    else
      CRT := '3';
    if chbx_Prop.Checked then
      PropagaReducaoBase := 'S'
    else
      PropagaReducaoBase := 'N';
    NCM := E_Cod_Class.Text;
    if chbx_Direcao_Entrada.Checked then
      Direcao := 'E'
    else
      Direcao := 'S'
  End;
  TaxRuler.save;
end;

procedure TCadTaxRuler.SetVariable;
begin
  with TaxRuler do
  Begin
    Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Registro.Codigo := CodigoRegistro;
    getByKey;
    //observation
    Observation.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Observation.Registro.Codigo := Registro.Observacao;
    Observation.getByKey;
  End;
  inherited;
end;

procedure TCadTaxRuler.ShowCFOP;
begin
  FrCFOP := TFmCFOP.Create(Self);
  FrCFOP.Parent := Ctn_CFOP;
  FrCFOP.Listar;
  FrCFOP.DBLCB_Lista.OnExit := FiltrarCFOP;
  FrCFOP.Align := alClient;
  FrCFOP.Show;
end;

procedure TCadTaxRuler.ShowCofins;
begin
  FrCofins := TFmTaxCofins.Create(Self);
  FrCofins.Parent := Ctn_Cofins;
  FrCofins.listar;
  FrCofins.Align := alClient;
  FrCofins.Show;
end;

procedure TCadTaxRuler.ShowData;
begin
  With TaxRuler.Registro do
  begin
    if Self.Estabelecimento.Fiscal.Juridica.Registro.CRT = '3' then
      FrTaxIcmsNr.DBLCB_Lista.KeyValue  := CST
    else
      FrTaxIcmsSn.DBLCB_Lista.KeyValue := CSOSN;
    FrDeterBaseTaxIcms.DBLCB_Lista.KeyValue := DeterminacaoBaseIcms;
    FrDeterBaseTaxIcmsST.DBLCB_Lista.KeyValue := DeterminacaoBaseIcmsSt;
    FrDischargeIcms.DBLCB_Lista.KeyValue := Desoneracao;
    FrIPI.DBLCB_Lista.KeyValue := CstIpi;
    FrPIS.DBLCB_Lista.KeyValue := CstPis;
    FrCofins.DBLCB_Lista.KeyValue := CstCofins;
    frObservation.DBLCB_Lista.KeyValue := Observacao;
    FrCFOP.DBLCB_Lista.KeyValue := Cfop;
    FrState.DBLCB_Lista.KeyValue := Estado;
    Cb_Origin.ItemIndex   := StrToIntDef(Origem,0);
    E_Ali_ICMS.Text       := FloatToStrF(AliquotaICMS, ffFixed,10,2);
    E_Red_Aliq.Text       := FloatToStrF(ReducaoAliqICMS, ffFixed, 10,2);
    E_Red_Base.Text       := FloatToStrF(ReducaoBaseICMS, ffFixed, 10,2);
    E_aliqu_IPI.Text      := FloatToStrf(AliquotaIPI, ffFixed, 10,2);
    E_aliqu_IPI.Text      := FloatToStrF(AliquotaPIS, ffFixed, 10,2);
    E_Alq_IRPJ.Text       := FloatToStrF(AliquotaIRRJ, ffFixed, 10,2);
    E_Alq_CSLL.Text       := FloatToStrF(AliquotaCSLL, ffFixed, 10,2);
    E_Alq_II.Text         := FloatToStrF(AliquotaII, ffFixed, 10,2);
    chbx_Produto_com_ST.Checked   := ParaIcmsSt = 'S';
    chbx_Operac.Checked   := ParaConsumidor = 'S';
    chbx_Sub_Tri.Checked  := subistitutoTributario = 'S';
    Cb_trans.ItemIndex    := StrToIntDef(TipoTransacao,0);
    E_Alq_ADRMM.Text      := FloatToStrF(AliquotaAFRMM, ffFixed, 10,2);
    E_Alq_SIS.Text        := FloatToStrF(AliquotaSiscomex, ffFixed, 10,2);
    E_Cod_Class.Text      := NCM;
    chbx_Prop.Checked     := PropagaReducaoBase = 'S';
    chbx_Direcao_Entrada.Checked := Direcao = 'E';

    E_Aliq_PIS.Text       := FloatToStrF(AliquotaPIS, ffFixed, 10,2);
    E_Aliq_conf.Text      := FloatToStrF(AliquotaCofins, ffFixed, 10,2 );
  End;
end;


procedure TCadTaxRuler.ShowDeterBaseTaxIcms;
begin
  FrDeterBaseTaxIcms := TFmDeterBaseTaxIcms.Create(Self);
  FrDeterBaseTaxIcms.Parent := Ctn_DeterBaseTaxIcms;
  FrDeterBaseTaxIcms.listar;
  FrDeterBaseTaxIcms.Align := alClient;
  FrDeterBaseTaxIcms.Show;
end;

procedure TCadTaxRuler.ShowDeterBaseTaxIcmsST;
begin
  FrDeterBaseTaxIcmsST := TFmDeterBaseTaxIcmsST.Create(Self);
  FrDeterBaseTaxIcmsST.Parent := Ctn_DeterBaseTaxIcmsST;
  FrDeterBaseTaxIcmsST.listar;
  FrDeterBaseTaxIcmsST.Align := alClient;
  FrDeterBaseTaxIcmsST.Show;
end;

procedure TCadTaxRuler.ShowDischargeIcms;
begin
  FrDischargeIcms := TFmDischargeIcms.Create(Self);
  FrDischargeIcms.Parent := Ctn_DischargeIcms;
  FrDischargeIcms.listar;
  FrDischargeIcms.Align := alClient;
  FrDischargeIcms.Show;
end;

procedure TCadTaxRuler.ShowIPI;
begin
  FrIPI := TFmTaxIpi.Create(Self);
  FrIPI.Parent := Ctn_IPI;
  FrIPI.listar;
  FrIPI.Align := alClient;
  FrIPI.Show;

end;

procedure TCadTaxRuler.ShowNoData;
begin
  ClearAllFields;
  inherited;
end;

procedure TCadTaxRuler.ShowObservation;
begin
  frObservation := TFmObservation.Create(Self);
  FrObservation.Parent := Ctn_Observation;
  FrObservation.Listar;
  FrObservation.Align := alClient;
  FrObservation.Show;
end;

procedure TCadTaxRuler.ShowPIS;
begin
  FrPIS := TFmTaxPis.Create(Self);
  FrPIS.Parent := Ctn_PIS;
  FrPIS.Listar;
  FrPIS.Align := alClient;
  FrPIS.Show;
end;

procedure TCadTaxRuler.ShowState;
begin
  FrState := TFmState.Create(Self);
  FrState.Parent := ctn_state;
  FrState.Align := alClient;
  FrState.Listar(1058);
  FrState.DBLCB_Lista.OnExit := FiltrarCFOP;
  FrState.Show;
end;

procedure TCadTaxRuler.ShowTaxIcmsNr;
begin
  FrTaxIcmsNr := TFmTaxIcmsNr.Create(Self);
  FrTaxIcmsNr.Parent := Ctn_TaxIcmsNr;
  FrTaxIcmsNr.listar;
  FrTaxIcmsNr.Align := alClient;
  FrTaxIcmsNr.Show;
end;

procedure TCadTaxRuler.ShowTaxIcmsSn;
begin
  FrTaxIcmsSn := TFmTaxIcmsSn.Create(Self);
  FrTaxIcmsSn.Parent := Ctn_TaxIcmsSn;
  FrTaxIcmsSn.Listar;
  FrTaxIcmsSn.Align := alClient;
  FrTaxIcmsSn.Show;
end;

function TCadTaxRuler.ValidaInsert: boolean;
begin
//
end;

function TCadTaxRuler.ValidateDelete: boolean;
begin
//
end;

function TCadTaxRuler.ValidateSave: boolean;
begin
  result :=true;
  if Estabelecimento.Fiscal.Juridica.Registro.CRT = '3' then
  Begin
  if TRIM(FrTaxIcmsNr.DBLCB_Lista.Text) = '' then
    begin
          MensageAlert(['A T E N Ç Ã O!.',
                    '',
                    'Campo Situação Tributaria do ICMS não informado.',
                    'Preencha o campo para continuar']);
        Result:=False;
        Exit;
    end;
  End
  else
  Begin
    if TRIM(FrTaxIcmsSn.DBLCB_Lista.Text) = '' then
      begin
        MensageAlert(['A T E N Ç Ã O!.',
                    '',
                    'Campo Situação Tributária - Icms Simples Nacional não informado.',
                    'Preencha o campo para continuar']);
        Result:=False;
        Exit;
      end;
  End;

  if TRIM(FrDeterBaseTaxIcms.DBLCB_Lista.Text) = '' then
    begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Determinação de Base ICMS não informado.',
                  'Preencha o campo para continuar']);
    Result:=False;
    Exit;
    end;

  if chbx_Produto_com_ST.Checked then
    Begin
      if TRIM(FrDeterBaseTaxIcmsST.DBLCB_Lista.Text) = '' then
      Begin
        MensageAlert(['A T E N Ç Ã O!.',
                    '',
                    'Preencha Determinação de Base ICMS S.T. para esta tributação.',
                    'Preencha o campo para continuar']);
        Result:=False;
        Exit;
      End;
    end;

  if TRIM(FrCFOP.DBLCB_Lista.Text) = '' then
    begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Preencha CFOP.',
                  'Preencha o campo para continuar']);
    Result:=False;
    Exit;
   end;

  if (StrToFloatDef(E_aliqu_IPI.Text,0) > 0 ) and (trim(FrIPI.Text) ='') then
   begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Preencha  Aliquota de IPI maior que zero.',
                  'Preencha o campo para continuar']);
    pg_tax.ActivePage:= tbs_Ipi;
    Result:=False;
    Exit;
   end;

  if (StrToFloatDef(E_Aliq_conf.Text,0) > 0 ) and (trim(FrCofins.Text) ='') then
   begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Aliquota de COFINS maior que zero.',
                  'Preencha o campo para continuar']);
    pg_tax.ActivePage:= tbs_cofins;
    Result:=False;
    Exit;
   end;

  if (StrToFloatDef(E_Aliq_PIS.Text,0) > 0 ) and (trim(FrPIS.Text) ='') then
   begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Aliquota de PIS maior que zero.',
                  'Preencha o campo para continuar']);
    pg_tax.ActivePage:= tbs_pis;
    Result:=False;
    Exit;
   end;
end;
end.
