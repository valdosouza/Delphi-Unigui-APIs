inherited CadBankChargeTicket: TCadBankChargeTicket
  ClientHeight = 239
  ClientWidth = 571
  Caption = 'Cadadastro de Carteira de Cobran'#231'a'
  ExplicitWidth = 587
  ExplicitHeight = 298
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 175
    Width = 571
    ExplicitTop = 134
    ExplicitWidth = 571
  end
  inherited pnl_fundo: TUniPanel
    Width = 571
    Height = 175
    ExplicitTop = -2
    ExplicitWidth = 571
    ExplicitHeight = 276
    object pnl_row_1: TUniPanel
      Left = 2
      Top = 2
      Width = 567
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 1
      BorderStyle = ubsNone
      Caption = ''
      ExplicitLeft = 3
      ExplicitTop = 3
      object Ctn_Bank: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 567
        Height = 52
        Hint = ''
        ParentColor = False
        Align = alClient
        TabOrder = 1
        ExplicitLeft = -203
        ExplicitTop = 11
        ExplicitWidth = 459
        ExplicitHeight = 38
      end
    end
    object pnl_row_2: TUniPanel
      Left = 2
      Top = 54
      Width = 567
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 2
      BorderStyle = ubsNone
      Caption = ''
      ExplicitLeft = 0
      ExplicitTop = 276
      ExplicitWidth = 571
      object E_Number: TUniEdit
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 198
        Height = 46
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 1
        FieldLabel = 'C'#243'digo/N'#250'mero'
        FieldLabelAlign = laTop
      end
      object Rg_Emission_By: TUniRadioGroup
        AlignWithMargins = True
        Left = 207
        Top = 3
        Width = 185
        Height = 46
        Hint = ''
        Items.Strings = (
          'Cliente'
          'Banco')
        Align = alLeft
        Caption = 'Emiss'#227'o'
        TabOrder = 2
        Columns = 2
      end
    end
    object pnl_row_3: TUniPanel
      Left = 2
      Top = 106
      Width = 567
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 3
      BorderStyle = ubsNone
      Caption = ''
      object E_Description: TUniEdit
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 561
        Height = 46
        Hint = ''
        Text = ''
        Align = alClient
        TabOrder = 1
        FieldLabel = 'Descri'#231#227'o Carteira'
        FieldLabelAlign = laTop
        ExplicitLeft = -300
        ExplicitTop = 106
        ExplicitWidth = 556
        ExplicitHeight = 22
      end
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 72
    Top = 224
  end
end
