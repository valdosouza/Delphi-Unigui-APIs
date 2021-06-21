inherited CadPrivilege: TCadPrivilege
  ClientHeight = 129
  ClientWidth = 567
  Caption = 'Cadastro de Privil'#233'gio'
  ExplicitWidth = 583
  ExplicitHeight = 188
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 65
    Width = 567
    ExplicitTop = 49
    ExplicitWidth = 567
  end
  inherited pnl_fundo: TUniPanel
    Width = 567
    Height = 65
    ExplicitWidth = 567
    ExplicitHeight = 49
    object pnl_row_1: TUniPanel
      Left = 2
      Top = 2
      Width = 563
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 1
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
        TabOrder = 1
        ReadOnly = True
        FieldLabel = 'C'#243'digo'
        FieldLabelAlign = laTop
        ExplicitLeft = 4
        ExplicitTop = 5
        ExplicitHeight = 44
      end
      object E_Description: TUniEdit
        AlignWithMargins = True
        Left = 65
        Top = 3
        Width = 495
        Height = 46
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Align = alClient
        TabOrder = 2
        FieldLabel = 'Descri'#231#227'o'
        FieldLabelAlign = laTop
        ExplicitLeft = 67
        ExplicitTop = 5
        ExplicitWidth = 493
        ExplicitHeight = 120
      end
    end
  end
  inherited MenuTask: TUniMainMenu
    Top = 80
  end
end
