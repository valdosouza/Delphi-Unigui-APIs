inherited SeaOrderStockTransfer: TSeaOrderStockTransfer
  ClientWidth = 818
  Caption = 'Pesquisa Ordem de Transfer'#234'ncia Estoque '
  ExplicitWidth = 834
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 818
    ExplicitWidth = 818
    inherited pc_search: TUniPageControl
      Width = 814
      ActivePage = tbs_search
      ExplicitLeft = 2
      ExplicitTop = 2
      ExplicitWidth = 814
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 806
        ExplicitHeight = 303
        inherited pnl_param: TUniPanel
          Width = 806
          ExplicitWidth = 806
          object chbx_periodo: TUniCheckBox
            Left = 6
            Top = 2
            Width = 205
            Height = 17
            Hint = ''
            Checked = True
            Caption = 'Data Inicial            Data Final'
            TabOrder = 1
          end
          object DTP_Date_Initial: TUniDateTimePicker
            Left = 6
            Top = 20
            Width = 100
            Hint = ''
            DateTime = 42916.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 2
          end
          object DTP_Date_End: TUniDateTimePicker
            Left = 110
            Top = 20
            Width = 100
            Hint = ''
            DateTime = 42916.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 3
          end
          object L_Codigo: TUniLabel
            Left = 213
            Top = 4
            Width = 32
            Height = 14
            Hint = ''
            Caption = 'Ordem'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 4
          end
          object E_Number: TUniEdit
            Left = 213
            Top = 20
            Width = 102
            Hint = ''
            Text = ''
            TabOrder = 5
          end
          object ctn_Stock_Id_Ori: TUniContainerPanel
            Left = 325
            Top = 6
            Width = 481
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 6
          end
          object ctn_Stock_Id_Des: TUniContainerPanel
            Left = 325
            Top = 48
            Width = 481
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 7
          end
          object Ctn_Situation: TUniContainerPanel
            Left = 3
            Top = 48
            Width = 319
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 8
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 806
        ExplicitHeight = 303
        inherited dbg_Search: TUniDBGrid
          Width = 806
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'id'
              Width = 64
              Visible = False
            end
            item
              FieldName = 'dt_record'
              Title.Caption = 'Data Registro'
              Width = 74
            end
            item
              FieldName = 'number'
              Title.Caption = 'N'#250'mero'
              Width = 64
              ReadOnly = True
            end
            item
              FieldName = 'name_company'
              Title.Caption = 'Destinat'#225'rio'
              Width = 301
              ReadOnly = True
            end
            item
              FieldName = 'description'
              Title.Caption = 'Situa'#231#227'o'
              Width = 154
              ReadOnly = True
            end
            item
              FieldName = 'est_origem'
              Title.Caption = 'Estoque Origem'
              Width = 142
              ReadOnly = True
            end
            item
              FieldName = 'est_destino'
              Title.Caption = 'Estoque Destino'
              Width = 119
              ReadOnly = True
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 818
    ExplicitWidth = 818
    inherited Sb_View: TUniSpeedButton
      ExplicitTop = 6
    end
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_searchdt_record: TDateField
      FieldName = 'dt_record'
    end
    object cds_searchnumber: TIntegerField
      FieldName = 'number'
      ReadOnly = True
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      ReadOnly = True
      Size = 100
    end
    object cds_searchname_company: TStringField
      FieldName = 'name_company'
      ReadOnly = True
      Size = 100
    end
    object cds_searchest_origem: TStringField
      FieldName = 'est_origem'
      ReadOnly = True
      Size = 45
    end
    object cds_searchest_destino: TStringField
      FieldName = 'est_destino'
      ReadOnly = True
      Size = 45
    end
  end
end
