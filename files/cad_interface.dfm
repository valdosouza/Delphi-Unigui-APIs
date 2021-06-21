inherited CadInterface: TCadInterface
  ClientHeight = 463
  ClientWidth = 572
  Caption = 'Cadastros de Interfaces'
  ExplicitWidth = 588
  ExplicitHeight = 522
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 399
    Width = 572
    ExplicitTop = 399
    ExplicitWidth = 572
  end
  inherited pnl_fundo: TUniPanel
    Width = 572
    Height = 399
    ExplicitWidth = 572
    ExplicitHeight = 399
    object E_Description: TUniEdit
      Left = 64
      Top = 21
      Width = 500
      Hint = ''
      Text = ''
      ParentFont = False
      TabOrder = 1
    end
    object L_Kind: TUniLabel
      Left = 8
      Top = 46
      Width = 38
      Height = 14
      Hint = ''
      Caption = 'Posi'#231#227'o'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 3
    end
    object L_NameCompany: TUniLabel
      Left = 64
      Top = 6
      Width = 27
      Height = 14
      Hint = ''
      Caption = 'Nome'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 4
    end
    object E_ID: TUniEdit
      Left = 6
      Top = 21
      Width = 56
      Hint = ''
      Text = ''
      TabOrder = 0
      ReadOnly = True
    end
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
      TabOrder = 5
    end
    object UniPanel1: TUniPanel
      Left = 2
      Top = 88
      Width = 568
      Height = 309
      Hint = ''
      Align = alBottom
      TabOrder = 6
      BorderStyle = ubsNone
      Caption = ''
      object dbg_UseList: TUniDBGrid
        Left = 317
        Top = 22
        Width = 244
        Height = 284
        Hint = ''
        HeaderTitle = 'Interfaces Usadas'
        DataSource = ds_search_use
        Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete]
        LoadMask.Message = 'Loading data...'
        TabOrder = 1
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = 'id'
            Width = 64
          end
          item
            FieldName = 'description'
            Title.Caption = 'description'
            Width = 240
          end>
      end
      object sb_int_to_mod: TUniSpeedButton
        Left = 255
        Top = 140
        Width = 56
        Height = 22
        Hint = ''
        Caption = '>>'
        ParentColor = False
        Color = clWindow
        TabOrder = 2
        OnClick = sb_int_to_modClick
      end
      object sb_mod_to_int: TUniSpeedButton
        Left = 255
        Top = 168
        Width = 56
        Height = 22
        Hint = ''
        Caption = '<<'
        ParentColor = False
        Color = clWindow
        TabOrder = 3
        OnClick = sb_mod_to_intClick
      end
      object dbg_AvalibleList: TUniDBGrid
        Left = 5
        Top = 20
        Width = 244
        Height = 284
        Hint = ''
        HeaderTitle = 'Interfaces Disponiveis'
        DataSource = ds_search_available
        Options = [dgEditing, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete]
        LoadMask.Message = 'Loading data...'
        TabOrder = 4
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = 'id'
            Width = 64
            Visible = False
          end
          item
            FieldName = 'description'
            Title.Caption = 'description'
            Width = 240
          end>
      end
      object UniLabel3: TUniLabel
        Left = 0
        Top = 0
        Width = 568
        Height = 18
        Hint = ''
        Alignment = taCenter
        AutoSize = False
        Caption = 'OPERA'#199#213'ES E PRIVIL'#201'GIOS DA INTERFACE'
        Align = alTop
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        ParentColor = False
        Color = clNavy
        TabOrder = 5
      end
    end
    object Cb_Posicao: TUniComboBox
      Left = 6
      Top = 61
      Width = 110
      Hint = ''
      Style = csDropDownList
      Text = ''
      Items.Strings = (
        'INTERNO'
        'CADASTRO'
        'TAREFA'
        'RELATORIO')
      TabOrder = 7
      ForceSelection = False
    end
    object Cb_img_index: TUniComboBox
      Left = 345
      Top = 61
      Width = 111
      Hint = ''
      Style = csDropDownList
      Text = ''
      TabOrder = 8
      ForceSelection = False
      Images = UMM.uImg32
    end
    object UniLabel1: TUniLabel
      Left = 347
      Top = 46
      Width = 67
      Height = 14
      Hint = ''
      Caption = 'Imagem Bot'#227'o'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 9
    end
    object UniLabel2: TUniLabel
      Left = 118
      Top = 46
      Width = 72
      Height = 14
      Hint = ''
      Caption = 'A'#231#227'o do Bot'#227'o'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 10
    end
    object Cb_acao_botao: TUniComboBox
      Left = 116
      Top = 61
      Width = 227
      Hint = ''
      Style = csDropDownList
      Text = ''
      TabOrder = 11
      Sorted = True
      ForceSelection = False
    end
    object btn_Img_Left: TUniButton
      Left = 459
      Top = 48
      Width = 35
      Height = 35
      Hint = ''
      Caption = ''
      TabOrder = 12
      IconAlign = iaCenter
      IconCls = 'arrow_left'
      OnClick = btn_Img_LeftClick
    end
    object btn_Img_Right: TUniButton
      Left = 529
      Top = 48
      Width = 35
      Height = 35
      Hint = ''
      Caption = ''
      TabOrder = 13
      IconAlign = iaCenter
      IconCls = 'arrow_right'
      OnClick = btn_Img_RightClick
    end
    object btn_amostra: TUniButton
      Left = 494
      Top = 48
      Width = 35
      Height = 35
      Hint = ''
      Caption = ''
      TabOrder = 14
      Images = UMM.uImg32
      IconAlign = iaCenter
      OnClick = btn_amostraClick
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 200
    Top = 160
  end
  inherited ds_msg: TDataSource
    Left = 200
    Top = 216
  end
  inherited MenuTask: TUniMainMenu
    Left = 40
    Top = 80
  end
  object cds_available: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 96
    Top = 154
    object cds_availableid: TIntegerField
      FieldName = 'id'
      KeyFields = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cds_availabledescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Size = 100
    end
  end
  object ds_search_available: TDataSource
    DataSet = cds_available
    Left = 96
    Top = 210
  end
  object cds_used: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 472
    Top = 170
    object cds_usedid: TIntegerField
      FieldName = 'id'
      KeyFields = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cds_useddescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Size = 100
    end
  end
  object ds_search_use: TDataSource
    DataSet = cds_used
    Left = 472
    Top = 226
  end
end
