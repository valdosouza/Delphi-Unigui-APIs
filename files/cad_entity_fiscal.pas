unit cad_entity_fiscal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Menus, Data.DB, Datasnap.DBClient,

  uniMainMenu, uniMemo, uniPanel, uniPageControl, uniRadioGroup, uniDateTimePicker,
  uniGUIClasses, uniEdit, uniLabel, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniMultiItem, uniComboBox, uniCheckBox,
  uniImageList,
  api_receita_ws,
  CnpjReceita,
  cad_entity,
  ControllerEntityFiscal,
  ControllerCity,
  ControllerState,
  ControllerPerson,
  ControllerCompany,
  ControllerEntity,
  pes_cnpjOnLine, System.StrUtils
  ;

type
  TCadEntityFiscal = class(TCadEntity)
    E_DocFiscal: TUniEdit;
    RG_Pessoa: TUniRadioGroup;
    E_RG_InscEst: TUniEdit;
    E_Ins_Mun: TUniEdit;
    Sb_PesCNPJ: TUniSpeedButton;
    tbs_tributacao: TUniTabSheet;
    ChBx_OptanteSimples: TUniCheckBox;
    Chbx_IgnoraST: TUniCheckBox;
    UniLabel1: TUniLabel;
    Cb_Ind_IE_Dest: TUniComboBox;
    RG_ISS_RET: TUniRadioGroup;
    Rg_ISS_INC_FISCAL: TUniRadioGroup;
    chbx_Just_Xml: TUniCheckBox;
    tbs_OutrasInfo: TUniTabSheet;
    pnl_tributacai_linha_6: TUniPanel;
    pnl_tributacai_linha_6_2: TUniPanel;
    pnl_tributacai_linha_6_1: TUniPanel;
    UniLabel15: TUniLabel;
    Cb_ISS_EXIGIB: TUniComboBox;
    UniLabel3: TUniLabel;
    E_ISS_Nr_Processo: TUniEdit;
    pnl_tributacai_linha_7: TUniPanel;
    procedure RG_PessoaClick(Sender: TObject);
    procedure E_DocFiscalExit(Sender: TObject);
    procedure Sb_PesCNPJClick(Sender: TObject);
  private
    procedure defineDocMask;
    procedure GetDataDocument;
    procedure fillDataByCNPJ(pData:TCnpjReceita);
  protected
    procedure InitVariable;Override;
    procedure FormatScreen;Override;

    //Inserir;
    function  ValidaInsert():boolean;Override;
    procedure Insert;Override;
    //Alterar;
    function  ValidateChange():boolean;Override;
    procedure Change;Override;
    //Salvar
    function  ValidateSave():boolean;Override;
    procedure Save;Override;

    procedure RegistroExistente;
    procedure getRegistroExistente;Virtual;
    procedure ShowRegistroExistente(pEF:TControllerEntityFiscal);

  public
    //MainObj : TControllerEntityFiscal;

    procedure saveEntityFiscal(Entity:TControllerEntityFiscal);
    procedure ShowDataFiscal(Entity:TControllerEntityFiscal);

    function ValidSearchCNPJ: Boolean;
    function ValidateSaveEntityFiscal():boolean;
    procedure TipoPessoa(Pc_Tipo:Integer);

  end;

var
  CadEntityFiscal: TCadEntityFiscal;

implementation

{$R *.dfm}

uses
  UnFunctions,
  unMessages,
  MainModule,
  msg_form,
  ClasseUtil;

function TCadEntityFiscal.ValidaInsert: boolean;
begin
  TipoPessoa(0);
  Result := True;
end;

function TCadEntityFiscal.ValidateChange: boolean;
begin
  Result := True;
end;

function TCadEntityFiscal.ValidateSave: boolean;
begin
  Result := True;
  if not ValidateSaveEntityFiscal then
  Begin
    Result := false;
    Exit;
  end;
end;

function TCadEntityFiscal.ValidateSaveEntityFiscal():boolean;
Var
  AuxReturn : String;
