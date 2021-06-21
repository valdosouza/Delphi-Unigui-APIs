inherited CadMedPriceList: TCadMedPriceList
  ClientHeight = 452
  ClientWidth = 570
  Caption = 'Tabela de Pre'#231'os'
  ExplicitWidth = 586
  ExplicitHeight = 510
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 388
    Width = 570
    TabOrder = 1
    ExplicitTop = 388
    ExplicitWidth = 570
    inherited SB_Insert: TUniSpeedButton
      Left = 391
      Top = 6
      Visible = False
      ExplicitLeft = 391
      ExplicitTop = 6
    end
    inherited SB_Change: TUniSpeedButton
      Left = 476
      Top = 6
      Visible = False
      ExplicitLeft = 476
      ExplicitTop = 6
    end
    inherited SB_Delete: TUniSpeedButton
      Left = 307
      Top = 6
      Visible = False
      ExplicitLeft = 307
      ExplicitTop = 6
    end
    inherited SB_Save: TUniSpeedButton
      Left = 7
      Top = 3
      Caption = 'Atualizar'
      ExplicitLeft = 7
      ExplicitTop = 3
    end
    inherited SB_Cancel: TUniSpeedButton
      Left = 222
      Top = 6
      Visible = False
      ExplicitLeft = 222
      ExplicitTop = 6
    end
    inherited Sb_Close: TUniSpeedButton
      Left = 100
      Top = 3
      ExplicitLeft = 100
      ExplicitTop = 3
    end
  end
  inherited pnl_fundo: TUniPanel
    Top = 84
    Width = 570
    Height = 304
    TabOrder = 2
    ExplicitTop = 84
    ExplicitWidth = 570
    ExplicitHeight = 304
    object dbg_List_items: TUniDBGrid
      Left = 2
      Top = 2
      Width = 566
      Height = 258
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
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Columns = <
        item
          FieldName = 'id'
          Title.Caption = 'id'
          Width = 64
          Visible = False
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'description'
          Title.Caption = 'Descri'#231#227'o'
          Width = 470
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'tag_value'
          Title.Caption = 'Valor'
          Width = 84
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'tb_institution_id'
          Title.Caption = 'tb_institution_id'
          Width = 81
          Visible = False
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'tb_broadcaster_id'
          Title.Caption = 'tb_broadcaster_id'
          Width = 92
          Visible = False
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'kind'
          Title.Caption = 'kind'
          Width = 64
          Visible = False
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
    object sb_Delete_Items: TUniSpeedButton
      Left = 7
      Top = 266
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
      OnClick = sb_Delete_ItemsClick
    end
  end
  object UniPanel1: TUniPanel [2]
    Left = 0
    Top = 0
    Width = 570
    Height = 84
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    BorderStyle = ubsFrameLowered
    Caption = ''
    DesignSize = (
      570
      84)
    object UniLabel1: TUniLabel
      Left = 4
      Top = 3
      Width = 46
      Height = 13
      Hint = ''
      Caption = 'Descri'#231#227'o'
      TabOrder = 1
    end
    object E_description: TUniEdit
      Left = 4
      Top = 17
      Width = 467
      Hint = ''
      Text = ''
      TabOrder = 2
    end
    object sb_Insert_Items: TUniSpeedButton
      Left = 7
      Top = 45
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
      OnClick = sb_Insert_ItemsClick
    end
    object E_tag_value: TUniFormattedNumberEdit
      Left = 475
      Top = 17
      Width = 87
      Hint = ''
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      TabOrder = 4
      DecimalUseOSDefault = True
    end
    object UniLabel11: TUniLabel
      Left = 478
      Top = 2
      Width = 25
      Height = 14
      Hint = ''
      Caption = 'Valor'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 5
    end
  end
  inherited Menu: TUniMainMenu
    Left = 64
    Top = 96
  end
  object DSP: TDataSetProvider
    DataSet = UMM.Qr_Crud
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 32
    Top = 128
  end
  object cds_med_price_list: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    Left = 40
    Top = 186
    object cds_med_price_listid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_med_price_listdescription: TStringField
      FieldName = 'description'
      Size = 100
    end
    object cds_med_price_listtag_value: TBCDField
      FieldName = 'tag_value'
      Precision = 10
      Size = 2
    end
    object cds_med_price_listtb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
    end
    object cds_med_price_listtb_broadcaster_id: TIntegerField
      FieldName = 'tb_broadcaster_id'
    end
    object cds_med_price_listkind: TIntegerField
      FieldName = 'kind'
    end
  end
  object ds_med_price_list: TDataSource
    DataSet = cds_med_price_list
    Left = 48
    Top = 250
  end
end
