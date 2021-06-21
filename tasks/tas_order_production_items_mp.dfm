inherited TasOrderProductionItemsMp: TTasOrderProductionItemsMp
  ClientHeight = 199
  ClientWidth = 580
  Caption = 'Tarefa - Lan'#231'amento de Itens'
  MonitoredKeys.Enabled = True
  MonitoredKeys.KeyEnableAll = True
  ExplicitWidth = 596
  ExplicitHeight = 258
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_Top: TUniPanel [0]
    Left = 0
    Top = 0
    Width = 580
    Height = 50
    Hint = ''
    Align = alTop
    TabOrder = 0
    BorderStyle = ubsFrameLowered
    Caption = ''
    object ctn_Stock_List: TUniContainerPanel
      Left = 2
      Top = 2
      Width = 576
      Height = 46
      Hint = ''
      ParentColor = False
      Align = alClient
      TabOrder = 0
    end
  end
  object pnl_Fundo: TUniPanel [1]
    Left = 0
    Top = 50
    Width = 580
    Height = 85
    Hint = ''
    Align = alClient
    TabOrder = 1
    BorderStyle = ubsFrameLowered
    Caption = ''
    object UniLabel11: TUniLabel
      Left = 4
      Top = 41
      Width = 67
      Height = 14
      Hint = ''
      Caption = 'Valor Unit'#225'rio '
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 6
    end
    object E_Unit_Value: TUniFormattedNumberEdit
      Left = 3
      Top = 56
      Width = 116
      Hint = ''
      Alignment = taRightJustify
      TabOrder = 1
      DecimalUseOSDefault = True
      OnExit = E_Unit_ValueExit
    end
    object UniLabel18: TUniLabel
      Left = 121
      Top = 40
      Width = 55
      Height = 14
      Hint = ''
      Caption = 'Quantidade'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 7
    end
    object E_Qtty: TUniFormattedNumberEdit
      Left = 121
      Top = 56
      Width = 61
      Hint = ''
      Alignment = taRightJustify
      TabOrder = 2
      DecimalUseOSDefault = True
      OnExit = E_QttyExit
    end
    object UniLabel17: TUniLabel
      Left = 184
      Top = 40
      Width = 39
      Height = 14
      Hint = ''
      Caption = 'Unidade'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 8
    end
    object E_Measure: TUniEdit
      Left = 184
      Top = 56
      Width = 47
      Hint = ''
      Text = ''
      TabOrder = 3
      TabStop = False
      ReadOnly = True
    end
    object UniLabel5: TUniLabel
      Left = 459
      Top = 40
      Width = 50
      Height = 14
      Hint = ''
      Caption = 'Valor Total'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 9
    end
    object E_Total_Value: TUniFormattedNumberEdit
      Left = 458
      Top = 56
      Width = 116
      Hint = ''
      Alignment = taRightJustify
      ParentFont = False
      Font.Color = clLime
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 4
      TabStop = False
      Color = clBlack
      ReadOnly = True
      DecimalUseOSDefault = True
    end
    object ctn_merchandise: TUniContainerPanel
      Left = 2
      Top = 2
      Width = 576
      Height = 36
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 0
    end
  end
  object Pnl_Botao: TUniPanel [2]
    Left = 0
    Top = 135
    Width = 580
    Height = 64
    Hint = ''
    Align = alBottom
    TabOrder = 2
    BorderStyle = ubsFrameLowered
    Caption = ''
    AlignmentControl = uniAlignmentClient
    ParentAlignmentControl = False
    DesignSize = (
      580
      64)
    object Sb_Save: TUniSpeedButton
      Left = 388
      Top = 3
      Width = 93
      Height = 54
      Hint = ''
      Caption = 'Gravar'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 1
      OnClick = Sb_SaveClick
    end
    object Sb_Cancel: TUniSpeedButton
      Left = 481
      Top = 3
      Width = 93
      Height = 54
      Hint = ''
      Caption = 'Cancelar'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 2
      OnClick = Sb_CancelClick
    end
    object UniLabel1: TUniLabel
      Left = 6
      Top = 20
      Width = 49
      Height = 14
      Hint = ''
      Caption = 'ESTOQUE'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      TabOrder = 3
    end
    object E_Stock_Balance: TUniFormattedNumberEdit
      Left = 4
      Top = 35
      Width = 61
      Hint = ''
      Alignment = taRightJustify
      ParentFont = False
      Font.Color = clWhite
      Font.Style = [fsBold]
      TabOrder = 4
      TabStop = False
      Color = clGreen
      ReadOnly = True
      DecimalSeparator = ','
      ThousandSeparator = '.'
    end
  end
end
