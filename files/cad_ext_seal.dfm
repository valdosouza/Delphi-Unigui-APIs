inherited CadExtSeal: TCadExtSeal
  ClientHeight = 116
  ClientWidth = 590
  Caption = 'Cadastro de Selo de Extintor'
  ExplicitWidth = 606
  ExplicitHeight = 175
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 52
    Width = 590
    ExplicitTop = 52
    ExplicitWidth = 590
  end
  inherited pnl_fundo: TUniPanel
    Width = 590
    Height = 52
    ExplicitWidth = 590
    ExplicitHeight = 52
    object UniLabel1: TUniLabel
      Left = 4
      Top = 4
      Width = 23
      Height = 13
      Hint = ''
      Caption = 'Data'
      TabOrder = 1
    end
    object Dtp_dt_record: TUniDateTimePicker
      Left = 4
      Top = 19
      Width = 93
      Hint = ''
      DateTime = 43000.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 2
    end
    object UniLabel2: TUniLabel
      Left = 99
      Top = 4
      Width = 64
      Height = 13
      Hint = ''
      Caption = 'In'#237'cio do Lote'
      TabOrder = 3
    end
    object E_nr_initial: TUniEdit
      Left = 99
      Top = 19
      Width = 134
      Hint = ''
      Text = ''
      TabOrder = 4
    end
    object UniLabel3: TUniLabel
      Left = 235
      Top = 4
      Width = 61
      Height = 13
      Hint = ''
      Caption = 'Final do Lote'
      TabOrder = 5
    end
    object UniLabel4: TUniLabel
      Left = 371
      Top = 4
      Width = 83
      Height = 13
      Hint = ''
      Caption = #218'ltimo selo usado'
      TabOrder = 6
    end
    object E_nr_las_used: TUniEdit
      Left = 371
      Top = 19
      Width = 142
      Hint = ''
      Text = ''
      TabOrder = 7
    end
    object E_nr_final: TUniEdit
      Left = 235
      Top = 19
      Width = 134
      Hint = ''
      Text = ''
      TabOrder = 8
    end
    object UniButton1: TUniButton
      Left = 515
      Top = 17
      Width = 66
      Height = 25
      Hint = ''
      Caption = 'Alterar'
      TabOrder = 9
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 16
    Top = 80
  end
end
