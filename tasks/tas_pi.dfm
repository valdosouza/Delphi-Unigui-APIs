inherited TasPi: TTasPi
  ClientHeight = 685
  ClientWidth = 853
  Caption = 'TasPi'
  ExplicitLeft = -6
  ExplicitWidth = 869
  ExplicitHeight = 744
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniSimplePanel
    Top = 621
    Width = 853
    object UniSpeedButton1: TUniSpeedButton
      Left = 562
      Top = 4
      Width = 95
      Height = 54
      Hint = ''
      Caption = 'Pesquisar'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      OnClick = Sb_CloseClick
    end
    object UniSpeedButton2: TUniSpeedButton
      Left = 657
      Top = 4
      Width = 95
      Height = 54
      Hint = ''
      Caption = 'E-mail'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      OnClick = Sb_CloseClick
    end
    object UniSpeedButton3: TUniSpeedButton
      Left = 752
      Top = 4
      Width = 95
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
      OnClick = Sb_CloseClick
    end
  end
  inherited pnl_fundo: TUniSimplePanel
    Top = 197
    Width = 853
    Height = 424
    ExplicitTop = 215
    ExplicitWidth = 788
    ExplicitHeight = 213
    object UniPanel2: TUniPanel
      Left = 0
      Top = 0
      Width = 853
      Height = 424
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = 'UniPanel2'
      ExplicitTop = -2
      object UniLabel16: TUniLabel
        Left = 8
        Top = 2
        Width = 89
        Height = 13
        Hint = ''
        Caption = 'Rela'#231#227'o das Pe'#231'as'
        TabOrder = 1
      end
      object UniEdit8: TUniEdit
        Left = 634
        Top = 382
        Width = 105
        Hint = ''
        Text = ''
        TabOrder = 2
      end
      object UniEdit9: TUniEdit
        Left = 418
        Top = 382
        Width = 105
        Hint = ''
        Text = ''
        TabOrder = 3
      end
      object UniEdit10: TUniEdit
        Left = 742
        Top = 382
        Width = 105
        Hint = ''
        Text = ''
        TabOrder = 4
      end
      object UniEdit11: TUniEdit
        Left = 526
        Top = 382
        Width = 105
        Hint = ''
        Text = ''
        TabOrder = 5
      end
      object UniLabel18: TUniLabel
        Left = 417
        Top = 367
        Width = 53
        Height = 13
        Hint = ''
        Caption = 'Valor Bruto'
        TabOrder = 6
      end
      object UniLabel19: TUniLabel
        Left = 525
        Top = 367
        Width = 38
        Height = 13
        Hint = ''
        Caption = 'Ag'#234'ncia'
        TabOrder = 7
      end
      object UniLabel20: TUniLabel
        Left = 742
        Top = 367
        Width = 45
        Height = 13
        Hint = ''
        Caption = 'Merconet'
        TabOrder = 8
      end
      object UniLabel21: TUniLabel
        Left = 633
        Top = 367
        Width = 60
        Height = 13
        Hint = ''
        Caption = 'Valor Liquido'
        TabOrder = 9
      end
    end
    object UniDBGrid1: TUniDBGrid
      Left = 8
      Top = 18
      Width = 839
      Height = 161
      Hint = ''
      LoadMask.Message = 'Loading data...'
      TabOrder = 2
    end
    object UniDBGrid3: TUniDBGrid
      Left = 8
      Top = 236
      Width = 273
      Height = 160
      Hint = ''
      LoadMask.Message = 'Loading data...'
      TabOrder = 3
    end
    object UniLabel15: TUniLabel
      Left = 8
      Top = 221
      Width = 93
      Height = 13
      Hint = ''
      Caption = 'Data das Inser'#231#245'es'
      TabOrder = 4
    end
    object UniMemo1: TUniMemo
      Left = 285
      Top = 236
      Width = 562
      Height = 117
      Hint = ''
      Lines.Strings = (
        'UniMemo1')
      TabOrder = 5
    end
    object UniLabel17: TUniLabel
      Left = 285
      Top = 221
      Width = 63
      Height = 13
      Hint = ''
      Caption = 'Observa'#231#245'es'
      TabOrder = 6
    end
    object UniRadioGroup1: TUniRadioGroup
      Left = 287
      Top = 354
      Width = 121
      Height = 63
      Hint = ''
      Items.Strings = (
        'Valor Bruto'
        'Valor L'#237'quido')
      Caption = 'Tipo de Calculo'
      TabOrder = 7
    end
  end
  object UniPanel1: TUniPanel [2]
    Left = 0
    Top = 0
    Width = 853
    Height = 197
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = 'UniPanel1'
    ExplicitLeft = 64
    ExplicitTop = -6
    ExplicitWidth = 855
    object UniLabel1: TUniLabel
      Left = 8
      Top = 7
      Width = 54
      Height = 13
      Hint = ''
      Caption = 'P.J Original'
      TabOrder = 1
    end
    object UniEdit2: TUniEdit
      Left = 8
      Top = 21
      Width = 67
      Hint = ''
      Text = ''
      TabOrder = 2
    end
    object UniEdit3: TUniEdit
      Left = 77
      Top = 21
      Width = 78
      Hint = ''
      Text = ''
      TabOrder = 3
    end
    object UniLabel2: TUniLabel
      Left = 77
      Top = 7
      Width = 62
      Height = 13
      Hint = ''
      Caption = 'Data Original'
      TabOrder = 4
    end
    object UniLabel3: TUniLabel
      Left = 157
      Top = 7
      Width = 55
      Height = 13
      Hint = ''
      Caption = 'Vencimento'
      TabOrder = 5
    end
    object UniEdit4: TUniEdit
      Left = 157
      Top = 21
      Width = 78
      Hint = ''
      Text = ''
      TabOrder = 6
    end
    object UniEdit5: TUniEdit
      Left = 237
      Top = 21
      Width = 78
      Hint = ''
      Text = ''
      TabOrder = 7
    end
    object UniLabel4: TUniLabel
      Left = 237
      Top = 7
      Width = 58
      Height = 13
      Hint = ''
      Caption = 'Data Pedido'
      TabOrder = 8
    end
    object UniLabel5: TUniLabel
      Left = 317
      Top = 7
      Width = 58
      Height = 13
      Hint = ''
      Caption = 'PI Merconet'
      TabOrder = 9
    end
    object UniEdit6: TUniEdit
      Left = 317
      Top = 21
      Width = 78
      Hint = ''
      Text = ''
      TabOrder = 10
    end
    object UniComboBox2: TUniComboBox
      Left = 702
      Top = 21
      Width = 145
      Hint = ''
      ParentShowHint = False
      Text = ''
      Items.Strings = (
        'Jornais e Revistas'
        'R'#225'dios e TV'#39's')
      ItemIndex = 0
      TabOrder = 11
    end
    object UniLabel6: TUniLabel
      Left = 702
      Top = 7
      Width = 45
      Height = 13
      Hint = ''
      Caption = 'Aplica'#231#227'o'
      TabOrder = 12
    end
    object Ctn_Agency: TUniContainerPanel
      Left = 8
      Top = 79
      Width = 400
      Height = 40
      Hint = ''
      RTL = True
      ParentRTL = False
      ParentColor = False
      TabOrder = 13
    end
    object UniLabel8: TUniLabel
      Left = 8
      Top = 63
      Width = 109
      Height = 13
      Hint = ''
      Caption = 'Ag'#234'ncia de Publicidade'
      TabOrder = 14
    end
    object UniLabel9: TUniLabel
      Left = 414
      Top = 63
      Width = 53
      Height = 13
      Hint = ''
      Caption = 'Anuciantes'
      TabOrder = 15
    end
    object UniLabel10: TUniLabel
      Left = 8
      Top = 62
      Width = 109
      Height = 13
      Hint = ''
      Caption = 'Ag'#234'ncia de Publicidade'
      TabOrder = 16
    end
    object UniEdit1: TUniEdit
      Left = 432
      Top = 166
      Width = 121
      Hint = ''
      Text = ''
      TabOrder = 17
    end
    object UniEdit7: TUniEdit
      Left = 591
      Top = 166
      Width = 121
      Hint = ''
      Text = ''
      TabOrder = 18
    end
    object UniLabel11: TUniLabel
      Left = 591
      Top = 147
      Width = 89
      Height = 13
      Hint = ''
      Caption = 'Comiss'#227'o Empresa'
      TabOrder = 19
    end
    object UniLabel12: TUniLabel
      Left = 432
      Top = 147
      Width = 86
      Height = 13
      Hint = ''
      Caption = 'Comiss'#227'o Ag'#234'ncia'
      TabOrder = 20
    end
    object UniLabel13: TUniLabel
      Left = 560
      Top = 169
      Width = 11
      Height = 13
      Hint = ''
      Caption = '%'
      TabOrder = 21
    end
    object UniLabel14: TUniLabel
      Left = 720
      Top = 169
      Width = 11
      Height = 13
      Hint = ''
      Caption = '%'
      TabOrder = 22
    end
  end
  object UniLabel7: TUniLabel [3]
    Left = 8
    Top = 128
    Width = 114
    Height = 13
    Hint = ''
    Caption = 'Ve'#237'culo de Comunica'#231#227'o'
    TabOrder = 3
  end
  object Ctn_Broadcaster: TUniContainerPanel [4]
    Left = 8
    Top = 147
    Width = 400
    Height = 40
    Hint = ''
    ParentColor = False
    TabOrder = 4
  end
  object Ctn_Advertiser: TUniContainerPanel [5]
    Left = 414
    Top = 82
    Width = 433
    Height = 40
    Hint = ''
    ParentColor = False
    TabOrder = 5
  end
  object UniSpeedButton7: TUniSpeedButton [6]
    Left = 8
    Top = 381
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
    OnClick = SB_InsertClick
  end
  object UniSpeedButton8: TUniSpeedButton [7]
    Left = 135
    Top = 381
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
    OnClick = SB_ChangeClick
  end
  object UniSpeedButton9: TUniSpeedButton [8]
    Left = 262
    Top = 381
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
    OnClick = SB_DeleteClick
  end
  inherited Menu: TUniMainMenu
    Left = 8
    Top = 248
  end
end