Begin
  Result := True;
  if not ValidateSaveEntity then
  Begin
    Result := false;
    Exit;
  end;
  if (FrAddress.FrCountryStateCity.FrCountry.DBLCB_Lista.Text = 'BRASIL' ) then
  Begin
    if not ValidDocFiscal(E_DocFiscal.Text) then
    Begin
      Result := False;
      exit
    End;
    if RG_Pessoa.ItemIndex = 1 then
    BEgin
      if (UpperCase(E_RG_InscEst.Text) = 'ISENTO') OR (UpperCase(E_RG_InscEst.Text) = 'ISENTA')  then
      BEgin
        MensageAlert(['A T E N Ç Ã O!.',
                      '',
                      'Informação de Isento(a) não deve ser colocado no campo de Inscrição.',
                      'Verifique campo indicador da Inscrição Estadual do Destinatário',
                      'Verifique e tente novamente']);
        Result := false;
        exit;
      end;
      if (E_RG_InscEst.Text <> '') then
      Begin
        if not ValidInscEstadual(E_RG_InscEst.Text,FrAddress.FrCountryStateCity.FrState.DBLCB_Lista.Text) then
        Begin
          MensageAlert(['A T E N Ç Ã O!.',
                        '',
                        'Inscrição Estadual inválida.',
                        'Verifique e tente novamente']);
          Result := False;
          exit;
        End;
      End;
    End;
  End;
end;

function  TCadEntityFiscal.ValidSearchCNPJ():Boolean;
Begin
  Result:= True;
  if RG_Pessoa.ItemIndex = 0 then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Está consulta é apenas para C.N.P.J.',
                  'Verifique e tente novamente']);
    Result := false;
    exit;
  end;

  if not ValidDocFiscal(E_DocFiscal.Text) then
  Begin
    Result := False;
  end;
end;

procedure TCadEntityFiscal.TipoPessoa(Pc_Tipo:Integer);
begin
  E_DocFiscal.Clear;
  RG_Pessoa.Enabled := True;
  case Pc_tipo of
    -1:begin
        RG_Pessoa.Enabled := False;
        E_DocFiscal.FieldLabel    := 'C.P.F';
        E_Ins_Mun.FieldLabel      := 'Orgão Emissor';
        E_NameCompany.FieldLabel  := 'Nome';
        E_NickTrade.FieldLabel    := 'Codnome/Apelido';
        E_RG_InscEst.FieldLabel   := 'Número RG';
        E_DtAniversary.FieldLabel := 'Nascimento';
      end;
    0:begin
        E_DocFiscal.FieldLabel    := 'C.P.F';
        E_Ins_Mun.FieldLabel      := 'Orgão Emissor';
        E_NameCompany.FieldLabel  := 'Nome';
        E_NickTrade.FieldLabel    := 'Codnome/Apelido';
        E_RG_InscEst.FieldLabel   := 'Número RG';
        E_DtAniversary.FieldLabel := 'Data Nascimento';
      end;
    1:begin
        E_DocFiscal.FieldLabel    := 'C.N.P.J';
        E_Ins_Mun.FieldLabel      := 'Insc. Municipal';
        E_NameCompany.FieldLabel  := 'Nome/Razão Social';
        E_NickTrade.FieldLabel    := 'Nome Fantasia';
        E_RG_InscEst.FieldLabel   := 'Insc. Estadual';
        E_DtAniversary.FieldLabel := 'Data Fundação';
      end;
  end;
end;

procedure TCadEntityFiscal.Sb_PesCNPJClick(Sender: TObject);
Var
  Lc_Form : TPesCnpjOnLine;
begin
  if ValidSearchCNPJ then
  Begin
    try
      Self.showMask('Buscando Dados do C.N.P.J.');
      UniSession.Synchronize();
      GetDataDocument;
    finally
      self.HideMask;
    end;
  end;
end;

procedure TCadEntityFiscal.GetDataDocument;
Var
  LcApi : TApiReceitaWs;
begin
  try
    ShowProgress('Buscando Dados');
    LcApi := TApiReceitaWs.Create(nil);
    LcApi.CNPJ := RemoveCaracterInformado(E_DocFiscal.Text,['.','/','-']);
    fillDataByCNPJ(LcApi.getDados);
  finally
    LcApi.DisposeOf;
    HideProgress;
  end;
end;

