inherited CadModule: TCadModule
  ClientHeight = 465
  ClientWidth = 571
  Caption = 'Cadastro de Modulo'
  ExplicitWidth = 587
  ExplicitHeight = 524
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 401
    Width = 571
    ExplicitTop = 401
    ExplicitWidth = 571
  end
  inherited pnl_fundo: TUniPanel
    Width = 571
    Height = 401
    ExplicitWidth = 571
    ExplicitHeight = 401
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
      TabOrder = 3
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
    object E_Description: TUniEdit
      Left = 64
      Top = 21
      Width = 498
      Hint = ''
      Text = ''
      ParentFont = False
      TabOrder = 1
    end
    object UniPanel1: TUniPanel
      Left = 2
      Top = 87
      Width = 567
      Height = 312
      Hint = ''
      Align = alBottom
      TabOrder = 5
      Caption = 'UniPanel1'
      object dbg_AvalibleList: TUniDBGrid
        Left = 6
        Top = 22
        Width = 244
        Height = 284
        Hint = ''
        HeaderTitle = 'Interfaces Disponiveis'
        DataSource = ds_search_available
        Options = [dgEditing, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete]
        LoadMask.Message = 'Loading data...'
        TabOrder = 1
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = 'id'
            Width = 64
            Visible = False
          end
          item
            FieldName = 'description'
            Title.Caption = 'Interfaces Disponiveis'
            Width = 604
          end>
      end
      object sb_int_to_mod: TUniSpeedButton
        Left = 256
        Top = 142
        Width = 56
        Height = 22
        Hint = ''
        Caption = '>>'
        ParentColor = False
        Color = clWindow
        TabOrder = 2
        OnClick = sb_int_to_modClick
      end
      object dbg_UseList: TUniDBGrid
        Left = 318
        Top = 25
        Width = 244
        Height = 284
        Hint = ''
        HeaderTitle = 'Interfaces Usadas'
        DataSource = ds_search_use
        Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete]
        LoadMask.Message = 'Loading data...'
        TabOrder = 3
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = 'id'
            Width = 64
            Visible = False
          end
          item
            FieldName = 'description'
            Title.Caption = 'Interfaces Usadas'
            Width = 604
          end>
      end
      object UniLabel3: TUniLabel
        Left = 1
        Top = 1
        Width = 565
        Height = 18
        Hint = ''
        Alignment = taCenter
        AutoSize = False
        Caption = 'LISTA DE  NTTERFACES '
        Align = alTop
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        ParentColor = False
        Color = clNavy
        TabOrder = 4
      end
    end
    object Cb_img_index: TUniComboBox
      Left = 242
      Top = 61
      Width = 111
      Hint = ''
      Style = csDropDownList
      Text = ''
      TabOrder = 6
      ForceSelection = False
      Images = UMM.uImg32
    end
    object UniLabel1: TUniLabel
      Left = 244
      Top = 46
      Width = 67
      Height = 14
      Hint = ''
      Caption = 'Imagem Bot'#227'o'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 7
    end
    object UniLabel2: TUniLabel
      Left = 8
      Top = 46
      Width = 72
      Height = 14
      Hint = ''
      Caption = 'A'#231#227'o do Bot'#227'o'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 8
    end
    object Cb_acao_botao: TUniComboBox
      Left = 6
      Top = 61
      Width = 233
      Hint = ''
      Style = csDropDownList
      Text = ''
      TabOrder = 9
      Sorted = True
      ForceSelection = False
    end
    object btn_Img_Left: TUniButton
      Left = 359
      Top = 48
      Width = 35
      Height = 35
      Hint = ''
      Caption = ''
      TabOrder = 10
      IconAlign = iaCenter
      IconCls = 'arrow_left'
      OnClick = btn_Img_LeftClick
    end
    object btn_Img_Right: TUniButton
      Left = 429
      Top = 48
      Width = 35
      Height = 35
      Hint = ''
      Caption = ''
      TabOrder = 11
      IconAlign = iaCenter
      IconCls = 'arrow_right'
      OnClick = btn_Img_RightClick
    end
    object btn_amostra: TUniButton
      Left = 394
      Top = 48
      Width = 35
      Height = 35
      Hint = ''
      Caption = ''
      TabOrder = 12
      IconAlign = iaCenter
      OnClick = btn_amostraClick
    end
  end
  object sb_mod_to_int: TUniSpeedButton [2]
    Left = 256
    Top = 197
    Width = 56
    Height = 22
    Hint = ''
    Caption = '<<'
    ParentColor = False
    Color = clWindow
    TabOrder = 2
    OnClick = sb_mod_to_intClick
  end
  inherited cds_msg: TClientDataSet
    Left = 16
    Top = 40
  end
  inherited ds_msg: TDataSource
    Left = 16
    Top = 96
  end
  inherited MenuTask: TUniMainMenu
    Left = 424
    Top = 0
  end
  object cds_available: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 96
    Top = 154
    object cds_availableid: TIntegerField
      FieldName = 'id'
      KeyFields = 'id'
    end
    object cds_availabledescription: TStringField
      FieldName = 'description'
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
    ProviderName = 'DSP'
    Left = 472
    Top = 170
    object cds_usedid: TIntegerField
      FieldName = 'id'
      KeyFields = 'id'
    end
    object cds_useddescription: TStringField
      FieldName = 'description'
      Size = 100
    end
  end
  object ds_search_use: TDataSource
    DataSet = cds_used
    Left = 472
    Top = 226
  end
end
