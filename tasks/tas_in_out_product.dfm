inherited TasInOutProduct: TTasInOutProduct
  ClientHeight = 550
  ClientWidth = 880
  Caption = 'Movimenta'#231#227'o de Produtos'
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  ExplicitWidth = 896
  ExplicitHeight = 609
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 880
    Height = 486
    ExplicitWidth = 880
    ExplicitHeight = 486
    inherited pc_search: TUniPageControl
      Width = 876
      Height = 482
      ExplicitWidth = 876
      ExplicitHeight = 482
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 868
        ExplicitHeight = 454
        inherited pnl_param: TUniPanel
          Width = 868
          Height = 423
          ExplicitWidth = 868
          ExplicitHeight = 423
          object ChBx_Periodo: TUniCheckBox
            Left = 4
            Top = 3
            Width = 188
            Height = 17
            Hint = ''
            Caption = 'Data Inicial           Data Final'
            TabOrder = 1
          end
          object DTP_Date_Initial: TUniDateTimePicker
            Left = 4
            Top = 21
            Width = 94
            Hint = ''
            DateTime = 42923.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 2
          end
          object DTP_Date_End: TUniDateTimePicker
            Left = 100
            Top = 21
            Width = 94
            Hint = ''
            DateTime = 42923.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 3
          end
          object Ctn_Company: TUniContainerPanel
            Left = 200
            Top = 6
            Width = 673
            Height = 37
            Hint = ''
            ParentColor = False
            TabOrder = 4
          end
          object Ctn_Product: TUniContainerPanel
            Left = 4
            Top = 49
            Width = 432
            Height = 37
            Hint = ''
            ParentColor = False
            TabOrder = 5
          end
          object Ctn_Brand: TUniContainerPanel
            Left = 442
            Top = 49
            Width = 431
            Height = 37
            Hint = ''
            ParentColor = False
            TabOrder = 6
          end
          object Rg_Direction: TUniRadioGroup
            Left = 5
            Top = 89
            Width = 267
            Height = 42
            Hint = ''
            Items.Strings = (
              'Entrada'
              'Sa'#237'da'
              'Todos')
            ItemIndex = 2
            Caption = 'Sentido opera'#231#227'o'
            TabOrder = 7
            Columns = 3
          end
          object UniLabel1: TUniLabel
            Left = 277
            Top = 89
            Width = 107
            Height = 13
            Hint = ''
            Caption = 'Tipo de Movimenta'#231#227'o'
            TabOrder = 8
          end
          object cb_kind_operation: TUniComboBox
            Left = 275
            Top = 107
            Width = 204
            Hint = ''
            Style = csDropDownList
            Text = 'TODOS'
            Items.Strings = (
              'TODOS'
              'COMPRA'
              'VENDA'
              'AJUSTES'
              'ROMANEIO'
              'TRANSFER'#202'NCIA'
              'PRODU'#199#195'O'
              'ENGENHARIA')
            ItemIndex = 0
            TabOrder = 9
            IconItems = <>
          end
        end
        inherited pnl_config: TUniPanel
          Top = 423
          Width = 868
          ExplicitTop = 423
          ExplicitWidth = 868
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 868
        ExplicitHeight = 454
        inherited dbg_Search: TUniDBGrid
          Width = 868
          Height = 454
          CellCursor = crDrag
          Columns = <
            item
              FieldName = 'direcao'
              Title.Caption = 'Dire'#231#227'o'
              Width = 94
            end
            item
              FieldName = 'ordem'
              Title.Caption = 'Ordem'
              Width = 64
              ReadOnly = True
            end
            item
              FieldName = 'invoice_id'
              Title.Caption = 'invoice_id'
              Width = 64
              Visible = False
            end
            item
              FieldName = 'way'
              Title.Caption = 'way'
              Width = 24
              Visible = False
              ReadOnly = True
            end
            item
              FieldName = 'notafiscal'
              Title.Caption = 'Nota Fiscal'
              Width = 64
            end
            item
              FieldName = 'dt_emission'
              Title.Caption = 'Data Nota'
              Width = 64
            end
            item
              FieldName = 'id'
              Title.Caption = 'id'
              Width = 64
              Visible = False
              ReadOnly = True
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o Mercadoria'
              Width = 604
              ReadOnly = True
            end
            item
              FieldName = 'quantity'
              Title.Caption = 'Quantidade'
              Width = 70
              ReadOnly = True
            end
            item
              FieldName = 'unit_value'
              Title.Caption = 'Valor Unit'#225'rio'
              Width = 70
              ReadOnly = True
            end
            item
              FieldName = 'subtotal'
              Title.Caption = 'Valor Subtotal'
              Width = 130
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
    Top = 486
    Width = 880
    ExplicitTop = 486
    ExplicitWidth = 880
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
  inherited ds_search: TDataSource
    Left = 728
    Top = 322
  end
  inherited cds_search: TClientDataSet
    OnCalcFields = cds_searchCalcFields
    Left = 728
    Top = 266
    object cds_searchinvoice_id: TIntegerField
      FieldName = 'invoice_id'
      Origin = 'id'
      Required = True
    end
    object cds_searchway: TStringField
      FieldName = 'way'
      Origin = 'way'
      ProviderFlags = []
      ReadOnly = True
      Size = 1
    end
    object cds_searchnotafiscal: TStringField
      FieldName = 'notafiscal'
      Origin = 'number'
      Size = 10
    end
    object cds_searchdt_emission: TDateField
      FieldName = 'dt_emission'
      Origin = 'dt_emission'
      Required = True
    end
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInKey]
      ReadOnly = True
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_searchquantity: TBCDField
      FieldName = 'quantity'
      Origin = 'quantity'
      ProviderFlags = []
      ReadOnly = True
      Precision = 10
    end
    object cds_searchunit_value: TFMTBCDField
      FieldName = 'unit_value'
      Origin = 'unit_value'
      ProviderFlags = []
      ReadOnly = True
      Precision = 10
      Size = 6
    end
    object cds_searchsubtotal: TFMTBCDField
      FieldName = 'subtotal'
      Origin = 'subtotal'
      ProviderFlags = []
      ReadOnly = True
      Precision = 20
      Size = 10
    end
    object cds_searchname_company: TStringField
      FieldName = 'name_company'
      Origin = 'name_company'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_searchdirecao: TStringField
      FieldKind = fkCalculated
      FieldName = 'direcao'
      Size = 15
      Calculated = True
    end
    object cds_searchordem: TStringField
      FieldName = 'ordem'
      Origin = 'ordem'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
  end
  inherited DSP: TDataSetProvider
    Left = 728
    Top = 208
  end
end
