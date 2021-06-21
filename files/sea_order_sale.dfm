inherited SeaOrderSale: TSeaOrderSale
  ClientHeight = 481
  ClientWidth = 920
  Caption = 'Pesquisa Ordem de Venda'
  ExplicitWidth = 936
  ExplicitHeight = 540
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 920
    Height = 417
    ExplicitWidth = 831
    ExplicitHeight = 417
    inherited pc_search: TUniPageControl
      Width = 916
      Height = 413
      ActivePage = tbs_search
      ExplicitWidth = 827
      ExplicitHeight = 413
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 819
        ExplicitHeight = 385
        inherited pnl_param: TUniPanel
          Width = 908
          Height = 354
          ExplicitWidth = 819
          ExplicitHeight = 354
          object pnl_row_1: TUniPanel
            Left = 2
            Top = 2
            Width = 904
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 1
            BorderStyle = ubsNone
            Caption = ''
            ExplicitWidth = 815
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
            object E_Nr_Order: TUniEdit
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
              FieldLabel = 'N'#250'mero Pedido'
              FieldLabelAlign = laTop
              FieldLabelFont.Color = clNavy
            end
            object ctn_Customer: TUniContainerPanel
              Left = 324
              Top = 0
              Width = 580
              Height = 52
              Hint = ''
              ParentColor = False
              Align = alClient
              TabOrder = 3
              ExplicitWidth = 491
            end
          end
          object pnl_row_2: TUniPanel
            Left = 2
            Top = 54
            Width = 904
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 2
            BorderStyle = ubsNone
            Caption = 'pnl_row_2'
            ExplicitWidth = 815
            object Ctn_salesMan: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 495
              Height = 52
              Hint = ''
              ParentColor = False
              Align = alLeft
              TabOrder = 1
            end
          end
        end
        inherited pnl_config: TUniPanel
          Top = 354
          Width = 908
          ExplicitTop = 354
          ExplicitWidth = 819
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 819
        ExplicitHeight = 385
        inherited dbg_Search: TUniDBGrid
          Width = 908
          Height = 385
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
              Visible = False
            end
            item
              FieldName = 'dt_record'
              Title.Caption = 'Data Registro'
              Width = 73
            end
            item
              FieldName = 'number'
              Title.Caption = 'Ordem'
              Width = 64
              ReadOnly = True
            end
            item
              FieldName = 'terminal'
              Title.Caption = 'Terminal'
              Width = 64
            end
            item
              FieldName = 'name_company'
              Title.Caption = 'Nome/ Raz'#227'o Social'
              Width = 545
              ReadOnly = True
            end
            item
              FieldName = 'total_value'
              Title.Caption = 'Valor Total'
              Width = 103
              ReadOnly = True
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 417
    Width = 920
    ExplicitTop = 417
    ExplicitWidth = 831
  end
  inherited cds_search: TClientDataSet
    object cds_searchdt_record: TDateField
      FieldName = 'dt_record'
      Origin = 'dt_record'
    end
    object cds_searchnumber: TIntegerField
      FieldName = 'number'
      Origin = '`number`'
      ProviderFlags = []
      ReadOnly = True
    end
    object cds_searchname_company: TStringField
      FieldName = 'name_company'
      Origin = 'name_company'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_searchtotal_value: TBCDField
      FieldName = 'total_value'
      Origin = 'total_value'
      ProviderFlags = []
      ReadOnly = True
      Precision = 10
      Size = 2
    end
    object cds_searchtb_salesman_id: TIntegerField
      FieldName = 'tb_salesman_id'
      Origin = 'tb_salesman_id'
      ProviderFlags = []
      ReadOnly = True
    end
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_searchterminal: TIntegerField
      FieldName = 'terminal'
      Origin = 'terminal'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
  end
  inherited DSP: TDataSetProvider
    Left = 160
  end
  inherited MenuTask: TUniMainMenu
    Left = 16
    Top = 272
  end
end
