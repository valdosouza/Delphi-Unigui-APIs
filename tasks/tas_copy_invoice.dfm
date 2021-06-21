inherited TasCopyInvoice: TTasCopyInvoice
  ClientHeight = 215
  ClientWidth = 217
  Caption = 'C'#243'pia de Nota Fiscal'
  BorderStyle = bsSingle
  BorderIcons = [biSystemMenu]
  ExplicitWidth = 223
  ExplicitHeight = 264
  PixelsPerInch = 96
  TextHeight = 13
  object UniPanel1: TUniPanel [0]
    Left = 0
    Top = 0
    Width = 217
    Height = 142
    Hint = ''
    Align = alClient
    TabOrder = 0
    BorderStyle = ubsFrameLowered
    Caption = ''
    object cb_kind_operation: TUniComboBox
      Left = 6
      Top = 69
      Width = 204
      Hint = ''
      Style = csDropDownList
      Text = 'COMPRA'
      Items.Strings = (
        'COMPRA'
        'VENDA'
        'AJUSTES'
        'ROMANEIO'
        'TRANSFER'#202'NCIA'
        'PRODU'#199#195'O'
        'ENGENHARIA')
      ItemIndex = 0
      TabOrder = 1
      IconItems = <>
    end
    object UniLabel1: TUniLabel
      Left = 6
      Top = 51
      Width = 107
      Height = 13
      Hint = ''
      Caption = 'Tipo de Movimenta'#231#227'o'
      TabOrder = 2
    end
    object Rg_kind_Doc: TUniRadioGroup
      Left = 6
      Top = 3
      Width = 204
      Height = 45
      Hint = ''
      Items.Strings = (
        'Ordem'
        'Nota Fiscal')
      ItemIndex = 0
      Caption = 'Tipo de Documento'
      TabOrder = 3
      Columns = 2
      OnClick = Rg_kind_DocClick
    end
    object UniLabel5: TUniLabel
      Left = 7
      Top = 92
      Width = 109
      Height = 14
      Hint = ''
      Caption = 'N'#250'mero do Documento'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 4
    end
    object E_Nr_Documento: TUniEdit
      Left = 6
      Top = 109
      Width = 115
      Hint = ''
      Text = ''
      TabOrder = 5
    end
  end
  object UniPanel2: TUniPanel [1]
    Left = 0
    Top = 142
    Width = 217
    Height = 73
    Hint = ''
    Align = alBottom
    TabOrder = 1
    BorderStyle = ubsFrameLowered
    Caption = ''
    DesignSize = (
      217
      73)
    object Sb_Confirm: TUniSpeedButton
      Left = 17
      Top = 6
      Width = 97
      Height = 58
      Hint = ''
      Caption = 'Confirmar'
      Anchors = [akRight, akBottom]
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 1
      OnClick = Sb_ConfirmClick
    end
    object Sb_Abort: TUniSpeedButton
      Left = 114
      Top = 6
      Width = 97
      Height = 58
      Hint = ''
      Caption = 'Cancela'
      Anchors = [akRight, akBottom]
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 2
      OnClick = Sb_AbortClick
    end
  end
end
