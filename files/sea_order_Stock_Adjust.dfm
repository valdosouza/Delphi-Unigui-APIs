inherited SeaOrderStockAdjust: TSeaOrderStockAdjust
  ClientWidth = 827
  Caption = 'Pesquisa Ajuste de Estoque'
  ExplicitWidth = 843
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 827
    ExplicitWidth = 827
    inherited pc_search: TUniPageControl
      Width = 823
      ExplicitWidth = 823
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 815
        ExplicitHeight = 303
        inherited pnl_param: TUniPanel
          Width = 815
          ExplicitWidth = 815
          object chbx_periodo: TUniCheckBox
            Left = 4
            Top = 2
            Width = 205
            Height = 17
            Hint = ''
            Checked = True
            Caption = 'Data Inicial            Data Final'
            TabOrder = 1
          end
          object DTP_Date_Initial: TUniDateTimePicker
            Left = 5
            Top = 20
            Width = 100
            Hint = ''
            DateTime = 42916.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 2
          end
          object DTP_Date_End: TUniDateTimePicker
            Left = 109
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
            Top = 6
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
            Left = 212
            Top = 20
            Width = 102
            Hint = ''
            Text = ''
            TabOrder = 5
          end
          object ctn_Entity: TUniContainerPanel
            Left = 320
            Top = 8
            Width = 495
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 6
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 815
        ExplicitHeight = 303
        inherited dbg_Search: TUniDBGrid
          Width = 815
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
            end
            item
              FieldName = 'dt_record'
              Title.Caption = 'Data Registro'
              Width = 70
            end
            item
              FieldName = 'number'
              Title.Caption = 'Ordem'
              Width = 64
              ReadOnly = True
            end
            item
              FieldName = 'name_company'
              Title.Caption = 'Nome/Raz'#227'o Social'
              Width = 604
              ReadOnly = True
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 827
    ExplicitWidth = 827
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
    object cds_searchname_company: TStringField
      FieldName = 'name_company'
      ReadOnly = True
      Size = 100
    end
  end
end
