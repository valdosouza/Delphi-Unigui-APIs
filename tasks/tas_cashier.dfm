inherited TasCashier: TTasCashier
  ClientHeight = 478
  ClientWidth = 646
  Caption = 'TasCashier'
  ExplicitTop = -147
  ExplicitWidth = 662
  ExplicitHeight = 537
  PixelsPerInch = 96
  TextHeight = 13
  object UniPanel1: TUniPanel [0]
    Left = 0
    Top = 0
    Width = 646
    Height = 154
    Hint = ''
    Align = alTop
    TabOrder = 0
    BorderStyle = ubsFrameLowered
    Caption = ''
    object UniDBGrid1: TUniDBGrid
      Left = 3
      Top = 4
      Width = 515
      Height = 147
      Hint = ''
      LoadMask.Message = 'Loading data...'
      TabOrder = 1
    end
    object UniLabel1: TUniLabel
      Left = 521
      Top = 4
      Width = 93
      Height = 13
      Hint = ''
      Caption = 'Movimento anterior'
      TabOrder = 2
    end
    object UniEdit1: TUniEdit
      Left = 521
      Top = 17
      Width = 121
      Hint = ''
      Text = ''
      TabOrder = 3
    end
    object UniLabel2: TUniLabel
      Left = 521
      Top = 40
      Width = 68
      Height = 13
      Hint = ''
      Caption = 'Saldo Anterior'
      TabOrder = 4
    end
    object UniEdit2: TUniEdit
      Left = 521
      Top = 54
      Width = 121
      Hint = ''
      Text = ''
      TabOrder = 5
    end
    object UniLabel3: TUniLabel
      Left = 521
      Top = 78
      Width = 79
      Height = 13
      Hint = ''
      Caption = 'Movimento atual'
      TabOrder = 6
    end
    object UniEdit3: TUniEdit
      Left = 521
      Top = 92
      Width = 121
      Hint = ''
      Text = ''
      TabOrder = 7
    end
    object UniLabel4: TUniLabel
      Left = 521
      Top = 115
      Width = 54
      Height = 13
      Hint = ''
      Caption = 'Saldo Atual'
      TabOrder = 8
    end
    object UniEdit4: TUniEdit
      Left = 521
      Top = 129
      Width = 121
      Hint = ''
      Text = ''
      TabOrder = 9
    end
  end
  object UniPanel2: TUniPanel [1]
    Left = 0
    Top = 412
    Width = 646
    Height = 66
    Hint = ''
    Align = alBottom
    TabOrder = 1
    BorderStyle = ubsFrameLowered
    Caption = ''
    DesignSize = (
      646
      66)
    object SB_Delete: TUniSpeedButton
      Left = 185
      Top = 6
      Width = 93
      Height = 54
      Hint = ''
      Caption = 'Excluir'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 1
    end
    object SB_Change: TUniSpeedButton
      Left = 94
      Top = 6
      Width = 91
      Height = 54
      Hint = ''
      Caption = 'Alterar'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 2
    end
    object SB_Insert: TUniSpeedButton
      Left = 3
      Top = 6
      Width = 91
      Height = 54
      Hint = ''
      Caption = 'Inserir'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 3
    end
    object UniButton1: TUniButton
      Left = 278
      Top = 6
      Width = 91
      Height = 54
      Hint = ''
      Caption = 'Abre Caixa'
      ParentFont = False
      Font.Color = clNavy
      TabOrder = 4
    end
    object UniButton2: TUniButton
      Left = 369
      Top = 6
      Width = 91
      Height = 54
      Hint = ''
      Caption = 'Fecha Caixa'
      ParentFont = False
      Font.Color = clNavy
      TabOrder = 5
    end
    object UniButton3: TUniButton
      Left = 460
      Top = 6
      Width = 91
      Height = 54
      Hint = ''
      Caption = 'Buscar'
      ParentFont = False
      Font.Color = clNavy
      TabOrder = 6
    end
    object UniButton4: TUniButton
      Left = 551
      Top = 6
      Width = 91
      Height = 54
      Hint = ''
      Caption = 'Fechar'
      ParentFont = False
      Font.Color = clNavy
      TabOrder = 7
    end
  end
  object UniPanel3: TUniPanel [2]
    Left = 0
    Top = 312
    Width = 646
    Height = 100
    Hint = ''
    TabOrder = 2
    BorderStyle = ubsFrameLowered
    Caption = ''
    object UniGroupBox1: TUniGroupBox
      Left = 3
      Top = 0
      Width = 639
      Height = 97
      Hint = ''
      Caption = 'Digite sua op'#231#227'o de busca'
      TabOrder = 1
      object ChBx_Periodo: TUniCheckBox
        Left = 1
        Top = 15
        Width = 145
        Height = 13
        Hint = ''
        Checked = True
        Caption = 'Periodo data de cadastro'
        TabOrder = 1
      end
      object DTP_Date_Initial: TUniDateTimePicker
        Left = 1
        Top = 29
        Width = 93
        Hint = ''
        DateTime = 42544.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 2
      end
      object DTP_Date_End: TUniDateTimePicker
        Left = 97
        Top = 29
        Width = 94
        Hint = ''
        DateTime = 42544.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 3
      end
      object UniLabel5: TUniLabel
        Left = 193
        Top = 15
        Width = 105
        Height = 13
        Hint = ''
        Caption = 'Descri'#231#227'o do Hist'#243'rico'
        TabOrder = 4
      end
      object UniEdit5: TUniEdit
        Left = 193
        Top = 29
        Width = 200
        Hint = ''
        Text = ''
        TabOrder = 5
      end
      object UniLabel6: TUniLabel
        Left = 395
        Top = 15
        Width = 24
        Height = 13
        Hint = ''
        Caption = 'Valor'
        TabOrder = 6
      end
      object UniEdit6: TUniEdit
        Left = 395
        Top = 29
        Width = 70
        Hint = ''
        Text = ''
        TabOrder = 7
      end
      object UniLabel7: TUniLabel
        Left = 467
        Top = 15
        Width = 36
        Height = 13
        Hint = ''
        Caption = 'Usu'#225'rio'
        TabOrder = 8
      end
      object UniComboBox1: TUniComboBox
        Left = 467
        Top = 29
        Width = 94
        Hint = ''
        Text = ''
        TabOrder = 9
        ForceSelection = False
      end
      object UniLabel8: TUniLabel
        Left = 563
        Top = 15
        Width = 59
        Height = 13
        Hint = ''
        Caption = 'Caixa do dia'
        TabOrder = 10
      end
      object UniComboBox2: TUniComboBox
        Left = 563
        Top = 29
        Width = 73
        Hint = ''
        Text = ''
        TabOrder = 11
        ForceSelection = False
      end
      object Ctn_Payment_Type: TUniContainerPanel
        Left = 1
        Top = 57
        Width = 296
        Height = 38
        Hint = ''
        ParentColor = False
        TabOrder = 12
      end
    end
  end
  object UniPanel4: TUniPanel [3]
    Left = 0
    Top = 154
    Width = 646
    Height = 152
    Hint = ''
    Align = alTop
    TabOrder = 3
    BorderStyle = ubsFrameLowered
    Caption = ''
    object UniDBGrid2: TUniDBGrid
      Left = 3
      Top = 2
      Width = 640
      Height = 147
      Hint = ''
      LoadMask.Message = 'Loading data...'
      TabOrder = 1
    end
  end
end
