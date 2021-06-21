inherited CadEntityFiscal: TCadEntityFiscal
  ClientWidth = 700
  Caption = 'Cadastro Entidade'
  ExplicitWidth = 716
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Width = 700
    ExplicitWidth = 700
  end
  inherited pnl_fundo: TUniPanel
    Width = 700
    ExplicitWidth = 700
    inherited pnl_fundo_linha_1: TUniPanel
      Width = 696
      ExplicitWidth = 696
      inherited E_DateRegistry: TUniDateTimePicker
        Left = 60
        DateTime = 43330.000000000000000000
        FieldLabel = 'Cadastro'
        ExplicitLeft = 60
      end
      inherited E_ID: TUniEdit
        Width = 51
        ExplicitWidth = 51
      end
      object E_DocFiscal: TUniEdit
        AlignWithMargins = True
        Left = 294
        Top = 3
        Width = 113
        Height = 41
        Hint = ''
        Margins.Bottom = 8
        MaxLength = 18
        Text = ''
        Align = alLeft
        TabOrder = 3
        FieldLabel = 'C.P.F'
        FieldLabelAlign = laTop
        OnExit = E_DocFiscalExit
      end
      object E_Ins_Mun: TUniEdit
        AlignWithMargins = True
        Left = 561
        Top = 3
        Width = 120
        Height = 41
        Hint = ''
        Margins.Bottom = 8
        MaxLength = 14
        Text = ''
        Align = alLeft
        TabOrder = 4
        FieldLabel = 'Emissor'
        FieldLabelAlign = laTop
      end
      object E_RG_InscEst: TUniEdit
        AlignWithMargins = True
        Left = 442
        Top = 3
        Width = 113
        Height = 41
        Hint = ''
        Margins.Bottom = 8
        MaxLength = 14
        Text = ''
        Align = alLeft
        TabOrder = 5
        FieldLabel = 'RG:'
        FieldLabelAlign = laTop
      end
      object RG_Pessoa: TUniRadioGroup
        Left = 154
        Top = 0
        Width = 137
        Height = 52
        Hint = ''
        Items.Strings = (
          'F'#237'sica'
          'Jur'#237'dica')
        ItemIndex = 0
        Align = alLeft
        Caption = 'Tipo Pessoa'
        TabOrder = 6
        ParentFont = False
        Font.Color = clNavy
        Columns = 2
        OnClick = RG_PessoaClick
      end
      object Sb_PesCNPJ: TUniSpeedButton
        AlignWithMargins = True
        Left = 413
        Top = 22
        Width = 23
        Height = 27
        Hint = ''
        Margins.Top = 22
        Caption = '...'
        Align = alLeft
        ParentColor = False
        Color = clWindow
        TabOrder = 7
        OnClick = Sb_PesCNPJClick
      end
    end
    inherited pnl_fundo_linha_2: TUniPanel
      Width = 696
      ExplicitWidth = 696
      inherited E_NickTrade: TUniEdit
        Width = 376
        ExplicitWidth = 376
      end
    end
    inherited pnl_fundo_linha_3: TUniPanel
      Width = 696
      ExplicitWidth = 696
      inherited Ctn_LineBusiness: TUniContainerPanel
        Width = 592
        ExplicitWidth = 592
      end
      inherited E_DtAniversary: TUniDateTimePicker
        Left = 595
        Width = 98
        ExplicitLeft = 595
        ExplicitWidth = 98
      end
    end
    inherited pnl_fundo_linha_4: TUniPanel
      Width = 696
      ExplicitWidth = 696
      inherited E_WebSite: TUniEdit
        Width = 376
        FieldLabelAlign = laTop
        ExplicitWidth = 376
      end
    end
  end
  inherited Pg_Main: TUniPageControl
    Width = 700
    ActivePage = tbs_OutrasInfo
    ExplicitWidth = 700
    inherited tb_Address: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 692
      ExplicitHeight = 240
      inherited Ctn_Address: TUniContainerPanel
        Width = 692
        ExplicitWidth = 692
      end
    end
    inherited tb_Obs: TUniTabSheet
      ExplicitWidth = 692
      inherited E_Obs: TUniMemo
        Width = 686
        ExplicitWidth = 686
      end
    end
    object tbs_tributacao: TUniTabSheet
      Hint = ''
      Caption = 'Tributa'#231#227'o'
      object ChBx_OptanteSimples: TUniCheckBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 686
        Height = 17
        Hint = ''
        Margins.Bottom = 0
        Caption = 'Optante pelo Simples Nacional'
        Align = alTop
        TabOrder = 0
      end
      object Chbx_IgnoraST: TUniCheckBox
        AlignWithMargins = True
        Left = 3
        Top = 20
        Width = 686
        Height = 17
        Hint = ''
        Margins.Top = 0
        Margins.Bottom = 0
        Caption = 
          'A marca'#231#227'o dos produtos Sujeitos '#224' Substitui'#231#227'o Tribut'#225'ria, ser'#225 +
          ' ignorada na emiss'#227'o da Nota'
        Align = alTop
        TabOrder = 1
      end
      object UniLabel1: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 57
        Width = 226
        Height = 13
        Hint = ''
        Caption = 'Indicador da Inscri'#231#227'o Estadual do Destinat'#225'rio'
        Align = alTop
        ParentFont = False
        TabOrder = 4
      end
      object Cb_Ind_IE_Dest: TUniComboBox
        AlignWithMargins = True
        Left = 3
        Top = 76
        Width = 686
        Hint = ''
        Style = csDropDownList
        Text = '1 - Contribuinte ICMS (informar a IE do destinat'#225'rio)'
        Items.Strings = (
          '1 - Contribuinte ICMS (informar a IE do destinat'#225'rio)'
          
            '2 - Contribuinte isento de Inscri'#231#227'o no cadastro de Contribuinte' +
            's do ICMS'
          
            '9 - N'#227'o Contribuinte, que pode ou n'#227'o possuir Inscri'#231#227'o Estadual' +
            ' no Cadastro de Contribuintes do ICMS')
        ItemIndex = 0
        Align = alTop
        TabOrder = 3
        IconItems = <>
      end
      object chbx_Just_Xml: TUniCheckBox
        AlignWithMargins = True
        Left = 3
        Top = 37
        Width = 686
        Height = 17
        Hint = ''
        Margins.Top = 0
        Margins.Bottom = 0
        Caption = 
          'Enviar somente o Arquivo XML, nos casos em que a recep'#231#227'o do arq' +
          'uivo seja feita por meio eletr'#244'nico'
        Align = alTop
        TabOrder = 2
      end
      object pnl_tributacai_linha_6: TUniPanel
        Left = 0
        Top = 101
        Width = 692
        Height = 47
        Hint = ''
        Align = alTop
        TabOrder = 5
        BorderStyle = ubsNone
        Caption = ''
        object pnl_tributacai_linha_6_2: TUniPanel
          Left = 272
          Top = 0
          Width = 112
          Height = 47
          Hint = ''
          Align = alLeft
          TabOrder = 1
          BorderStyle = ubsNone
          Caption = ''
          object UniLabel3: TUniLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 101
            Height = 14
            Hint = ''
            Caption = 'N'#250'mero do processo'
            Align = alTop
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 1
          end
          object E_ISS_Nr_Processo: TUniEdit
            AlignWithMargins = True
            Left = 3
            Top = 23
            Width = 106
            Hint = ''
            MaxLength = 14
            Text = ''
            Align = alTop
            TabOrder = 2
          end
        end
        object pnl_tributacai_linha_6_1: TUniPanel
          Left = 0
          Top = 0
          Width = 272
          Height = 47
          Hint = ''
          Align = alLeft
          TabOrder = 2
          BorderStyle = ubsNone
          Caption = ''
          object UniLabel15: TUniLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 170
            Height = 13
            Hint = ''
            Caption = 'Indicador da exigibilidade do ISSQN'
            Align = alTop
            ParentFont = False
            TabOrder = 1
          end
          object Cb_ISS_EXIGIB: TUniComboBox
            AlignWithMargins = True
            Left = 3
            Top = 22
            Width = 266
            Hint = ''
            Style = csDropDownList
            Text = '01 - Exig'#237'vel.'
            Items.Strings = (
              '01 - Exig'#237'vel.'
              '02 - N'#227'o incid'#234'ncia.'
              '03 - Isen'#231#227'o.'
              '04 - Exporta'#231#227'o.'
              '05 - Imunidade.'
              '06 - Exigibilidade Suspensa por Decis'#227'o Judicial.'
              '07 - Exigibilidade Suspensa por Processo Administrativo.')
            ItemIndex = 0
            Align = alTop
            TabOrder = 2
            IconItems = <>
          end
        end
      end
      object pnl_tributacai_linha_7: TUniPanel
        Left = 0
        Top = 148
        Width = 692
        Height = 48
        Hint = ''
        Align = alTop
        TabOrder = 6
        BorderStyle = ubsNone
        Caption = ''
        object RG_ISS_RET: TUniRadioGroup
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 133
          Height = 42
          Hint = ''
          Items.Strings = (
            'N'#195'O'
            'SIM')
          Align = alLeft
          Caption = 'Reten'#231#227'o do ISSQN'
          TabOrder = 1
          Columns = 2
        end
        object Rg_ISS_INC_FISCAL: TUniRadioGroup
          AlignWithMargins = True
          Left = 142
          Top = 3
          Width = 160
          Height = 42
          Hint = ''
          Items.Strings = (
            'N'#195'O'
            'SIM')
          Align = alLeft
          Caption = 'Incentivo Fiscal - ISSQN'
          TabOrder = 2
          Columns = 2
        end
      end
    end
    object tbs_OutrasInfo: TUniTabSheet
      Hint = ''
      Caption = 'Outras Informa'#231#245'es'
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 168
    Top = 40
  end
end
