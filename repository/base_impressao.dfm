inherited BaseImpressao: TBaseImpressao
  ClientHeight = 380
  ClientWidth = 588
  Caption = 'Base Impress'#227'o'
  BorderStyle = bsSingle
  BorderIcons = [biSystemMenu]
  ExplicitHeight = 408
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_Botao: TUniPanel [0]
    Left = 0
    Top = 314
    Width = 588
    Height = 66
    Hint = ''
    Align = alBottom
    TabOrder = 0
    BorderStyle = ubsFrameLowered
    Caption = ''
    DesignSize = (
      588
      66)
    object SB_Print: TUniSpeedButton
      Left = 10
      Top = 4
      Width = 93
      Height = 54
      Hint = ''
      Caption = 'Imprimir'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 1
      OnClick = SB_PrintClick
    end
    object SB_Export: TUniSpeedButton
      Left = 311
      Top = 3
      Width = 93
      Height = 54
      Hint = ''
      Visible = False
      Caption = 'Exportar'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 2
      OnClick = SB_ExportClick
    end
    object Sb_Close: TUniSpeedButton
      Left = 103
      Top = 4
      Width = 95
      Height = 54
      Hint = ''
      Caption = 'Sair'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 3
      OnClick = Sb_CloseClick
    end
  end
  object pnl_Lista: TUniPanel [1]
    Left = 0
    Top = 0
    Width = 169
    Height = 314
    Hint = ''
    Align = alLeft
    TabOrder = 1
    BorderStyle = ubsFrameLowered
    Caption = ''
    object Lbx_reports: TUniListBox
      Left = 2
      Top = 15
      Width = 165
      Height = 297
      Hint = ''
      Align = alClient
      TabOrder = 1
    end
    object UniLabel1: TUniLabel
      Left = 2
      Top = 2
      Width = 165
      Height = 13
      Hint = ''
      Alignment = taCenter
      AutoSize = False
      Caption = 'Lista de Relat'#243'rios'
      Align = alTop
      ParentFont = False
      Font.Color = clBlack
      Font.Style = [fsBold]
      ParentColor = False
      Color = clBtnFace
      TabOrder = 2
    end
  end
  object Parâmetros: TUniGroupBox [2]
    Left = 169
    Top = 0
    Width = 419
    Height = 314
    Hint = ''
    Caption = 'Par'#226'metros'
    Align = alClient
    TabOrder = 2
  end
end
