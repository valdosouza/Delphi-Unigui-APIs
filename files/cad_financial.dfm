inherited CadFinancial: TCadFinancial
  ClientHeight = 490
  ClientWidth = 583
  Caption = 'Cadastro no Financeiro'
  Layout = 'fit'
  ExplicitWidth = 599
  ExplicitHeight = 549
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 422
    Width = 583
    Height = 68
    TabOrder = 1
    ExplicitTop = 422
    ExplicitWidth = 583
    ExplicitHeight = 68
    inherited SB_Insert: TUniSpeedButton
      Left = 221
      Width = 47
      Height = 58
      Visible = False
      ExplicitLeft = 221
      ExplicitWidth = 47
      ExplicitHeight = 58
    end
    inherited SB_Change: TUniSpeedButton
      Left = 268
      Width = 47
      Height = 58
      Visible = False
      ExplicitLeft = 268
      ExplicitWidth = 47
      ExplicitHeight = 58
    end
    inherited SB_Delete: TUniSpeedButton
      Left = 315
      Width = 49
      Height = 58
      Visible = False
      ExplicitLeft = 315
      ExplicitWidth = 49
      ExplicitHeight = 58
    end
    inherited SB_Save: TUniSpeedButton
      Left = 2
      Height = 58
      ExplicitLeft = 2
      ExplicitHeight = 58
    end
    inherited SB_Cancel: TUniSpeedButton
      Left = 95
      Height = 58
      ExplicitLeft = 95
      ExplicitHeight = 58
    end
    inherited Sb_Close: TUniSpeedButton
      Left = 188
      Width = 30
      Height = 58
      Visible = False
      ExplicitLeft = 188
      ExplicitWidth = 30
      ExplicitHeight = 58
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 583
    Height = 173
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 583
    ExplicitHeight = 173
    DesignSize = (
      583
      173)
    object UniLabel2: TUniLabel
      Left = 5
      Top = 4
      Width = 84
      Height = 13
      Hint = ''
      Caption = 'Data Lan'#231'amento'
      TabOrder = 8
    end
    object Dtp_Emission: TUniDateTimePicker
      Left = 4
      Top = 20
      Width = 94
      Hint = ''
      DateTime = 42979.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 0
    end
    object E_Nr_Doc: TUniEdit
      Left = 99
      Top = 20
      Width = 116
      Hint = ''
      Text = ''
      TabOrder = 1
    end
    object UniLabel1: TUniLabel
      Left = 101
      Top = 5
      Width = 110
      Height = 13
      Hint = ''
      Caption = 'Nota Fiscal/Documento'
      TabOrder = 9
    end
    object UniLabel3: TUniLabel
      Left = 217
      Top = 5
      Width = 89
      Height = 13
      Hint = ''
      Caption = 'Modelo Nota Fiscal'
      TabOrder = 10
    end
    object E_Mod_Doc: TUniEdit
      Left = 217
      Top = 20
      Width = 102
      Hint = ''
      Text = ''
      TabOrder = 2
    end
    object UniLabel4: TUniLabel
      Left = 321
      Top = 5
      Width = 79
      Height = 13
      Hint = ''
      Caption = 'S'#233'rie Nota Fiscal'
      TabOrder = 11
    end
    object E_Doc_Serie: TUniEdit
      Left = 321
      Top = 20
      Width = 102
      Hint = ''
      Text = ''
      TabOrder = 3
      OnExit = E_Doc_SerieExit
    end
    object Ctn_Cfop: TUniContainerPanel
      Left = 3
      Top = 46
      Width = 573
      Height = 38
      Hint = ''
      ParentColor = False
      TabOrder = 4
    end
    object Ctn_Entity_Fiscal: TUniContainerPanel
      Left = 3
      Top = 86
      Width = 573
      Height = 37
      Hint = ''
      ParentColor = False
      TabOrder = 5
    end
    object Lb_VL_Doc: TUniLabel
      Left = 6
      Top = 125
      Width = 96
      Height = 13
      Hint = ''
      Caption = 'Valor do Documento'
      TabOrder = 12
    end
    object E_VL_Doc: TUniNumberEdit
      Left = 4
      Top = 140
      Width = 121
      Hint = ''
      Alignment = taRightJustify
      TabOrder = 6
      DecimalSeparator = ','
      OnExit = E_VL_DocExit
    end
    object UniLabel5: TUniLabel
      Left = 126
      Top = 126
      Width = 315
      Height = 14
      Hint = ''
      Caption = 'N'#250'mero de Parcelas e Prazo - Separe os os prazos com / (barra)'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 13
    end
    object E_Plots: TUniEdit
      Left = 126
      Top = 140
      Width = 48
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      TabOrder = 14
    end
    object E_DeadLine: TUniEdit
      Left = 177
      Top = 140
      Width = 399
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 15
      OnExit = E_DeadLineExit
    end
  end
  object UniPageControl1: TUniPageControl [2]
    Left = 0
    Top = 173
    Width = 583
    Height = 249
    Hint = ''
    ActivePage = UniTabSheet2
    Align = alClient
    TabOrder = 2
    object tbs_Parcelamento: TUniTabSheet
      Hint = ''
      Caption = 'Parcelamento'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object ctn_Financial: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 575
        Height = 221
        Hint = ''
        ParentColor = False
        Align = alClient
        TabOrder = 0
      end
    end
    object UniTabSheet2: TUniTabSheet
      Hint = ''
      Caption = 'Observa'#231#227'o'
      object m_note: TUniMemo
        Left = 0
        Top = 0
        Width = 575
        Height = 221
        Hint = ''
        Align = alClient
        TabOrder = 0
      end
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 88
    Top = 65528
  end
end
