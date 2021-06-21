inherited TasOrderProductionV2: TTasOrderProductionV2
  ClientHeight = 521
  Caption = 'Ordem de Produ'#231#227'o'
  ExplicitHeight = 580
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 457
    ExplicitTop = 457
  end
  inherited pnl_fundo: TUniPanel
    Height = 457
    ExplicitHeight = 457
    object pg_Items: TUniPageControl
      Left = 2
      Top = 57
      Width = 771
      Height = 398
      Hint = ''
      ActivePage = tbs_List_mp_real
      Align = alClient
      TabOrder = 1
      object tbs_List_mp_Forecast: TUniTabSheet
        Hint = ''
        Caption = 'Mat'#233'ria Prima Prevista'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object Pnl_Items: TUniPanel
          Left = 0
          Top = 0
          Width = 763
          Height = 370
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          DesignSize = (
            763
            370)
          object sb_Insert_Items_mp_f: TUniSpeedButton
            Left = 6
            Top = 333
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
            TabOrder = 1
            OnClick = sb_Insert_Items_mp_fClick
          end
          object sb_Change_Items_mp_f: TUniSpeedButton
            Left = 133
            Top = 333
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
            TabOrder = 2
            OnClick = sb_Change_Items_mp_fClick
          end
          object sb_Delete_Items_mp_f: TUniSpeedButton
            Left = 260
            Top = 333
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
            TabOrder = 3
            OnClick = sb_Delete_Items_mp_fClick
          end
          object dbg_items_mp_forecast: TUniDBGrid
            Left = 2
            Top = 2
            Width = 759
            Height = 327
            Hint = ''
            ClientEvents.ExtEvents.Strings = (
              
                'headerclick=function headerclick(ct, column, e, t, eOpts)'#13#10'{'#13#10'  ' +
                'dbg_List_items.dbCases.getStore().sort(column.dataIndex);'#13#10'}')
            ClientEvents.UniEvents.Strings = (
              
                'store.afterCreate=function store.afterCreate(sender)'#13#10'{'#13#10'   send' +
                'er.remotestore=false;'#13#10'}'
              
                'afterCreate=function afterCreate(sender)'#13#10'{'#13#10'  sender.remoteSort' +
                '=false;'#13#10'}')
            DataSource = ds_search_mp_forecast
            Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgTitleClick, dgTabs]
            LoadMask.Message = 'Loading data...'
            Align = alTop
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 4
            Columns = <
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
                FieldName = 'id'
                Title.Caption = 'id'
                Width = 64
                Visible = False
              end
              item
                FieldName = 'tb_product_id'
                Title.Caption = 'C'#243'digo'
                Width = 64
              end
              item
                FieldName = 'description'
                Title.Caption = 'Descri'#231#227'o Produto'
                Width = 300
                ReadOnly = True
              end
              item
                FieldName = 'tb_stock_list_id'
                Title.Caption = 'tb_stock_list_id'
                Width = 78
                Visible = False
              end
              item
                FieldName = 'kind'
                Title.Caption = 'kind'
                Width = 23
                Visible = False
              end
              item
                FieldName = 'quantity'
                Title.Caption = 'Quantidade'
                Width = 79
              end
              item
                FieldName = 'unit_value'
                Title.Caption = 'Valor Unit'#225'rio'
                Width = 92
              end
              item
                FieldName = 'subtotal'
                Title.Caption = 'subtotal'
                Width = 130
                ReadOnly = True
              end>
          end
        end
      end
      object tbs_List_mp_real: TUniTabSheet
        Hint = ''
        Caption = 'Mat'#233'ria Prima Realizada'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object UniPanel3: TUniPanel
          Left = 0
          Top = 0
          Width = 763
          Height = 370
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          DesignSize = (
            763
            370)
          object sb_Insert_Items_mp_r: TUniSpeedButton
            Left = 6
            Top = 334
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
            TabOrder = 1
            OnClick = sb_Insert_Items_mp_rClick
          end
          object sb_change_Items_mp_r: TUniSpeedButton
            Left = 133
            Top = 334
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
            TabOrder = 2
            OnClick = sb_change_Items_mp_rClick
          end
          object sb_Delete_Items_mp_r: TUniSpeedButton
            Left = 260
            Top = 334
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
            TabOrder = 3
            OnClick = sb_Delete_Items_mp_rClick
          end
          object dbg_items_mp_real: TUniDBGrid
            Left = 2
            Top = 2
            Width = 759
            Height = 325
            Hint = ''
            ClientEvents.ExtEvents.Strings = (
              
                'headerclick=function headerclick(ct, column, e, t, eOpts)'#13#10'{'#13#10'  ' +
                'dbg_List_items.dbCases.getStore().sort(column.dataIndex);'#13#10'}')
            ClientEvents.UniEvents.Strings = (
              
                'store.afterCreate=function store.afterCreate(sender)'#13#10'{'#13#10'   send' +
                'er.remotestore=false;'#13#10'}'
              
                'afterCreate=function afterCreate(sender)'#13#10'{'#13#10'  sender.remoteSort' +
                '=false;'#13#10'}')
            DataSource = ds_items_mp_real
            Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgTitleClick, dgTabs]
            LoadMask.Message = 'Loading data...'
            Align = alTop
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 4
            Columns = <
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
                FieldName = 'id'
                Title.Caption = 'id'
                Width = 64
                Visible = False
              end
              item
                FieldName = 'tb_product_id'
                Title.Caption = 'C'#243'digo'
                Width = 64
              end
              item
                FieldName = 'description'
                Title.Caption = 'Descri'#231#227'o Produto'
                Width = 300
                ReadOnly = True
              end
              item
                FieldName = 'tb_stock_list_id'
                Title.Caption = 'tb_stock_list_id'
                Width = 78
                Visible = False
              end
              item
                FieldName = 'kind'
                Title.Caption = 'kind'
                Width = 23
                Visible = False
              end
              item
                FieldName = 'quantity'
                Title.Caption = 'Quantidade'
                Width = 79
              end
              item
                FieldName = 'unit_value'
                Title.Caption = 'Valor Unit'#225'rio'
                Width = 92
              end
              item
                FieldName = 'subtotal'
                Title.Caption = 'subtotal'
                Width = 130
                ReadOnly = True
              end>
          end
        end
      end
      object tbs_List_pa: TUniTabSheet
        Hint = ''
        Caption = 'Produto Acabado'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object UniPanel5: TUniPanel
          Left = 0
          Top = 0
          Width = 763
          Height = 370
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          DesignSize = (
            763
            370)
          object sb_Insert_Items_pa: TUniSpeedButton
            Left = 6
            Top = 334
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
            TabOrder = 1
            OnClick = sb_Insert_Items_paClick
          end
          object sb_Change_Items_pa: TUniSpeedButton
            Left = 133
            Top = 334
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
            TabOrder = 2
            OnClick = sb_Change_Items_paClick
          end
          object sb_Delete_Items_pa: TUniSpeedButton
            Left = 260
            Top = 334
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
            TabOrder = 3
            OnClick = sb_Delete_Items_paClick
          end
          object dbg_items_pa: TUniDBGrid
            Left = 2
            Top = 2
            Width = 759
            Height = 325
            Hint = ''
            ClientEvents.ExtEvents.Strings = (
              
                'headerclick=function headerclick(ct, column, e, t, eOpts)'#13#10'{'#13#10'  ' +
                'dbg_List_items.dbCases.getStore().sort(column.dataIndex);'#13#10'}')
            ClientEvents.UniEvents.Strings = (
              
                'store.afterCreate=function store.afterCreate(sender)'#13#10'{'#13#10'   send' +
                'er.remotestore=false;'#13#10'}'
              
                'afterCreate=function afterCreate(sender)'#13#10'{'#13#10'  sender.remoteSort' +
                '=false;'#13#10'}')
            DataSource = ds_items_pa
            Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgTitleClick, dgTabs]
            LoadMask.Message = 'Loading data...'
            Align = alTop
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 4
            Columns = <
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
                FieldName = 'id'
                Title.Caption = 'id'
                Width = 64
                Visible = False
              end
              item
                FieldName = 'tb_product_id'
                Title.Caption = 'C'#243'digo'
                Width = 64
              end
              item
                FieldName = 'description'
                Title.Caption = 'Descri'#231#227'o Produto'
                Width = 516
                ReadOnly = True
              end
              item
                FieldName = 'tb_stock_list_id'
                Title.Caption = 'tb_stock_list_id'
                Width = 78
                Visible = False
              end
              item
                FieldName = 'quantity'
                Title.Caption = 'Quantidade'
                Width = 70
              end>
          end
        end
      end
      object tbs_other: TUniTabSheet
        Hint = ''
        Caption = 'Outras Informa'#231#245'es'
        object UniPanel2: TUniPanel
          Left = 0
          Top = 0
          Width = 763
          Height = 370
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          DesignSize = (
            763
            370)
          object M_note: TUniMemo
            Left = 1
            Top = 16
            Width = 759
            Height = 106
            Hint = ''
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object UniLabel13: TUniLabel
            Left = 4
            Top = 1
            Width = 66
            Height = 14
            Hint = ''
            Caption = 'Observa'#231#245'es'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 2
          end
        end
      end
    end
    object UniPanel1: TUniPanel
      Left = 2
      Top = 2
      Width = 771
      Height = 55
      Hint = ''
      Align = alTop
      TabOrder = 2
      BorderStyle = ubsFrameLowered
      Caption = ''
      DesignSize = (
        771
        55)
      object E_Number: TUniEdit
        Left = 5
        Top = 19
        Width = 75
        Hint = ''
        Text = ''
        TabOrder = 0
        ReadOnly = True
      end
      object Dtp_Registry: TUniDateTimePicker
        Left = 83
        Top = 19
        Width = 116
        Hint = ''
        DateTime = 42544.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 1
      end
      object L_Codigo: TUniLabel
        Left = 6
        Top = 3
        Width = 44
        Height = 14
        Hint = ''
        Caption = 'N'#250'mero'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        TabOrder = 3
      end
      object L_DtRegistry: TUniLabel
        Left = 85
        Top = 3
        Width = 69
        Height = 14
        Hint = ''
        Caption = 'Data Cadastro'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 4
      end
      object Ctn_Situacao: TUniContainerPanel
        Left = 202
        Top = 6
        Width = 323
        Height = 43
        Hint = ''
        ParentColor = False
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
      end
      object UniLabel1: TUniLabel
        Left = 530
        Top = 7
        Width = 49
        Height = 14
        Hint = ''
        Caption = 'Data Inicio'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 6
      end
      object Dtp_Start: TUniDateTimePicker
        Left = 528
        Top = 23
        Width = 116
        Hint = ''
        DateTime = 42544.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 7
      end
      object UniLabel2: TUniLabel
        Left = 651
        Top = 7
        Width = 70
        Height = 14
        Hint = ''
        Caption = 'Data Final final'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 8
      end
      object Dtp_Forecast: TUniDateTimePicker
        Left = 648
        Top = 23
        Width = 116
        Hint = ''
        DateTime = 42544.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 9
      end
    end
  end
  object cds_items_mp_forecast: TClientDataSet
    Aggregates = <>
    Filtered = True
    PacketRecords = 0
    Params = <>
    Left = 80
    Top = 218
    object cds_items_mp_forecasttb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
      Origin = 'tb_institution_id'
      Required = True
    end
    object cds_items_mp_forecasttb_order_id: TIntegerField
      FieldName = 'tb_order_id'
      Origin = 'tb_order_id'
      Required = True
    end
    object cds_items_mp_forecastid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object cds_items_mp_forecasttb_product_id: TIntegerField
      FieldName = 'tb_product_id'
      Origin = 'tb_product_id'
      Required = True
    end
    object cds_items_mp_forecasttb_stock_list_id: TIntegerField
      FieldName = 'tb_stock_list_id'
      Origin = 'tb_stock_list_id'
      Required = True
    end
    object cds_items_mp_forecastkind: TStringField
      FieldName = 'kind'
      Origin = 'kind'
      FixedChar = True
      Size = 1
    end
    object cds_items_mp_forecastquantity: TBCDField
      FieldName = 'quantity'
      Origin = 'quantity'
      Precision = 10
    end
    object cds_items_mp_forecastunit_value: TFMTBCDField
      FieldName = 'unit_value'
      Origin = 'unit_value'
      DisplayFormat = '0.00'
      Precision = 10
      Size = 6
    end
    object cds_items_mp_forecastdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      ProviderFlags = []
      Size = 100
    end
    object cds_items_mp_forecastsubtotal: TFMTBCDField
      FieldName = 'subtotal'
      Origin = 'subtotal'
      ProviderFlags = []
      DisplayFormat = '0.00'
      Precision = 20
      Size = 10
    end
  end
  object ds_search_mp_forecast: TDataSource
    DataSet = cds_items_mp_forecast
    Left = 80
    Top = 274
  end
  object ds_items_mp_real: TDataSource
    DataSet = cds_items_mp_real
    Left = 240
    Top = 274
  end
  object cds_items_mp_real: TClientDataSet
    PersistDataPacket.Data = {
      410100009619E0BD02000000180000000A00000000000300000041011174625F
      696E737469747574696F6E5F696404000100040000000B74625F6F726465725F
      6964040001000400000002696404000100040000000D74625F70726F64756374
      5F696404000100040000001074625F73746F636B5F6C6973745F696404000100
      04000000046B696E640100490020000100055749445448020002000100087175
      616E74697479070005000000020008444543494D414C53020002000400055749
      445448020002000A000A756E69745F76616C7565070012000000020008444543
      494D414C53020002000600055749445448020002000A000B6465736372697074
      696F6E010049000200010005574944544802000200640008737562746F74616C
      0C0012000200020008444543494D414C53020002000A00055749445448020002
      0014000000}
    Active = True
    Aggregates = <>
    Filtered = True
    PacketRecords = 0
    Params = <>
    Left = 240
    Top = 218
    object cds_items_mp_realtb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
      Required = True
    end
    object cds_items_mp_realtb_order_id: TIntegerField
      FieldName = 'tb_order_id'
      Required = True
    end
    object cds_items_mp_realid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_items_mp_realtb_product_id: TIntegerField
      FieldName = 'tb_product_id'
      Required = True
    end
    object cds_items_mp_realtb_stock_list_id: TIntegerField
      FieldName = 'tb_stock_list_id'
      Required = True
    end
    object cds_items_mp_realkind: TStringField
      FieldName = 'kind'
      FixedChar = True
      Size = 1
    end
    object cds_items_mp_realquantity: TBCDField
      FieldName = 'quantity'
      Precision = 10
    end
    object cds_items_mp_realunit_value: TFMTBCDField
      FieldName = 'unit_value'
      DisplayFormat = '0.00'
      Precision = 10
      Size = 6
    end
    object cds_items_mp_realdescription: TStringField
      FieldName = 'description'
      Size = 100
    end
    object cds_items_mp_realsubtotal: TFMTBCDField
      FieldName = 'subtotal'
      DisplayFormat = '0.00'
      Precision = 20
      Size = 10
    end
  end
  object ds_items_pa: TDataSource
    DataSet = cds_items_pa
    Left = 384
    Top = 274
  end
  object cds_items_pa: TClientDataSet
    Aggregates = <>
    Filtered = True
    PacketRecords = 0
    Params = <>
    ProviderName = 'DSP'
    Left = 384
    Top = 218
    object cds_items_patb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
      Required = True
    end
    object cds_items_patb_order_id: TIntegerField
      FieldName = 'tb_order_id'
      Required = True
    end
    object cds_items_paid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_items_patb_product_id: TIntegerField
      FieldName = 'tb_product_id'
      Required = True
    end
    object cds_items_patb_stock_list_id: TIntegerField
      FieldName = 'tb_stock_list_id'
      Required = True
    end
    object cds_items_paquantity: TBCDField
      FieldName = 'quantity'
      Precision = 10
    end
    object cds_items_padescription: TStringField
      FieldName = 'description'
      Size = 100
    end
  end
  object DSP: TDataSetProvider
    DataSet = UMM.Qr_Crud
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 144
    Top = 160
  end
end