procedure TCadEntityFiscal.ShowDataFiscal(Entity: TControllerEntityFiscal);
Var
  I:Integer;
begin
  //Pessoa Juridica  - Fiscal
  with Entity do
  Begin
    if Juridica.exist then
    Begin
      with Juridica.Registro do
      Begin
        RG_Pessoa.ItemIndex := 1;
        TipoPessoa(RG_Pessoa.ItemIndex);
        E_DocFiscal.Text := CNPJ;
        MaskCNPJ(E_DocFiscal);
        E_RG_InscEst.Text := InscricaoEstadual;
        E_Ins_Mun.Text := InscricaoMunicipal;
        E_DtAniversary.DateTime := DataFundacao;
        for I := 0 to Cb_ISS_EXIGIB.Count -1 do
        Begin
          if (Copy(Cb_ISS_EXIGIB.Text,1,2) =  IndExigibilidadeISS) then
          BEgin
            Cb_ISS_EXIGIB.ItemIndex := I;
            break;
          end;
        end;
        if RetencaoISS = 'N' then
         RG_ISS_RET.ItemIndex := 0
        else
          RG_ISS_RET.ItemIndex := 1;
        if IncentFiscalISS = 'N' then
          Rg_ISS_INC_FISCAL.ItemIndex := 0
        else
          Rg_ISS_INC_FISCAL.ItemIndex := 1;
        E_ISS_Nr_Processo.Text := NumeroProcessoISS;
        chbx_Just_Xml.Checked := ( EnviarSomenteXMLNFe = 'S');
        ChBx_OptanteSimples.Checked:= ( CRT <> '3');
      End;
    End
    else
    Begin
      with Fisica.Registro do
      Begin
        RG_Pessoa.ItemIndex := 0;
        TipoPessoa(RG_Pessoa.ItemIndex);
        E_DocFiscal.Text := CPF;
        MaskCPF(E_DocFiscal);
        E_RG_InscEst.Text := RG;
        E_Ins_Mun.Text := OrgaoEmissor;
        E_DtAniversary.DateTime := Aniversario;
      End;
    End;
  End;

end;

procedure TCadEntityFiscal.ShowRegistroExistente(pEF: TControllerEntityFiscal);
begin
  with pEF do
  Begin
    Registro.Codigo := CodigoRegistro;
    getAllByKey;
    ShowDataEntity(pEF);
    ShowDataAddress(Endereco);
    ShowDataPhone(registro.Codigo, Telefone);
    ShowDataMailing(Email);
    ShowDataSocialMedia(MidiaSocial);
    ShowDataFiscal(pEF);
    //Setando a variavel para controle de botãoe (Alterar/Excluir
    CodigoRegistro := Registro.Codigo;
    E_ID.Text := IntToStr(Registro.codigo);
    E_DateRegistry.DateTime := Now;
  End;
end;

procedure TCadEntityFiscal.Change;
begin
  inherited;
  E_DateRegistry.SetFocus;
end;

procedure TCadEntityFiscal.defineDocMask;
begin

end;

procedure TCadEntityFiscal.E_DocFiscalExit(Sender: TObject);
begin
  if RG_Pessoa.ItemIndex = 1 then
    MaskCNPJ(TUniEdit(Sender))
  else
    MaskCPF(TUniEdit(Sender));
  RegistroExistente;
end;

procedure TCadEntityFiscal.fillDataByCNPJ(pData: TCnpjReceita);
Var
  LcPos : Integer;
  LcLocal : TControllerCity;
