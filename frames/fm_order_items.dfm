inherited FmOrderItems: TFmOrderItems
  Width = 822
  Height = 433
  ExplicitWidth = 822
  ExplicitHeight = 433
  object Pnl_Items: TUniPanel
    Left = 0
    Top = 0
    Width = 822
    Height = 379
    Hint = ''
    Align = alClient
    TabOrder = 0
    BorderStyle = ubsFrameLowered
    Caption = ''
    ExplicitWidth = 778
    DesignSize = (
      822
      379)
    object dbg_List_items: TUniDBGrid
      Left = 2
      Top = 2
      Width = 818
      Height = 335
      Hint = ''
      ClientEvents.ExtEvents.Strings = (
        
          'headerclick=function headerclick(ct, column, e, t, eOpts)'#13#10'{'#13#10'  ' +
          'dbg_List_items.dbCases.getStore().sort(column.dataIndex);'#13#10'}')
      ClientEvents.UniEvents.Strings = (
        
          'store.afterCreate=function store.afterCreate(sender)'#13#10'{'#13#10'   send' +
          'er.remotestore=false;'#13#10'}'
        
          'afterCreate=function afterCreate(sender)'#13#10'{'#13#10'  sender.remoteSort' +
          '=false;'#13#10'}')
      DataSource = ds_search
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgTitleClick, dgTabs]
      LoadMask.Message = 'Loading data...'
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      OnMouseDown = dbg_List_itemsMouseDown
      OnTitleClick = dbg_List_itemsTitleClick
      Columns = <
        item
          FieldName = 'codepro'
          Title.Caption = 'C'#243'digo'
          Width = 68
          Visible = False
        end
        item
          FieldName = 'identifier'
          Title.Caption = 'Interno'
          Width = 82
          Visible = False
        end
        item
          FieldName = 'description'
          Title.Caption = 'Descri'#231#227'o'
          Width = 439
        end
        item
          FieldName = 'id'
          Title.Caption = 'id'
          Width = 64
          Visible = False
        end
        item
          FieldName = 'tb_institution_id'
          Title.Caption = 'tb_institution_id'
          Width = 81
          Visible = False
        end
        item
          FieldName = 'tb_order_id'
          Title.Caption = 'tb_order_id'
          Width = 64
          Visible = False
        end
        item
          FieldName = 'tb_product_id'
          Title.Caption = 'tb_product_id'
          Width = 71
          Visible = False
        end
        item
          FieldName = 'update_stock'
          Title.Caption = 'update_stock'
          Width = 69
          Visible = False
        end
        item
          FieldName = 'quantity'
          Title.Caption = 'Quantidade'
          Width = 70
        end
        item
          FieldName = 'unit_value'
          Title.Caption = 'Valor Unit'#225'rio'
          Width = 70
        end
        item
          FieldName = 'total_value'
          Title.Caption = 'Valor Total'
          Width = 75
        end
        item
          FieldName = 'discount_aliquot'
          Title.Caption = 'Aliq desc'
          Width = 70
        end
        item
          FieldName = 'discount_value'
          Title.Caption = 'Valor Desc'
          Width = 70
        end
        item
          FieldName = 'work_front'
          Title.Caption = 'Frente/Lota'#231#227'o/Refer'#234'ncia'
          Width = 304
        end
        item
          FieldName = 'note'
          Title.Caption = 'Observa'#231#227'o/Especifica'#231#227'o'
          Width = 604
        end
        item
          FieldName = 'dt_forecast'
          Title.Caption = 'Data Prevista'
          Width = 69
        end>
    end
    object sb_Insert_Items: TUniSpeedButton
      Left = 3
      Top = 342
      Width = 127
      Height = 31
      Hint = ''
      Caption = 'Novo Item'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      TabOrder = 2
      OnClick = sb_Insert_ItemsClick
    end
    object sb_Change_Items: TUniSpeedButton
      Left = 133
      Top = 341
      Width = 127
      Height = 31
      Hint = ''
      Caption = 'Alterar Item'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      TabOrder = 3
      OnClick = sb_Change_ItemsClick
    end
    object sb_Delete_Items: TUniSpeedButton
      Left = 260
      Top = 341
      Width = 129
      Height = 31
      Hint = ''
      Caption = 'Excluir Item'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      TabOrder = 4
      OnClick = sb_Delete_ItemsClick
    end
  end
  object pnl_totalizer: TUniPanel
    Left = 0
    Top = 379
    Width = 822
    Height = 54
    Hint = ''
    Align = alBottom
    TabOrder = 1
    Caption = ''
    ExplicitWidth = 778
    object E_Nr_Items: TUniFormattedNumberEdit
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 109
      Height = 46
      Hint = ''
      Alignment = taRightJustify
      ParentFont = False
      Font.Color = clLime
      Font.Height = -13
      Font.Style = [fsBold]
      Align = alLeft
      TabOrder = 1
      TabStop = False
      Color = clBlack
      ReadOnly = True
      FieldLabel = 'N'#250'mero de Itens'
      FieldLabelAlign = laTop
      DecimalSeparator = ','
      ThousandSeparator = '.'
    end
    object E_total_qtty: TUniFormattedNumberEdit
      AlignWithMargins = True
      Left = 119
      Top = 4
      Width = 90
      Height = 46
      Hint = ''
      Alignment = taRightJustify
      ParentFont = False
      Font.Color = clLime
      Font.Height = -13
      Font.Style = [fsBold]
      Align = alLeft
      TabOrder = 2
      TabStop = False
      Color = clBlack
      ReadOnly = True
      FieldLabel = 'Quantidade'
      FieldLabelAlign = laTop
      DecimalSeparator = ','
      ThousandSeparator = '.'
      ExplicitLeft = 100
    end
    object E_total_Product: TUniFormattedNumberEdit
      AlignWithMargins = True
      Left = 215
      Top = 4
      Width = 90
      Height = 46
      Hint = ''
      Alignment = taRightJustify
      ParentFont = False
      Font.Color = clLime
      Font.Height = -13
      Font.Style = [fsBold]
      Align = alLeft
      TabOrder = 3
      TabStop = False
      Color = clBlack
      ReadOnly = True
      FieldLabel = 'Valor Produtos'
      FieldLabelAlign = laTop
      DecimalSeparator = ','
      ThousandSeparator = '.'
      ExplicitLeft = 196
    end
    object E_VL_Expensive: TUniFormattedNumberEdit
      AlignWithMargins = True
      Left = 311
      Top = 4
      Width = 90
      Height = 46
      Hint = ''
      Alignment = taRightJustify
      Align = alLeft
      TabOrder = 4
      FieldLabel = 'Valor Despesas'
      FieldLabelAlign = laTop
      DecimalSeparator = ','
      ThousandSeparator = '.'
      OnExit = E_VL_ExpensiveExit
      ExplicitLeft = 292
    end
    object E_VL_Freight: TUniFormattedNumberEdit
      AlignWithMargins = True
      Left = 407
      Top = 4
      Width = 90
      Height = 46
      Hint = ''
      Alignment = taRightJustify
      Align = alLeft
      TabOrder = 5
      FieldLabel = 'Valor Frete'
      FieldLabelAlign = laTop
      DecimalSeparator = ','
      ThousandSeparator = '.'
      OnExit = E_VL_ExpensiveExit
      ExplicitLeft = 388
    end
    object E_Tx_Discount: TUniFormattedNumberEdit
      AlignWithMargins = True
      Left = 503
      Top = 4
      Width = 90
      Height = 46
      Hint = ''
      Alignment = taRightJustify
      Align = alLeft
      TabOrder = 6
      FieldLabel = 'Tx. Desconto'
      FieldLabelAlign = laTop
      DecimalSeparator = ','
      ThousandSeparator = '.'
      OnExit = E_VL_ExpensiveExit
      ExplicitLeft = 468
    end
    object E_VL_Discount: TUniFormattedNumberEdit
      AlignWithMargins = True
      Left = 599
      Top = 4
      Width = 90
      Height = 46
      Hint = ''
      Alignment = taRightJustify
      Align = alLeft
      TabOrder = 7
      FieldLabel = 'VL. Desconto'
      FieldLabelAlign = laTop
      DecimalSeparator = ','
      ThousandSeparator = '.'
      OnExit = E_VL_ExpensiveExit
      ExplicitLeft = 519
    end
    object E_VL_Order: TUniFormattedNumberEdit
      AlignWithMargins = True
      Left = 695
      Top = 4
      Width = 114
      Height = 46
      Hint = ''
      Alignment = taRightJustify
      ParentFont = False
      Font.Color = clLime
      Font.Style = [fsBold]
      Align = alLeft
      TabOrder = 8
      Color = clBlack
      ReadOnly = True
      FieldLabel = 'Valor Total'
      FieldLabelAlign = laTop
      DecimalSeparator = ','
      ThousandSeparator = '.'
    end
  end
  object ds_search: TDataSource
    DataSet = cds_items
    Left = 200
    Top = 178
  end
  object cds_items: TClientDataSet
    Aggregates = <>
    Filtered = True
    PacketRecords = 0
    Params = <>
    AfterPost = cds_itemsAfterPost
    AfterDelete = cds_itemsAfterDelete
    OnCalcFields = cds_itemsCalcFields
    Left = 208
    Top = 122
    object cds_itemscodepro: TIntegerField
      FieldName = 'codepro'
      Origin = 'codepro'
      Required = True
    end
    object cds_itemsidentifier: TStringField
      FieldName = 'identifier'
      Origin = 'identifier'
      Required = True
      Size = 50
    end
    object cds_itemsdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Required = True
      Size = 100
    end
    object cds_itemsid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_itemstb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
      Origin = 'tb_institution_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_itemstb_order_id: TIntegerField
      FieldName = 'tb_order_id'
      Origin = 'tb_order_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_itemstb_product_id: TIntegerField
      FieldName = 'tb_product_id'
      Origin = 'tb_product_id'
      Required = True
    end
    object cds_itemstb_stock_list_id: TIntegerField
      FieldName = 'tb_stock_list_id'
      Origin = 'tb_stock_list_id'
      Required = True
    end
    object cds_itemsquantity: TBCDField
      FieldName = 'quantity'
      Origin = 'quantity'
      DisplayFormat = '#,##0.00#'
      Precision = 10
    end
    object cds_itemsunit_value: TFMTBCDField
      FieldName = 'unit_value'
      Origin = 'unit_value'
      DisplayFormat = '#,##0.00#'
      Precision = 10
      Size = 6
    end
    object cds_itemsdiscount_aliquot: TBCDField
      FieldName = 'discount_aliquot'
      Origin = 'discount_aliquot'
      DisplayFormat = '0.00'
      Precision = 10
      Size = 2
    end
    object cds_itemsdiscount_value: TFMTBCDField
      FieldName = 'discount_value'
      Origin = 'discount_value'
      DisplayFormat = '#,##0.00#'
      Precision = 10
      Size = 6
    end
    object cds_itemstotal_value: TFloatField
      FieldKind = fkCalculated
      FieldName = 'total_value'
      DisplayFormat = '#,##0.00#'
      Calculated = True
    end
    object cds_itemsreg_status: TStringField
      FieldKind = fkCalculated
      FieldName = 'reg_status'
      Calculated = True
    end
    object cds_itemswork_front: TStringField
      FieldName = 'work_front'
      Size = 50
    end
    object cds_itemsnote: TStringField
      FieldName = 'note'
      Size = 100
    end
    object cds_itemsdt_forecast: TDateField
      FieldName = 'dt_forecast'
    end
    object cds_itemscomposition: TStringField
      FieldName = 'composition'
    end
    object cds_itemsstatus: TStringField
      FieldName = 'status'
      Size = 1
    end
  end
  object pop_items: TUniPopupMenu
    Left = 392
    Top = 72
    object Mercadoria1: TUniMenuItem
      Caption = 'Cadastro Mercadoria'
      OnClick = Mercadoria1Click
    end
  end
end
