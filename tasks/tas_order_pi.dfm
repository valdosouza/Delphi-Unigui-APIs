inherited TasOrderPi: TTasOrderPi
  ClientHeight = 530
  ClientWidth = 1025
  Caption = 'Tarefa de Pedido de Inser'#231#227'o'
  ExplicitWidth = 1041
  ExplicitHeight = 589
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 466
    Width = 1025
    TabOrder = 2
    ExplicitTop = 466
    ExplicitWidth = 1025
    inherited SB_Insert: TUniSpeedButton
      ExplicitTop = 5
    end
    inherited SB_Change: TUniSpeedButton
      ExplicitTop = 5
    end
    inherited SB_Save: TUniSpeedButton
      ExplicitTop = 5
    end
    inherited Sb_Close: TUniSpeedButton
      Left = 656
      ExplicitLeft = 656
      ExplicitTop = 5
    end
    object Sb_Invoice: TUniSpeedButton
      AlignWithMargins = True
      Left = 561
      Top = 5
      Width = 95
      Height = 54
      Hint = ''
      Margins.Left = 0
      Margins.Right = 0
      Caption = 'Faturar'
      Align = alLeft
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 7
      OnClick = Sb_CloseClick
    end
    object Sb_Print: TUniSpeedButton
      AlignWithMargins = True
      Left = 466
      Top = 5
      Width = 95
      Height = 54
      Hint = ''
      Margins.Left = 0
      Margins.Right = 0
      Caption = 'Imprimir'
      Align = alLeft
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 8
      OnClick = Sb_PrintClick
    end
  end
  inherited pnl_fundo: TUniPanel
    Top = 58
    Width = 1025
    Height = 408
    BorderStyle = ubsNone
    ExplicitTop = 58
    ExplicitWidth = 1025
    ExplicitHeight = 408
    object pnl_totalizador: TUniPanel
      AlignWithMargins = True
      Left = 3
      Top = 353
      Width = 1019
      Height = 52
      Hint = ''
      Align = alBottom
      TabOrder = 1
      BorderStyle = ubsNone
      Caption = ''
      object E_net_value: TUniFormattedNumberEdit
        AlignWithMargins = True
        Left = 451
        Top = 3
        Width = 105
        Height = 46
        Hint = ''
        Alignment = taRightJustify
        Align = alLeft
        TabOrder = 3
        TabStop = False
        ReadOnly = True
        FieldLabel = 'Valor Liquido'
        FieldLabelAlign = laTop
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object E_gross_value: TUniFormattedNumberEdit
        AlignWithMargins = True
        Left = 229
        Top = 3
        Width = 105
        Height = 46
        Hint = ''
        Alignment = taRightJustify
        Align = alLeft
        TabOrder = 1
        TabStop = False
        ReadOnly = True
        FieldLabel = 'Valor Bruto'
        FieldLabelAlign = laTop
        DecimalUseOSDefault = True
      end
      object E_owner_value: TUniFormattedNumberEdit
        AlignWithMargins = True
        Left = 562
        Top = 3
        Width = 105
        Height = 46
        Hint = ''
        Alignment = taRightJustify
        Align = alLeft
        TabOrder = 4
        TabStop = False
        ReadOnly = True
        FieldLabel = 'Valor Empresa'
        FieldLabelAlign = laTop
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object E_agency_value: TUniFormattedNumberEdit
        AlignWithMargins = True
        Left = 340
        Top = 3
        Width = 105
        Height = 46
        Hint = ''
        Alignment = taRightJustify
        Align = alLeft
        TabOrder = 2
        TabStop = False
        ReadOnly = True
        FieldLabel = 'Ag'#234'ncia'
        FieldLabelAlign = laTop
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object Rg_kind_calculation: TUniRadioGroup
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 220
        Height = 46
        Hint = ''
        Items.Strings = (
          'Valor Bruto'
          'Valor L'#237'quido')
        ItemIndex = 0
        Align = alLeft
        Caption = 'Tipo de Calculo'
        TabOrder = 0
        Columns = 2
        OnClick = Rg_kind_calculationClick
      end
    end
    object Pg_Principal: TUniPageControl
      Left = 0
      Top = 0
      Width = 1025
      Height = 350
      Hint = ''
      ActivePage = tab_jr
      Align = alClient
      TabOrder = 2
      object tbs_operadores: TUniTabSheet
        Hint = ''
        Caption = 'Operadores'
        object UniPanel5: TUniPanel
          Left = 0
          Top = 0
          Width = 1017
          Height = 322
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          DesignSize = (
            1017
            322)
          object Ctn_Agency: TUniContainerPanel
            Left = 3
            Top = 3
            Width = 510
            Height = 52
            Hint = ''
            RTL = True
            ParentRTL = False
            ParentColor = False
            TabOrder = 1
          end
          object Ctn_Advertiser: TUniContainerPanel
            Left = 3
            Top = 56
            Width = 510
            Height = 52
            Hint = ''
            ParentColor = False
            TabOrder = 2
          end
          object Ctn_Broadcaster: TUniContainerPanel
            Left = 3
            Top = 110
            Width = 510
            Height = 52
            Hint = ''
            ParentColor = False
            TabOrder = 3
          end
          object E_kickback_agency: TUniFormattedNumberEdit
            Left = 519
            Top = 3
            Width = 110
            Height = 41
            Hint = ''
            Alignment = taRightJustify
            TabOrder = 4
            FieldLabel = 'Comiss'#227'o Ag'#234'ncia'
            FieldLabelAlign = laTop
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object E_kickback_owner: TUniFormattedNumberEdit
            Left = 651
            Top = 3
            Width = 110
            Height = 41
            Hint = ''
            Alignment = taRightJustify
            TabOrder = 5
            FieldLabel = 'Comiss'#227'o Empresa'
            FieldLabelAlign = laTop
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object UniLabel13: TUniLabel
            Left = 634
            Top = 26
            Width = 11
            Height = 13
            Hint = ''
            Caption = '%'
            TabOrder = 6
          end
          object UniLabel14: TUniLabel
            Left = 770
            Top = 30
            Width = 11
            Height = 13
            Hint = ''
            Caption = '%'
            TabOrder = 7
          end
          object M_Note: TUniMemo
            Left = 3
            Top = 149
            Width = 508
            Height = 170
            Hint = ''
            Anchors = [akLeft, akBottom]
            TabOrder = 8
            FieldLabel = 'Observa'#231#245'es'
            FieldLabelAlign = laTop
          end
        end
      end
      object tab_jr: TUniTabSheet
        Hint = ''
        Caption = 'Rela'#231#227'o das Pe'#231'as Jornal e Revista'
        object dbg_Jr: TUniDBGrid
          Left = 0
          Top = 0
          Width = 1017
          Height = 286
          Hint = ''
          DataSource = ds_parts_jr
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete]
          LoadMask.Message = 'Loading data...'
          Align = alTop
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          OnCellClick = dbg_JrCellClick
          Columns = <
            item
              FieldName = 'tittle'
              Title.Caption = 'T'#237'tulo'
              Width = 184
            end
            item
              FieldName = 'mppDescription'
              Title.Caption = 'Posi'#231#227'o'
              Width = 200
            end
            item
              FieldName = 'insertion'
              Title.Caption = 'Inser'#231#227'o'
              Width = 80
            end
            item
              FieldName = 'mmDescription'
              Title.Caption = 'Material'
              Width = 200
            end
            item
              FieldName = 'color'
              Title.Caption = 'Cor'
              Width = 50
            end
            item
              FieldName = 'nr_height'
              Title.Caption = 'Altura'
              Width = 50
            end
            item
              FieldName = 'nr_column'
              Title.Caption = 'Coluna'
              Width = 50
            end
            item
              FieldName = 'total_value'
              Title.Caption = 'Valor'
              Width = 100
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
              Width = 0
              Visible = False
            end
            item
              FieldName = 'day'
              Title.Caption = 'day'
              Width = 0
              Visible = False
            end
            item
              FieldName = 'created_at'
              Title.Caption = 'created_at'
              Width = 0
              Visible = False
            end
            item
              FieldName = 'updated_at'
              Title.Caption = 'updated_at'
              Width = 0
              Visible = False
            end
            item
              FieldName = 'tb_med_material_id'
              Title.Caption = 'tb_med_material_id'
              Width = 0
              Visible = False
            end
            item
              FieldName = 'tb_med_pos_prog_id'
              Title.Caption = 'tb_med_pos_prog_id'
              Width = 0
              Visible = False
            end
            item
              FieldName = 'nr_repetition'
              Title.Caption = 'nr_repetition'
              Width = 0
              Visible = False
            end
            item
              FieldName = 'table_value'
              Title.Caption = 'table_value'
              Width = 0
              Visible = False
            end
            item
              FieldName = 'unit_value'
              Title.Caption = 'unit_value'
              Width = 0
              Visible = False
            end
            item
              FieldName = 'aliq_desc'
              Title.Caption = 'aliq_desc'
              Width = 0
              Visible = False
            end
            item
              FieldName = 'mppId'
              Title.Caption = 'mppId'
              Width = 0
              Visible = False
            end
            item
              FieldName = 'mmId'
              Title.Caption = 'mmId'
              Width = 0
              Visible = False
            end>
        end
        object Sb_Insert_Parts_jr: TUniSpeedButton
          AlignWithMargins = True
          Left = 3
          Top = 289
          Width = 127
          Height = 30
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
          OnClick = Sb_Insert_Parts_jrClick
        end
        object Sb_Change_Parts_jr: TUniSpeedButton
          AlignWithMargins = True
          Left = 130
          Top = 289
          Width = 127
          Height = 30
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
          OnClick = Sb_Change_Parts_jrClick
        end
        object Sb_Delet_Parts_jr: TUniSpeedButton
          AlignWithMargins = True
          Left = 257
          Top = 289
          Width = 129
          Height = 30
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
          OnClick = Sb_Delet_Parts_jrClick
        end
      end
      object tab_rt: TUniTabSheet
        Hint = ''
        Caption = 'Rela'#231#227'o das Pe'#231'as Radio e Tv'
        object dbg_rt: TUniDBGrid
          Left = 0
          Top = 0
          Width = 1017
          Height = 284
          Hint = ''
          DataSource = ds_part_rt
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete]
          LoadMask.Message = 'Loading data...'
          Align = alTop
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          OnCellClick = dbg_rtCellClick
          Columns = <
            item
              FieldName = 'tittle'
              Title.Caption = 'T'#237'tulo'
              Width = 184
            end
            item
              FieldName = 'mppDescription'
              Title.Caption = 'Posi'#231#227'o'
              Width = 200
            end
            item
              FieldName = 'insertion'
              Title.Caption = 'Inser'#231#227'o'
              Width = 80
            end
            item
              FieldName = 'mmDescription'
              Title.Caption = 'Material'
              Width = 200
            end
            item
              FieldName = 'testimonial'
              Title.Caption = 'Test.'
              Width = 50
            end
            item
              FieldName = 'tm_duration'
              Title.Caption = 'Dura'#231#227'o'
              Width = 100
            end
            item
              FieldName = 'total_value'
              Title.Caption = 'Valor'
              Width = 100
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
              FieldName = 'increase_testemonial'
              Title.Caption = 'increase_testemonial'
              Width = 105
              Visible = False
            end
            item
              FieldName = 'tb_med_pos_prog_id'
              Title.Caption = 'tb_med_pos_prog_id'
              Width = 105
              Visible = False
            end
            item
              FieldName = 'nr_repetition'
              Title.Caption = 'nr_repetition'
              Width = 66
              Visible = False
            end
            item
              FieldName = 'tb_med_material_id'
              Title.Caption = 'tb_med_material_id'
              Width = 98
              Visible = False
            end
            item
              FieldName = 'table_value'
              Title.Caption = 'Valor Total'
              Width = 70
              Visible = False
            end
            item
              FieldName = 'unit_value'
              Title.Caption = 'unit_value'
              Width = 70
              Visible = False
            end
            item
              FieldName = 'aliq_desc'
              Title.Caption = 'aliq_desc'
              Width = 70
              Visible = False
            end
            item
              FieldName = 'mppId'
              Title.Caption = 'mppId'
              Width = 64
              Visible = False
            end
            item
              FieldName = 'mmId'
              Title.Caption = 'mmId'
              Width = 64
              Visible = False
            end>
        end
        object Sb_Insert_Parts_rt: TUniSpeedButton
          AlignWithMargins = True
          Left = 3
          Top = 287
          Width = 127
          Height = 32
          Hint = ''
          Margins.Right = 0
          Caption = 'Inserir'
          Align = alLeft
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          ParentColor = False
          Color = clWindow
          TabOrder = 1
          OnClick = Sb_Insert_Parts_rtClick
        end
        object Sb_Change_Parts_rt: TUniSpeedButton
          AlignWithMargins = True
          Left = 130
          Top = 287
          Width = 127
          Height = 32
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
          OnClick = Sb_Change_Parts_rtClick
        end
        object Sb_Delet_Parts_rt: TUniSpeedButton
          AlignWithMargins = True
          Left = 257
          Top = 287
          Width = 129
          Height = 32
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
          OnClick = Sb_Delet_Parts_rtClick
        end
      end
      object UniTabSheet2: TUniTabSheet
        Hint = ''
        Caption = 'Outras Informa'#231#245'es'
        object UniPanel3: TUniPanel
          Left = 0
          Top = 0
          Width = 1017
          Height = 322
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          DesignSize = (
            1017
            322)
          object UniLabel15: TUniLabel
            Left = 6
            Top = 3
            Width = 93
            Height = 13
            Hint = ''
            Caption = 'Data das Inser'#231#245'es'
            TabOrder = 1
          end
          object UniDBGrid2: TUniDBGrid
            Left = 4
            Top = 22
            Width = 273
            Height = 297
            Hint = ''
            DataSource = ds_Insertion
            LoadMask.Message = 'Loading data...'
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 2
            Columns = <
              item
                FieldName = 'id'
                Title.Caption = 'id'
                Width = 64
                Visible = False
              end
              item
                FieldName = 'tb_med_parts_id'
                Title.Caption = 'tb_med_parts_id'
                Width = 85
                Visible = False
              end
              item
                FieldName = 'dt_insertion'
                Title.Caption = 'Data'
                Width = 64
              end
              item
                FieldName = 'week_day'
                Title.Caption = 'Semana'
                Width = 111
              end
              item
                FieldName = 'qt_insertion'
                Title.Caption = 'Insers'#227'o'
                Width = 64
              end>
          end
          object UniLabel17: TUniLabel
            Left = 284
            Top = 3
            Width = 92
            Height = 13
            Hint = ''
            Caption = 'Observa'#231#245'es Extra'
            TabOrder = 3
          end
          object M_extra_note: TUniMemo
            Left = 283
            Top = 22
            Width = 729
            Height = 297
            Hint = ''
            Lines.Strings = (
              'M_extra_note')
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 4
          end
        end
      end
    end
  end
  object pnl_top: TUniPanel [2]
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1019
    Height = 52
    Hint = ''
    Align = alTop
    TabOrder = 0
    BorderStyle = ubsNone
    Caption = ''
    object E_nr_original: TUniEdit
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 67
      Height = 46
      Hint = ''
      Text = ''
      Align = alLeft
      TabOrder = 0
      FieldLabel = 'P.I Original'
      FieldLabelAlign = laTop
    end
    object E_nr_internal: TUniEdit
      AlignWithMargins = True
      Left = 353
      Top = 3
      Width = 81
      Height = 46
      Hint = ''
      Text = ''
      Align = alLeft
      TabOrder = 4
      ReadOnly = True
      FieldLabel = 'PI Interna'
      FieldLabelAlign = laTop
    end
    object Cb_kind_media: TUniComboBox
      AlignWithMargins = True
      Left = 440
      Top = 3
      Width = 145
      Height = 46
      Hint = ''
      ParentShowHint = False
      Style = csDropDownList
      Text = 'Jornais e Revistas'
      Items.Strings = (
        'Jornais e Revistas'
        'R'#225'dios e TV'#39's'
        'On-line')
      ItemIndex = 0
      Align = alLeft
      TabOrder = 5
      FieldLabel = 'Aplica'#231#227'o/Tipo M'#237'dia'
      FieldLabelAlign = laTop
      IconItems = <>
      OnChange = Cb_kind_mediaChange
    end
    object Dt_dt_original: TUniDateTimePicker
      AlignWithMargins = True
      Left = 76
      Top = 3
      Width = 90
      Height = 46
      Hint = ''
      DateTime = 42935.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      Align = alLeft
      TabOrder = 1
      FieldLabel = 'Data Original'
      FieldLabelAlign = laTop
    end
    object Dt_dt_internal: TUniDateTimePicker
      AlignWithMargins = True
      Left = 268
      Top = 3
      Width = 79
      Height = 46
      Hint = ''
      DateTime = 42935.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      Align = alLeft
      TabOrder = 3
      FieldLabel = 'Data Pedido'
      FieldLabelAlign = laTop
    end
    object Dt_dt_vencimento: TUniDateTimePicker
      AlignWithMargins = True
      Left = 172
      Top = 3
      Width = 90
      Height = 46
      Hint = ''
      DateTime = 42935.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      Align = alLeft
      TabOrder = 2
      FieldLabel = 'Vencimento'
      FieldLabelAlign = laTop
    end
    object E_Campanha: TUniEdit
      AlignWithMargins = True
      Left = 791
      Top = 3
      Width = 202
      Height = 46
      Hint = ''
      Text = ''
      Align = alLeft
      TabOrder = 7
      ReadOnly = True
      FieldLabel = 'Campanha'
      FieldLabelAlign = laTop
    end
    object E_Produto: TUniEdit
      AlignWithMargins = True
      Left = 591
      Top = 3
      Width = 194
      Height = 46
      Hint = ''
      Text = ''
      Align = alLeft
      TabOrder = 8
      ReadOnly = True
      FieldLabel = 'Produto'
      FieldLabelAlign = laTop
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 312
    Top = 184
  end
  object cds_parts_jr: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 640
    Top = 250
    object cds_parts_jrid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cds_parts_jrtb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
      Origin = 'tb_institution_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cds_parts_jrtb_order_id: TIntegerField
      FieldName = 'tb_order_id'
      Origin = 'tb_order_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cds_parts_jrnr_column: TStringField
      FieldName = 'nr_column'
      Origin = 'nr_column'
      Size = 5
    end
    object cds_parts_jrnr_height: TStringField
      FieldName = 'nr_height'
      Origin = 'nr_height'
      Size = 5
    end
    object cds_parts_jrcolor: TStringField
      FieldName = 'color'
      Origin = 'color'
      Size = 3
    end
    object cds_parts_jrday: TStringField
      FieldName = 'day'
      Origin = 'day'
      Size = 9
    end
    object cds_parts_jrcreated_at: TDateTimeField
      FieldName = 'created_at'
      Origin = 'created_at'
    end
    object cds_parts_jrupdated_at: TDateTimeField
      FieldName = 'updated_at'
      Origin = 'updated_at'
    end
    object cds_parts_jrtittle: TStringField
      FieldName = 'tittle'
      Origin = 'tittle'
      ProviderFlags = []
      Size = 30
    end
    object cds_parts_jrtb_med_material_id: TIntegerField
      FieldName = 'tb_med_material_id'
      Origin = 'tb_med_material_id'
      ProviderFlags = []
    end
    object cds_parts_jrtb_med_price_list_id: TIntegerField
      FieldName = 'tb_med_price_list_id'
      Origin = 'tb_med_price_list_id'
      ProviderFlags = []
    end
    object cds_parts_jrinsertion: TIntegerField
      FieldName = 'insertion'
      Origin = 'insertion'
      ProviderFlags = []
    end
    object cds_parts_jrnr_repetition: TIntegerField
      FieldName = 'nr_repetition'
      Origin = 'nr_repetition'
      ProviderFlags = []
    end
    object cds_parts_jrtable_value: TBCDField
      FieldName = 'table_value'
      Origin = 'table_value'
      ProviderFlags = []
      Precision = 10
      Size = 2
    end
    object cds_parts_jrunit_value: TBCDField
      FieldName = 'unit_value'
      Origin = 'unit_value'
      ProviderFlags = []
      Precision = 10
      Size = 2
    end
    object cds_parts_jrtotal_value: TBCDField
      FieldName = 'total_value'
      Origin = 'total_value'
      ProviderFlags = []
      DisplayFormat = '0.00'
      Precision = 10
      Size = 2
    end
    object cds_parts_jraliq_desc: TBCDField
      FieldName = 'aliq_desc'
      Origin = 'aliq_desc'
      ProviderFlags = []
      Precision = 10
      Size = 2
    end
    object cds_parts_jrmppId: TIntegerField
      FieldName = 'mppId'
      Origin = 'id'
      ProviderFlags = []
    end
    object cds_parts_jrmppDescription: TStringField
      FieldName = 'mppDescription'
      Origin = 'description'
      ProviderFlags = []
      Size = 100
    end
    object cds_parts_jrmmId: TIntegerField
      FieldName = 'mmId'
      Origin = 'id'
      ProviderFlags = []
    end
    object cds_parts_jrmmDescription: TStringField
      FieldName = 'mmDescription'
      Origin = 'description'
      ProviderFlags = []
      Size = 100
    end
  end
  object ds_parts_jr: TDataSource
    DataSet = cds_parts_jr
    Left = 640
    Top = 306
  end
  object cds_Insertion: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 712
    Top = 250
    object cds_Insertionid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_Insertiontb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
    end
    object cds_Insertiontb_med_parts_id: TIntegerField
      FieldName = 'tb_med_parts_id'
      Origin = 'tb_med_parts_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_Insertiondt_insertion: TDateField
      FieldName = 'dt_insertion'
      Origin = 'dt_insertion'
    end
    object cds_Insertionweek_day: TStringField
      FieldName = 'week_day'
      Origin = 'week_day'
    end
    object cds_Insertionqt_insertion: TIntegerField
      FieldName = 'qt_insertion'
      Origin = 'qt_insertion'
    end
    object cds_Insertiontb_order_id: TIntegerField
      FieldName = 'tb_order_id'
    end
  end
  object ds_Insertion: TDataSource
    DataSet = cds_Insertion
    Left = 712
    Top = 306
  end
  object cds_parts_rt: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 792
    Top = 250
    object cds_parts_rtid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cds_parts_rttb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
      Origin = 'tb_institution_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cds_parts_rttb_order_id: TIntegerField
      FieldName = 'tb_order_id'
      Origin = 'tb_order_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cds_parts_rttm_duration: TStringField
      FieldName = 'tm_duration'
      Origin = 'tm_duration'
      Size = 8
    end
    object cds_parts_rttestimonial: TStringField
      FieldName = 'testimonial'
      Origin = 'testimonial'
      Size = 3
    end
    object cds_parts_rtincrease_testemonial: TBCDField
      FieldName = 'increase_testemonial'
      Origin = 'increase_testemonial'
      Precision = 10
      Size = 2
    end
    object cds_parts_rttittle: TStringField
      FieldName = 'tittle'
      Origin = 'tittle'
      ProviderFlags = []
      Size = 30
    end
    object cds_parts_rttb_med_material_id: TIntegerField
      FieldName = 'tb_med_material_id'
      Origin = 'tb_med_material_id'
      ProviderFlags = []
    end
    object cds_parts_rttb_med_price_list_id: TIntegerField
      FieldName = 'tb_med_price_list_id'
      Origin = 'tb_med_price_list_id'
      ProviderFlags = []
    end
    object cds_parts_rtinsertion: TIntegerField
      FieldName = 'insertion'
      Origin = 'insertion'
      ProviderFlags = []
    end
    object cds_parts_rtnr_repetition: TIntegerField
      FieldName = 'nr_repetition'
      Origin = 'nr_repetition'
      ProviderFlags = []
    end
    object cds_parts_rttable_value: TBCDField
      FieldName = 'table_value'
      Origin = 'table_value'
      ProviderFlags = []
      Precision = 10
      Size = 2
    end
    object cds_parts_rtunit_value: TBCDField
      FieldName = 'unit_value'
      Origin = 'unit_value'
      ProviderFlags = []
      Precision = 10
      Size = 2
    end
    object cds_parts_rttotal_value: TBCDField
      FieldName = 'total_value'
      Origin = 'total_value'
      ProviderFlags = []
      Precision = 10
      Size = 2
    end
    object cds_parts_rtaliq_desc: TBCDField
      FieldName = 'aliq_desc'
      Origin = 'aliq_desc'
      ProviderFlags = []
      Precision = 10
      Size = 2
    end
    object cds_parts_rtmppId: TIntegerField
      FieldName = 'mppId'
      Origin = 'id'
      ProviderFlags = []
    end
    object cds_parts_rtmppDescription: TStringField
      FieldName = 'mppDescription'
      Origin = 'description'
      ProviderFlags = []
      Size = 100
    end
    object cds_parts_rtmmId: TIntegerField
      FieldName = 'mmId'
      Origin = 'id'
      ProviderFlags = []
    end
    object cds_parts_rtmmDescription: TStringField
      FieldName = 'mmDescription'
      Origin = 'description'
      ProviderFlags = []
      Size = 100
    end
  end
  object ds_part_rt: TDataSource
    DataSet = cds_parts_rt
    Left = 792
    Top = 306
  end
end