begin
  with pData do
  BEgin
    E_NameCompany.Text  := RazaoSocial;
    E_NickTrade.Text    := Fantasia;
    //E_Doc.Text        := Preenchido pelo Usuario
    E_RG_InscEst.Text   := '';
    E_email.Text        := EndEletronico;

    LcPos := Pos('/',Telefone);
    FrAddress.E_Phone.Text        := RemoveCaracterInformado( Copy(Telefone,1,LcPos-1),['/','(',')',' ','-']);
    MaskPhone(FrAddress.e_Phone);
    FrAddress.E_Celular.Text      := RemoveCaracterInformado( Copy(Telefone,LcPos+1,Length( Telefone )-LcPos),['/','(',')',' ','-']);
    MaskPhone(FrAddress.E_Celular);
    FrAddress.E_Street.Text       := Endereco;
    FrAddress.E_number.Text       := Numero;
    FrAddress.E_Compl.Text      := Complemento;
    FrAddress.E_Neighborhood.Text := Bairro;
    FrAddress.E_Cep.Text      := RemoveCaracterInformado( CEP, ['.','-']);
    //Posiciona o Estado na Lista
    FrAddress.FrCountryStateCity.FrCountry.DBLCB_Lista.KeyValue := 1058;
    FrAddress.FrCountryStateCity.FrCountry.DBLCB_Lista.Text := 'BRASIL';
    FrAddress.FrCountryStateCity.CountryExit(FrAddress.FrCountryStateCity.FrCountry.DBLCB_Lista);
    try
      LcLocal := TControllerCity.create(nil);
      LcLocal.State.Registro.Abreviatura := UF;
      LcLocal.State.getByAbbreviation;
      //Estados
      FrAddress.FrCountryStateCity.FrState.DBLCB_Lista.KeyValue := LcLocal.State.Registro.Codigo;
      FrAddress.FrCountryStateCity.FrState.DBLCB_Lista.Text := LcLocal.State.Registro.Nome;
      FrAddress.FrCountryStateCity.StateExit(FrAddress.FrCountryStateCity.FrState.DBLCB_Lista);
      //Cidades
      LcLocal.Registro.CodigoEstado := LcLocal.State.Registro.Codigo;
      LcLocal.Registro.Nome := UpperCase(Cidade);
      LcLocal.getByName;
      FrAddress.FrCountryStateCity.FrCity.DBLCB_Lista.KeyValue := LcLocal.Registro.Codigo;
      FrAddress.FrCountryStateCity.FrCity.DBLCB_Lista.Text := LcLocal.Registro.Nome;
    finally
      LcLocal.DisposeOf;
    end;
  End;
end;

procedure TCadEntityFiscal.FormatScreen;
begin
  inherited;
end;

procedure TCadEntityFiscal.InitVariable;
begin
  inherited;
  //MainObj := TControllerEntityFiscal.Create(self);
  TipoPessoa(-1);
end;

procedure TCadEntityFiscal.Insert;
begin
  inherited;
  ClearAllFields;
end;

procedure TCadEntityFiscal.getRegistroExistente;
begin
  {
  with p do
  Begin
    if ( RG_Pessoa.ItemIndex = 0 ) then
    Begin
      CodigoRegistro := Fiscal.Fisica.getIDbyCPF(unMaskField(E_DocFiscal.Text));
    End
    else
    Begin
      CodigoRegistro := Fiscal.Juridica.getIDbyCnpj(unMaskField(E_DocFiscal.Text));
    End;
    if ( CodigoRegistro > 0 ) then
    Begin
      ShowRegistroExistente(Fiscal);
    End;
  end;
  }
end;

procedure TCadEntityFiscal.RegistroExistente;
begin
  if (Length( Trim(E_DocFiscal.Text) ) > 0 ) and  ( EditionState ='I' ) then
  Begin
    try
      Self.showMask('Verificando existência do Cadastro.');
      UniSession.Synchronize();
      getRegistroExistente;
    finally
      self.HideMask;
    end;
  End;
end;

procedure TCadEntityFiscal.RG_PessoaClick(Sender: TObject);
begin
  TipoPessoa(RG_Pessoa.ItemIndex);
  defineDocMask;
end;

procedure TCadEntityFiscal.Save;
begin

end;

