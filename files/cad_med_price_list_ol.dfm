inherited CadMedPriceListOl: TCadMedPriceListOl
  ClientHeight = 500
  ClientWidth = 793
  Caption = 'Tabela de Pre'#231'os - ON-LINE'
  ExplicitWidth = 809
  ExplicitHeight = 559
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 436
    Width = 793
    ExplicitTop = 436
    ExplicitWidth = 793
    inherited SB_Insert: TUniSpeedButton
      Left = 700
      Visible = False
      Align = alRight
      ExplicitLeft = 700
      ExplicitTop = 5
    end
    inherited SB_Change: TUniSpeedButton
      Left = 606
      Visible = False
      Align = alRight
      ExplicitLeft = 606
      ExplicitTop = 5
    end
    inherited SB_Delete: TUniSpeedButton
      Left = 513
      Visible = False
      Align = alRight
      ExplicitLeft = 513
    end
    inherited SB_Save: TUniSpeedButton
      Left = 2
      Caption = 'Atualiza'
      ExplicitLeft = 2
      ExplicitTop = 5
    end
    inherited SB_Cancel: TUniSpeedButton
      Left = 420
      Visible = False
      Align = alRight
      ExplicitLeft = 420
    end
    inherited Sb_Close: TUniSpeedButton
      Left = 95
      ExplicitLeft = 95
      ExplicitTop = 5
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 793
    Height = 436
    ExplicitTop = 0
    ExplicitWidth = 793
    ExplicitHeight = 436
    object pnl_row_3: TUniPanel
      Left = 2
      Top = 106
      Width = 789
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 2
      BorderStyle = ubsNone
      Caption = ''
      object E_note: TUniEdit
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 783
        Height = 46
        Hint = ''
        Text = ''
        Align = alClient
        TabOrder = 0
        FieldLabel = 'Observa'#231#245'es'
        FieldLabelAlign = laTop
      end
    end
    object pnl_row_4: TUniPanel
      Left = 2
      Top = 158
      Width = 789
      Height = 43
      Hint = ''
      Align = alTop
      TabOrder = 3
      BorderStyle = ubsNone
      Caption = ''
      object sb_Insert_Items: TUniSpeedButton
        AlignWithMargins = True
        Left = 1
        Top = 3
        Width = 110
        Height = 37
        Hint = ''
        Margins.Left = 1
        Caption = 'Inserir Item'
        Align = alLeft
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        ParentColor = False
        Color = clWindow
        TabOrder = 1
        OnClick = sb_Insert_ItemsClick
      end
      object sb_delete_Items: TUniSpeedButton
        AlignWithMargins = True
        Left = 227
        Top = 3
        Width = 110
        Height = 37
        Hint = ''
        Margins.Left = 1
        Margins.Right = 1
        Caption = 'Excluir Item'
        Align = alLeft
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        ParentColor = False
        Color = clWindow
        TabOrder = 2
        OnClick = sb_delete_ItemsClick
      end
      object sb_change_Items: TUniSpeedButton
        AlignWithMargins = True
        Left = 115
        Top = 3
        Width = 110
        Height = 37
        Hint = ''
        Margins.Left = 1
        Margins.Right = 1
        Caption = 'Alterar Item'
        Align = alLeft
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        ParentColor = False
        Color = clWindow
        TabOrder = 3
        OnClick = sb_change_ItemsClick
      end
      object sb_cancel_Items: TUniSpeedButton
        AlignWithMargins = True
        Left = 453
        Top = 3
        Width = 110
        Height = 37
        Hint = ''
        Margins.Right = 1
        Caption = 'Cancelar Item'
        Align = alLeft
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        ParentColor = False
        Color = clWindow
        TabOrder = 4
        OnClick = sb_cancel_ItemsClick
      end
      object sb_save_Items: TUniSpeedButton
        AlignWithMargins = True
        Left = 339
        Top = 3
        Width = 110
        Height = 37
        Hint = ''
        Margins.Left = 1
        Margins.Right = 1
        Caption = 'Gravar Item'
        Align = alLeft
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        ParentColor = False
        Color = clWindow
        TabOrder = 5
        OnClick = sb_save_ItemsClick
      end
    end
    object pnl_row_2: TUniPanel
      Left = 2
      Top = 54
      Width = 789
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 1
      BorderStyle = ubsNone
      Caption = ''
      object E_Daily: TUniFormattedNumberEdit
        AlignWithMargins = True
        Left = 301
        Top = 3
        Width = 80
        Height = 46
        Hint = ''
        Alignment = taRightJustify
        Align = alLeft
        TabOrder = 3
        FieldLabel = 'Di'#225'ria'
        FieldLabelAlign = laTop
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object E_price_value: TUniFormattedNumberEdit
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 120
        Height = 46
        Hint = ''
        Alignment = taRightJustify
        Align = alLeft
        TabOrder = 0
        FieldLabel = 'Valor Padr'#227'o'
        FieldLabelAlign = laTop
        DecimalUseOSDefault = True
      end
      object E_Expansible: TUniEdit
        AlignWithMargins = True
        Left = 215
        Top = 3
        Width = 80
        Height = 46
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 2
        FieldLabel = 'Expansivel'
        FieldLabelAlign = laTop
      end
      object E_Determination: TUniEdit
        AlignWithMargins = True
        Left = 129
        Top = 3
        Width = 80
        Height = 46
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 1
        FieldLabel = 'Determina'#231#227'o'
        FieldLabelAlign = laTop
      end
      object E_Dimension: TUniEdit
        AlignWithMargins = True
        Left = 387
        Top = 3
        Width = 80
        Height = 46
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 4
        FieldLabel = 'Dimens'#245'es'
        FieldLabelAlign = laTop
      end
      object E_PageView_Max: TUniFormattedNumberEdit
        AlignWithMargins = True
        Left = 695
        Top = 3
        Width = 90
        Height = 46
        Hint = ''
        Alignment = taRightJustify
        Align = alLeft
        TabOrder = 7
        FieldLabel = 'PageView M'#225'x'
        FieldLabelAlign = laTop
        DecimalPrecision = 0
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object E_PageView_Min: TUniFormattedNumberEdit
        AlignWithMargins = True
        Left = 599
        Top = 3
        Width = 90
        Height = 46
        Hint = ''
        Alignment = taRightJustify
        Align = alLeft
        TabOrder = 6
        FieldLabel = 'PageView M'#237'n'
        FieldLabelAlign = laTop
        DecimalPrecision = 0
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object E_OnlineVAlue: TUniFormattedNumberEdit
        AlignWithMargins = True
        Left = 473
        Top = 3
        Width = 120
        Height = 46
        Hint = ''
        Alignment = taRightJustify
        Align = alLeft
        TabOrder = 5
        FieldLabel = 'Valor Online'
        FieldLabelAlign = laTop
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
    end
    object pnl_row_1: TUniPanel
      Left = 2
      Top = 2
      Width = 789
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 0
      BorderStyle = ubsNone
      Caption = ''
      object E_Description: TUniEdit
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 312
        Height = 46
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 0
        FieldLabel = 'Descri'#231#227'o'
        FieldLabelAlign = laTop
      end
      object E_position: TUniEdit
        AlignWithMargins = True
        Left = 321
        Top = 3
        Width = 80
        Height = 46
        Hint = ''
        Text = ''
        Align = alLeft
        TabOrder = 1
        FieldLabel = 'Posi'#231#227'o'
        FieldLabelAlign = laTop
      end
      object e_formats: TUniEdit
        AlignWithMargins = True
        Left = 407
        Top = 3
        Width = 379
        Height = 46
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        Align = alClient
        TabOrder = 2
        FieldLabel = 'Formatos'
        FieldLabelAlign = laTop
      end
    end
    object dbg_List_items: TUniDBGrid
      Left = 2
      Top = 201
      Width = 789
      Height = 233
      Hint = ''
      ClientEvents.ExtEvents.Strings = (
        
          'headerclick=function headerclick(ct, column, e, t, eOpts)'#13#10'{'#13#10'  ' +
          'dbg_List_items.dbCases.getStore().sort(column.dataIndex);'#13#10'}')
      ClientEvents.UniEvents.Strings = (
        
          'store.afterCreate=function store.afterCreate(sender)'#13#10'{'#13#10'   send' +
          'er.remotestore=false;'#13#10'}'
        
          'afterCreate=function afterCreate(sender)'#13#10'{'#13#10'  sender.remoteSort' +
          '=false;'#13#10'}')
      DataSource = ds_med_price_list
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgTitleClick, dgTabs]
      LoadMask.Message = 'Loading data...'
      Align = alClient
      TabOrder = 5
      OnMouseDown = dbg_List_itemsMouseDown
      OnDrawColumnCell = dbg_List_itemsDrawColumnCell
      Columns = <
        item
          FieldName = 'img'
          Title.Caption = ' '
          Width = 30
        end
        item
          FieldName = 'description'
          Title.Caption = 'Descri'#231#227'o'
          Width = 286
        end
        item
          FieldName = 'formats'
          Title.Caption = 'Formatos'
          Width = 297
        end
        item
          FieldName = 'price_value'
          Title.Caption = 'Valor Tabela'
          Width = 87
        end
        item
          FieldName = 'determination'
          Title.Caption = 'Determina'#231#227'o'
          Width = 101
        end
        item
          FieldName = 'expansible'
          Title.Caption = 'Expans'#237'vel'
          Width = 81
        end
        item
          FieldName = 'daily'
          Title.Caption = 'Di'#225'ria'
          Width = 70
        end
        item
          FieldName = 'dimensions'
          Title.Caption = 'Dimens'#245'es'
          Width = 304
        end
        item
          FieldName = 'position'
          Title.Caption = 'Posi'#231#227'o'
          Width = 64
        end
        item
          FieldName = 'online_price'
          Title.Caption = 'Valor On-Line'
          Width = 91
        end
        item
          FieldName = 'pageview_min'
          Title.Caption = 'PageView M'#237'nima'
          Width = 96
        end
        item
          FieldName = 'pageview_max'
          Title.Caption = 'PageView M'#225'xima'
          Width = 107
        end>
    end
  end
  object cds_med_price_list: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    Left = 72
    Top = 194
    object cds_med_price_listtb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
      Origin = 'tb_institution_id'
      Required = True
    end
    object cds_med_price_listid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object cds_med_price_listtb_broadcaster_id: TIntegerField
      FieldName = 'tb_broadcaster_id'
      Origin = 'tb_broadcaster_id'
      Required = True
    end
    object cds_med_price_listdescription: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'description'
      Origin = 'description'
      Required = True
      Size = 100
    end
    object cds_med_price_listformats: TStringField
      DisplayLabel = 'Formatos'
      FieldName = 'formats'
      Origin = 'formats'
      Required = True
      Size = 100
    end
    object cds_med_price_listprice_value: TBCDField
      DisplayLabel = 'Valor Tabela'
      FieldName = 'price_value'
      Origin = 'price_value'
      Required = True
      Precision = 10
      Size = 2
    end
    object cds_med_price_listdetermination: TIntegerField
      DisplayLabel = 'Dimens'#245'es'
      FieldName = 'determination'
      Origin = 'determination'
      Required = True
    end
    object cds_med_price_listexpansible: TIntegerField
      DisplayLabel = 'Expans'#237'vel'
      FieldName = 'expansible'
      Origin = 'expansible'
      Required = True
    end
    object cds_med_price_listdaily: TBCDField
      DisplayLabel = 'Di'#225'ria'
      FieldName = 'daily'
      Origin = 'daily'
      Required = True
      Precision = 10
      Size = 2
    end
    object cds_med_price_listdimensions: TStringField
      DisplayLabel = 'Dimens'#245'es'
      FieldName = 'dimensions'
      Origin = 'dimensions'
      Required = True
      Size = 50
    end
    object cds_med_price_listposition: TIntegerField
      DisplayLabel = 'Posi'#231#227'o'
      FieldName = 'position'
      Origin = 'position'
      Required = True
    end
    object cds_med_price_listnote: TBlobField
      FieldName = 'note'
      Origin = 'note'
    end
    object cds_med_price_listcreated_at: TDateTimeField
      FieldName = 'created_at'
      Origin = 'created_at'
    end
    object cds_med_price_listupdated_at: TDateTimeField
      FieldName = 'updated_at'
      Origin = 'updated_at'
    end
    object cds_med_price_listonline_price: TBCDField
      DisplayLabel = 'Valor On-Line'
      FieldName = 'online_price'
      Origin = 'online_price'
      Precision = 10
      Size = 2
    end
    object cds_med_price_listpageview_min: TIntegerField
      DisplayLabel = 'PageView M'#237'nima'
      FieldName = 'pageview_min'
      Origin = 'pageview_min'
    end
    object cds_med_price_listpageview_max: TIntegerField
      DisplayLabel = 'PageView M'#225'xima'
      FieldName = 'pageview_max'
      Origin = 'pageview_max'
    end
    object cds_med_price_listimg: TStringField
      FieldKind = fkCalculated
      FieldName = 'img'
      Calculated = True
    end
    object cds_med_price_listpath_file: TStringField
      FieldName = 'path_file'
      Size = 100
    end
  end
  object ds_med_price_list: TDataSource
    DataSet = cds_med_price_list
    Left = 48
    Top = 250
  end
  object DSP: TDataSetProvider
    DataSet = UMM.Qr_Crud
    Left = 48
    Top = 136
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
