inherited CadClinModule: TCadClinModule
  ClientHeight = 133
  ClientWidth = 583
  Caption = ''
  ExplicitWidth = 599
  ExplicitHeight = 192
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 69
    Width = 583
    ExplicitTop = 69
    ExplicitWidth = 583
  end
  inherited pnl_fundo: TUniPanel
    Top = 52
    Width = 583
    Height = 17
    ExplicitTop = 52
    ExplicitWidth = 583
    ExplicitHeight = 17
  end
  object pnl_row_1: TUniPanel [2]
    Left = 0
    Top = 0
    Width = 583
    Height = 52
    Hint = ''
    Align = alTop
    TabOrder = 2
    BorderStyle = ubsNone
    Caption = ''
    object E_ID: TUniEdit
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 56
      Height = 46
      Hint = ''
      Text = ''
      Align = alLeft
      TabOrder = 0
      ReadOnly = True
      FieldLabel = 'C'#243'digo'
      FieldLabelAlign = laTop
    end
    object E_Sequencia: TUniEdit
      AlignWithMargins = True
      Left = 65
      Top = 3
      Width = 56
      Height = 46
      Hint = ''
      Text = ''
      Align = alLeft
      TabOrder = 1
      ReadOnly = True
      FieldLabel = 'Sequencia'
      FieldLabelAlign = laTop
    end
    object E_Description: TUniEdit
      AlignWithMargins = True
      Left = 127
      Top = 3
      Width = 453
      Height = 46
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      Align = alClient
      TabOrder = 2
      FieldLabel = 'Descri'#231#227'o'
      FieldLabelAlign = laTop
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 8
    Top = 64
  end
end
