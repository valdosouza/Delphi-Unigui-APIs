inherited CadBankAccount: TCadBankAccount
  ClientHeight = 179
  ClientWidth = 633
  Caption = 'Cadastro Contas Banc'#225'rias'
  ExplicitWidth = 649
  ExplicitHeight = 238
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 115
    Width = 633
    ExplicitTop = 96
    ExplicitWidth = 581
  end
  inherited pnl_fundo: TUniPanel
    Width = 633
    Height = 115
    ExplicitTop = 106
    ExplicitWidth = 857
    ExplicitHeight = 159
    object pnl_row_1: TUniPanel
      Left = 2
      Top = 2
      Width = 629
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 1
      BorderStyle = ubsNone
      Caption = ''
      object Ctn_Bank: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 353
        Height = 52
        Hint = ''
        ParentColor = False
        Align = alLeft
        TabOrder = 1
        ExplicitLeft = -3
        ExplicitTop = -3
      end
      object E_Agency: TUniEdit
        AlignWithMargins = True
        Left = 356
        Top = 3
        Width = 78
        Height = 46
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 2
        FieldLabel = 'Ag'#234'ncia'
        FieldLabelAlign = laTop
      end
      object E_Agency_Dv: TUniEdit
        AlignWithMargins = True
        Left = 440
        Top = 3
        Width = 37
        Height = 46
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 3
        FieldLabel = 'D.V'
        FieldLabelAlign = laTop
      end
      object E_Number: TUniEdit
        AlignWithMargins = True
        Left = 483
        Top = 3
        Width = 94
        Height = 46
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 4
        FieldLabel = 'Conta'
        FieldLabelAlign = laTop
      end
      object E_Number_Dv: TUniEdit
        AlignWithMargins = True
        Left = 583
        Top = 3
        Width = 37
        Height = 46
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 5
        FieldLabel = 'D.V'
        FieldLabelAlign = laTop
      end
    end
    object pnl_row_2: TUniPanel
      Left = 2
      Top = 54
      Width = 629
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 2
      BorderStyle = ubsNone
      Caption = ''
      ExplicitTop = 57
      object E_Phone: TUniEdit
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 91
        Height = 46
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 1
        FieldLabel = 'Fone'
        FieldLabelAlign = laTop
      end
      object E_Manager: TUniEdit
        AlignWithMargins = True
        Left = 100
        Top = 3
        Width = 210
        Height = 46
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 2
        FieldLabel = 'Gerente'
        FieldLabelAlign = laTop
      end
      object E_Limit_Value: TUniEdit
        AlignWithMargins = True
        Left = 316
        Top = 3
        Width = 68
        Height = 46
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 3
        FieldLabel = 'Limite'
        FieldLabelAlign = laTop
      end
      object Dt_Dt_Opening: TUniDateTimePicker
        AlignWithMargins = True
        Left = 390
        Top = 3
        Width = 100
        Height = 46
        Hint = ''
        DateTime = 42982.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Align = alLeft
        TabOrder = 4
        FieldLabel = 'Abertura'
      end
      object Dt_Dt_Contract: TUniDateTimePicker
        AlignWithMargins = True
        Left = 496
        Top = 3
        Width = 100
        Height = 46
        Hint = ''
        DateTime = 42982.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Align = alLeft
        TabOrder = 5
        FieldLabel = 'Vencimento'
        FieldLabelAlign = laTop
      end
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 512
    Top = 112
  end
end