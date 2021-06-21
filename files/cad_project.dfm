inherited CadProject: TCadProject
  ClientHeight = 431
  Caption = 'Cadastro de Projetos'
  ExplicitHeight = 490
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 367
    ExplicitTop = 367
  end
  inherited pnl_fundo: TUniPanel
    Height = 367
    ExplicitHeight = 367
    object L_Codigo: TUniLabel
      Left = 6
      Top = 6
      Width = 33
      Height = 14
      Hint = ''
      Caption = 'C'#243'digo'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 1
    end
    object E_ID: TUniEdit
      Left = 6
      Top = 21
      Width = 56
      Hint = ''
      Text = ''
      TabOrder = 2
      ReadOnly = True
    end
    object L_Description: TUniLabel
      Left = 64
      Top = 6
      Width = 49
      Height = 14
      Hint = ''
      Caption = 'Descri'#231#227'o'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 3
    end
    object E_Description: TUniEdit
      Left = 64
      Top = 21
      Width = 440
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 4
    end
    object M_Detail: TUniMemo
      Left = 6
      Top = 208
      Width = 556
      Height = 137
      Hint = ''
      RTL = True
      ParentRTL = False
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 5
    end
    object UniLabel1: TUniLabel
      Left = 6
      Top = 179
      Width = 36
      Height = 14
      Hint = ''
      Caption = 'Detalhe'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 6
    end
    object ctn_Customer: TUniContainerPanel
      AlignWithMargins = True
      Left = 5
      Top = 49
      Width = 561
      Height = 43
      Hint = ''
      Margins.Left = 5
      ParentColor = False
      TabOrder = 7
    end
    object ctn_Situacao: TUniContainerPanel
      AlignWithMargins = True
      Left = 6
      Top = 109
      Width = 307
      Height = 43
      Hint = ''
      Margins.Left = 5
      ParentColor = False
      Anchors = [akLeft, akBottom]
      TabOrder = 8
    end
    object DTP_Date_Initial_forecast: TUniDateTimePicker
      Left = 65
      Top = 180
      Width = 100
      Hint = ''
      DateTime = 42916.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 9
    end
    object DTP_Date_End_forecast: TUniDateTimePicker
      Left = 177
      Top = 180
      Width = 100
      Hint = ''
      DateTime = 42916.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 10
    end
    object UniLabel2: TUniLabel
      Left = 64
      Top = 162
      Width = 93
      Height = 14
      Hint = ''
      Caption = 'Data inicial Prevista'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 11
    end
    object UniLabel3: TUniLabel
      Left = 177
      Top = 162
      Width = 89
      Height = 14
      Hint = ''
      Caption = 'Data Final Prevista'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 12
    end
  end
  object L_Number: TUniLabel [2]
    Left = 511
    Top = 6
    Width = 37
    Height = 14
    Hint = ''
    Caption = 'N'#250'mero'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Name = 'Arial'
    TabOrder = 2
  end
  object E_Number: TUniEdit [3]
    Left = 505
    Top = 21
    Width = 62
    Hint = ''
    Text = ''
    TabOrder = 3
    ReadOnly = True
  end
  object UniLabel4: TUniLabel [4]
    Left = 283
    Top = 162
    Width = 73
    Height = 14
    Hint = ''
    Caption = 'Data do Projeto'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Name = 'Arial'
    TabOrder = 4
  end
  object DTP_dt_record: TUniDateTimePicker [5]
    Left = 284
    Top = 180
    Width = 100
    Hint = ''
    DateTime = 42916.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 5
  end
  inherited cds_msg: TClientDataSet
    Left = 592
    Top = 72
  end
  inherited ds_msg: TDataSource
    Left = 592
    Top = 128
  end
  inherited MenuTask: TUniMainMenu
    Left = 592
    Top = 16
  end
end
