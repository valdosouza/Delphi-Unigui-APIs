inherited CadBankHistoric: TCadBankHistoric
  ClientHeight = 133
  ClientWidth = 773
  Caption = 'Cadastro do Hist'#243'rico Banco'
  ExplicitWidth = 789
  ExplicitHeight = 192
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 69
    Width = 773
    ExplicitTop = 69
    ExplicitWidth = 773
    inherited SB_Change: TUniSpeedButton
      ExplicitTop = 5
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 773
    Height = 69
    ExplicitWidth = 773
    ExplicitHeight = 69
    object pnl_row_1: TUniPanel
      Left = 2
      Top = 2
      Width = 769
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 1
      Caption = ''
      object E_ID: TUniEdit
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 51
        Height = 44
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 1
        FieldLabel = 'C'#243'digo'
        FieldLabelAlign = laTop
      end
      object E_Description: TUniEdit
        AlignWithMargins = True
        Left = 61
        Top = 4
        Width = 346
        Height = 44
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 2
        FieldLabel = 'Descri'#231#227'o'
        FieldLabelAlign = laTop
        ExplicitTop = 3
      end
      object Ctn_Bank: TUniContainerPanel
        Left = 410
        Top = 1
        Width = 358
        Height = 50
        Hint = ''
        ParentColor = False
        Align = alClient
        TabOrder = 3
      end
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 648
    Top = 16
  end
end
