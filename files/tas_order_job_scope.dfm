inherited TasOrderJobScope: TTasOrderJobScope
  ClientHeight = 370
  ClientWidth = 568
  Caption = 'Escopo do Obra'
  BorderStyle = bsDialog
  ExplicitWidth = 574
  ExplicitHeight = 419
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_fundo: TUniPanel [0]
    Left = 0
    Top = 0
    Width = 568
    Height = 306
    Hint = ''
    Align = alClient
    TabOrder = 0
    BorderStyle = ubsFrameLowered
    Caption = ''
    object L_NameCompany: TUniLabel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 155
      Height = 14
      Hint = ''
      Caption = 'Descri'#231#227'o da Frente de trabalho'
      Align = alTop
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 6
      ExplicitLeft = 3
      ExplicitTop = 3
    end
    object E_Description: TUniEdit
      AlignWithMargins = True
      Left = 5
      Top = 25
      Width = 558
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      Align = alTop
      TabOrder = 0
      ExplicitLeft = 10
      ExplicitTop = 18
      ExplicitWidth = 555
    end
    object E_Detail: TUniMemo
      AlignWithMargins = True
      Left = 5
      Top = 73
      Width = 558
      Height = 133
      Hint = ''
      Align = alTop
      TabOrder = 1
    end
    object UniLabel1: TUniLabel
      AlignWithMargins = True
      Left = 5
      Top = 53
      Width = 119
      Height = 14
      Hint = ''
      Caption = 'Detalhamento do escopo'
      Align = alTop
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 7
    end
    object Ctn_WorkFront: TUniContainerPanel
      AlignWithMargins = True
      Left = 5
      Top = 212
      Width = 558
      Height = 37
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 2
      ExplicitLeft = 3
      ExplicitTop = 191
      ExplicitWidth = 564
    end
    object L_DtRegistry: TUniLabel
      Left = 9
      Top = 255
      Width = 114
      Height = 14
      Hint = ''
      Caption = 'Previs'#227'o de Finaliza'#231#227'o'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 8
    end
    object Dtp_Forecast: TUniDateTimePicker
      Left = 7
      Top = 270
      Width = 120
      Hint = ''
      DateTime = 42544.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 3
    end
    object E_Vl_Forecast: TUniEdit
      Left = 130
      Top = 270
      Width = 121
      Hint = ''
      Alignment = taRightJustify
      Text = '0,00'
      TabOrder = 4
    end
    object UniLabel2: TUniLabel
      Left = 133
      Top = 255
      Width = 67
      Height = 14
      Hint = ''
      Caption = 'Valor Previsto'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 9
    end
  end
  object pnl_botao: TUniPanel [1]
    Left = 0
    Top = 306
    Width = 568
    Height = 64
    Hint = ''
    Align = alBottom
    TabOrder = 1
    BorderStyle = ubsFrameLowered
    Caption = ''
    ExplicitTop = 279
    DesignSize = (
      568
      64)
    object SB_Save: TUniSpeedButton
      Left = 5
      Top = 6
      Width = 93
      Height = 54
      Hint = ''
      Caption = 'Gravar'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 1
      OnClick = SB_SaveClick
    end
    object SB_Cancel: TUniSpeedButton
      Left = 98
      Top = 6
      Width = 93
      Height = 54
      Hint = ''
      Caption = 'Cancelar'
      Anchors = [akLeft, akBottom]
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
end
