inherited CadExtMotivos: TCadExtMotivos
  ClientHeight = 160
  ClientWidth = 568
  Caption = 'Cadastro de Motivos Reprova'#231#227'o/Condena'#231#227'o '
  ExplicitWidth = 584
  ExplicitHeight = 219
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 96
    Width = 568
    ExplicitTop = 96
    ExplicitWidth = 568
  end
  inherited pnl_fundo: TUniPanel
    Width = 568
    Height = 96
    ExplicitWidth = 568
    ExplicitHeight = 96
    object UniLabel1: TUniLabel
      Left = 4
      Top = 5
      Width = 46
      Height = 13
      Hint = ''
      Caption = 'Descri'#231#227'o'
      TabOrder = 1
    end
    object E_Description: TUniEdit
      Left = 4
      Top = 20
      Width = 558
      Hint = ''
      Text = ''
      TabOrder = 2
    end
    object Cb_Kind: TUniComboBox
      Left = 4
      Top = 59
      Width = 125
      Hint = ''
      Text = 'Cb_Kind'
      Items.Strings = (
        'CONDENA'#199#195'O'
        'REPROVA'#199#195'O')
      ItemIndex = 0
      TabOrder = 3
    end
    object UniLabel2: TUniLabel
      Left = 4
      Top = 44
      Width = 20
      Height = 13
      Hint = ''
      Caption = 'Tipo'
      TabOrder = 4
    end
    object UniLabel3: TUniLabel
      Left = 131
      Top = 44
      Width = 31
      Height = 13
      Hint = ''
      Caption = 'Norma'
      TabOrder = 5
    end
    object E_rule: TUniEdit
      Left = 131
      Top = 59
      Width = 182
      Hint = ''
      Text = ''
      TabOrder = 6
    end
  end
  inherited Menu: TUniMainMenu
    Left = 40
    Top = 112
  end
end
