inherited TasExtMaintenance: TTasExtMaintenance
  ClientHeight = 475
  ClientWidth = 857
  Caption = 'TasExtMaintenance'
  ExplicitWidth = 873
  ExplicitHeight = 534
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 411
    Width = 857
    ExplicitTop = 411
    ExplicitWidth = 857
    inherited SB_Delete: TUniSpeedButton
      Left = 468
      Visible = False
      ExplicitLeft = 468
    end
    inherited SB_Save: TUniSpeedButton
      Left = 187
      ExplicitLeft = 187
    end
    inherited SB_Cancel: TUniSpeedButton
      Left = 280
      ExplicitLeft = 280
    end
    inherited Sb_Close: TUniSpeedButton
      Left = 373
      ExplicitLeft = 373
    end
    object UniSpeedButton8: TUniSpeedButton
      Left = 371
      Top = 4
      Width = 93
      Height = 54
      Hint = ''
      Caption = 'Pedido'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 7
    end
    object UniSpeedButton9: TUniSpeedButton
      Left = 464
      Top = 4
      Width = 93
      Height = 54
      Hint = ''
      Caption = 'Encerrar'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 8
    end
    object UniSpeedButton10: TUniSpeedButton
      Left = 557
      Top = 4
      Width = 93
      Height = 54
      Hint = ''
      Caption = 'Imprimir'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 9
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 857
    Height = 411
    ExplicitWidth = 857
    ExplicitHeight = 411
    object UniPanel1: TUniPanel
      Left = 2
      Top = 2
      Width = 853
      Height = 95
      Hint = ''
      Align = alTop
      TabOrder = 1
      BorderStyle = ubsFrameLowered
      Caption = ''
      object UniLabel1: TUniLabel
        Left = 4
        Top = 5
        Width = 69
        Height = 13
        Hint = ''
        Caption = 'Data Abertura'
        TabOrder = 1
      end
      object UniDateTimePicker1: TUniDateTimePicker
        Left = 4
        Top = 19
        Width = 79
        Hint = ''
        DateTime = 43003.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 2
      end
      object UniLabel2: TUniLabel
        Left = 85
        Top = 5
        Width = 56
        Height = 13
        Hint = ''
        Caption = 'C'#243'd.Cliente'
        TabOrder = 3
      end
      object UniEdit1: TUniEdit
        Left = 85
        Top = 19
        Width = 63
        Hint = ''
        Text = ''
        TabOrder = 4
      end
      object Ctn_Entity: TUniContainerPanel
        Left = 151
        Top = 7
        Width = 347
        Height = 38
        Hint = ''
        ParentColor = False
        TabOrder = 5
      end
      object Ctn_Address_List: TUniContainerPanel
        Left = 501
        Top = 7
        Width = 346
        Height = 38
        Hint = ''
        ParentColor = False
        TabOrder = 6
      end
      object Ctn_Ext_Level: TUniContainerPanel
        Left = 4
        Top = 49
        Width = 245
        Height = 38
        Hint = ''
        ParentColor = False
        TabOrder = 7
      end
      object UniLabel3: TUniLabel
        Left = 251
        Top = 51
        Width = 82
        Height = 13
        Hint = ''
        Caption = 'Ordem do Pedido'
        TabOrder = 8
      end
      object UniEdit2: TUniEdit
        Left = 251
        Top = 65
        Width = 91
        Hint = ''
        Text = ''
        TabOrder = 9
      end
      object UniLabel4: TUniLabel
        Left = 344
        Top = 51
        Width = 88
        Height = 13
        Hint = ''
        Caption = 'Ordem de Servi'#231'o '
        TabOrder = 10
      end
      object UniEdit3: TUniEdit
        Left = 344
        Top = 65
        Width = 96
        Hint = ''
        Text = ''
        TabOrder = 11
      end
      object UniLabel5: TUniLabel
        Left = 442
        Top = 51
        Width = 87
        Height = 13
        Hint = ''
        Caption = 'N'#250'mero Inspe'#231#227'o '
        TabOrder = 12
      end
      object UniEdit4: TUniEdit
        Left = 442
        Top = 65
        Width = 91
        Hint = ''
        Text = ''
        TabOrder = 13
      end
      object UniLabel6: TUniLabel
        Left = 535
        Top = 51
        Width = 99
        Height = 13
        Hint = ''
        Caption = 'N'#250'mero Manuten'#231#227'o'
        TabOrder = 14
      end
      object UniEdit5: TUniEdit
        Left = 535
        Top = 65
        Width = 111
        Hint = ''
        Text = ''
        TabOrder = 15
      end
      object UniLabel7: TUniLabel
        Left = 648
        Top = 51
        Width = 71
        Height = 13
        Hint = ''
        Caption = 'N'#250'mero Ensaio'
        TabOrder = 16
      end
      object UniEdit6: TUniEdit
        Left = 648
        Top = 65
        Width = 81
        Hint = ''
        Text = ''
        TabOrder = 17
      end
      object UniLabel8: TUniLabel
        Left = 733
        Top = 51
        Width = 108
        Height = 13
        Hint = ''
        Caption = 'Data de Encerramento'
        TabOrder = 18
      end
      object UniLabel9: TUniLabel
        Left = 737
        Top = 65
        Width = 105
        Height = 24
        Hint = ''
        Caption = 'EM ABERTO'
        ParentFont = False
        Font.Height = -20
        TabOrder = 19
      end
    end
    object UniDBGrid1: TUniDBGrid
      Left = 2
      Top = 97
      Width = 853
      Height = 239
      Hint = ''
      LoadMask.Message = 'Loading data...'
      Align = alClient
      TabOrder = 2
    end
    object UniPanel2: TUniPanel
      Left = 2
      Top = 336
      Width = 853
      Height = 73
      Hint = ''
      Align = alBottom
      TabOrder = 3
      BorderStyle = ubsFrameLowered
      Caption = ''
      object UniGroupBox1: TUniGroupBox
        Left = 3
        Top = 4
        Width = 847
        Height = 65
        Hint = ''
        Caption = 'Edi'#231#227'o dos Extintores'
        TabOrder = 1
        DesignSize = (
          847
          65)
        object Sb_Insert_Ext: TUniSpeedButton
          Left = 2
          Top = 19
          Width = 127
          Height = 31
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
          TabOrder = 1
          OnClick = Sb_Insert_ExtClick
        end
        object Sb_Chance_Ext: TUniSpeedButton
          Left = 129
          Top = 19
          Width = 127
          Height = 31
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
          OnClick = Sb_Chance_ExtClick
        end
        object Sb_Delet_Ext: TUniSpeedButton
          Left = 256
          Top = 19
          Width = 129
          Height = 31
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
          TabOrder = 3
          OnClick = Sb_Delet_ExtClick
        end
      end
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 672
    Top = 360
  end
end
