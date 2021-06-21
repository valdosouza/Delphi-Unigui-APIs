inherited SeaRestMenuPizza: TSeaRestMenuPizza
  Caption = 'Card'#225'pio Pizza'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    inherited pc_search: TUniPageControl
      ActivePage = tbs_group_measure
      inherited tbs_group_attribute: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 924
        ExplicitHeight = 434
      end
      inherited tbs_group_measure: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 924
        ExplicitHeight = 434
        inherited UniPanel2: TUniPanel
          object UniSpeedButton1: TUniSpeedButton
            AlignWithMargins = True
            Left = 387
            Top = 4
            Width = 166
            Height = 39
            Hint = ''
            Margins.Left = 0
            Margins.Right = 0
            Caption = 'Atualizar Sabores/Fatias'
            Align = alLeft
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            ParentColor = False
            Color = clWindow
            TabOrder = 4
            OnClick = UniSpeedButton1Click
          end
        end
        inherited pnl_measure: TUniPanel
          inherited dbg_measure: TUniDBGrid
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
            Columns = <
              item
                FieldName = 'description'
                Title.Caption = 'Tamanhos'
                Width = 216
              end
              item
                FieldName = 'parts'
                Title.Caption = 'Sabores'
                Width = 95
              end
              item
                FieldName = 'slices'
                Title.Caption = 'Fatias'
                Width = 64
              end>
          end
        end
      end
      inherited tbs_group_observation: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 924
        ExplicitHeight = 434
      end
      inherited tbs_group_optional: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 924
        ExplicitHeight = 434
      end
      object UniTabSheet1: TUniTabSheet
        Hint = ''
        Caption = 'Ingredientes'
        object pnl_Ingredient: TUniPanel
          Left = 0
          Top = 0
          Width = 924
          Height = 434
          Hint = ''
          Align = alClient
          TabOrder = 0
          TitleVisible = True
          Title = 'Lista de Ingredientes'
          Caption = ''
          object dbg_Ingredients: TUniDBGrid
            Left = 1
            Top = 1
            Width = 922
            Height = 432
            Hint = ''
            DataSource = ds_Ingredients
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
                Width = 604
                ReadOnly = True
              end
              item
                FieldName = 'quantity'
                Title.Caption = 'Quantidade'
                Width = 70
              end>
          end
        end
      end
    end
  end
  inherited FileRestMenu: TUniFileUpload
    OnCompleted = nil
  end
  inherited Mnu_Img_Rest: TUniPopupMenu
    inherited popResMenuInsertImagem: TUniMenuItem
      OnClick = nil
    end
    inherited popResMenuDeleteImagem: TUniMenuItem
      OnClick = nil
    end
  end
  object cds_Ingredients: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    Left = 856
    Top = 159
    object cds_Ingredientstb_rest_menu_id: TIntegerField
      FieldName = 'tb_rest_menu_id'
      Origin = 'tb_rest_menu_id'
      Required = True
    end
    object cds_Ingredientstb_product_id: TIntegerField
      FieldName = 'tb_product_id'
      Origin = 'tb_product_id'
      Required = True
    end
    object cds_Ingredientsdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_Ingredientsquantity: TBCDField
      FieldName = 'quantity'
      Origin = 'quantity'
      Required = True
      Precision = 10
    end
  end
  object ds_Ingredients: TDataSource
    DataSet = cds_Ingredients
    Left = 856
    Top = 206
  end
end
