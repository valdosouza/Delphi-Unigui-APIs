inherited TasFinancial: TTasFinancial
  ClientHeight = 561
  ClientWidth = 945
  Caption = ' '
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  ExplicitWidth = 961
  ExplicitHeight = 620
  PixelsPerInch = 96
  TextHeight = 13
  object Grp_search_parameter: TUniGroupBox [0]
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 939
    Height = 78
    Hint = ''
    Caption = 'Digite sua op'#231#227'o de busca'
    Align = alTop
    TabOrder = 0
    object pnl_search_row_1: TUniPanel
      Left = 2
      Top = 15
      Width = 935
      Height = 61
      Hint = ''
      Align = alClient
      TabOrder = 1
      BorderStyle = ubsNone
      Caption = ''
      object pnl_search_row_1_1: TUniPanel
        Left = 0
        Top = 0
        Width = 935
        Height = 56
        Hint = ''
        Align = alTop
        TabOrder = 1
        BorderStyle = ubsNone
        Caption = 'pnl_search_row_1_1'
        object Rg_tipo_data: TUniRadioGroup
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 295
          Height = 50
          Hint = ''
          Items.Strings = (
            'Lan'#231'amento'
            'Vencimento'
            'Pagamento')
          ItemIndex = 0
          Align = alLeft
          Caption = 'Tipo de Data'
          TabOrder = 1
          Columns = 3
        end
        object pnl_date_periodo: TUniPanel
          Left = 301
          Top = 0
          Width = 256
          Height = 56
          Hint = ''
          Align = alLeft
          TabOrder = 2
          BorderStyle = ubsNone
          Caption = ''
          object pnl_date_periodo_1: TUniPanel
            Left = 0
            Top = 0
            Width = 256
            Height = 19
            Hint = ''
            Align = alTop
            TabOrder = 1
            BorderStyle = ubsNone
            Caption = ''
            object ChBx_Periodo: TUniCheckBox
              AlignWithMargins = True
              Left = 3
              Top = 5
              Width = 15
              Height = 14
              Hint = ''
              Margins.Top = 5
              Margins.Bottom = 0
              Caption = ''
              Align = alLeft
              TabOrder = 1
            end
            object UniLabel1: TUniLabel
              AlignWithMargins = True
              Left = 24
              Top = 5
              Width = 108
              Height = 14
              Hint = ''
              Margins.Top = 5
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'Data Final'
              Align = alLeft
              TabOrder = 2
            end
            object UniLabel2: TUniLabel
              AlignWithMargins = True
              Left = 138
              Top = 5
              Width = 115
              Height = 14
              Hint = ''
              Margins.Top = 5
              Margins.Bottom = 0
              AutoSize = False
              Caption = 'Data Final'
              Align = alClient
              TabOrder = 3
            end
          end
          object pnl_date_periodo_2: TUniPanel
            Left = 0
            Top = 19
            Width = 256
            Height = 37
            Hint = ''
            Align = alClient
            TabOrder = 2
            BorderStyle = ubsNone
            Caption = ''
            object DTP_Date_Initial: TUniDateTimePicker
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 129
              Height = 31
              Hint = ''
              DateTime = 42979.000000000000000000
              DateFormat = 'dd/MM/yyyy'
              TimeFormat = 'HH:mm:ss'
              Align = alLeft
              TabOrder = 1
            end
            object DTP_Date_End: TUniDateTimePicker
              AlignWithMargins = True
              Left = 138
              Top = 3
              Width = 115
              Height = 31
              Hint = ''
              DateTime = 42979.000000000000000000
              DateFormat = 'dd/MM/yyyy'
              TimeFormat = 'HH:mm:ss'
              Align = alClient
              TabOrder = 2
            end
          end
        end
        object E_Nr_Ordem: TUniEdit
          AlignWithMargins = True
          Left = 560
          Top = 3
          Width = 129
          Height = 50
          Hint = ''
          Text = ''
          Align = alLeft
          TabOrder = 3
          FieldLabel = 'N'#186' Pedido'
          FieldLabelAlign = laTop
        end
        object E_Nr_Invoice: TUniEdit
          AlignWithMargins = True
          Left = 695
          Top = 3
          Width = 111
          Height = 50
          Hint = ''
          Text = ''
          Align = alLeft
          TabOrder = 4
          FieldLabel = 'N'#186' Nota Fiscal'
          FieldLabelAlign = laTop
        end
      end
    end
  end
  object pg_Principal: TUniPageControl [1]
    Left = 0
    Top = 84
    Width = 945
    Height = 477
    Hint = ''
    ActivePage = tbs_valores
    Align = alClient
    TabOrder = 1
    object tbs_valores: TUniTabSheet
      Hint = ''
      Caption = 'Valores'
      object pnl_valores: TUniPanel
        Left = 0
        Top = 0
        Width = 937
        Height = 340
        Hint = ''
        Align = alClient
        TabOrder = 0
        BorderStyle = ubsFrameLowered
        Caption = ''
        object dbg_valores: TUniDBGrid
          Left = 2
          Top = 2
          Width = 933
          Height = 336
          Hint = ''
          DataSource = ds_search
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgCheckSelect, dgConfirmDelete, dgMultiSelect]
          LoadMask.Message = 'Loading data...'
          Align = alClient
          TabOrder = 1
        end
      end
      object UniGroupBox3: TUniGroupBox
        AlignWithMargins = True
        Left = 5
        Top = 343
        Width = 927
        Height = 39
        Hint = ''
        Margins.Left = 5
        Margins.Right = 5
        Caption = 'Totalizador'
        Align = alBottom
        TabOrder = 1
        object UniLabel6: TUniLabel
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 54
          Height = 16
          Hint = ''
          AutoSize = False
          Caption = 'Valor Total '
          Align = alLeft
          TabOrder = 1
        end
        object E_VL_Total: TUniLabel
          AlignWithMargins = True
          Left = 65
          Top = 18
          Width = 100
          Height = 16
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = '480,00'
          Align = alLeft
          TabOrder = 2
        end
        object UniLabel14: TUniLabel
          AlignWithMargins = True
          Left = 691
          Top = 18
          Width = 111
          Height = 16
          Hint = ''
          Visible = False
          AutoSize = False
          Caption = 'Valor Total Selecionado'
          Align = alRight
          TabOrder = 3
        end
        object E_VL_Selecionado: TUniLabel
          AlignWithMargins = True
          Left = 808
          Top = 18
          Width = 114
          Height = 16
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = '5,06'
          Align = alRight
          TabOrder = 4
        end
      end
      object pnl_botao_Valores: TUniPanel
        Left = 0
        Top = 385
        Width = 937
        Height = 64
        Hint = ''
        Align = alBottom
        TabOrder = 2
        BorderStyle = ubsFrameLowered
        Caption = ''
        object SB_Insert: TUniSpeedButton
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 91
          Height = 54
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
          IconAlign = iaTop
          TabOrder = 1
        end
        object SB_Change: TUniSpeedButton
          AlignWithMargins = True
          Left = 96
          Top = 5
          Width = 91
          Height = 54
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
          IconAlign = iaTop
          TabOrder = 2
          OnClick = SB_ChangeClick
        end
        object SB_Delete: TUniSpeedButton
          AlignWithMargins = True
          Left = 187
          Top = 5
          Width = 91
          Height = 54
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
          IconAlign = iaTop
          TabOrder = 3
        end
        object Sb_Close_Valores: TUniSpeedButton
          AlignWithMargins = True
          Left = 371
          Top = 5
          Width = 91
          Height = 54
          Hint = ''
          Margins.Left = 0
          Margins.Right = 0
          Caption = 'Sair'
          Align = alLeft
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          ParentColor = False
          Color = clWindow
          IconAlign = iaTop
          TabOrder = 4
          OnClick = Sb_Close_ValoresClick
        end
        object Sb_Search: TUniSpeedButton
          AlignWithMargins = True
          Left = 278
          Top = 5
          Width = 93
          Height = 54
          Hint = ''
          Margins.Left = 0
          Margins.Right = 0
          Caption = 'Buscar'
          Align = alLeft
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          ParentColor = False
          Color = clWindow
          IconAlign = iaTop
          TabOrder = 5
          OnClick = Sb_SearchClick
        end
      end
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 192
    Top = 128
  end
  inherited MenuTask: TUniMainMenu
    Top = 152
  end
  object cds_search: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    Left = 160
    Top = 218
  end
  object ds_search: TDataSource
    DataSet = cds_search
    Left = 152
    Top = 274
  end
  object DSP: TDataSetProvider
    DataSet = UMM.Qr_Crud
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 160
    Top = 176
  end
end
