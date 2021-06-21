inherited SeaInvoiceMerchandise: TSeaInvoiceMerchandise
  ClientHeight = 595
  ClientWidth = 972
  Caption = 'Pesquisa Nota Fiscal'
  ExplicitWidth = 988
  ExplicitHeight = 654
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 972
    Height = 531
    ExplicitWidth = 972
    ExplicitHeight = 531
    inherited pc_search: TUniPageControl
      Width = 968
      Height = 527
      ExplicitWidth = 968
      ExplicitHeight = 527
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 960
        ExplicitHeight = 499
        inherited pnl_param: TUniPanel
          Width = 960
          Height = 468
          ExplicitWidth = 960
          ExplicitHeight = 468
          object pnl_row_1: TUniPanel
            Left = 2
            Top = 2
            Width = 956
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 1
            BorderStyle = ubsNone
            Caption = ''
            object pnl_data: TUniPanel
              Left = 0
              Top = 0
              Width = 216
              Height = 52
              Hint = ''
              Align = alLeft
              TabOrder = 1
              BorderStyle = ubsNone
              Caption = ''
              object chbx_periodo: TUniCheckBox
                AlignWithMargins = True
                Left = 3
                Top = 5
                Width = 210
                Height = 17
                Hint = ''
                Margins.Top = 5
                Margins.Bottom = 0
                Checked = True
                Caption = 'Data Inicial            Data Final'
                Align = alTop
                TabOrder = 1
              end
              object pnl_data_campos: TUniPanel
                Left = 0
                Top = 22
                Width = 216
                Height = 30
                Hint = ''
                Align = alClient
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                object DTP_Date_Initial: TUniDateTimePicker
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 100
                  Height = 24
                  Hint = ''
                  DateTime = 42916.000000000000000000
                  DateFormat = 'dd/MM/yyyy'
                  TimeFormat = 'HH:mm:ss'
                  Align = alLeft
                  TabOrder = 1
                end
                object DTP_Date_End: TUniDateTimePicker
                  AlignWithMargins = True
                  Left = 109
                  Top = 3
                  Width = 100
                  Height = 24
                  Hint = ''
                  DateTime = 42916.000000000000000000
                  DateFormat = 'dd/MM/yyyy'
                  TimeFormat = 'HH:mm:ss'
                  Align = alLeft
                  TabOrder = 2
                end
              end
            end
            object E_Nr_Invoice: TUniEdit
              AlignWithMargins = True
              Left = 219
              Top = 3
              Width = 102
              Height = 41
              Hint = ''
              Margins.Bottom = 8
              Text = ''
              Align = alLeft
              TabOrder = 2
              FieldLabel = 'Nota Fiscal'
              FieldLabelAlign = laTop
              FieldLabelFont.Color = clNavy
            end
            object E_Nr_Order: TUniEdit
              AlignWithMargins = True
              Left = 380
              Top = 3
              Width = 102
              Height = 41
              Hint = ''
              Margins.Bottom = 8
              Text = ''
              Align = alLeft
              TabOrder = 3
              FieldLabel = 'N'#250'mero Pedido'
              FieldLabelAlign = laTop
              FieldLabelFont.Color = clNavy
            end
            object E_Nr_Invoice_serie: TUniEdit
              AlignWithMargins = True
              Left = 327
              Top = 3
              Width = 47
              Height = 41
              Hint = ''
              Margins.Bottom = 8
              Text = ''
              Align = alLeft
              TabOrder = 4
              FieldLabel = 'S'#233'rie'
              FieldLabelAlign = laTop
              FieldLabelFont.Color = clNavy
            end
            object E_Client_id: TUniEdit
              AlignWithMargins = True
              Left = 488
              Top = 3
              Width = 81
              Height = 41
              Hint = ''
              Margins.Bottom = 8
              Text = ''
              Align = alLeft
              TabOrder = 5
              FieldLabel = 'C'#243'digo Cliente'
              FieldLabelAlign = laTop
              FieldLabelFont.Color = clNavy
            end
            object E_Name_Company: TUniEdit
              AlignWithMargins = True
              Left = 575
              Top = 3
              Width = 378
              Height = 41
              Hint = ''
              Margins.Bottom = 8
              Text = ''
              Align = alClient
              TabOrder = 6
              FieldLabel = 'Nome/Raz'#227'o Social'
              FieldLabelAlign = laTop
              FieldLabelFont.Color = clNavy
            end
          end
          object pnl_row_2: TUniPanel
            Left = 2
            Top = 54
            Width = 956
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 2
            BorderStyle = ubsNone
            Caption = ''
            object E_neighborhood: TUniEdit
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 341
              Height = 41
              Hint = ''
              Margins.Bottom = 8
              ParentCustomHint = False
              Text = ''
              Align = alLeft
              TabOrder = 1
              FieldLabel = 'Bairro'
              FieldLabelAlign = laTop
              FieldLabelFont.Color = clNavy
            end
            object E_Region: TUniEdit
              AlignWithMargins = True
              Left = 350
              Top = 3
              Width = 207
              Height = 41
              Hint = ''
              Margins.Bottom = 8
              Text = ''
              Align = alLeft
              TabOrder = 2
              FieldLabel = 'Regi'#227'o'
              FieldLabelAlign = laTop
              FieldLabelFont.Color = clNavy
            end
            object E_UF: TUniEdit
              AlignWithMargins = True
              Left = 563
              Top = 3
              Width = 33
              Height = 41
              Hint = ''
              Margins.Bottom = 8
              Text = ''
              Align = alLeft
              TabOrder = 3
              FieldLabel = 'UF'
              FieldLabelAlign = laTop
              FieldLabelFont.Color = clNavy
            end
            object E_city: TUniEdit
              AlignWithMargins = True
              Left = 602
              Top = 3
              Width = 218
              Height = 41
              Hint = ''
              Margins.Bottom = 8
              Text = ''
              Align = alLeft
              TabOrder = 4
              FieldLabel = 'Cidade'
              FieldLabelAlign = laTop
              FieldLabelFont.Color = clNavy
            end
            object E_fone: TUniEdit
              AlignWithMargins = True
              Left = 826
              Top = 3
              Width = 127
              Height = 41
              Hint = ''
              Margins.Bottom = 8
              Text = ''
              Align = alClient
              TabOrder = 5
              FieldLabel = 'Telefone'
              FieldLabelAlign = laTop
              FieldLabelFont.Color = clNavy
            end
          end
          object pnl_row_3: TUniPanel
            Left = 2
            Top = 106
            Width = 956
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 3
            BorderStyle = ubsNone
            Caption = ''
            object Ctn_salesMan: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 318
              Height = 52
              Hint = ''
              ParentColor = False
              Align = alLeft
              TabOrder = 1
            end
            object ctn_Cfop: TUniContainerPanel
              Left = 588
              Top = 0
              Width = 368
              Height = 52
              Hint = ''
              ParentColor = False
              Align = alRight
              TabOrder = 2
            end
            object E_Obervation: TUniEdit
              AlignWithMargins = True
              Left = 321
              Top = 3
              Width = 264
              Height = 41
              Hint = ''
              Margins.Bottom = 8
              ParentCustomHint = False
              Text = ''
              Align = alClient
              TabOrder = 3
              FieldLabel = 'Observa'#231#227'o'
              FieldLabelAlign = laTop
              FieldLabelFont.Color = clNavy
            end
          end
          object pnl_row_4: TUniPanel
            Left = 2
            Top = 158
            Width = 956
            Height = 99
            Hint = ''
            Align = alTop
            TabOrder = 4
            BorderStyle = ubsNone
            Caption = ''
            object UniGroupBox1: TUniGroupBox
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 117
              Height = 93
              Hint = ''
              Caption = 'Tipo de Opera'#231#227'o'
              Align = alLeft
              TabOrder = 1
              object chbx_Vendas: TUniCheckBox
                AlignWithMargins = True
                Left = 5
                Top = 18
                Width = 107
                Height = 17
                Hint = ''
                Checked = True
                Caption = 'Vendas'
                Align = alTop
                TabOrder = 1
                OnChange = chbx_VendasChange
              end
              object chbx_Compras: TUniCheckBox
                AlignWithMargins = True
                Left = 5
                Top = 41
                Width = 107
                Height = 17
                Hint = ''
                Caption = 'Compras'
                Align = alTop
                TabOrder = 2
                OnChange = chbx_ComprasChange
              end
              object chbx_Ajustes: TUniCheckBox
                AlignWithMargins = True
                Left = 5
                Top = 64
                Width = 107
                Height = 17
                Hint = ''
                Caption = 'Ajustes'
                Align = alTop
                TabOrder = 3
                OnChange = chbx_AjustesChange
              end
            end
            object Rg_Tipo_Operacao: TUniRadioGroup
              AlignWithMargins = True
              Left = 126
              Top = 3
              Width = 129
              Height = 93
              Hint = ''
              Items.Strings = (
                'Entrada'
                'Saida'
                'Todas')
              ItemIndex = 2
              Align = alLeft
              Caption = 'Tipos de Opera'#231#227'o'
              TabOrder = 2
            end
            object Rg_Sit_Nfe: TUniRadioGroup
              AlignWithMargins = True
              Left = 261
              Top = 3
              Width = 356
              Height = 93
              Hint = ''
              Items.Strings = (
                'Pendentes'
                'Enviadas'
                'Autorizadas'
                'Canceladas'
                'Inutilizadas'
                'Denegadas'
                'Todas')
              ItemIndex = 6
              Align = alLeft
              Caption = 'Situa'#231#227'o Nota Fiscal Eletr'#244'nica'
              TabOrder = 3
              Columns = 3
            end
          end
        end
        inherited pnl_config: TUniPanel
          Top = 468
          Width = 960
          ExplicitTop = 468
          ExplicitWidth = 960
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 960
        ExplicitHeight = 499
        inherited dbg_Search: TUniDBGrid
          Width = 960
          Height = 499
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
              Visible = False
            end
            item
              FieldName = 'nr_order'
              Title.Caption = 'Pedido'
              Width = 80
              ReadOnly = True
            end
            item
              FieldName = 'nr_invoice'
              Title.Caption = 'Nota Fiscal'
              Width = 64
            end
            item
              FieldName = 'dt_emission'
              Title.Caption = 'Data Emiss'#227'o'
              Width = 90
            end
            item
              FieldName = 'kind_emis'
              Title.Caption = 'Tipo Emiss'#227'o'
              Width = 121
              Visible = False
            end
            item
              FieldName = 'name_company'
              Title.Caption = 'Nome Companhia'
              Width = 450
              ReadOnly = True
            end
            item
              FieldName = 'value'
              Title.Caption = 'Valor'
              Width = 157
            end
            item
              FieldName = 'model'
              Title.Caption = 'Modelo'
              Width = 121
              Visible = False
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 531
    Width = 972
    ExplicitTop = 531
    ExplicitWidth = 972
    inherited Sb_Close: TUniSpeedButton
      Left = 186
      ExplicitLeft = 186
    end
    inherited Sb_View: TUniSpeedButton
      Left = 94
      ExplicitLeft = 94
    end
    inherited Sb_Search: TUniSpeedButton
      Left = 2
      ExplicitLeft = 2
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 281
      Visible = False
      ExplicitLeft = 281
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 224
    Top = 337
  end
  inherited ds_msg: TDataSource
    Left = 296
    Top = 360
  end
  inherited ds_search: TDataSource
    Left = 136
    Top = 458
  end
  inherited cds_search: TClientDataSet
    Left = 136
    Top = 402
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_searchnr_order: TIntegerField
      FieldName = 'nr_order'
      Origin = '`number`'
      ProviderFlags = []
      ReadOnly = True
    end
    object cds_searchnr_invoice: TStringField
      FieldName = 'nr_invoice'
      Origin = '`number`'
      Size = 10
    end
    object cds_searchdt_emission: TDateField
      FieldName = 'dt_emission'
      Origin = 'dt_emission'
      Required = True
    end
    object cds_searchkind_emis: TStringField
      FieldName = 'kind_emis'
      Origin = 'kind_emis'
      Size = 50
    end
    object cds_searchname_company: TStringField
      FieldName = 'name_company'
      Origin = 'name_company'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_searchvalue: TBCDField
      FieldName = 'value'
      Origin = '`value`'
      DisplayFormat = '0.00'
      Precision = 10
      Size = 2
    end
    object cds_searchmodel: TStringField
      FieldName = 'model'
      Origin = 'model'
      Size = 2
    end
    object cds_searchsalesman_id: TIntegerField
      FieldName = 'salesman_id'
    end
    object cds_searchsalesman_name: TStringField
      FieldName = 'salesman_name'
      Size = 100
    end
    object cds_searchterminal: TIntegerField
      FieldName = 'terminal'
    end
    object cds_searchkind_order: TStringField
      FieldName = 'kind_order'
      Size = 1
    end
  end
  inherited DSP: TDataSetProvider
    Left = 136
    Top = 352
  end
  inherited MenuTask: TUniMainMenu
    Left = 16
    Top = 472
  end
end
