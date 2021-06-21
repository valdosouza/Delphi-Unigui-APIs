inherited SeaOrderPurchase: TSeaOrderPurchase
  ClientWidth = 819
  Caption = 'Pesquisa de Pedidos de Compra'
  ExplicitWidth = 835
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 819
    ExplicitWidth = 819
    inherited pc_search: TUniPageControl
      Width = 815
      ExplicitWidth = 815
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 807
        ExplicitHeight = 303
        inherited pnl_param: TUniPanel
          Width = 807
          ExplicitWidth = 807
          object chbx_periodo: TUniCheckBox
            Left = 4
            Top = 2
            Width = 205
            Height = 17
            Hint = ''
            Checked = True
            Caption = 'Data Inicial            Data Final'
            TabOrder = 1
            OnClick = chbx_periodoClick
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
          object E_Number: TUniEdit
            Left = 212
            Top = 20
            Width = 102
            Hint = ''
            Text = ''
            TabOrder = 4
          end
          object ctn_Provider: TUniContainerPanel
            Left = 312
            Top = 7
            Width = 495
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 5
          end
          object RG_approved: TUniRadioGroup
            Left = 3
            Top = 46
            Width = 174
            Height = 45
            Hint = ''
            Items.Strings = (
              'Sim'
              'N'#227'o'
              'Todos')
            ItemIndex = 2
            Caption = 'Pedido Aprovado'
            TabOrder = 6
            Columns = 3
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
            TabOrder = 7
          end
          object cb_Status: TUniComboBox
            Left = 183
            Top = 67
            Width = 179
            Hint = ''
            Style = csDropDownList
            Text = 'PENDENTE'
            Items.Strings = (
              'PENDENTE'
              'FATURADO')
            ItemIndex = 0
            TabOrder = 8
            IconItems = <>
          end
          object UniLabel1: TUniLabel
            Left = 185
            Top = 47
            Width = 92
            Height = 14
            Hint = ''
            Caption = 'Situa'#231#227'o do Pedido'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 9
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 807
        ExplicitHeight = 303
        inherited dbg_Search: TUniDBGrid
          Width = 807
          Columns = <
            item
              FieldName = 'dt_record'
              Title.Caption = 'Data'
              Width = 64
            end
            item
              FieldName = 'number'
              Title.Caption = 'N'#250'mero'
              Width = 102
              ReadOnly = True
            end
            item
              FieldName = 'name_company'
              Title.Caption = 'Nome/Raz'#227'o Social'
              Width = 428
              ReadOnly = True
            end
            item
              FieldName = 'total_value'
              Title.Caption = 'Valor Total'
              Width = 105
              ReadOnly = True
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 819
    ExplicitWidth = 819
  end
  inherited cds_search: TClientDataSet
    object cds_searchdt_record: TDateField
      FieldName = 'dt_record'
      Origin = 'dt_record'
    end
    object cds_searchnumber: TIntegerField
      FieldName = 'number'
      Origin = 'number'
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
      DisplayFormat = '#,##0.00'
      Precision = 10
      Size = 2
    end
    object cds_searchid: TAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
  end
end