procedure TCadEntityFiscal.saveEntityFiscal(Entity: TControllerEntityFiscal);
begin
  with Entity do
  Begin
    if RG_Pessoa.ItemIndex = 0 then
    Begin
      with Fisica.Registro do
      Begin
        if ( Fisica.Registro.Codigo = 0 ) then
        Begin
          Fisica.Registro.Codigo := Fisica.getIDbyCPF(unMaskField(E_DocFiscal.Text));
          Registro.Codigo := Fisica.Registro.Codigo;
        End;
        Fisica.Registro.Codigo := Registro.Codigo;
        CPF := unMaskField( E_DocFiscal.Text ) ;
        RG := E_RG_InscEst.Text;
      End;
      SaveEntity(Entity);
      if ( Fisica.Registro.Codigo = 0 ) then
        Fisica.Registro.Codigo := Entity.Registro.Codigo;
      Fisica.Registro.CPF  := unMaskField( E_DocFiscal.Text );
      Fisica.Registro.RG   := E_RG_InscEst.Text;
      Fisica.Registro.DataEmissao := E_DateRegistry.DateTime;
      Fisica.Registro.OrgaoEmissor := E_Ins_Mun.Text;
      Fisica.Registro.CodigoEstadoEmissor := 0;
      Fisica.Registro.Aniversario := E_DtAniversary.DateTime;
      Fisica.Registro.CodigoCargo := 0;
      Fisica.save;
    End
    else
    Begin
      with Juridica.Registro do
      Begin
        if ( Juridica.Registro.Codigo = 0 ) then
        Begin
          Juridica.Registro.Codigo := Juridica.getIDbyCNPJ(unMaskField(E_DocFiscal.Text));
          Registro.Codigo := Juridica.Registro.Codigo;
        End;
        CNPJ := unMaskField( E_DocFiscal.Text );
        InscricaoEstadual := E_RG_InscEst.Text ;
        InscricaoMunicipal := E_Ins_Mun.Text;
        DataFundacao:= E_DtAniversary.DateTime;
        IndExigibilidadeISS := Copy(Cb_ISS_EXIGIB.Text,1,2);
        CRT := IfThen(ChBx_OptanteSimples.Checked,'1','3');

        RetencaoISS :=  IfThen(RG_ISS_RET.ItemIndex=0,'N','S');
        IncentFiscalISS := IfThen(Rg_ISS_INC_FISCAL.ItemIndex=0,'N','S');
        NumeroProcessoISS := E_ISS_Nr_Processo.Text;
        EnviarSomenteXMLNFe := IfThen(chbx_Just_Xml.Checked,'S','N');
      End;
      SaveEntity(Entity);
      if ( Juridica.Registro.Codigo = 0 ) then
        Juridica.Registro.Codigo := Entity.Registro.Codigo;
      Juridica.Registro.CNPJ   := unMaskField( E_DocFiscal.Text);
      Juridica.Registro.InscricaoEstadual  := E_RG_InscEst.Text;
      Juridica.Registro.InscricaoMunicipal := E_Ins_Mun.Text;
      Juridica.Registro.DataFundacao    := E_DtAniversary.DateTime;
      Juridica.Registro.CRT := IfThen(ChBx_OptanteSimples.Checked,'1','3');
      Juridica.Registro.CRTmodal := IfThen(Chbx_IgnoraST.Checked,'S','N');
      case Cb_Ind_IE_Dest.ItemIndex of
        0: Juridica.Registro.IndicacaoIEDestinatario := '1';
        1: Juridica.Registro.IndicacaoIEDestinatario := '2';
        2: Juridica.Registro.IndicacaoIEDestinatario := '3';
      end;
      case Cb_ISS_EXIGIB.ItemIndex of
        0: Juridica.Registro.IndExigibilidadeISS := '01';
        1: Juridica.Registro.IndExigibilidadeISS := '02';
        2: Juridica.Registro.IndExigibilidadeISS := '03';
        3: Juridica.Registro.IndExigibilidadeISS := '04';
        4: Juridica.Registro.IndExigibilidadeISS := '05';
        5: Juridica.Registro.IndExigibilidadeISS := '06';
        6: Juridica.Registro.IndExigibilidadeISS := '07';
      end;
      Juridica.Registro.IncentFiscalISS := IfThen(Rg_ISS_INC_FISCAL.ItemIndex=0,'S','N');
      Juridica.Registro.RetencaoISS := IfThen(RG_ISS_RET.ItemIndex=0,'S','N');
      Juridica.Registro.NumeroProcessoISS := IfThen(E_ISS_Nr_Processo.Text='','0',E_ISS_Nr_Processo.Text) ;
      Juridica.Registro.EnviarSomenteXMLNFe := IfThen(chbx_Just_Xml.Checked,'S','N');
      Juridica.save;
    End;
  End;

end;

end.
