inherited CadMedBroadcasterCirculation: TCadMedBroadcasterCirculation
  Caption = 'Cobertura e Tiragem'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    inherited SB_Insert: TUniSpeedButton
      Left = 352
      Visible = False
      Align = alRight
      ExplicitLeft = 352
      ExplicitTop = 5
    end
    inherited SB_Change: TUniSpeedButton
      Left = 443
      Visible = False
      Align = alRight
      ExplicitLeft = 443
      ExplicitTop = 5
    end
    inherited SB_Delete: TUniSpeedButton
      Left = 534
      Visible = False
      Align = alRight
      ExplicitLeft = 534
    end
    inherited SB_Save: TUniSpeedButton
      Left = 2
      Caption = 'Atualizar'
      ExplicitLeft = 2
      ExplicitTop = 5
    end
    inherited SB_Cancel: TUniSpeedButton
      Left = 627
      Visible = False
      Align = alRight
      ExplicitLeft = 627
    end
    inherited Sb_Close: TUniSpeedButton
      Left = 95
      ExplicitLeft = 95
      ExplicitTop = 5
    end
  end
  inherited pnl_fundo: TUniPanel
    ExplicitTop = 0
    object pnl_row_1: TUniPanel
      Left = 2
      Top = 2
      Width = 718
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 1
      BorderStyle = ubsNone
      Caption = ''
      object Ctn_StateCity: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 603
        Height = 52
        Hint = ''
        RTL = True
        ParentRTL = False
        ParentColor = False
        Align = alClient
        TabOrder = 0
      end
      object e_Number: TUniFormattedNumberEdit
        AlignWithMargins = True
        Left = 606
        Top = 3
        Width = 109
        Height = 46
        Hint = ''
        Alignment = taRightJustify
        Align = alRight
        TabOrder = 1
        AllowBlank = False
        EmptyText = '0'
        FieldLabel = 'Tiragem'
        FieldLabelAlign = laTop
        DecimalUseOSDefault = True
        DecimalPrecision = 0
      end
    end
    object dbg_List_items: TUniDBGrid
      AlignWithMargins = True
      Left = 5
      Top = 115
      Width = 712
      Height = 201
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
      DataSource = ds_bhc
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgTitleClick, dgTabs]
      LoadMask.Message = 'Loading data...'
      Align = alClient
      TabOrder = 2
      Columns = <
        item
          FieldName = 'name'
          Title.Caption = 'Cidade'
          Width = 437
        end
        item
          FieldName = 'population'
          Title.Caption = 'Populu'#231#227'o'
          Width = 97
        end
        item
          FieldName = 'number'
          Title.Caption = 'Tiragem'
          Width = 100
        end>
    end
    object pnl_botao_item: TUniPanel
      AlignWithMargins = True
      Left = 5
      Top = 57
      Width = 712
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 3
      BorderStyle = ubsFrameLowered
      Caption = ''
      object sb_Delete_Items: TUniSpeedButton
        AlignWithMargins = True
        Left = 229
        Top = 5
        Width = 110
        Height = 42
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
        TabOrder = 1
        OnClick = sb_Delete_ItemsClick
      end
      object sb_change_Items: TUniSpeedButton
        AlignWithMargins = True
        Left = 117
        Top = 5
        Width = 110
        Height = 42
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
        TabOrder = 2
        OnClick = sb_change_ItemsClick
      end
      object sb_cancel_Items: TUniSpeedButton
        AlignWithMargins = True
        Left = 455
        Top = 5
        Width = 110
        Height = 42
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
        TabOrder = 3
        OnClick = sb_cancel_ItemsClick
      end
      object sb_save_Items: TUniSpeedButton
        AlignWithMargins = True
        Left = 341
        Top = 5
        Width = 110
        Height = 42
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
  end
  inherited cds_msg: TClientDataSet
    Left = 104
    Top = 8
  end
  inherited ds_msg: TDataSource
    Left = 104
    Top = 64
  end
  object cds_bhc: TClientDataSet
    PersistDataPacket.Data = {
      960000009619E0BD01000000180000000600000000000300000096000B74625F
      73746174655F696404000100000000000A74625F636974795F69640400010000
      000000046E616D6501004900000001000557494454480200020064001174625F
      62726F61646361737465725F696404000100000000000A706F70756C6174696F
      6E0400010000000000066E756D62657204000100000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 96
    Top = 154
    object cds_bhctb_state_id: TIntegerField
      FieldName = 'tb_state_id'
    end
    object cds_bhctb_city_id: TIntegerField
      FieldName = 'tb_city_id'
    end
    object cds_bhcname: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'name'
      Size = 100
    end
    object cds_bhctb_broadcaster_id: TIntegerField
      FieldName = 'tb_broadcaster_id'
    end
    object cds_bhcpopulation: TIntegerField
      DisplayLabel = 'Populu'#231#227'o'
      FieldName = 'population'
    end
    object cds_bhcnumber: TIntegerField
      DisplayLabel = 'Tiragem'
      FieldName = 'number'
    end
  end
  object ds_bhc: TDataSource
    DataSet = cds_bhc
    Left = 96
    Top = 210
  end
end
