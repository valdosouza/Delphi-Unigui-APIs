inherited TasOrder: TTasOrder
  ClientHeight = 440
  ClientWidth = 775
  Caption = 'Ordem'
  ExplicitWidth = 791
  ExplicitHeight = 499
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 376
    Width = 775
    ExplicitTop = 376
    ExplicitWidth = 775
    inherited Sb_Close: TUniSpeedButton
      Left = 652
      ExplicitLeft = 652
    end
    object Sb_Invoice: TUniSpeedButton
      AlignWithMargins = True
      Left = 466
      Top = 5
      Width = 93
      Height = 54
      Hint = ''
      Margins.Left = 0
      Margins.Right = 0
      Caption = 'Faturar'
      Align = alLeft
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 7
      OnClick = Sb_InvoiceClick
    end
    object Sb_print: TUniSpeedButton
      AlignWithMargins = True
      Left = 559
      Top = 5
      Width = 93
      Height = 54
      Hint = ''
      Margins.Left = 0
      Margins.Right = 0
      Caption = 'Imprimir'
      Align = alLeft
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 8
      OnClick = Sb_printClick
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 775
    Height = 376
    ExplicitWidth = 775
    ExplicitHeight = 376
  end
  inherited MenuTask: TUniMainMenu
    Left = 592
    Top = 120
  end
end
