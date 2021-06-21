inherited CadDeliveryRange: TCadDeliveryRange
  ClientHeight = 496
  ClientWidth = 577
  Caption = 'Cadastro de Tabela de Entrega'
  ExplicitWidth = 593
  ExplicitHeight = 555
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 432
    Width = 577
    ExplicitTop = 432
    ExplicitWidth = 577
    inherited SB_Insert: TUniSpeedButton
      Left = 207
      Visible = False
      Align = alRight
      ExplicitLeft = 207
      ExplicitTop = 5
    end
    inherited SB_Change: TUniSpeedButton
      Left = 298
      Visible = False
      Align = alRight
      ExplicitLeft = 298
      ExplicitTop = 5
    end
    inherited SB_Delete: TUniSpeedButton
      Left = 389
      Visible = False
      Align = alRight
      ExplicitLeft = 389
    end
    inherited SB_Save: TUniSpeedButton
      Left = 2
      Caption = 'Atualiza'
      ExplicitLeft = 2
      ExplicitTop = 5
    end
    inherited SB_Cancel: TUniSpeedButton
      Left = 482
      Visible = False
      Align = alRight
      ExplicitLeft = 482
    end
    inherited Sb_Close: TUniSpeedButton
      Left = 95
      ExplicitLeft = 95
      ExplicitTop = 5
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 577
    Height = 432
    ExplicitTop = 0
    ExplicitWidth = 577
    ExplicitHeight = 432
    object pnl_row_1: TUniPanel
      Left = 2
      Top = 2
      Width = 573
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 1
      BorderStyle = ubsNone
      Caption = ''
      object E_km_from: TUniFormattedNumberEdit
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 150
        Height = 46
        Hint = ''
        Alignment = taCenter
        Align = alLeft
        TabOrder = 0
        AllowBlank = False
        EmptyText = '0,00'
        FieldLabel = 'Do Km Inicial'
        FieldLabelAlign = laTop
        DecimalUseOSDefault = True
        DecimalPrecision = 0
      end
      object E_km_to: TUniFormattedNumberEdit
        AlignWithMargins = True
        Left = 159
        Top = 3
        Width = 150
        Height = 46
        Hint = ''
        Alignment = taCenter
        Align = alLeft
        TabOrder = 1
        AllowBlank = False
        FieldLabel = 'At'#233' o Km Final'
        FieldLabelAlign = laTop
        DecimalUseOSDefault = True
        DecimalPrecision = 0
      end
      object e_km_value: TUniFormattedNumberEdit
        AlignWithMargins = True
        Left = 315
        Top = 3
        Width = 150
        Height = 46
        Hint = ''
        Alignment = taRightJustify
        Align = alLeft
        TabOrder = 2
        AllowBlank = False
        FieldLabel = 'Valor do Km'
        FieldLabelAlign = laTop
        DecimalUseOSDefault = True
      end
    end
    object pnl_botao_item: TUniPanel
      AlignWithMargins = True
      Left = 5
      Top = 57
      Width = 567
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 2
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
      Top = 115
      Width = 567
      Height = 312
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
      DataSource = ds_delivery_range
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgTitleClick, dgTabs]
      LoadMask.Message = 'Loading data...'
      Align = alClient
      TabOrder = 3
      Columns = <
        item
          FieldName = 'km_from'
          Title.Caption = 'Do Km Inicial'
          Width = 131
        end
        item
          FieldName = 'km_to'
          Title.Caption = 'At'#233' o Km Final'
          Width = 106
        end
        item
          FieldName = 'km_value'
          Title.Caption = 'Valor do Km'
          Width = 106
        end>
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 328
    Top = 176
  end
  inherited ds_msg: TDataSource
    Left = 328
    Top = 232
  end
  object ds_delivery_range: TDataSource
    DataSet = cds_delivery_range
    Left = 64
    Top = 202
  end
  object cds_delivery_range: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 144
    object cds_delivery_rangeid: TIntegerField
      FieldName = 'id'
    end
    object cds_delivery_rangetb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
    end
    object cds_delivery_rangekm_from: TIntegerField
      FieldName = 'km_from'
    end
    object cds_delivery_rangekm_to: TIntegerField
      FieldName = 'km_to'
    end
    object cds_delivery_rangekm_value: TFloatField
      FieldName = 'km_value'
      DisplayFormat = '0.00'
    end
  end
end
