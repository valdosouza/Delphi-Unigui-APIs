inherited CadMedPriceListJR: TCadMedPriceListJR
  ClientHeight = 497
  ClientWidth = 759
  Caption = 'Tabela de Pre'#231'o Jornal e Revista'
  ExplicitWidth = 775
  ExplicitHeight = 556
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 433
    Width = 759
    ExplicitTop = 433
    ExplicitWidth = 759
    inherited SB_Insert: TUniSpeedButton
      Left = 389
      Visible = False
      Align = alRight
      ExplicitLeft = 389
      ExplicitTop = 5
    end
    inherited SB_Change: TUniSpeedButton
      Left = 480
      Visible = False
      Align = alRight
      ExplicitLeft = 480
      ExplicitTop = 5
    end
    inherited SB_Delete: TUniSpeedButton
      Left = 571
      Visible = False
      Align = alRight
      ExplicitLeft = 571
    end
    inherited SB_Save: TUniSpeedButton
      Left = 2
      Caption = 'Atuaiza'
      ExplicitLeft = 2
    end
    inherited SB_Cancel: TUniSpeedButton
      Left = 664
      Visible = False
      Align = alRight
      ExplicitLeft = 664
    end
    inherited Sb_Close: TUniSpeedButton
      Left = 95
      ExplicitLeft = 95
      ExplicitTop = 5
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 759
    Height = 433
    ExplicitTop = 0
    ExplicitWidth = 759
    ExplicitHeight = 433
    object pnl_row_1: TUniPanel
      Left = 2
      Top = 2
      Width = 755
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 0
      BorderStyle = ubsNone
      Caption = ''
      object Ctn_Med_Pos_Prog: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 454
        Height = 52
        Hint = ''
        RTL = True
        ParentRTL = False
        ParentColor = False
        Align = alClient
        TabOrder = 0
      end
      object E_week_day_value: TUniFormattedNumberEdit
        AlignWithMargins = True
        Left = 457
        Top = 3
        Width = 109
        Height = 46
        Hint = ''
        Alignment = taRightJustify
        Align = alRight
        TabOrder = 1
        AllowBlank = False
        EmptyText = '0,00'
        FieldLabel = 'Dia '#218'til'
        FieldLabelAlign = laTop
        DecimalUseOSDefault = True
        OnExit = E_week_day_valueExit
      end
      object E_sun_day_value: TUniFormattedNumberEdit
        AlignWithMargins = True
        Left = 572
        Top = 3
        Width = 87
        Height = 46
        Hint = ''
        Alignment = taRightJustify
        Align = alRight
        TabOrder = 2
        AllowBlank = False
        FieldLabel = 'Domingo'
        FieldLabelAlign = laTop
        DecimalUseOSDefault = True
      end
      object e_addition_value: TUniFormattedNumberEdit
        AlignWithMargins = True
        Left = 665
        Top = 3
        Width = 87
        Height = 46
        Hint = ''
        Alignment = taRightJustify
        Align = alRight
        TabOrder = 3
        AllowBlank = False
        FieldLabel = 'Adicional Cor'
        FieldLabelAlign = laTop
        DecimalUseOSDefault = True
        OnExit = e_addition_valueExit
      end
    end
    object pnl_row_2: TUniPanel
      Left = 2
      Top = 54
      Width = 755
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 1
      BorderStyle = ubsNone
      Caption = ''
      object E_Medidas: TUniEdit
        AlignWithMargins = True
        Left = 219
        Top = 3
        Width = 172
        Height = 46
        Hint = ''
        Text = ''
        Align = alRight
        TabOrder = 1
        FieldLabel = 'Medida'
        FieldLabelAlign = laTop
      end
      object E_Formats: TUniEdit
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 210
        Height = 46
        Hint = ''
        Text = ''
        Align = alClient
        TabOrder = 0
        FieldLabel = 'Formato'
        FieldLabelAlign = laTop
      end
      object E_Nr_Columns: TUniEdit
        AlignWithMargins = True
        Left = 397
        Top = 3
        Width = 67
        Height = 46
        Hint = ''
        Alignment = taCenter
        Text = ''
        Align = alRight
        TabOrder = 2
        FieldLabel = 'Colunas'
        FieldLabelAlign = laTop
        OnExit = E_Nr_ColumnsExit
      end
      object E_Size_Columns: TUniEdit
        AlignWithMargins = True
        Left = 470
        Top = 3
        Width = 81
        Height = 46
        Hint = ''
        Alignment = taCenter
        Text = ''
        Align = alRight
        TabOrder = 3
        FieldLabel = 'Altura Coluna'
        FieldLabelAlign = laTop
        OnExit = E_Size_ColumnsExit
      end
      object E_OnlineValue: TUniFormattedNumberEdit
        AlignWithMargins = True
        Left = 654
        Top = 3
        Width = 98
        Height = 46
        Hint = ''
        Alignment = taRightJustify
        Align = alRight
        TabOrder = 5
        FieldLabel = 'Valor Online'
        FieldLabelAlign = laTop
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object E_OnlineDiscount: TUniFormattedNumberEdit
        AlignWithMargins = True
        Left = 557
        Top = 3
        Width = 91
        Height = 46
        Hint = ''
        Alignment = taRightJustify
        Align = alRight
        TabOrder = 4
        FieldLabel = 'Deconto Online'
        FieldLabelAlign = laTop
        DecimalSeparator = ','
        ThousandSeparator = '.'
        OnExit = E_OnlineDiscountExit
      end
    end
    object pnl_botao_item: TUniPanel
      AlignWithMargins = True
      Left = 5
      Top = 109
      Width = 749
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 3
      BorderStyle = ubsFrameLowered
      Caption = ''
      object sb_Delete_Items: TUniSpeedButton
        AlignWithMargins = True
        Left = 225
        Top = 5
        Width = 110
        Height = 42
        Hint = ''
        Margins.Left = 1
        Margins.Right = 0
        Caption = 'Excluir Item'
        Align = alLeft
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        ParentColor = False
        Color = clWindow
        TabOrder = 1
        OnClick = sb_Delete_ItemsClick
      end
      object sb_change_Items: TUniSpeedButton
        AlignWithMargins = True
        Left = 114
        Top = 5
        Width = 110
        Height = 42
        Hint = ''
        Margins.Left = 1
        Margins.Right = 0
        Caption = 'Alterar Item'
        Align = alLeft
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        ParentColor = False
        Color = clWindow
        TabOrder = 2
        OnClick = sb_change_ItemsClick
      end
      object sb_cancel_Items: TUniSpeedButton
        AlignWithMargins = True
        Left = 447
        Top = 5
        Width = 110
        Height = 42
        Hint = ''
        Margins.Left = 1
        Margins.Right = 0
        Caption = 'Cancelar Item'
        Align = alLeft
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        ParentColor = False
        Color = clWindow
        TabOrder = 3
        OnClick = sb_cancel_ItemsClick
      end
      object sb_save_Items: TUniSpeedButton
        AlignWithMargins = True
        Left = 336
        Top = 5
        Width = 110
        Height = 42
        Hint = ''
        Margins.Left = 1
        Margins.Right = 0
        Caption = 'Gravar Item'
        Align = alLeft
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        ParentColor = False
        Color = clWindow
        TabOrder = 4
        OnClick = sb_save_ItemsClick
      end
      object sb_Insert_Items: TUniSpeedButton
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 110
        Height = 42
        Hint = ''
        Margins.Left = 1
        Margins.Right = 0
        Caption = 'Inserir Item'
        Align = alLeft
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        ParentColor = False
        Color = clWindow
        TabOrder = 5
        OnClick = sb_Insert_ItemsClick
      end
    end
    object dbg_List_items: TUniDBGrid
      AlignWithMargins = True
      Left = 5
      Top = 167
      Width = 749
      Height = 261
      Hint = ''
      ClientEvents.ExtEvents.Strings = (
        
          'headerclick=function headerclick(ct, column, e, t, eOpts)'#13#10'{'#13#10'  ' +
          'dbg_List_items.dbCases.getStore().sort(column.dataIndex);'#13#10'}')
      ClientEvents.UniEvents.Strings = (
        
          'store.afterCreate=function store.afterCreate(sender)'#13#10'{'#13#10'   send' +
          'er.remotestore=false;'#13#10'}'
        
          'afterCreate=function afterCreate(sender)'#13#10'{'#13#10'  sender.remoteSort' +
          '=false;'#13#10'}')
      ClicksToEdit = 1
      DataSource = ds_med_price_list
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgTitleClick, dgTabs]
      LoadMask.Message = 'Loading data...'
      Align = alClient
      TabOrder = 4
      OnMouseDown = dbg_List_itemsMouseDown
      OnDrawColumnCell = dbg_List_itemsDrawColumnCell
      Columns = <
        item
          FieldName = 'img'
          Title.Caption = ' '
          Width = 30
        end
        item
          FieldName = 'position'
          Title.Caption = 'Posi'#231#227'o '
          Width = 224
        end
        item
          FieldName = 'week_day_value'
          Title.Caption = 'Dia '#250'til'
          Width = 70
        end
        item
          FieldName = 'sun_day_value'
          Title.Caption = 'Domingo'
          Width = 70
        end
        item
          FieldName = 'addition'
          Title.Caption = 'Valor Adicional'
          Width = 87
        end
        item
          FieldName = 'formats'
          Title.Caption = 'Formatos'
          Width = 256
        end
        item
          FieldName = 'measure'
          Title.Caption = 'Medidas'
          Width = 291
        end
        item
          FieldName = 'nr_columns'
          Title.Caption = 'Colunas'
          Width = 64
        end
        item
          FieldName = 'size_columns'
          Title.Caption = 'Tamanho Coluna'
          Width = 96
        end
        item
          FieldName = 'online_discount'
          Title.Caption = 'Desconto On-Line'
          Width = 108
        end
        item
          FieldName = 'online_price'
          Title.Caption = 'Valor On-Line'
          Width = 102
        end>
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 512
    Top = 272
  end
  inherited ds_msg: TDataSource
    Left = 512
    Top = 328
  end
  inherited MenuTask: TUniMainMenu
    Left = 792
    Top = 32
  end
  object cds_med_price_list: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 194
    object cds_med_price_listtb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
      Origin = 'tb_institution_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_med_price_listid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_med_price_listtb_broadcaster_id: TIntegerField
      FieldName = 'tb_broadcaster_id'
      Origin = 'tb_broadcaster_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_med_price_listtb_med_pos_prog_id: TIntegerField
      FieldName = 'tb_med_pos_prog_id'
      Origin = 'tb_med_pos_prog_id'
    end
    object cds_med_price_listposition: TStringField
      DisplayLabel = 'Posi'#231#227'o '
      FieldName = 'position'
      Size = 100
    end
    object cds_med_price_listweek_day_value: TBCDField
      DisplayLabel = 'Dia '#250'til'
      FieldName = 'week_day_value'
      Origin = 'week_day_value'
      Precision = 10
      Size = 2
    end
    object cds_med_price_listsun_day_value: TBCDField
      DisplayLabel = 'Domingo'
      FieldName = 'sun_day_value'
      Origin = 'sun_day_value'
      Precision = 10
      Size = 2
    end
    object cds_med_price_listaddition: TBCDField
      DisplayLabel = 'Valor Adicional'
      FieldName = 'addition'
      Origin = 'addition'
      Precision = 10
      Size = 2
    end
    object cds_med_price_listformats: TStringField
      DisplayLabel = 'Formatos'
      FieldName = 'formats'
      Origin = 'formats'
      Size = 100
    end
    object cds_med_price_listmeasure: TStringField
      DisplayLabel = 'Medidas'
      FieldName = 'measure'
      Origin = 'measure'
      Size = 100
    end
    object cds_med_price_listnr_columns: TIntegerField
      DisplayLabel = 'Colunas'
      FieldName = 'nr_columns'
      Origin = 'nr_columns'
    end
    object cds_med_price_listsize_columns: TIntegerField
      DisplayLabel = 'Tamanho Coluna'
      FieldName = 'size_columns'
      Origin = 'size_columns'
    end
    object cds_med_price_listonline_discount: TBCDField
      DisplayLabel = 'Desconto On-Line'
      FieldName = 'online_discount'
      Origin = 'online_discount'
      Precision = 10
      Size = 2
    end
    object cds_med_price_listonline_price: TBCDField
      DisplayLabel = 'Valor On-Line'
      FieldName = 'online_price'
      Origin = 'online_price'
      Precision = 10
      Size = 2
    end
    object cds_med_price_listpath_file: TStringField
      FieldName = 'path_file'
      Origin = 'path_file'
      Size = 255
    end
    object cds_med_price_listimg: TStringField
      FieldKind = fkCalculated
      FieldName = 'img'
      Size = 1
      Calculated = True
    end
  end
  object ds_med_price_list: TDataSource
    DataSet = cds_med_price_list
    Left = 48
    Top = 250
  end
  object UniFileUpload: TUniFileUpload
    Title = 'Upload'
    Messages.Uploading = 'Uploading...'
    Messages.PleaseWait = 'Please Wait'
    Messages.Cancel = 'Cancel'
    Messages.Processing = 'Processing...'
    Messages.UploadError = 'Upload Error'
    Messages.Upload = 'Upload'
    Messages.NoFileError = 'Please select a file'
    Messages.BrowseText = 'Browse...'
    Messages.UploadTimeout = 'Timeout occurred...'
    Messages.MaxSizeError = 'File is bigger than maximum allowed size'
    Messages.MaxFilesError = 'You can upload maximum %d files.'
    OnCompleted = UniFileUploadCompleted
    Left = 576
    Top = 280
  end
  object Mnu_Imagem: TUniPopupMenu
    Left = 376
    Top = 232
    object InserirImagem1: TUniMenuItem
      Caption = 'Inserir Imagem'
      OnClick = InserirImagem1Click
    end
    object ExcluirImagem1: TUniMenuItem
      Caption = 'Excluir Imagem'
      OnClick = ExcluirImagem1Click
    end
    object VisualizarImage1: TUniMenuItem
      Caption = 'Visualizar Imagem'
      OnClick = VisualizarImage1Click
    end
  end
end
