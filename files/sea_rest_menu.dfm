inherited SeaRestMenu: TSeaRestMenu
  ClientHeight = 530
  ClientWidth = 936
  Caption = 'Pesquisa Card'#225'pio'
  ExplicitWidth = 952
  ExplicitHeight = 589
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 936
    Height = 466
    ExplicitWidth = 936
    ExplicitHeight = 466
    inherited pc_search: TUniPageControl
      Width = 932
      Height = 462
      ActivePage = tbs_search
      ExplicitWidth = 932
      ExplicitHeight = 462
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 924
        ExplicitHeight = 434
        inherited pnl_param: TUniPanel
          Width = 924
          Height = 403
          ExplicitWidth = 924
          ExplicitHeight = 403
          object pnl_param_row_01: TUniPanel
            Left = 2
            Top = 2
            Width = 920
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 1
            BorderStyle = ubsNone
            Caption = ''
            object E_Subgrupo: TUniEdit
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 230
              Height = 46
              Hint = ''
              Text = ''
              Align = alLeft
              TabOrder = 1
              FieldLabel = 'Subgrupo'
              FieldLabelAlign = laTop
              SelectOnFocus = True
            end
            object E_Description: TUniEdit
              AlignWithMargins = True
              Left = 239
              Top = 3
              Width = 678
              Height = 46
              Hint = ''
              CharCase = ecUpperCase
              Text = ''
              Align = alClient
              TabOrder = 2
              FieldLabel = 'Descri'#231#227'o'
              FieldLabelAlign = laTop
              SelectOnFocus = True
            end
          end
          object chbx_Ativo: TUniCheckBox
            AlignWithMargins = True
            Left = 9
            Top = 57
            Width = 62
            Height = 23
            Hint = ''
            Checked = True
            Caption = 'Ativo'
            TabOrder = 2
            OnChange = chbx_limit_resultChange
          end
        end
        inherited pnl_config: TUniPanel
          Top = 403
          Width = 924
          ExplicitTop = 403
          ExplicitWidth = 924
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 924
        ExplicitHeight = 434
        inherited dbg_Search: TUniDBGrid
          Width = 924
          Height = 434
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgTitleClick, dgTabs]
          OnMouseDown = dbg_SearchMouseDown
          OnDrawColumnCell = dbg_SearchDrawColumnCell
          Columns = <
            item
              FieldName = 'menu'
              Title.Caption = 'menu'
              Width = 416
            end
            item
              FieldName = 'subgrupo'
              Title.Caption = 'Subgrupo'
              Width = 280
              ReadOnly = True
            end
            item
              FieldName = 'link_url'
              Title.Caption = 'Imagem'
              Width = 147
              Alignment = taCenter
              ImageOptions.Visible = True
              ImageOptions.Width = 30
            end>
        end
      end
      object tbs_group_attribute: TUniTabSheet
        Hint = ''
        Caption = 'Atributos'
        object pnl_Attribute_group: TUniPanel
          Left = 0
          Top = 0
          Width = 275
          Height = 381
          Hint = ''
          Align = alLeft
          TabOrder = 0
          TitleVisible = True
          Title = 'Lista de Atributos'
          Caption = ''
          object dbg_attribute_Group: TUniDBGrid
            Left = 1
            Top = 1
            Width = 273
            Height = 379
            Hint = ''
            DataSource = ds_attribute_group
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
            WebOptions.RetainCursorOnSort = True
            LoadMask.Message = 'Carregando os dados'
            Align = alClient
            TabOrder = 1
            OnColumnSort = dbg_SearchColumnSort
            OnDblClick = dbg_SearchDblClick
            Columns = <
              item
                FieldName = 'kind'
                Title.Caption = 'Descri'#231#227'o'
                Width = 205
              end>
          end
        end
        object pnl_attribute_itens: TUniPanel
          Left = 275
          Top = 0
          Width = 649
          Height = 381
          Hint = ''
          Align = alClient
          TabOrder = 1
          TitleVisible = True
          Title = 'Detalhes dos Atributos'
          Caption = ''
          object dbg_attribute_itens: TUniDBGrid
            Left = 1
            Top = 1
            Width = 647
            Height = 379
            Hint = ''
            DataSource = ds_attribute_itens
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
            WebOptions.RetainCursorOnSort = True
            LoadMask.Message = 'Carregando os dados'
            Align = alClient
            TabOrder = 1
            OnColumnSort = dbg_SearchColumnSort
            OnDblClick = dbg_SearchDblClick
            Columns = <
              item
                FieldName = 'description'
                Title.Caption = 'Descri'#231#227'o'
                Width = 304
              end
              item
                FieldName = 'price_tag'
                Title.Caption = 'Valor Unit'#225'rio'
                Width = 139
              end>
          end
        end
        object pnl_group_attribute_bottom: TUniPanel
          AlignWithMargins = True
          Left = 3
          Top = 384
          Width = 918
          Height = 47
          Hint = ''
          Align = alBottom
          TabOrder = 2
          Caption = ''
          object Sb_Insert_attributes: TUniSpeedButton
            AlignWithMargins = True
            Left = 4
            Top = 4
            Width = 127
            Height = 39
            Hint = ''
            Margins.Right = 0
            AllowAllUp = True
            Caption = 'Inserir'
            Align = alLeft
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            ParentColor = False
            Color = clWindow
            TabOrder = 1
          end
          object Sb_Change_attributes: TUniSpeedButton
            AlignWithMargins = True
            Left = 131
            Top = 4
            Width = 127
            Height = 39
            Hint = ''
            Margins.Left = 0
            Margins.Right = 0
            Caption = 'Alterar'
            Align = alLeft
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            ParentColor = False
            Color = clWindow
            TabOrder = 2
          end
          object Sb_Delet_attributes: TUniSpeedButton
            AlignWithMargins = True
            Left = 258
            Top = 4
            Width = 129
            Height = 39
            Hint = ''
            Margins.Left = 0
            Margins.Right = 0
            Caption = 'Excluir'
            Align = alLeft
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            ParentColor = False
            Color = clWindow
            TabOrder = 3
          end
        end
      end
      object tbs_group_measure: TUniTabSheet
        Hint = ''
        Caption = 'Medidas'
        object UniPanel2: TUniPanel
          AlignWithMargins = True
          Left = 3
          Top = 384
          Width = 918
          Height = 47
          Hint = ''
          Align = alBottom
          TabOrder = 0
          Caption = ''
          object Sb_Insert_measure: TUniSpeedButton
            AlignWithMargins = True
            Left = 4
            Top = 4
            Width = 127
            Height = 39
            Hint = ''
            Margins.Right = 0
            AllowAllUp = True
            Caption = 'Inserir'
            Align = alLeft
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            ParentColor = False
            Color = clWindow
            TabOrder = 1
          end
          object Sb_Change_measure: TUniSpeedButton
            AlignWithMargins = True
            Left = 131
            Top = 4
            Width = 127
            Height = 39
            Hint = ''
            Margins.Left = 0
            Margins.Right = 0
            Caption = 'Alterar'
            Align = alLeft
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            ParentColor = False
            Color = clWindow
            TabOrder = 2
          end
          object Sb_Delet_measure: TUniSpeedButton
            AlignWithMargins = True
            Left = 258
            Top = 4
            Width = 129
            Height = 39
            Hint = ''
            Margins.Left = 0
            Margins.Right = 0
            Caption = 'Excluir'
            Align = alLeft
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            ParentColor = False
            Color = clWindow
            TabOrder = 3
          end
        end
        object pnl_measure: TUniPanel
          Left = 0
          Top = 0
          Width = 924
          Height = 381
          Hint = ''
          Align = alClient
          TabOrder = 1
          TitleVisible = True
          Title = 'Lista de Medidas/Tamanhos'
          Caption = ''
          object dbg_measure: TUniDBGrid
            Left = 1
            Top = 1
            Width = 922
            Height = 379
            Hint = ''
            DataSource = ds_measure
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
            WebOptions.RetainCursorOnSort = True
            LoadMask.Message = 'Carregando os dados'
            Align = alClient
            TabOrder = 1
          end
        end
      end
      object tbs_group_observation: TUniTabSheet
        Hint = ''
        Caption = 'Observa'#231#245'es'
        object pnl_observation: TUniPanel
          Left = 0
          Top = 0
          Width = 924
          Height = 434
          Hint = ''
          Align = alClient
          TabOrder = 0
          TitleVisible = True
          Title = 'Lista de Observa'#231#245'es'
          Caption = ''
          object dbg_observation: TUniDBGrid
            Left = 1
            Top = 1
            Width = 922
            Height = 432
            Hint = ''
            DataSource = ds_observation
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
            WebOptions.RetainCursorOnSort = True
            LoadMask.Message = 'Carregando os dados'
            Align = alClient
            TabOrder = 1
            OnColumnSort = dbg_SearchColumnSort
            OnDblClick = dbg_SearchDblClick
            Columns = <
              item
                FieldName = 'description'
                Title.Caption = 'Descri'#231#227'o'
                Width = 304
              end>
          end
        end
      end
      object tbs_group_optional: TUniTabSheet
        Hint = ''
        Caption = 'Opcionais'
        object pnl_optional: TUniPanel
          Left = 0
          Top = 0
          Width = 924
          Height = 434
          Hint = ''
          Align = alClient
          TabOrder = 0
          TitleVisible = True
          Title = 'Lista de Opcionais'
          Caption = ''
          object dbg_optional: TUniDBGrid
            Left = 1
            Top = 1
            Width = 922
            Height = 432
            Hint = ''
            DataSource = ds_optional
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
            WebOptions.RetainCursorOnSort = True
            LoadMask.Message = 'Carregando os dados'
            Align = alClient
            TabOrder = 1
            OnColumnSort = dbg_SearchColumnSort
            OnDblClick = dbg_SearchDblClick
            Columns = <
              item
                FieldName = 'description'
                Title.Caption = 'Descri'#231#227'o'
                Width = 545
                ReadOnly = True
              end
              item
                FieldName = 'quantity'
                Title.Caption = 'Quantidade'
                Width = 89
              end
              item
                FieldName = 'price_tag'
                Title.Caption = 'Valor Unit'#225'rio'
                Width = 97
              end>
          end
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 466
    Width = 936
    ExplicitTop = 466
    ExplicitWidth = 936
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_searchtb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
      Origin = 'tb_institution_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_searchmenu: TStringField
      FieldName = 'menu'
      Origin = 'description'
      Required = True
      Size = 1000
    end
    object cds_searchtb_rest_subgroup_id: TIntegerField
      FieldName = 'tb_rest_subgroup_id'
      Origin = 'tb_rest_subgroup_id'
    end
    object cds_searchtb_rest_group_id: TIntegerField
      FieldName = 'tb_rest_group_id'
      Origin = 'tb_rest_group_id'
    end
    object cds_searchsubgrupo: TStringField
      FieldName = 'subgrupo'
      Origin = 'description'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_searchlink_url: TStringField
      FieldName = 'link_url'
      Size = 255
    end
    object cds_searchimg: TStringField
      DisplayWidth = 255
      FieldKind = fkCalculated
      FieldName = 'img'
      Size = 255
      Calculated = True
    end
    object cds_searchactive: TStringField
      FieldName = 'active'
      Size = 1
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 8
    Top = 120
  end
  object cds_attribute_group: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    AfterScroll = cds_attribute_groupAfterScroll
    Left = 328
    Top = 135
  end
  object ds_attribute_group: TDataSource
    DataSet = cds_attribute_group
    Left = 328
    Top = 182
  end
  object cds_attribute_itens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    Left = 456
    Top = 159
    object cds_attribute_itensid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_attribute_itenstb_rest_group_id: TIntegerField
      FieldName = 'tb_rest_group_id'
      Origin = 'tb_rest_group_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_attribute_itenstb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
      Origin = 'tb_institution_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_attribute_itenskind: TStringField
      FieldName = 'kind'
      Origin = 'kind'
      Size = 25
    end
    object cds_attribute_itensdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Size = 50
    end
    object cds_attribute_itensprice_tag: TBCDField
      FieldName = 'price_tag'
      Origin = 'price_tag'
      DisplayFormat = '0.00'
      Precision = 10
      Size = 2
    end
    object cds_attribute_itenscreated_at: TDateTimeField
      FieldName = 'created_at'
      Origin = 'created_at'
    end
    object cds_attribute_itensupdated_at: TDateTimeField
      FieldName = 'updated_at'
      Origin = 'updated_at'
    end
  end
  object ds_attribute_itens: TDataSource
    DataSet = cds_attribute_itens
    Left = 456
    Top = 206
  end
  object cds_measure: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    Left = 552
    Top = 95
  end
  object ds_measure: TDataSource
    DataSet = cds_measure
    Left = 552
    Top = 142
  end
  object cds_observation: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    Left = 640
    Top = 159
    object cds_observationid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_observationtb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
      Origin = 'tb_institution_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_observationtb_rest_group_id: TIntegerField
      FieldName = 'tb_rest_group_id'
      Origin = 'tb_rest_group_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_observationdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Size = 100
    end
    object cds_observationcreated_at: TDateTimeField
      FieldName = 'created_at'
      Origin = 'created_at'
    end
    object cds_observationupdated_at: TDateTimeField
      FieldName = 'updated_at'
      Origin = 'updated_at'
    end
  end
  object ds_observation: TDataSource
    DataSet = cds_observation
    Left = 640
    Top = 206
  end
  object cds_optional: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    Left = 752
    Top = 159
    object cds_optionaltb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
      Origin = 'tb_institution_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_optionaltb_rest_group_id: TIntegerField
      FieldName = 'tb_rest_group_id'
      Origin = 'tb_rest_group_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_optionaltb_product_id: TIntegerField
      FieldName = 'tb_product_id'
      Origin = 'tb_product_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_optionalquantity: TBCDField
      FieldName = 'quantity'
      Origin = 'quantity'
      Required = True
      DisplayFormat = '0.00'
      Precision = 10
    end
    object cds_optionalprice_tag: TBCDField
      FieldName = 'price_tag'
      Origin = 'price_tag'
      DisplayFormat = '0.00'
      Precision = 10
      Size = 2
    end
    object cds_optionaldescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object ds_optional: TDataSource
    DataSet = cds_optional
    Left = 752
    Top = 206
  end
  object FileRestMenu: TUniFileUpload
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
    OnCompleted = FileRestMenuCompleted
    Left = 528
    Top = 296
  end
  object Mnu_Img_Rest: TUniPopupMenu
    Left = 448
    Top = 296
    object popResMenuInsertImagem: TUniMenuItem
      Caption = 'Inserir Imagem'
      OnClick = popResMenuInsertImagemClick
    end
    object popResMenuDeleteImagem: TUniMenuItem
      Caption = 'Excluir Imagem'
      OnClick = popResMenuDeleteImagemClick
    end
  end
end
