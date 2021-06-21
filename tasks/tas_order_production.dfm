inherited TasOrderProduction: TTasOrderProduction
  ClientHeight = 499
  Caption = 'Tarefa de Produ'#231#227'o'
  ExplicitHeight = 558
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 435
    ExplicitTop = 435
    inherited Sb_Invoice: TUniSpeedButton
      Caption = 'Baixar'
    end
  end
  inherited pnl_fundo: TUniPanel
    Height = 49
    Align = alTop
    ExplicitHeight = 49
    DesignSize = (
      775
      49)
    object E_Number: TUniEdit
      Left = 5
      Top = 19
      Width = 75
      Hint = ''
      Text = ''
      TabOrder = 0
      ReadOnly = True
    end
    object Dtp_Registry: TUniDateTimePicker
      Left = 83
      Top = 19
      Width = 116
      Hint = ''
      DateTime = 42544.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 1
    end
    object Ctn_Merchandise: TUniContainerPanel
      Left = 203
      Top = 6
      Width = 482
      Height = 37
      Hint = ''
      ParentColor = False
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object L_Codigo: TUniLabel
      Left = 6
      Top = 3
      Width = 44
      Height = 14
      Hint = ''
      Caption = 'N'#250'mero'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      TabOrder = 4
    end
    object L_DtRegistry: TUniLabel
      Left = 85
      Top = 3
      Width = 69
      Height = 14
      Hint = ''
      Caption = 'Data Cadastro'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 5
    end
    object UniLabel3: TUniLabel
      Left = 693
      Top = 3
      Width = 55
      Height = 14
      Hint = ''
      Caption = 'Quantidade'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 6
    end
    object E_Qtty: TUniNumberEdit
      Left = 691
      Top = 19
      Width = 74
      Hint = ''
      Alignment = taRightJustify
      TabOrder = 7
      DecimalSeparator = ','
    end
  end
  object pg_Items: TUniPageControl [2]
    Left = 0
    Top = 49
    Width = 775
    Height = 386
    Hint = ''
    ActivePage = tbs_List
    Align = alClient
    TabOrder = 2
    object tbs_List: TUniTabSheet
      Hint = ''
      Caption = 'Lista de Mat'#233'ria Prima'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object pnl_Order_Item: TUniPanel
        Left = 0
        Top = 0
        Width = 767
        Height = 358
        Hint = ''
        Align = alClient
        TabOrder = 0
        BorderStyle = ubsFrameLowered
        Caption = ''
        object Ctn_Order_itens_production: TUniContainerPanel
          Left = 2
          Top = 2
          Width = 763
          Height = 354
          Hint = ''
          ParentColor = False
          Align = alClient
          TabOrder = 1
        end
      end
    end
    object tbs_other: TUniTabSheet
      Hint = ''
      Caption = 'Outras Informa'#231#245'es'
      object UniPanel2: TUniPanel
        Left = 0
        Top = 0
        Width = 767
        Height = 358
        Hint = ''
        Align = alClient
        TabOrder = 0
        BorderStyle = ubsFrameLowered
        Caption = ''
        DesignSize = (
          767
          358)
        object M_note: TUniMemo
          Left = 3
          Top = 116
          Width = 759
          Height = 106
          Hint = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object UniLabel13: TUniLabel
          Left = 6
          Top = 101
          Width = 66
          Height = 14
          Hint = ''
          Caption = 'Observa'#231#245'es'
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          TabOrder = 2
        end
        object Ctn_Stock_Id_Ori: TUniContainerPanel
          Left = 6
          Top = 8
          Width = 418
          Height = 43
          Hint = ''
          ParentColor = False
          TabOrder = 3
        end
        object Ctn_Stock_Id_Des: TUniContainerPanel
          Left = 6
          Top = 57
          Width = 418
          Height = 43
          Hint = ''
          ParentColor = False
          TabOrder = 4
        end
        object Ctn_Situacao: TUniContainerPanel
          Left = 427
          Top = 8
          Width = 335
          Height = 43
          Hint = ''
          ParentColor = False
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
        end
        object UniLabel1: TUniLabel
          Left = 432
          Top = 57
          Width = 49
          Height = 14
          Hint = ''
          Caption = 'Data Inicio'
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          TabOrder = 6
        end
        object Dtp_Start: TUniDateTimePicker
          Left = 430
          Top = 73
          Width = 116
          Hint = ''
          DateTime = 42544.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 7
        end
        object UniLabel2: TUniLabel
          Left = 553
          Top = 57
          Width = 92
          Height = 14
          Hint = ''
          Caption = 'Data Final Prevista '
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          TabOrder = 8
        end
        object Dtp_Forecast: TUniDateTimePicker
          Left = 550
          Top = 73
          Width = 116
          Hint = ''
          DateTime = 42544.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 9
        end
      end
    end
  end
end
