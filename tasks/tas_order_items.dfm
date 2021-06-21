inherited TasOrderItems: TTasOrderItems
  ClientHeight = 285
  ClientWidth = 701
  Caption = 'Tarefa - Lan'#231'amento de Itens'
  MonitoredKeys.Enabled = True
  MonitoredKeys.KeyEnableAll = True
  ExplicitWidth = 717
  ExplicitHeight = 344
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_Top: TUniPanel [0]
    Left = 0
    Top = 0
    Width = 701
    Height = 50
    Hint = ''
    Align = alTop
    TabOrder = 0
    BorderStyle = ubsFrameLowered
    Caption = ''
    object ctn_Stock_List: TUniContainerPanel
      Left = 4
      Top = 4
      Width = 688
      Height = 43
      Hint = ''
      ParentColor = False
      TabOrder = 0
    end
  end
  object pnl_Fundo: TUniPanel [1]
    Left = 0
    Top = 50
    Width = 701
    Height = 86
    Hint = ''
    Align = alClient
    TabOrder = 1
    BorderStyle = ubsFrameLowered
    Caption = ''
    object UniLabel11: TUniLabel
      Left = 579
      Top = 2
      Width = 67
      Height = 14
      Hint = ''
      Caption = 'Valor Unit'#225'rio '
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 9
    end
    object E_Unit_Value: TUniFormattedNumberEdit
      Left = 578
      Top = 17
      Width = 116
      Hint = ''
      Alignment = taRightJustify
      TabOrder = 1
      DecimalUseOSDefault = True
      OnExit = E_Unit_ValueExit
    end
    object UniLabel18: TUniLabel
      Left = 5
      Top = 40
      Width = 55
      Height = 14
      Hint = ''
      Caption = 'Quantidade'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 10
    end
    object E_Qtty: TUniFormattedNumberEdit
      Left = 5
      Top = 56
      Width = 61
      Hint = ''
      Alignment = taRightJustify
      TabOrder = 2
      DecimalUseOSDefault = True
      OnExit = E_QttyExit
    end
    object UniLabel17: TUniLabel
      Left = 68
      Top = 40
      Width = 39
      Height = 14
      Hint = ''
      Caption = 'Unidade'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 11
    end
    object E_Measure: TUniEdit
      Left = 68
      Top = 56
      Width = 47
      Hint = ''
      Text = ''
      TabOrder = 3
      TabStop = False
      ReadOnly = True
    end
    object UniLabel16: TUniLabel
      Left = 118
      Top = 40
      Width = 96
      Height = 14
      Hint = ''
      Caption = 'SubTotal do Produto'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 12
    end
    object E_Total_Product: TUniFormattedNumberEdit
      AlignWithMargins = True
      Left = 118
      Top = 56
      Width = 101
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
    object UniLabel15: TUniLabel
      Left = 221
      Top = 40
      Width = 52
      Height = 14
      Hint = ''
      Caption = 'Aliq. Desc.'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 13
    end
    object E_Aliq_Desconto: TUniFormattedNumberEdit
      Left = 221
      Top = 56
      Width = 63
      Hint = ''
      Alignment = taRightJustify
      TabOrder = 5
      DecimalUseOSDefault = True
      OnExit = E_Aliq_DescontoExit
    end
    object UniLabel14: TUniLabel
      Left = 286
      Top = 40
      Width = 56
      Height = 14
      Hint = ''
      Caption = 'Valor Desc.'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 14
    end
    object E_Vl_Desconto: TUniFormattedNumberEdit
      Left = 286
      Top = 56
      Width = 65
      Hint = ''
      Alignment = taRightJustify
      TabOrder = 6
      DecimalUseOSDefault = True
      OnExit = E_Vl_DescontoExit
    end
    object UniLabel5: TUniLabel
      Left = 579
      Top = 40
      Width = 50
      Height = 14
      Hint = ''
      Caption = 'Valor Total'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 15
    end
    object E_Total_Value: TUniFormattedNumberEdit
      Left = 578
      Top = 56
      Width = 116
      Hint = ''
      Alignment = taRightJustify
      ParentFont = False
      Font.Color = clLime
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 7
      TabStop = False
      Color = clBlack
      ReadOnly = True
      DecimalUseOSDefault = True
    end
    object ctn_merchandise: TUniContainerPanel
      Left = 4
      Top = 4
      Width = 569
      Height = 36
      Hint = ''
      ParentColor = False
      TabOrder = 0
    end
  end
  object Pnl_Botao: TUniPanel [2]
    Left = 0
    Top = 221
    Width = 701
    Height = 64
    Hint = ''
    Align = alBottom
    TabOrder = 3
    BorderStyle = ubsFrameLowered
    Caption = ''
    AlignmentControl = uniAlignmentClient
    ParentAlignmentControl = False
    DesignSize = (
      701
      64)
    object Sb_Save: TUniSpeedButton
      Left = 509
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
      Left = 602
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
      Top = 22
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
      Top = 37
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
  object pnl_detalhes: TUniPanel [3]
    Left = 0
    Top = 136
    Width = 701
    Height = 85
    Hint = ''
    Align = alBottom
    TabOrder = 2
    BorderStyle = ubsFrameLowered
    Caption = ''
    object lb_work_front: TUniLabel
      Left = 4
      Top = 4
      Width = 129
      Height = 14
      Hint = ''
      Caption = 'Frente/Lota'#231#227'o/Refer'#234'ncia'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 4
    end
    object E_Work_Front: TUniEdit
      Left = 4
      Top = 19
      Width = 347
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      TabOrder = 0
    end
    object UniLabel2: TUniLabel
      Left = 4
      Top = 41
      Width = 131
      Height = 14
      Hint = ''
      Caption = 'Observa'#231#227'o/Especifica'#231#227'o'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 5
    end
    object E_Note: TUniEdit
      Left = 4
      Top = 56
      Width = 690
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      TabOrder = 2
    end
    object L_DtRegistry: TUniLabel
      Left = 355
      Top = 3
      Width = 64
      Height = 14
      Hint = ''
      Caption = 'Data Prevista'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 6
    end
    object E_DateForecast: TUniDateTimePicker
      Left = 353
      Top = 18
      Width = 99
      Hint = ''
      DateTime = 42544.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 1
    end
  end
end
