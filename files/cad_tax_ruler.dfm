inherited CadTaxRuler: TCadTaxRuler
  Left = 228
  ClientHeight = 580
  ClientWidth = 567
  Caption = 'Cadastro Regra de Tributa'#231#227'o'
  ExplicitWidth = 583
  ExplicitHeight = 639
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 509
    Width = 567
    Height = 71
    ExplicitTop = 496
    ExplicitWidth = 567
    ExplicitHeight = 71
    inherited SB_Insert: TUniSpeedButton
      Height = 61
      ExplicitHeight = 61
    end
    inherited SB_Change: TUniSpeedButton
      Height = 61
      ExplicitHeight = 61
    end
    inherited SB_Delete: TUniSpeedButton
      Height = 61
      ExplicitHeight = 61
    end
    inherited SB_Save: TUniSpeedButton
      Height = 61
      ExplicitHeight = 61
    end
    inherited SB_Cancel: TUniSpeedButton
      Height = 61
      ExplicitHeight = 61
    end
    inherited Sb_Close: TUniSpeedButton
      Height = 61
      ExplicitHeight = 61
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 567
    Height = 509
    ExplicitWidth = 567
    ExplicitHeight = 496
    object Ctn_TaxIcmsNr: TUniContainerPanel
      Left = 2
      Top = 46
      Width = 563
      Height = 36
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 0
    end
    object Ctn_TaxIcmsSn: TUniContainerPanel
      Left = 2
      Top = 82
      Width = 563
      Height = 36
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 1
    end
    object UniContainerPanel1: TUniContainerPanel
      Left = 2
      Top = 2
      Width = 563
      Height = 44
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 3
      object L_NameCompany: TUniLabel
        Left = 8
        Top = 3
        Width = 106
        Height = 14
        Hint = ''
        Caption = 'Origem da Mercadoria'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 1
      end
      object Cb_Origin: TUniComboBox
        Left = 4
        Top = 18
        Width = 554
        Hint = ''
        Style = csDropDownList
        Text = '0 - Nacional, exceto as indicadas nos c'#243'digos 3, 4, 5 e 8;'
        Items.Strings = (
          '0 - Nacional, exceto as indicadas nos c'#243'digos 3, 4, 5 e 8;'
          
            '1 - Estrangeira - Importa'#231#227'o direta, exceto a indicada no c'#243'digo' +
            ' 6;'
          
            '2 - Estrangeira - Adquirida no mercado interno, exceto a indicad' +
            'a no c'#243'digo 7;'
          
            '3 - Nacional, mercadoria ou bem com Conte'#250'do de Importa'#231#227'o super' +
            'ior a 40% e inferior ou igual a 70%;'
          
            '4 - Nacional, cuja prod. tenha sido feita em conf. os proc. prod' +
            'utivos b'#225'sicos conf as legisla'#231#245'es citadas nos Ajustes;'
          
            '5 - Nacional, mercadoria ou bem com Conte'#250'do de Importa'#231#227'o infer' +
            'ior ou igual a 40%;'
          
            '6 - Estrangeira - Importa'#231#227'o direta, sem similar nacional,consta' +
            'nte em lista da CAMEX e g'#225's natural;'
          
            '7 - Estrangeira - Adquirida no mercado interno, sem similar naci' +
            'onal, constante lista CAMEX e g'#225's natural.'
          
            '8 - Nacional, mercadoria ou bem com Conte'#250'do de Importa'#231#227'o super' +
            'ior a 70%;')
        ItemIndex = 0
        TabOrder = 2
        IconItems = <>
      end
    end
    object UniContainerPanel2: TUniContainerPanel
      Left = 2
      Top = 118
      Width = 563
      Height = 83
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 4
      object Ctn_DischargeIcms: TUniContainerPanel
        Left = 4
        Top = 41
        Width = 270
        Height = 36
        Hint = ''
        ParentColor = False
        TabOrder = 1
      end
      object Ctn_DeterBaseTaxIcms: TUniContainerPanel
        Left = 4
        Top = 3
        Width = 270
        Height = 36
        Hint = ''
        ParentColor = False
        TabOrder = 2
      end
      object Ctn_DeterBaseTaxIcmsST: TUniContainerPanel
        Left = 280
        Top = 3
        Width = 280
        Height = 36
        Hint = ''
        ParentColor = False
        TabOrder = 3
      end
      object UniLabel1: TUniLabel
        Left = 280
        Top = 41
        Width = 66
        Height = 14
        Hint = ''
        Caption = 'Aliquota ICMS'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 4
      end
      object E_Ali_ICMS: TUniEdit
        Left = 280
        Top = 55
        Width = 71
        Hint = ''
        CharCase = ecUpperCase
        Alignment = taRightJustify
        Text = ''
        ParentFont = False
        TabOrder = 5
      end
      object E_Red_Aliq: TUniEdit
        Left = 354
        Top = 55
        Width = 95
        Hint = ''
        CharCase = ecUpperCase
        Alignment = taRightJustify
        Text = ''
        ParentFont = False
        TabOrder = 6
      end
      object UniLabel2: TUniLabel
        Left = 354
        Top = 41
        Width = 95
        Height = 14
        Hint = ''
        Caption = 'Red na Aliquota em '
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 7
      end
      object UniLabel3: TUniLabel
        Left = 452
        Top = 41
        Width = 103
        Height = 14
        Hint = ''
        Caption = 'Redu'#231#227'o da Base em'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 8
      end
      object E_Red_Base: TUniEdit
        Left = 452
        Top = 55
        Width = 103
        Hint = ''
        CharCase = ecUpperCase
        Alignment = taRightJustify
        Text = ''
        ParentFont = False
        TabOrder = 9
      end
    end
    object pg_tax: TUniPageControl
      Left = 2
      Top = 201
      Width = 563
      Height = 75
      Hint = ''
      ActivePage = tbs_Ipi
      Align = alTop
      TabOrder = 5
      object tbs_Ipi: TUniTabSheet
        Hint = ''
        Caption = 'IPI'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object UniPanel1: TUniPanel
          Left = 0
          Top = 0
          Width = 555
          Height = 47
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object E_aliqu_IPI: TUniEdit
            Left = 429
            Top = 16
            Width = 110
            Hint = ''
            CharCase = ecUpperCase
            Alignment = taRightJustify
            Text = ''
            ParentFont = False
            TabOrder = 1
          end
          object UniLabel13: TUniLabel
            Left = 429
            Top = 2
            Width = 67
            Height = 14
            Hint = ''
            Caption = 'Aliquota de IPI'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 3
          end
          object Ctn_IPI: TUniContainerPanel
            Left = 3
            Top = 3
            Width = 425
            Height = 36
            Hint = ''
            ParentColor = False
            TabOrder = 0
          end
        end
      end
      object Tbs_pis: TUniTabSheet
        Hint = ''
        Caption = 'PIS'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object UniPanel2: TUniPanel
          Left = 0
          Top = 0
          Width = 555
          Height = 47
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object Ctn_PIS: TUniContainerPanel
            Left = 3
            Top = 3
            Width = 425
            Height = 36
            Hint = ''
            ParentColor = False
            TabOrder = 0
          end
          object UniLabel15: TUniLabel
            Left = 429
            Top = 2
            Width = 71
            Height = 14
            Hint = ''
            Caption = 'Aliquota de Pis'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 3
          end
          object E_Aliq_PIS: TUniEdit
            Left = 429
            Top = 16
            Width = 110
            Hint = ''
            CharCase = ecUpperCase
            Alignment = taRightJustify
            Text = ''
            ParentFont = False
            TabOrder = 1
          end
        end
      end
      object tbs_cofins: TUniTabSheet
        Hint = ''
        Caption = 'COFINS'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object UniPanel3: TUniPanel
          Left = 0
          Top = 0
          Width = 555
          Height = 47
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object E_Aliq_conf: TUniEdit
            Left = 429
            Top = 16
            Width = 110
            Hint = ''
            CharCase = ecUpperCase
            Alignment = taRightJustify
            Text = ''
            ParentFont = False
            TabOrder = 1
          end
          object Ctn_Cofins: TUniContainerPanel
            Left = 3
            Top = 3
            Width = 425
            Height = 36
            Hint = ''
            ParentColor = False
            TabOrder = 0
          end
          object UniLabel14: TUniLabel
            Left = 429
            Top = 2
            Width = 88
            Height = 14
            Hint = ''
            Caption = 'Aliquota de Cofins'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 3
          end
        end
      end
      object tbs_outros: TUniTabSheet
        Hint = ''
        Caption = 'Outros'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object UniPanel4: TUniPanel
          Left = 0
          Top = 0
          Width = 555
          Height = 47
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object UniLabel7: TUniLabel
            Left = 5
            Top = 3
            Width = 41
            Height = 14
            Hint = ''
            Caption = 'Al'#237'q IRPJ'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 6
          end
          object E_Alq_IRPJ: TUniEdit
            Left = 5
            Top = 18
            Width = 66
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 0
          end
          object UniLabel8: TUniLabel
            Left = 77
            Top = 3
            Width = 47
            Height = 14
            Hint = ''
            Caption = 'Al'#237'q CSLL'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 7
          end
          object E_Alq_CSLL: TUniEdit
            Left = 77
            Top = 18
            Width = 66
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 1
          end
          object UniLabel9: TUniLabel
            Left = 149
            Top = 3
            Width = 89
            Height = 14
            Hint = ''
            Caption = 'Al'#237'quota Siscomex'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 8
          end
          object E_Alq_SIS: TUniEdit
            Left = 149
            Top = 18
            Width = 100
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 2
          end
          object UniLabel10: TUniLabel
            Left = 255
            Top = 4
            Width = 49
            Height = 14
            Hint = ''
            Caption = 'Al'#237'quota l.l'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 9
          end
          object E_Alq_II: TUniEdit
            Left = 255
            Top = 18
            Width = 106
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 3
          end
          object l_aliqui_afrmm: TUniLabel
            Left = 368
            Top = 3
            Width = 89
            Height = 14
            Hint = ''
            Caption = 'Al'#237'quota A.F.R.M.M'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 10
          end
          object E_Alq_ADRMM: TUniEdit
            Left = 367
            Top = 18
            Width = 106
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 4
          end
        end
      end
    end
    object UniGroupBox1: TUniGroupBox
      Left = 2
      Top = 276
      Width = 563
      Height = 142
      Hint = ''
      Caption = 'Outros Crit'#233'rios'
      Align = alTop
      TabOrder = 6
      DesignSize = (
        563
        142)
      object chbx_Produto_com_ST: TUniCheckBox
        Left = 7
        Top = 22
        Width = 314
        Height = 17
        Hint = ''
        Caption = 'Regras Aplicadas para produtos com Substitui'#231#227'o Tributaria'
        TabOrder = 0
      end
      object chbx_Operac: TUniCheckBox
        Left = 7
        Top = 39
        Width = 290
        Height = 17
        Hint = ''
        Caption = 'Regras Aplicadas para Opera'#231#227'o com Consumidor Final'
        TabOrder = 1
      end
      object chbx_crt: TUniCheckBox
        Left = 7
        Top = 56
        Width = 322
        Height = 17
        Hint = ''
        Caption = 'Destinat'#225'rio Optante pelo Simples Nacional'
        TabOrder = 2
      end
      object chbx_Dif: TUniCheckBox
        Left = 7
        Top = 72
        Width = 138
        Height = 17
        Hint = ''
        Caption = 'Imposto ICMS Diferido'
        TabOrder = 3
      end
      object chbx_Sub_Tri: TUniCheckBox
        Left = 7
        Top = 88
        Width = 266
        Height = 17
        Hint = ''
        Caption = 'Regra Aplicada como Substituido Tributario - ICMS '
        TabOrder = 4
      end
      object chbx_Direcao_Entrada: TUniCheckBox
        Left = 7
        Top = 106
        Width = 146
        Height = 17
        Hint = ''
        Caption = 'Utilizar CFOP de Entrada'
        TabOrder = 5
        OnClick = chbx_Direcao_EntradaClick
      end
      object Cb_trans: TUniComboBox
        Left = 342
        Top = 36
        Width = 203
        Hint = ''
        Style = csDropDownList
        Text = '0 - Outras'
        Items.Strings = (
          '0 - Outras'
          '1 - Revenda'
          '2 - Produ'#231#227'o'
          '3 - Consignado'
          '4 - Industrializa'#231#227'o'
          '5 - Consumo Interno'
          '6 - Presta'#231#227'o de Servi'#231'o'
          '7 - Ativo Imobilizado')
        ItemIndex = 0
        TabOrder = 7
        IconItems = <>
      end
      object UniLabel4: TUniLabel
        Left = 342
        Top = 21
        Width = 178
        Height = 14
        Hint = ''
        Caption = 'Tipo da transi'#231#227'o do Produto/Servi'#231'o'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 11
      end
      object UniLabel6: TUniLabel
        Left = 342
        Top = 98
        Width = 119
        Height = 14
        Hint = ''
        Caption = 'C'#243'd. Class. Fiscal (NCM)'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 12
      end
      object E_Cod_Class: TUniEdit
        Left = 342
        Top = 113
        Width = 128
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 9
      end
      object Ctn_State: TUniContainerPanel
        Left = 342
        Top = 61
        Width = 92
        Height = 37
        Hint = ''
        ParentColor = False
        TabOrder = 8
      end
      object chbx_Prop: TUniCheckBox
        Left = 7
        Top = 122
        Width = 290
        Height = 17
        Hint = ''
        Caption = 'Propaga Redu'#231#227'o Base Icms S.T'
        TabOrder = 6
      end
    end
    object Ctn_Observation: TUniContainerPanel
      Left = 2
      Top = 418
      Width = 563
      Height = 36
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 7
    end
    object Ctn_CFOP: TUniContainerPanel
      Left = 2
      Top = 454
      Width = 563
      Height = 39
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 8
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 496
    Top = 248
  end
end
