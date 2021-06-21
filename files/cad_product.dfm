inherited CadProduct: TCadProduct
  ClientHeight = 469
  ClientWidth = 628
  Caption = 'Cadastro de Produtos'
  ExplicitWidth = 644
  ExplicitHeight = 528
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 405
    Width = 628
    ExplicitTop = 405
    ExplicitWidth = 628
    inherited SB_Insert: TUniSpeedButton
      ExplicitTop = 5
    end
    inherited SB_Change: TUniSpeedButton
      ExplicitTop = 5
    end
    inherited SB_Save: TUniSpeedButton
      ExplicitTop = 5
    end
    inherited Sb_Close: TUniSpeedButton
      ExplicitTop = 5
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 628
    Height = 405
    ExplicitTop = 0
    ExplicitWidth = 628
    ExplicitHeight = 405
    object ctn_Category: TUniContainerPanel
      Left = 2
      Top = 105
      Width = 624
      Height = 46
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 1
    end
    object Pg_Main: TUniPageControl
      Left = 2
      Top = 151
      Width = 624
      Height = 252
      Hint = ''
      ActivePage = tb_Obs
      Align = alClient
      TabOrder = 2
      object tb_Obs: TUniTabSheet
        Hint = ''
        Caption = 'Observa'#231#227'o'
        object E_note: TUniMemo
          Left = 0
          Top = 0
          Width = 616
          Height = 141
          Hint = ''
          Align = alTop
          TabOrder = 0
        end
        object ChBx_highlights: TUniCheckBox
          AlignWithMargins = True
          Left = 3
          Top = 158
          Width = 610
          Height = 17
          Hint = ''
          Margins.Top = 0
          Margins.Bottom = 0
          Caption = 'Produto em Destaque'
          Align = alTop
          TabOrder = 1
        end
        object ChBx_active: TUniCheckBox
          AlignWithMargins = True
          Left = 3
          Top = 192
          Width = 610
          Height = 17
          Hint = ''
          Margins.Top = 0
          Margins.Bottom = 0
          Caption = 'Produto encontra-se ativo para qualquer transa'#231#227'o'
          Align = alTop
          TabOrder = 2
        end
        object chbx_published: TUniCheckBox
          AlignWithMargins = True
          Left = 3
          Top = 175
          Width = 610
          Height = 17
          Hint = ''
          Margins.Top = 0
          Margins.Bottom = 0
          Caption = 'Produto Publicado na Internet'
          Align = alTop
          TabOrder = 3
        end
        object chbx_promotion: TUniCheckBox
          AlignWithMargins = True
          Left = 3
          Top = 141
          Width = 610
          Height = 17
          Hint = ''
          Margins.Top = 0
          Margins.Bottom = 0
          Caption = 'Produto em Promo'#231#227'o'
          Align = alTop
          TabOrder = 4
        end
      end
    end
    object pnl_topo: TUniPanel
      Left = 2
      Top = 2
      Width = 624
      Height = 47
      Hint = ''
      Align = alTop
      TabOrder = 3
      BorderStyle = ubsNone
      Caption = 'pnl_linha_1'
      object L_Codigo: TUniLabel
        Left = 5
        Top = 6
        Width = 33
        Height = 14
        Hint = ''
        Caption = 'C'#243'digo'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 1
      end
      object UniLabel1: TUniLabel
        Left = 64
        Top = 6
        Width = 108
        Height = 14
        Hint = ''
        Caption = 'C'#243'digo Interno/F'#225'brica'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 2
      end
      object E_ID: TUniEdit
        Left = 5
        Top = 21
        Width = 56
        Hint = ''
        Text = ''
        TabOrder = 3
        TabStop = False
        ReadOnly = True
      end
      object E_Identifier: TUniEdit
        Left = 64
        Top = 21
        Width = 135
        Hint = ''
        Text = ''
        TabOrder = 4
      end
    end
    object pnl_linha_2: TUniPanel
      Left = 2
      Top = 49
      Width = 624
      Height = 56
      Hint = ''
      Align = alTop
      TabOrder = 4
      BorderStyle = ubsNone
      Caption = ''
      object L_NameCompany: TUniLabel
        Left = 3
        Top = 4
        Width = 49
        Height = 14
        Hint = ''
        Caption = 'Descri'#231#227'o'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 1
      end
      object E_Description: TUniEdit
        Left = 5
        Top = 24
        Width = 435
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        TabOrder = 2
      end
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 288
    Top = 16
    inherited MnuTarefas: TUniMenuItem
      object Configurao1: TUniMenuItem
        Caption = 'Configura'#231#227'o'
        OnClick = Configurao1Click
      end
    end
  end
end
