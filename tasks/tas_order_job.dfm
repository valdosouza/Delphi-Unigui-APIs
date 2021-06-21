inherited TasOrderJob: TTasOrderJob
  ClientHeight = 507
  ClientWidth = 807
  Caption = 'Tarefa e Acompanhamento de Obra'
  ActiveControl = Ctn_Customer
  ExplicitWidth = 823
  ExplicitHeight = 566
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 443
    Width = 807
    ExplicitTop = 443
    ExplicitWidth = 807
  end
  inherited pnl_fundo: TUniPanel
    Width = 807
    Height = 97
    Align = alTop
    ExplicitTop = 0
    ExplicitWidth = 807
    ExplicitHeight = 97
    DesignSize = (
      807
      97)
    object L_Codigo: TUniLabel
      Left = 5
      Top = 6
      Width = 44
      Height = 14
      Hint = ''
      Caption = 'N'#250'mero'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      TabOrder = 4
    end
    object E_Number: TUniEdit
      Left = 4
      Top = 21
      Width = 72
      Hint = ''
      Text = ''
      TabOrder = 0
      ReadOnly = True
    end
    object L_DtRegistry: TUniLabel
      Left = 84
      Top = 6
      Width = 69
      Height = 14
      Hint = ''
      Caption = 'Data Cadastro'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 5
    end
    object Dtp_Registry: TUniDateTimePicker
      Left = 82
      Top = 21
      Width = 116
      Hint = ''
      DateTime = 42544.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 1
    end
    object Ctn_Customer: TUniContainerPanel
      Left = 202
      Top = 8
      Width = 599
      Height = 37
      Hint = ''
      ParentColor = False
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object Ctn_Situacao: TUniContainerPanel
      Left = 5
      Top = 49
      Width = 404
      Height = 37
      Hint = ''
      ParentColor = False
      TabOrder = 6
    end
    object UniLabel4: TUniLabel
      Left = 412
      Top = 47
      Width = 99
      Height = 14
      Hint = ''
      Caption = 'Descri'#231#227'o da Obra'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      TabOrder = 7
    end
    object E_Description: TUniEdit
      Left = 411
      Top = 61
      Width = 387
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      TabOrder = 8
      ReadOnly = True
    end
  end
  object pg_statement: TUniPageControl [2]
    Left = 0
    Top = 97
    Width = 807
    Height = 346
    Hint = ''
    ActivePage = UniTabSheet6
    Align = alClient
    TabOrder = 2
    OnChange = pg_statementChange
    object tbs_budget: TUniTabSheet
      Hint = ''
      Caption = 'Escopo'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object pnl_escopo: TUniPanel
        Left = 0
        Top = 0
        Width = 799
        Height = 318
        Hint = ''
        Align = alClient
        TabOrder = 0
        BorderStyle = ubsFrameLowered
        Caption = ''
        DesignSize = (
          799
          318)
        object dbg_scope: TUniDBGrid
          Left = 2
          Top = 2
          Width = 795
          Height = 273
          Hint = ''
          DataSource = Ds_scope
          LoadMask.Message = 'Loading data...'
          Align = alTop
          TabOrder = 1
          OnMouseDown = dbg_EmpenhoMouseDown
          Columns = <
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o do Escopo'
              Width = 604
            end
            item
              FieldName = 'WorkFront'
              Title.Caption = 'Frente de Trabalho'
              Width = 238
              ReadOnly = True
            end>
        end
        object sb_Insert_Items: TUniSpeedButton
          Left = 5
          Top = 281
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
          Left = 132
          Top = 281
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
          Left = 259
          Top = 281
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
    end
    object tbs_Insumos: TUniTabSheet
      Hint = ''
      Caption = 'Insumos da Obra'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object Ctn_Order_itens_job: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 799
        Height = 318
        Hint = ''
        ParentColor = False
        Align = alClient
        TabOrder = 0
      end
    end
    object UniTabSheet2: TUniTabSheet
      Hint = ''
      Caption = 'Informa'#231#245'es'
      object Pnl_Outras: TUniPanel
        Left = 0
        Top = 0
        Width = 799
        Height = 318
        Hint = ''
        Align = alClient
        TabOrder = 0
        BorderStyle = ubsFrameLowered
        Caption = ''
        object UniLabel1: TUniLabel
          Left = 5
          Top = 4
          Width = 49
          Height = 14
          Hint = ''
          Caption = 'Data Inicio'
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          TabOrder = 4
        end
        object Dtp_Start: TUniDateTimePicker
          Left = 3
          Top = 19
          Width = 116
          Hint = ''
          DateTime = 42544.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 0
        end
        object UniLabel2: TUniLabel
          Left = 128
          Top = 4
          Width = 92
          Height = 14
          Hint = ''
          Caption = 'Data Final Prevista '
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          TabOrder = 5
        end
        object Dtp_Forecast: TUniDateTimePicker
          Left = 125
          Top = 19
          Width = 116
          Hint = ''
          DateTime = 42544.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 1
        end
        object UniLabel3: TUniLabel
          Left = 249
          Top = 4
          Width = 73
          Height = 14
          Hint = ''
          Caption = 'Data Finalizada'
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          TabOrder = 6
        end
        object Dtp_End: TUniDateTimePicker
          Left = 248
          Top = 19
          Width = 116
          Hint = ''
          DateTime = 42544.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 2
        end
      end
    end
    object Empenho: TUniTabSheet
      Hint = ''
      Caption = 'Empenho'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object pnl_Empenho: TUniPanel
        Left = 0
        Top = 0
        Width = 799
        Height = 318
        Hint = ''
        Align = alClient
        TabOrder = 0
        BorderStyle = ubsFrameLowered
        Caption = ''
        object dbg_Empenho: TUniDBGrid
          Left = 2
          Top = 2
          Width = 795
          Height = 314
          Hint = ''
          DataSource = ds_search_emp
          LoadMask.Message = 'Loading data...'
          Align = alClient
          TabOrder = 1
          OnMouseDown = dbg_EmpenhoMouseDown
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 632
            end
            item
              FieldName = 'quantity'
              Title.Caption = 'Quantidade'
              Width = 78
            end>
        end
      end
    end
    object UniTabSheet1: TUniTabSheet
      Hint = ''
      Caption = 'Comprar'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object dbg_cmprar: TUniDBGrid
        Left = 0
        Top = 0
        Width = 799
        Height = 318
        Hint = ''
        DataSource = ds_search_comprar
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = 'C'#243'digo'
            Width = 64
          end
          item
            FieldName = 'description'
            Title.Caption = 'Descri'#231#227'o'
            Width = 460
          end
          item
            FieldName = 'quantity'
            Title.Caption = 'Quantidade'
            Width = 70
          end>
      end
    end
    object tbs_solicitado: TUniTabSheet
      Hint = ''
      Caption = 'Solicitado'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object dbg_solicitado: TUniDBGrid
        Left = 0
        Top = 0
        Width = 799
        Height = 318
        Hint = ''
        DataSource = ds_search_sol
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = 'C'#243'digo'
            Width = 64
          end
          item
            FieldName = 'description'
            Title.Caption = 'Descri'#231#227'o'
            Width = 458
          end
          item
            FieldName = 'quantity'
            Title.Caption = 'Quantidade'
            Width = 102
          end
          item
            FieldName = 'dt_record'
            Title.Caption = 'Data'
            Width = 64
          end
          item
            FieldName = 'number'
            Title.Caption = 'Pedido'
            Width = 64
          end
          item
            FieldName = 'dt_forecast'
            Title.Caption = 'Data Prevista'
            Width = 69
          end>
      end
    end
    object tbs_comprado: TUniTabSheet
      Hint = ''
      Caption = 'Comprado'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object pnl_Comprado: TUniPanel
        Left = 0
        Top = 0
        Width = 799
        Height = 318
        Hint = ''
        Align = alClient
        TabOrder = 0
        BorderStyle = ubsFrameLowered
        Caption = 'pnl_Comprado'
        object dbg_Comprado: TUniDBGrid
          Left = 2
          Top = 2
          Width = 795
          Height = 314
          Hint = ''
          DataSource = ds_search_comprado
          LoadMask.Message = 'Loading data...'
          Align = alClient
          TabOrder = 1
          OnMouseDown = dbg_CompradoMouseDown
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 446
            end
            item
              FieldName = 'quantity'
              Title.Caption = 'Quantidade'
              Width = 70
            end
            item
              FieldName = 'number'
              Title.Caption = 'Nota Fiscal'
              Width = 67
            end
            item
              FieldName = 'dt_emission'
              Title.Caption = 'Data'
              Width = 80
            end>
        end
      end
    end
    object UniTabSheet4: TUniTabSheet
      Hint = ''
      Caption = 'Produzir'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object dbg_Produzir: TUniDBGrid
        Left = 0
        Top = 0
        Width = 799
        Height = 318
        Hint = ''
        DataSource = ds_search_pro
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = 'C'#243'digo'
            Width = 64
          end
          item
            FieldName = 'description'
            Title.Caption = 'Descri'#231#227'o'
            Width = 461
          end
          item
            FieldName = 'quantity'
            Title.Caption = 'Quantidade'
            Width = 94
          end>
      end
    end
    object UniTabSheet5: TUniTabSheet
      Hint = ''
      Caption = 'Enviar'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object dbg_enviar: TUniDBGrid
        Left = 0
        Top = 0
        Width = 799
        Height = 318
        Hint = ''
        DataSource = ds_search_env
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = 'C'#243'digo'
            Width = 64
          end
          item
            FieldName = 'description'
            Title.Caption = 'Descri'#231#227'o'
            Width = 471
          end
          item
            FieldName = 'quantity'
            Title.Caption = 'Quantidade'
            Width = 70
          end>
      end
    end
    object UniTabSheet6: TUniTabSheet
      Hint = ''
      Caption = 'Enviados'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object dbg_Enviado: TUniDBGrid
        Left = 0
        Top = 0
        Width = 799
        Height = 318
        Hint = ''
        DataSource = ds_search_enviado
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = 'C'#243'digo'
            Width = 64
          end
          item
            FieldName = 'description'
            Title.Caption = 'Descri'#231#227'o'
            Width = 475
          end
          item
            FieldName = 'quantity'
            Title.Caption = 'Quantidade'
            Width = 70
          end>
      end
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 600
    Top = 205
    inherited MnuTarefas: TUniMenuItem
      object LiberarListas: TUniMenuItem
        Caption = 'Liberar Listas'
        OnClick = LiberarListasClick
      end
    end
  end
  object ds_search_emp: TDataSource
    DataSet = cds_search_emp
    Left = 108
    Top = 361
  end
  object cds_search_emp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_emp'
    Left = 115
    Top = 305
    object cds_search_empid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_search_empdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Required = True
      Size = 100
    end
    object cds_search_empquantity: TFMTBCDField
      FieldName = 'quantity'
      Origin = 'quantity'
      Required = True
      Precision = 10
      Size = 6
    end
    object cds_search_emptb_order_id: TIntegerField
      FieldName = 'tb_order_id'
    end
    object cds_search_emptb_stock_list_id: TIntegerField
      FieldName = 'tb_stock_list_id'
      Required = True
    end
    object cds_search_emptb_order_item_id: TIntegerField
      FieldName = 'tb_order_item_id'
    end
    object cds_search_empstatus: TStringField
      FieldName = 'status'
      Size = 1
    end
  end
  object DSP_emp: TDataSetProvider
    DataSet = UMM.Qr_Crud
    Left = 114
    Top = 244
  end
  object cds_search_comprar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_comprar'
    Left = 209
    Top = 305
    object cds_search_comprarid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_search_comprardescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Required = True
      Size = 100
    end
    object cds_search_comprarquantity: TBCDField
      FieldName = 'quantity'
      Origin = 'quantity'
      Precision = 10
    end
  end
  object ds_search_comprar: TDataSource
    DataSet = cds_search_comprar
    Left = 208
    Top = 363
  end
  object cds_search_sol: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_sol'
    Left = 316
    Top = 306
    object cds_search_solid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_search_soldescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Required = True
      Size = 100
    end
    object cds_search_solquantity: TBCDField
      FieldName = 'quantity'
      Origin = 'quantity'
      Precision = 10
    end
    object cds_search_soldt_record: TDateField
      FieldName = 'dt_record'
    end
    object cds_search_solnumber: TIntegerField
      FieldName = 'number'
    end
    object cds_search_soldt_forecast: TDateField
      FieldName = 'dt_forecast'
    end
  end
  object ds_search_sol: TDataSource
    DataSet = cds_search_sol
    Left = 316
    Top = 364
  end
  object cds_search_comprado: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Comprado'
    Left = 433
    Top = 305
    object cds_search_compradoid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_search_compradodescription: TStringField
      FieldName = 'description'
      Required = True
      Size = 100
    end
    object cds_search_compradoquantity: TBCDField
      FieldName = 'quantity'
      Precision = 10
    end
    object cds_search_compradotb_order_id: TIntegerField
      FieldName = 'tb_order_id'
    end
    object cds_search_compradotb_order_item_id: TIntegerField
      FieldName = 'tb_order_item_id'
    end
    object cds_search_compradotb_stock_list_id: TIntegerField
      FieldName = 'tb_stock_list_id'
    end
    object cds_search_compradodt_emission: TDateField
      FieldName = 'dt_emission'
    end
    object cds_search_compradonumber: TStringField
      FieldName = 'number'
      Size = 10
    end
    object cds_search_compradostatus_compra: TStringField
      FieldName = 'status_compra'
      Size = 1
    end
    object cds_search_compradostatus_entrega: TStringField
      FieldName = 'status_entrega'
      Size = 1
    end
  end
  object ds_search_comprado: TDataSource
    DataSet = cds_search_comprado
    Left = 436
    Top = 369
  end
  object cds_search_env: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_env'
    Left = 540
    Top = 307
    object cds_search_envid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_search_envdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Required = True
      Size = 100
    end
    object cds_search_envquantity: TBCDField
      FieldName = 'quantity'
      Origin = 'quantity'
      Precision = 10
    end
  end
  object ds_search_env: TDataSource
    DataSet = cds_search_env
    Left = 540
    Top = 369
  end
  object cds_search_enviado: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_enviado'
    Left = 643
    Top = 306
    object cds_search_enviadoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_search_enviadodescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Required = True
      Size = 100
    end
    object cds_search_enviadoquantity: TBCDField
      FieldName = 'quantity'
      Origin = 'quantity'
      Precision = 10
    end
  end
  object ds_search_enviado: TDataSource
    DataSet = cds_search_enviado
    Left = 644
    Top = 370
  end
  object cds_search_pro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_pro'
    Left = 744
    Top = 307
    object cds_search_proid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_search_prodescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Required = True
      Size = 100
    end
    object cds_search_proquantity: TBCDField
      FieldName = 'quantity'
      Origin = 'quantity'
      Required = True
      Precision = 10
    end
  end
  object ds_search_pro: TDataSource
    DataSet = cds_search_pro
    Left = 748
    Top = 369
  end
  object DSP_comprar: TDataSetProvider
    DataSet = UMM.Qr_Crud
    Left = 212
    Top = 249
  end
  object DSP_sol: TDataSetProvider
    DataSet = UMM.Qr_Crud
    Left = 316
    Top = 251
  end
  object DSP_Comprado: TDataSetProvider
    DataSet = UMM.Qr_Crud
    Left = 428
    Top = 257
  end
  object DSP_env: TDataSetProvider
    DataSet = UMM.Qr_Crud
    Left = 540
    Top = 257
  end
  object DSP_enviado: TDataSetProvider
    DataSet = UMM.Qr_Crud
    Left = 644
    Top = 257
  end
  object DSP_pro: TDataSetProvider
    DataSet = UMM.Qr_Crud
    Left = 740
    Top = 257
  end
  object pop_items_empenho: TUniPopupMenu
    Left = 120
    Top = 160
    object MercEmpenho: TUniMenuItem
      Caption = 'Liberar Entrega'
      OnClick = MercEmpenhoClick
    end
  end
  object pop_items_comprado: TUniPopupMenu
    Left = 264
    Top = 160
    object MercComprado: TUniMenuItem
      Caption = 'Liberar Entrega'
      OnClick = MercCompradoClick
    end
  end
  object cds_Scope: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 35
    Top = 305
    object cds_Scopeid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_Scopetb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
      Required = True
    end
    object cds_Scopetb_order_id: TIntegerField
      FieldName = 'tb_order_id'
      Required = True
    end
    object cds_Scopedescription: TStringField
      FieldName = 'description'
      Size = 100
    end
    object cds_Scopetb_work_front_id: TIntegerField
      FieldName = 'tb_work_front_id'
      Required = True
    end
    object cds_Scopenote: TBlobField
      FieldName = 'note'
    end
    object cds_Scopedt_forecast: TDateField
      FieldName = 'dt_forecast'
    end
    object cds_Scopevalue_forecast: TFMTBCDField
      FieldName = 'value_forecast'
      Precision = 10
      Size = 6
    end
    object cds_ScopeWorkFront: TStringField
      FieldName = 'WorkFront'
      Size = 100
    end
  end
  object Ds_scope: TDataSource
    DataSet = cds_Scope
    Left = 28
    Top = 361
  end
end
