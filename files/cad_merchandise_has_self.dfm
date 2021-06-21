inherited CadMerchandiseHasSelf: TCadMerchandiseHasSelf
  ClientHeight = 464
  ClientWidth = 571
  Caption = 'Cadastro de Composi'#231#227'o'
  ExplicitWidth = 587
  ExplicitHeight = 523
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_fundo: TUniPanel [0]
    Left = 0
    Top = 0
    Width = 571
    Height = 82
    Hint = ''
    Align = alTop
    TabOrder = 0
    BorderStyle = ubsFrameLowered
    Caption = ''
    DesignSize = (
      571
      82)
    object ctn_merchandise: TUniContainerPanel
      Left = 4
      Top = 4
      Width = 485
      Height = 36
      Hint = ''
      ParentColor = False
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object UniLabel11: TUniLabel
      Left = 495
      Top = 2
      Width = 55
      Height = 14
      Hint = ''
      Caption = 'Quantidade'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 2
    end
    object E_Quantity: TUniFormattedNumberEdit
      Left = 494
      Top = 17
      Width = 71
      Hint = ''
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      TabOrder = 3
      DecimalUseOSDefault = True
    end
    object sb_Insert_Items: TUniSpeedButton
      Left = 7
      Top = 43
      Width = 127
      Height = 31
      Hint = ''
      Caption = 'Inserir Item'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      TabOrder = 4
      OnClick = sb_Insert_ItemsClick
    end
  end
  object pnl_botao: TUniPanel [1]
    Left = 0
    Top = 400
    Width = 571
    Height = 64
    Hint = ''
    Align = alBottom
    TabOrder = 1
    BorderStyle = ubsFrameLowered
    Caption = ''
    DesignSize = (
      571
      64)
    object SB_Save: TUniSpeedButton
      Left = 5
      Top = 4
      Width = 93
      Height = 54
      Hint = ''
      Caption = 'Atualizar'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 1
      OnClick = SB_SaveClick
    end
    object Sb_Close: TUniSpeedButton
      Left = 99
      Top = 4
      Width = 95
      Height = 54
      Hint = ''
      Caption = 'Sair'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 2
      OnClick = Sb_CloseClick
    end
  end
  object UniPanel1: TUniPanel [2]
    Left = 0
    Top = 82
    Width = 571
    Height = 318
    Hint = ''
    Align = alClient
    TabOrder = 2
    BorderStyle = ubsFrameLowered
    Caption = ''
    DesignSize = (
      571
      318)
    object dbg_List_items: TUniDBGrid
      Left = 2
      Top = 2
      Width = 567
      Height = 272
      Hint = ''
      ClientEvents.ExtEvents.Strings = (
        
          'headerclick=function headerclick(ct, column, e, t, eOpts)'#13#10'{'#13#10'  ' +
          'dbg_List_items.dbCases.getStore().sort(column.dataIndex);'#13#10'}')
      ClientEvents.UniEvents.Strings = (
        
          'store.afterCreate=function store.afterCreate(sender)'#13#10'{'#13#10'   send' +
          'er.remotestore=false;'#13#10'}'
        
          'afterCreate=function afterCreate(sender)'#13#10'{'#13#10'  sender.remoteSort' +
          '=false;'#13#10'}')
      DataSource = ds_items
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgTitleClick, dgTabs]
      LoadMask.Message = 'Loading data...'
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Columns = <
        item
          FieldName = 'tb_detail_id'
          Title.Caption = 'tb_detail_id'
          Width = 64
          Visible = False
        end
        item
          FieldName = 'description'
          Title.Caption = 'Descri'#231#227'o'
          Width = 416
        end
        item
          FieldName = 'quantity'
          Title.Caption = 'Quantidade'
          Width = 72
        end>
    end
    object sb_Delete_Items: TUniSpeedButton
      Left = 7
      Top = 280
      Width = 127
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
      TabOrder = 2
      OnClick = sb_Delete_ItemsClick
    end
  end
  object cds_items: TClientDataSet
    Aggregates = <>
    Filtered = True
    PacketRecords = 0
    Params = <>
    Left = 208
    Top = 122
    object cds_itemstb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
    end
    object cds_itemstb_master_id: TIntegerField
      FieldName = 'tb_master_id'
    end
    object cds_itemstb_detail_id: TIntegerField
      FieldName = 'tb_detail_id'
    end
    object cds_itemsdescription: TStringField
      FieldName = 'description'
      Size = 100
    end
    object cds_itemsquantity: TIntegerField
      FieldName = 'quantity'
    end
  end
  object ds_items: TDataSource
    DataSet = cds_items
    Left = 200
    Top = 178
  end
end
