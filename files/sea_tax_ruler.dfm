inherited SeaTaxRuler: TSeaTaxRuler
  ClientWidth = 639
  Caption = 'Pesquisa Regra de Tributa'#231#227'o'
  ExplicitWidth = 655
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 639
    ExplicitWidth = 639
    inherited pc_search: TUniPageControl
      Width = 635
      ExplicitWidth = 635
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 627
        ExplicitHeight = 105
        inherited pnl_param: TUniPanel
          Width = 627
          ExplicitWidth = 627
          object RG_Direction: TUniRadioGroup
            Left = 4
            Top = 2
            Width = 139
            Height = 38
            Hint = ''
            Items.Strings = (
              'Sa'#237'da '
              'Entrada')
            ItemIndex = 0
            Caption = 'Tipo da Opera'#231#227'o'
            TabOrder = 1
            Columns = 2
          end
          object chbx_Apl: TUniCheckBox
            Left = 6
            Top = 42
            Width = 314
            Height = 17
            Hint = ''
            Caption = 'Regras Aplicadas para venda aplicada ao Consumidor Final'
            TabOrder = 2
          end
          object Ctn_State: TUniContainerPanel
            Left = 151
            Top = 4
            Width = 93
            Height = 36
            Hint = ''
            ParentColor = False
            TabOrder = 3
          end
          object Ctn_CFOP: TUniContainerPanel
            Left = 248
            Top = 4
            Width = 379
            Height = 36
            Hint = ''
            ParentColor = False
            TabOrder = 4
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 627
        ExplicitHeight = 105
        inherited dbg_Search: TUniDBGrid
          Width = 627
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
            end
            item
              FieldName = 'tb_cfop_id'
              Title.Caption = 'CFOP'
              Width = 47
            end
            item
              FieldName = 'direction'
              Title.Caption = 'Dire'#231#227'o'
              Width = 58
            end
            item
              FieldName = 'abbreviation'
              Title.Caption = 'UF'
              Width = 61
              ReadOnly = True
            end
            item
              FieldName = 'for_consumer'
              Title.Caption = 'Consumidor'
              Width = 72
            end
            item
              FieldName = 'crt'
              Title.Caption = 'CRT'
              Width = 59
            end
            item
              FieldName = 'for_icms_st'
              Title.Caption = 'ST'
              Width = 60
            end
            item
              FieldName = 'icms_aliq'
              Title.Caption = 'Al'#237'quota'
              Width = 76
            end
            item
              FieldName = 'icms_base_reduced'
              Title.Caption = 'Redu'#231#227'o da base'
              Width = 124
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 639
    ExplicitWidth = 639
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_searchabbreviation: TStringField
      FieldName = 'abbreviation'
      Origin = 'abbreviation'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
    object cds_searchfor_consumer: TStringField
      FieldName = 'for_consumer'
      Origin = 'for_consumer'
      FixedChar = True
      Size = 1
    end
    object cds_searchcrt: TStringField
      FieldName = 'crt'
      Origin = 'crt'
      Size = 3
    end
    object cds_searchfor_icms_st: TStringField
      FieldName = 'for_icms_st'
      Origin = 'for_icms_st'
      FixedChar = True
      Size = 1
    end
    object cds_searchicms_aliq: TBCDField
      FieldName = 'icms_aliq'
      Origin = 'icms_aliq'
      Precision = 10
      Size = 2
    end
    object cds_searchicms_base_reduced: TBCDField
      FieldName = 'icms_base_reduced'
      Origin = 'icms_base_reduced'
      Precision = 10
      Size = 2
    end
    object cds_searchtb_cfop_id: TStringField
      FieldName = 'tb_cfop_id'
      Origin = 'tb_cfop_id'
      Size = 10
    end
    object cds_searchdirection: TStringField
      FieldName = 'direction'
      Origin = 'direction'
      FixedChar = True
      Size = 1
    end
  end
  inherited DSP: TDataSetProvider
    Left = 200
    Top = 184
  end
end
