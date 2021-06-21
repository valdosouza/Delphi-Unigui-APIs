inherited CadMedPriceListRt: TCadMedPriceListRt
  ClientHeight = 493
  ClientWidth = 706
  Caption = 'Tabela de Pre'#231'o R'#225'dio e TV'
  ExplicitWidth = 722
  ExplicitHeight = 552
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 429
    Width = 706
    ExplicitTop = 429
    ExplicitWidth = 706
    inherited SB_Insert: TUniSpeedButton
      Left = 336
      Visible = False
      Align = alRight
      ExplicitLeft = 336
      ExplicitTop = 5
    end
    inherited SB_Change: TUniSpeedButton
      Left = 427
      Visible = False
      Align = alRight
      ExplicitLeft = 427
      ExplicitTop = 5
    end
    inherited SB_Delete: TUniSpeedButton
      Left = 518
      Visible = False
      Align = alRight
      ExplicitLeft = 518
    end
    inherited SB_Save: TUniSpeedButton
      Left = 2
      Caption = 'Atualiza'
      ExplicitLeft = 2
      ExplicitTop = 5
    end
    inherited SB_Cancel: TUniSpeedButton
      Left = 611
      Visible = False
      Align = alRight
      ExplicitLeft = 611
    end
    inherited Sb_Close: TUniSpeedButton
      Left = 95
      ExplicitLeft = 95
      ExplicitTop = 5
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 706
    Height = 429
    ExplicitTop = 0
    ExplicitWidth = 706
    ExplicitHeight = 429
    object pnl_row_1: TUniPanel
      Left = 2
      Top = 2
      Width = 702
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 0
      BorderStyle = ubsNone
      Caption = ''
      object Ctn_Med_Pos_Prog: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 346
        Height = 52
        Hint = ''
        RTL = True
        ParentRTL = False
        ParentColor = False
        Align = alLeft
        TabOrder = 0
      end
      object E_spot15: TUniFormattedNumberEdit
        AlignWithMargins = True
        Left = 349
        Top = 3
        Width = 80
        Height = 46
        Hint = ''
        Alignment = taRightJustify
        Align = alLeft
        TabOrder = 1
        FieldLabel = 'Spot 15'#39
        FieldLabelAlign = laTop
        DecimalUseOSDefault = True
      end
      object E_spot30: TUniFormattedNumberEdit
        AlignWithMargins = True
        Left = 435
        Top = 3
        Width = 80
        Height = 46
        Hint = ''
        Alignment = taRightJustify
        Align = alLeft
        TabOrder = 2
        FieldLabel = 'Spot 30'#39
        FieldLabelAlign = laTop
        DecimalUseOSDefault = True
      end
      object E_spot45: TUniFormattedNumberEdit
        AlignWithMargins = True
        Left = 521
        Top = 3
        Width = 80
        Height = 46
        Hint = ''
        Alignment = taRightJustify
        Align = alLeft
        TabOrder = 3
        FieldLabel = 'Spot 45'#39
        FieldLabelAlign = laTop
        DecimalUseOSDefault = True
      end
      object E_spot60: TUniFormattedNumberEdit
        AlignWithMargins = True
        Left = 607
        Top = 3
        Width = 80
        Height = 46
        Hint = ''
        Alignment = taRightJustify
        Align = alLeft
        TabOrder = 4
        FieldLabel = 'Spot 60'#39
        FieldLabelAlign = laTop
        DecimalUseOSDefault = True
      end
    end
    object pnl_row_2: TUniPanel
      Left = 2
      Top = 54
      Width = 702
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 1
      BorderStyle = ubsNone
      Caption = ''
      object e_schedule: TUniEdit
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 369
        Height = 46
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        Align = alLeft
        TabOrder = 0
        FieldLabel = 'Programa'#231#227'o'
        FieldLabelAlign = laTop
      end
    end
    object pnl_row_4: TUniPanel
      Left = 2
      Top = 106
      Width = 702
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
      object sb_Delete_Items: TUniSpeedButton
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
        OnClick = sb_Delete_ItemsClick
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
      object Sb_example_item: TUniSpeedButton
        AlignWithMargins = True
        Left = 589
        Top = 3
        Width = 110
        Height = 37
        Hint = ''
        Caption = 'Exemplo'
        Align = alRight
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        ParentColor = False
        Color = clWindow
        TabOrder = 6
      end
    end
    object dbg_List_items: TUniDBGrid
      Left = 2
      Top = 149
      Width = 702
      Height = 278
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
      TabOrder = 4
      Columns = <
        item
          FieldName = 'tb_institution_id'
          Title.Caption = 'tb_institution_id'
          Width = 81
          Visible = False
        end
        item
          FieldName = 'id'
          Title.Caption = 'id'
          Width = 64
          Visible = False
        end
        item
          FieldName = 'tb_broadcaster_id'
          Title.Caption = 'tb_broadcaster_id'
          Width = 0
          Visible = False
        end
        item
          FieldName = 'description'
          Title.Caption = 'Nome do Programa'
          Width = 318
        end
        item
          FieldName = 'spot15_value'
          Title.Caption = 'Spot 15'#39
          Width = 70
        end
        item
          FieldName = 'spot30_value'
          Title.Caption = 'Spot 30'#39
          Width = 70
        end
        item
          FieldName = 'spot45_value'
          Title.Caption = 'Spot 45'#39
          Width = 70
        end
        item
          FieldName = 'spot60_value'
          Title.Caption = 'Spot 60'#39
          Width = 70
        end
        item
          FieldName = 'schedule'
          Title.Caption = 'Hor'#225'rio'
          Width = 604
        end
        item
          FieldName = 'created_at'
          Title.Caption = 'created_at'
          Width = 112
          Visible = False
        end
        item
          FieldName = 'updated_at'
          Title.Caption = 'updated_at'
          Width = 112
          Visible = False
        end>
    end
  end
  object cds_med_price_list: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 194
    object cds_med_price_listtb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
      Required = True
    end
    object cds_med_price_listid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_med_price_listtb_broadcaster_id: TIntegerField
      FieldName = 'tb_broadcaster_id'
      Required = True
    end
    object cds_med_price_listdescription: TStringField
      FieldName = 'description'
      Size = 100
    end
    object cds_med_price_listspot15_value: TBCDField
      FieldName = 'spot15_value'
      DisplayFormat = '0.00'
      Precision = 10
      Size = 2
    end
    object cds_med_price_listspot30_value: TBCDField
      FieldName = 'spot30_value'
      DisplayFormat = '0.00'
      Precision = 10
      Size = 2
    end
    object cds_med_price_listspot45_value: TBCDField
      FieldName = 'spot45_value'
      DisplayFormat = '0.00'
      Precision = 10
      Size = 2
    end
    object cds_med_price_listspot60_value: TBCDField
      FieldName = 'spot60_value'
      DisplayFormat = '0.00'
      Precision = 10
      Size = 2
    end
    object cds_med_price_listschedule: TStringField
      FieldName = 'schedule'
      Size = 100
    end
    object cds_med_price_listcreated_at: TDateTimeField
      FieldName = 'created_at'
    end
    object cds_med_price_listupdated_at: TDateTimeField
      FieldName = 'updated_at'
    end
    object cds_med_price_listtb_med_pos_prog_id: TIntegerField
      FieldName = 'tb_med_pos_prog_id'
    end
  end
  object ds_med_price_list: TDataSource
    DataSet = cds_med_price_list
    Left = 48
    Top = 250
  end
end
