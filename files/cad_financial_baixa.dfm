inherited CadFinancialBaixa: TCadFinancialBaixa
  ClientHeight = 136
  ClientWidth = 247
  Caption = 'CadFinancialBaixa'
  BorderIcons = [biSystemMenu]
  ExplicitWidth = 263
  ExplicitHeight = 195
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_botao: TUniPanel [0]
    Left = 0
    Top = 72
    Width = 247
    Height = 64
    Hint = ''
    Align = alBottom
    TabOrder = 0
    BorderStyle = ubsFrameLowered
    Caption = ''
    Layout = 'auto'
    object SB_Confirm: TUniSpeedButton
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 93
      Height = 54
      Hint = ''
      Margins.Right = 0
      Caption = 'Confirmar'
      Align = alLeft
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 1
      OnClick = SB_ConfirmClick
    end
    object SB_Cancel: TUniSpeedButton
      AlignWithMargins = True
      Left = 98
      Top = 5
      Width = 93
      Height = 54
      Hint = ''
      Margins.Left = 0
      Margins.Right = 0
      Caption = 'Cancelar'
      Align = alLeft
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 2
      OnClick = SB_CancelClick
    end
  end
  object pnl_fundo: TUniPanel [1]
    Left = 0
    Top = 0
    Width = 247
    Height = 72
    Hint = ''
    Align = alClient
    TabOrder = 1
    BorderStyle = ubsFrameLowered
    Caption = ''
    Layout = 'auto'
    object Dtp_Payment: TUniDateTimePicker
      Left = 124
      Top = 21
      Width = 100
      Hint = ''
      DateTime = 43014.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 1
    end
    object UniLabel5: TUniLabel
      Left = 124
      Top = 6
      Width = 95
      Height = 13
      Hint = ''
      Caption = 'Data da Pagamento'
      TabOrder = 2
    end
    object UniLabel6: TUniLabel
      Left = 8
      Top = 6
      Width = 78
      Height = 13
      Hint = ''
      Caption = 'Numero da Nota'
      TabOrder = 3
    end
  end
  object E_Nr_Invoice: TUniEdit [2]
    Left = 7
    Top = 21
    Width = 110
    Hint = ''
    Text = ''
    TabOrder = 2
  end
  inherited MenuTask: TUniMainMenu
    Left = 56
    Top = 80
  end
  object cds_Baixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    Left = 80
    Top = 20
    object cds_Baixaid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_Baixatag_value: TBCDField
      FieldName = 'tag_value'
      Required = True
      Precision = 10
      Size = 2
    end
    object cds_Baixaparcel: TIntegerField
      FieldName = 'parcel'
      Required = True
    end
  end
end
